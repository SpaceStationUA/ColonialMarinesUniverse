using System.Diagnostics.CodeAnalysis;
using System.Linq;
using Content.Shared.GameTicking;
using Content.Shared.Mind;
using Content.Shared.Players;
using Content.Shared.Preferences;
using Content.Shared.Roles;
using Content.Shared.Roles.Jobs;
using Robust.Shared.Network;
using Robust.Shared.Player;
using Robust.Shared.Prototypes;
using Robust.Shared.Utility;

namespace Content.Server.GameTicking;

public sealed partial class GameTicker
{
    private readonly Dictionary<NetUserId, string> _lobbyManifestRoundJobs = new();

    private void InitializeLobbyManifest()
    {
        SubscribeNetworkEvent<TickerLobbyManifestRequestEvent>(OnTickerLobbyManifestRequest);
        SubscribeLocalEvent<PlayerSpawnCompleteEvent>(OnLobbyManifestPlayerSpawnComplete);
        SubscribeLocalEvent<RoundRestartCleanupEvent>(OnLobbyManifestRoundRestartCleanup);
    }

    private void OnTickerLobbyManifestRequest(TickerLobbyManifestRequestEvent ev, EntitySessionEventArgs args)
    {
        RaiseNetworkEvent(new TickerLobbyManifestEvent(GetLobbyManifestEntries()), args.SenderSession.Channel);
    }

    private void OnLobbyManifestPlayerSpawnComplete(PlayerSpawnCompleteEvent ev)
    {
        if (ev.JobId == null || !_prototypeManager.HasIndex<JobPrototype>(ev.JobId))
            return;

        _lobbyManifestRoundJobs[ev.Player.UserId] = ev.JobId;
    }

    private void OnLobbyManifestRoundRestartCleanup(RoundRestartCleanupEvent ev)
    {
        _lobbyManifestRoundJobs.Clear();
    }

    private List<TickerLobbyManifestEntry> GetLobbyManifestEntries()
    {
        var entries = new List<TickerLobbyManifestEntry>();
        var presetId = CurrentPreset?.ID ?? Preset?.ID;

        foreach (var (userId, status) in _playerGameStatuses)
        {
            if (!_playerManager.TryGetSessionById(userId, out var session))
                continue;

            var job = RunLevel == GameRunLevel.PreRoundLobby
                ? GetLobbyManifestPreferredJob(userId, status, presetId)
                : GetLobbyManifestCurrentJob(session);

            if (job == null)
                continue;

            entries.Add(new TickerLobbyManifestEntry(GetLobbyManifestJobName(job), GetLobbyManifestGroup(job)));
        }

        return entries
            .OrderBy(entry => entry.Group)
            .ThenBy(entry => entry.JobName)
            .ToList();
    }

    private JobPrototype? GetLobbyManifestPreferredJob(NetUserId userId, PlayerGameStatus status, string? presetId)
    {
        var ready = !LobbyEnabled || status == PlayerGameStatus.ReadyToPlay;
        if (LobbyEnabled && !ready)
            return null;

        if (!_prefsManager.TryGetCachedPreferences(userId, out var preferences) ||
            preferences.SelectedCharacter is not HumanoidCharacterProfile profile)
        {
            return null;
        }

        return TryGetLobbyManifestJob(profile, presetId, out var job) ? job : null;
    }

    private JobPrototype? GetLobbyManifestCurrentJob(ICommonSession session)
    {
        if (_mind.TryGetMind(session.UserId, out var mindId, out _) &&
            _jobs.MindTryGetJob(mindId, out var currentJob))
        {
            _lobbyManifestRoundJobs[session.UserId] = currentJob.ID;
            return currentJob;
        }

        return _lobbyManifestRoundJobs.TryGetValue(session.UserId, out var jobId) &&
            _prototypeManager.TryIndex<JobPrototype>(jobId, out var cachedJob)
                ? cachedJob
                : null;
    }

    private bool TryGetLobbyManifestJob(
        HumanoidCharacterProfile profile,
        string? presetId,
        [NotNullWhen(true)] out JobPrototype? job)
    {
        job = null;
        string? bestJobId = null;
        var bestPriority = JobPriority.Never;

        foreach (var (jobId, priority) in profile.GetJobPrioritiesForGamemode(presetId))
        {
            if (priority <= bestPriority ||
                !_prototypeManager.TryIndex(jobId, out JobPrototype? candidate) ||
                candidate.Hidden)
            {
                continue;
            }

            bestJobId = jobId.Id;
            bestPriority = priority;

            if (priority == JobPriority.High)
                break;
        }

        if (bestJobId == null)
            return false;

        return _prototypeManager.TryIndex<JobPrototype>(bestJobId, out job);
    }

    private string GetLobbyManifestJobName(JobPrototype job)
    {
        var name = !string.IsNullOrWhiteSpace(job.SpawnMenuRoleName)
            ? LocalizeOrRaw(job.SpawnMenuRoleName)
            : job.LocalizedName;

        return TrimLobbyManifestFactionSuffix(name);
    }

    private LobbyManifestGroup GetLobbyManifestGroup(JobPrototype job)
    {
        if (_jobs.TryGetDepartment(job.ID, out var department) &&
            !string.IsNullOrWhiteSpace(department.Faction))
        {
            var faction = department.Faction.ToLowerInvariant();
            if (faction == "govfor")
                return LobbyManifestGroup.Govfor;
            if (faction == "opfor")
                return LobbyManifestGroup.Opfor;
            if (faction is "humans" or "human" or "colonists" or "colonist" or "default")
                return LobbyManifestGroup.Colonists;
        }

        var id = job.ID.ToLowerInvariant();
        if (id.Contains("govfor"))
            return LobbyManifestGroup.Govfor;
        if (id.Contains("opfor"))
            return LobbyManifestGroup.Opfor;
        if (id.Contains("colon") || id.Contains("civilian"))
            return LobbyManifestGroup.Colonists;

        return LobbyManifestGroup.Other;
    }

    private static string TrimLobbyManifestFactionSuffix(string name)
    {
        var trimmed = name.TrimEnd();
        foreach (var suffix in new[] { " (GOVFOR)", " (OPFOR)" })
        {
            if (trimmed.EndsWith(suffix, StringComparison.OrdinalIgnoreCase))
                return trimmed[..^suffix.Length].TrimEnd();
        }

        return name;
    }
}
