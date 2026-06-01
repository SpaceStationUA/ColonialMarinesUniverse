using Content.Shared._RMC14.Marines;
using Content.Shared._RMC14.TacticalMap;
using Content.Shared.Station.Components;

namespace Content.Shared._RMC14.CrewManifest;

public abstract class SharedRMCCrewManifestSystem : EntitySystem
{
    public override void Initialize()
    {
        SubscribeLocalEvent<MarineComponent, OpenCrewManifestAlertEvent>(OnManifestOpenAlert);
        SubscribeLocalEvent<TacticalMapUserComponent, OpenCrewManifestAlertEvent>(OnTacMapUserManifestOpenAlert);
    }

    private void OnManifestOpenAlert(Entity<MarineComponent> ent, ref OpenCrewManifestAlertEvent args)
    {
        if (args.Handled)
            return;

        args.Handled = true;

        var stations = EntityQueryEnumerator<StationMemberComponent>();
        while (stations.MoveNext(out var stationId, out var stationComp))
        {
            if (!HasComp<AlmayerComponent>(stationId))
                continue;

            OpenCrewManifest(args.User, stationComp.Station);
            break;
        }
    }

    private void OnTacMapUserManifestOpenAlert(Entity<TacticalMapUserComponent> ent, ref OpenCrewManifestAlertEvent args)
    {
        if (args.Handled)
            return;

        if (!TryComp(ent.Owner, out TransformComponent? transform) ||
            transform.GridUid is not { } grid ||
            !TryComp(grid, out StationMemberComponent? stationMember))
        {
            return;
        }

        args.Handled = true;
        OpenCrewManifest(args.User, stationMember.Station);
    }

    public virtual void OpenCrewManifest(EntityUid user, NetEntity station)
    {
    }

    public virtual void OpenCrewManifest(EntityUid user, EntityUid station)
    {
    }
}
