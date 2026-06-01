using Content.Shared.GameTicking;

namespace Content.Client.GameTicking.Managers;

public sealed partial class ClientGameTicker
{
    [ViewVariables] public IReadOnlyList<TickerLobbyManifestEntry> LobbyManifestEntries { get; private set; } =
        Array.Empty<TickerLobbyManifestEntry>();

    public event Action<IReadOnlyList<TickerLobbyManifestEntry>>? LobbyManifestUpdated;

    private void InitializeLobbyManifest()
    {
        SubscribeNetworkEvent<TickerLobbyManifestEvent>(LobbyManifest);
    }

    public void RequestLobbyManifest()
    {
        RaiseNetworkEvent(new TickerLobbyManifestRequestEvent());
    }

    private void LobbyManifest(TickerLobbyManifestEvent message)
    {
        LobbyManifestEntries = message.Entries;
        LobbyManifestUpdated?.Invoke(LobbyManifestEntries);
    }
}
