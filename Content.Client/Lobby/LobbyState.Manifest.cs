using Content.Client.Lobby.UI;
using Robust.Client.UserInterface.Controls;

namespace Content.Client.Lobby;

public sealed partial class LobbyState
{
    private Button? _manifestButton;
    private LobbyManifestWindow? _manifestWindow;

    private void InitializeLobbyManifestButton()
    {
        _manifestButton = Lobby?.FindControl<Button>("ManifestButton");
        if (_manifestButton == null)
            return;

        _manifestButton.OnPressed += OnManifestPressed;
    }

    private void ShutdownLobbyManifestButton()
    {
        if (_manifestButton != null)
            _manifestButton.OnPressed -= OnManifestPressed;

        _manifestWindow?.Close();
        _manifestWindow = null;
        _manifestButton = null;
    }

    private void OnManifestPressed(BaseButton.ButtonEventArgs args)
    {
        if (_manifestWindow == null || _manifestWindow.Disposed)
        {
            _manifestWindow = new LobbyManifestWindow();
            _manifestWindow.OnClose += () => _manifestWindow = null;
            _manifestWindow.OpenCentered();
            return;
        }

        _manifestWindow.MoveToFront();
        _gameTicker.RequestLobbyManifest();
    }
}
