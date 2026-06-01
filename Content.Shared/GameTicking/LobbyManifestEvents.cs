using Robust.Shared.Serialization;

namespace Content.Shared.GameTicking;

[Serializable, NetSerializable]
public sealed partial class TickerLobbyManifestRequestEvent : EntityEventArgs
{
}

[Serializable, NetSerializable]
public sealed partial class TickerLobbyManifestEvent : EntityEventArgs
{
    public List<TickerLobbyManifestEntry> Entries { get; }

    public TickerLobbyManifestEvent(List<TickerLobbyManifestEntry> entries)
    {
        Entries = entries;
    }
}

[Serializable, NetSerializable]
public sealed partial class TickerLobbyManifestEntry
{
    public string JobName { get; }
    public LobbyManifestGroup Group { get; }

    public TickerLobbyManifestEntry(string jobName, LobbyManifestGroup group)
    {
        JobName = jobName;
        Group = group;
    }
}

[Serializable, NetSerializable]
public enum LobbyManifestGroup : byte
{
    Govfor,
    Opfor,
    Colonists,
    Other,
}
