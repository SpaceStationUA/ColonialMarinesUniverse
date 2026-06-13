using Content.Shared.FixedPoint;
using Robust.Shared.GameStates;
using Robust.Shared.Map;

namespace Content.Shared._RMC14.Projectiles;

[RegisterComponent, NetworkedComponent, AutoGenerateComponentState]
[Access(typeof(RMCProjectileSystem))]
public sealed partial class RMCProjectileMinimumRangeDamageCapComponent : Component
{
    /// <summary>
    /// ITS OUR FORK LOCAL FIX!!!
    /// Hits at or below this distance have their target-applicable damage capped.
    /// This is used by the M707 Vulture so point-blank shots stay weaker than real long-range shots.
    /// </summary>
    [DataField, AutoNetworkedField]
    public float Range;

    /// <summary>
    /// Maximum positive damage that the target can actually receive at close range.
    /// Target-applicable damage matters because xenos ignore Structural, while walls can still receive it.
    /// </summary>
    [DataField, AutoNetworkedField]
    public FixedPoint2 MaxDamage;

    /// <summary>
    /// Projectile spawn coordinates used to measure distance to the hit target.
    /// </summary>
    [DataField, AutoNetworkedField]
    public EntityCoordinates? ShotFrom;
}
