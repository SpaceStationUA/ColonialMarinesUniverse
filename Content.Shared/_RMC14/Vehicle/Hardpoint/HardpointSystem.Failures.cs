using Content.Shared.Tools;
using Robust.Shared.Prototypes;
using Robust.Shared.Random;

namespace Content.Shared._RMC14.Vehicle;

public sealed partial class HardpointSystem
{
    [Dependency] private IRobustRandom _random = default!;

    private readonly record struct VehicleHardpointFailureRepairStep(
        ProtoId<ToolQualityPrototype> Tool,
        float Time,
        string Instruction,
        bool RequiresWelder = false);

    private static readonly VehicleHardpointFailureRepairStep[] ArmorCompromisedRepairSteps =
    {
        new("Anchoring", 4f, "rmc-hardpoint-failure-repair-armor-compromised-1"),
        new("Welding", 8f, "rmc-hardpoint-failure-repair-armor-compromised-2", true),
    };

    private static readonly VehicleHardpointFailureRepairStep[] FeedJamRepairSteps =
    {
        new("Screwing", 4f, "rmc-hardpoint-failure-repair-feed-jam-1"),
        new("Pulsing", 5f, "rmc-hardpoint-failure-repair-feed-jam-2"),
    };

    private static readonly VehicleHardpointFailureRepairStep[] RunawayTriggerRepairSteps =
    {
        new("Screwing", 5f, "rmc-hardpoint-failure-repair-runaway-trigger-1"),
        new("Pulsing", 6f, "rmc-hardpoint-failure-repair-runaway-trigger-2"),
        new("Anchoring", 5f, "rmc-hardpoint-failure-repair-runaway-trigger-3"),
    };

    private static readonly VehicleHardpointFailureRepairStep[] TurretTraverseRepairSteps =
    {
        new("Anchoring", 6f, "rmc-hardpoint-failure-repair-turret-traverse-damage-1"),
        new("VehicleServicing", 5f, "rmc-hardpoint-failure-repair-turret-traverse-damage-2"),
    };

    private static readonly VehicleHardpointFailureRepairStep[] EngineMisfireRepairSteps =
    {
        new("Screwing", 4f, "rmc-hardpoint-failure-repair-engine-misfire-1"),
        new("Pulsing", 6f, "rmc-hardpoint-failure-repair-engine-misfire-2"),
        new("Anchoring", 4f, "rmc-hardpoint-failure-repair-engine-misfire-3"),
    };

    private static readonly VehicleHardpointFailureRepairStep[] TransmissionSlipRepairSteps =
    {
        new("VehicleServicing", 7f, "rmc-hardpoint-failure-repair-transmission-slip-1"),
        new("Anchoring", 5f, "rmc-hardpoint-failure-repair-transmission-slip-2"),
    };

    private static readonly VehicleHardpointFailureRepairStep[] WarpedFrameRepairSteps =
    {
        new("VehicleServicing", 8f, "rmc-hardpoint-failure-repair-warped-frame-1"),
        new("Welding", 12f, "rmc-hardpoint-failure-repair-warped-frame-2", true),
        new("Anchoring", 6f, "rmc-hardpoint-failure-repair-warped-frame-3"),
    };

    private static readonly VehicleHardpointFailureRepairStep[] DamagedMountRepairSteps =
    {
        new("VehicleServicing", 6f, "rmc-hardpoint-failure-repair-damaged-mount-1"),
        new("Anchoring", 6f, "rmc-hardpoint-failure-repair-damaged-mount-2"),
    };

    private static readonly VehicleHardpointFailureRepairStep[] TireBlowoutRepairSteps =
    {
        new("Prying", 5f, "rmc-hardpoint-failure-repair-tire-blowout-1"),
        new("VehicleServicing", 6f, "rmc-hardpoint-failure-repair-tire-blowout-2"),
        new("Anchoring", 5f, "rmc-hardpoint-failure-repair-tire-blowout-3"),
    };

    private static readonly VehicleHardpointFailureRepairStep[] ThrownTreadRepairSteps =
    {
        new("VehicleServicing", 8f, "rmc-hardpoint-failure-repair-thrown-tread-1"),
        new("Prying", 6f, "rmc-hardpoint-failure-repair-thrown-tread-2"),
        new("Anchoring", 8f, "rmc-hardpoint-failure-repair-thrown-tread-3"),
    };

    private static readonly VehicleHardpointFailureRepairStep[] EngineOverheatRepairSteps =
    {
        new("Screwing", 4f, "rmc-hardpoint-failure-repair-engine-overheat-1"),
        new("Prying", 5f, "rmc-hardpoint-failure-repair-engine-overheat-2"),
        new("Pulsing", 6f, "rmc-hardpoint-failure-repair-engine-overheat-3"),
    };

    private static readonly VehicleHardpointFailureRepairStep[] ElectricalShortRepairSteps =
    {
        new("Cutting", 5f, "rmc-hardpoint-failure-repair-electrical-short-1"),
        new("Pulsing", 6f, "rmc-hardpoint-failure-repair-electrical-short-2"),
        new("Screwing", 4f, "rmc-hardpoint-failure-repair-electrical-short-3"),
    };

    private static readonly VehicleHardpointFailureRepairStep[] FuelLeakRepairSteps =
    {
        new("Screwing", 4f, "rmc-hardpoint-failure-repair-fuel-leak-1"),
        new("Welding", 7f, "rmc-hardpoint-failure-repair-fuel-leak-2", true),
        new("Anchoring", 4f, "rmc-hardpoint-failure-repair-fuel-leak-3"),
    };
}
