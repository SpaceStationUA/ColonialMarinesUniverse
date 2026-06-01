using System.Linq;
using System.Numerics;
using Content.Client.GameTicking.Managers;
using Content.Client.Stylesheets;
using Content.Client.UserInterface.Controls;
using Content.Shared.CCVar;
using Content.Shared.GameTicking;
using Robust.Client.UserInterface;
using Robust.Client.UserInterface.Controls;
using Robust.Client.UserInterface.CustomControls;
using Robust.Shared.Configuration;
using Robust.Shared.Utility;
using static Robust.Client.UserInterface.Controls.BoxContainer;

namespace Content.Client.Lobby.UI;

public sealed partial class LobbyManifestWindow : DefaultWindow
{
    [Dependency] private IConfigurationManager _cfg = default!;
    [Dependency] private IEntitySystemManager _entitySystems = default!;
    [Dependency] private IStylesheetManager _stylesheetManager = default!;

    private readonly BoxContainer _entries;
    private readonly ClientGameTicker _gameTicker;

    public LobbyManifestWindow()
    {
        IoCManager.InjectDependencies(this);

        _gameTicker = _entitySystems.GetEntitySystem<ClientGameTicker>();

        MinSize = new Vector2(480, 420);
        SetSize = new Vector2(560, 560);
        Title = Loc.GetString("ui-lobby-manifest-window-title");

        _entries = new BoxContainer
        {
            Orientation = LayoutOrientation.Vertical,
            SeparationOverride = 8,
            Margin = new Thickness(8),
            HorizontalExpand = true,
        };

        Contents.AddChild(new PanelContainer
        {
            HorizontalExpand = true,
            VerticalExpand = true,
            StyleClasses = { StyleNano.StyleClassCrtPanel },
            Children =
            {
                new ScrollContainer
                {
                    HorizontalExpand = true,
                    VerticalExpand = true,
                    Children = { _entries },
                },
            },
        });

        ApplyCrtPalette();
        Rebuild(_gameTicker.LobbyManifestEntries);

        _gameTicker.LobbyManifestUpdated += Rebuild;
        _cfg.OnValueChanged(CCVars.CrtUiEnabled, OnCrtUiEnabledChanged);
        _cfg.OnValueChanged(CCVars.CrtUiColor, OnCrtUiColorChanged);
        _gameTicker.RequestLobbyManifest();
    }

    [Obsolete("Controls should only be removed from UI tree instead of being disposed")]
    protected override void Dispose(bool disposing)
    {
        base.Dispose(disposing);

        _gameTicker.LobbyManifestUpdated -= Rebuild;
        _cfg.UnsubValueChanged(CCVars.CrtUiEnabled, OnCrtUiEnabledChanged);
        _cfg.UnsubValueChanged(CCVars.CrtUiColor, OnCrtUiColorChanged);
    }

    private void OnCrtUiEnabledChanged(bool _)
    {
        ApplyCrtPalette();
    }

    private void OnCrtUiColorChanged(string _)
    {
        ApplyCrtPalette();
    }

    private void ApplyCrtPalette()
    {
        Stylesheet = _stylesheetManager.SheetNano;
        CrtLobbyTheme.ApplyWindow(this, useCrtTypography: true);
    }

    private void Rebuild(IReadOnlyList<TickerLobbyManifestEntry> entries)
    {
        _entries.RemoveAllChildren();

        if (entries.Count == 0)
        {
            _entries.AddChild(new Label
            {
                Text = Loc.GetString("ui-lobby-manifest-empty"),
                HorizontalAlignment = HAlignment.Center,
                Margin = new Thickness(0, 16),
            });
            return;
        }

        AddGroup(entries, LobbyManifestGroup.Govfor);
        AddGroup(entries, LobbyManifestGroup.Opfor);
        AddGroup(entries, LobbyManifestGroup.Colonists);
        AddGroup(entries, LobbyManifestGroup.Other);
    }

    private void AddGroup(IReadOnlyList<TickerLobbyManifestEntry> entries, LobbyManifestGroup group)
    {
        var groupEntries = entries.Where(entry => entry.Group == group).ToList();
        if (groupEntries.Count == 0 && group == LobbyManifestGroup.Other)
            return;

        _entries.AddChild(new StripeBack
        {
            StyleClasses = { StyleNano.StyleClassCrtStripeBack },
            Children =
            {
                new PanelContainer
                {
                    StyleClasses = { StyleNano.StyleClassCrtHeaderPanel },
                    Children =
                    {
                        new Label
                        {
                            Text = Loc.GetString(
                                "ui-lobby-manifest-group-heading",
                                ("group", GetGroupName(group)),
                                ("count", groupEntries.Count)),
                            StyleClasses = { "LabelBig" },
                            Align = Label.AlignMode.Center,
                            HorizontalExpand = true,
                            Margin = new Thickness(4, 2),
                        },
                    },
                },
            },
        });

        if (groupEntries.Count == 0)
        {
            _entries.AddChild(new Label
            {
                Text = Loc.GetString("ui-lobby-manifest-group-empty"),
                FontColorOverride = Color.Gray,
                Margin = new Thickness(8, 0, 0, 0),
            });
            return;
        }

        var jobCounts = groupEntries
            .GroupBy(entry => entry.JobName)
            .Select(grouping => new
            {
                Job = grouping.Key,
                Count = grouping.Count(),
            })
            .OrderByDescending(entry => entry.Count)
            .ThenBy(entry => entry.Job)
            .ToList();

        foreach (var entry in jobCounts)
        {
            _entries.AddChild(new RichTextLabel
            {
                Margin = new Thickness(8, 0, 0, 0),
                Text = Loc.GetString(
                    "ui-lobby-manifest-job-entry",
                    ("job", FormattedMessage.EscapeText(entry.Job)),
                    ("count", entry.Count)),
            });
        }
    }

    private static string GetGroupName(LobbyManifestGroup group)
    {
        return group switch
        {
            LobbyManifestGroup.Govfor => Loc.GetString("ui-lobby-manifest-group-govfor"),
            LobbyManifestGroup.Opfor => Loc.GetString("ui-lobby-manifest-group-opfor"),
            LobbyManifestGroup.Colonists => Loc.GetString("ui-lobby-manifest-group-colonists"),
            _ => Loc.GetString("ui-lobby-manifest-group-other"),
        };
    }
}
