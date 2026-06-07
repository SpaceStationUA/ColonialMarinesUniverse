using System;
using System.Collections.Generic;
using Content.Shared._CMU14.Medical;
using Content.Shared._CMU14.Medical.Bones;
using Content.Shared._CMU14.Medical.Items;
using Content.Shared._CMU14.Medical.Wounds;
using Content.Shared._RMC14.Medical.Wounds;
using Content.Shared.Body.Components;
using Content.Shared.Body.Part;
using Content.Shared.Body.Systems;
using Content.Shared.Examine;
using Robust.Shared.Configuration;
using Robust.Shared.Containers;

namespace Content.Shared._CMU14.Medical.Examine;

public sealed partial class CMUMedicalExamineSystem : EntitySystem
{
    [Dependency] private IConfigurationManager _cfg = default!;
    [Dependency] private SharedBodySystem _body = default!;
    [Dependency] private SharedContainerSystem _containers = default!;

    private const string UntreatedWoundColor = "#ff4d4d";
    private const string TreatedWoundColor = "#7bd88f";
    private const string FractureColor = "#dca94c";
    private const string SeveredColor = "#ff4d4d";
    private const string DetailedPartColor = "#9fc7ff";
    private const string DetailedInjurySiteColor = "#ff9f43";
    private const string DetailedWoundColor = "#ffb86c";
    private const string DetailedBurnColor = "#ff704d";
    private const string DetailedBleedColor = "#ff5f5f";
    private const string DetailedUntreatedColor = "#ffd166";
    private const string DetailedAdequateColor = "#f0c85a";
    private const string DetailedOptimalColor = "#7bd88f";
    private const string DetailedCleanupColor = "#d987ff";
    private const string DetailedHintColor = "#83c9ff";

    public override void Initialize()
    {
        base.Initialize();

        SubscribeLocalEvent<CMUHumanMedicalComponent, ExaminedEvent>(OnExamined);
    }

    private void OnExamined(Entity<CMUHumanMedicalComponent> ent, ref ExaminedEvent args)
    {
        if (!_cfg.GetCVar(CMUMedicalCCVars.Enabled))
            return;

        using (args.PushGroup(nameof(CMUMedicalExamineSystem), -1))
        {
            AddBodyPartLines(
                ent,
                args,
                _cfg.GetCVar(CMUMedicalCCVars.WoundsEnabled),
                _cfg.GetCVar(CMUMedicalCCVars.BoneEnabled),
                _cfg.GetCVar(CMUMedicalCCVars.BodyPartEnabled));
        }
    }

    private void AddBodyPartLines(
        EntityUid body,
        ExaminedEvent args,
        bool includeWounds,
        bool includeFractures,
        bool includeMissingParts)
    {
        var partSummaries = new List<BodyPartExamineSummary>();

        foreach (var (partUid, part) in _body.GetBodyChildren(body))
        {
            var sections = new List<string>();

            if (includeWounds)
            {
                var untreated = new List<string>();
                var adequate = new List<string>();
                var treated = new List<string>();
                if (TryComp<BodyPartWoundComponent>(partUid, out var wounds))
                {
                    for (var i = 0; i < wounds.Wounds.Count; i++)
                    {
                        if (GetTreatmentQuality(wounds, i) == WoundTreatmentQuality.Adequate)
                            adequate.Add(DescribeVisibleWound(wounds, i));
                        else if (IsWoundTreatedForExamine(wounds, i))
                            treated.Add(DescribeVisibleWound(wounds, i));
                        else
                            untreated.Add(DescribeVisibleWound(wounds, i));
                    }

                    if (wounds.ExternalBleeding != ExternalBleedTier.None)
                        untreated.Add(Loc.GetString("cmu-medical-examine-active-bleeding"));
                }

                if (HasComp<CMUEscharComponent>(partUid))
                    untreated.Add(Loc.GetString("cmu-medical-examine-charred-burn-tissue"));

                if (untreated.Count > 0)
                    sections.Add($"[color={UntreatedWoundColor}]{ToSentence(untreated)}[/color]");

                if (adequate.Count > 0)
                    sections.Add($"[color={DetailedAdequateColor}]{ToSentence(adequate)}[/color]");

                if (treated.Count > 0)
                    sections.Add($"[color={TreatedWoundColor}]{ToSentence(treated)}[/color]");
            }

            if (includeFractures
                && TryComp<FractureComponent>(partUid, out var fracture)
                && fracture.Severity.IsAtLeast(FractureSeverity.Simple))
            {
                var stabilized = HasComp<CMUSplintedComponent>(partUid) || HasComp<CMUCastComponent>(partUid);
                sections.Add($"[color={FractureColor}]{DescribeVisibleFracture(fracture.Severity, stabilized)}[/color]");
            }

            if (sections.Count == 0)
                continue;

            partSummaries.Add(new BodyPartExamineSummary(
                BodyPartSortOrder(part.PartType, part.Symmetry),
                FormatPartName(part.PartType, part.Symmetry),
                ToSemicolonList(sections)));
        }

        if (includeMissingParts)
        {
            foreach (var (type, symmetry) in GetMissingPartSlots(body))
            {
                partSummaries.Add(new BodyPartExamineSummary(
                    BodyPartSortOrder(type, symmetry),
                    FormatPartName(type, symmetry),
                    $"[color={SeveredColor}]{Loc.GetString("cmu-medical-examine-severed")}[/color]"));
            }
        }

        partSummaries.Sort((a, b) => a.Order.CompareTo(b.Order));

        foreach (var summary in partSummaries)
        {
            args.PushMarkup(Loc.GetString(
                "cmu-medical-examine-body-part-line",
                ("part", summary.Part),
                ("conditions", summary.Conditions)));
        }
    }

    public string GetDetailedExamineText(EntityUid body)
    {
        var partSummaries = new List<BodyPartExamineSummary>();

        foreach (var (partUid, part) in _body.GetBodyChildren(body))
        {
            var sections = new List<string>();

            if (TryComp<BodyPartWoundComponent>(partUid, out var wounds))
            {
                for (var i = 0; i < wounds.Wounds.Count; i++)
                {
                    if (IsOptimallyTreatedForDetailedExamine(wounds, i))
                        continue;

                    sections.Add(DescribeDetailedWound(wounds, i));
                }

                if (wounds.ExternalBleeding != ExternalBleedTier.None)
                {
                    sections.Add(Color(Loc.GetString(
                        "cmu-medical-detailed-examine-external-bleeding",
                        ("tier", BleedTierKey(wounds.ExternalBleeding))),
                        DetailedBleedColor));
                }
            }

            if (HasComp<CMUEscharComponent>(partUid))
                sections.Add(Color(Loc.GetString("cmu-medical-detailed-examine-burn-eschar"), DetailedBurnColor));

            if (sections.Count == 0)
                continue;

            partSummaries.Add(new BodyPartExamineSummary(
                BodyPartSortOrder(part.PartType, part.Symmetry),
                PartHeader(part.PartType, part.Symmetry),
                ToDetailedLines(sections)));
        }

        foreach (var (type, symmetry) in GetMissingPartSlots(body))
        {
            partSummaries.Add(new BodyPartExamineSummary(
                BodyPartSortOrder(type, symmetry),
                PartHeader(type, symmetry),
                Color(Loc.GetString("cmu-medical-examine-severed"), SeveredColor)));
        }

        if (partSummaries.Count == 0)
            return Loc.GetString("cmu-medical-detailed-examine-none");

        partSummaries.Sort((a, b) => a.Order.CompareTo(b.Order));

        var lines = new List<string>(partSummaries.Count);
        foreach (var summary in partSummaries)
        {
            lines.Add($"{summary.Part}:\n  {summary.Conditions}");
        }

        return string.Join('\n', lines);
    }

    public string GetInspectInjuriesText(EntityUid body)
    {
        var groups = new Dictionary<string, InspectInjuryGroup>();

        foreach (var (partUid, part) in _body.GetBodyChildren(body))
        {
            var partName = FormatPartName(part.PartType, part.Symmetry);
            var partOrder = BodyPartSortOrder(part.PartType, part.Symmetry);

            if (TryComp<BodyPartWoundComponent>(partUid, out var wounds))
            {
                for (var i = 0; i < wounds.Wounds.Count; i++)
                {
                    if (IsOptimallyTreatedForDetailedExamine(wounds, i))
                        continue;

                    var wound = wounds.Wounds[i];
                    var size = i < wounds.Sizes.Count ? wounds.Sizes[i] : WoundSize.Deep;
                    var mechanism = i < wounds.Mechanisms.Count ? wounds.Mechanisms[i] : LegacyMechanismFor(wound.Type);
                    var quality = GetTreatmentQuality(wounds, i);
                    var cleanup = i < wounds.Cleanup.Count ? wounds.Cleanup[i] : WoundCleanupFlags.None;
                    var header = GetInspectWoundHeader(mechanism, wound.Type);
                    var key = header;

                    if (!groups.TryGetValue(key, out var group))
                    {
                        group = new InspectInjuryGroup(partOrder, header);
                        groups.Add(key, group);
                    }
                    else if (partOrder < group.Order)
                    {
                        group.Order = partOrder;
                    }

                    group.AddWound(
                        partName,
                        InspectSeverity(size),
                        quality,
                        wound.Treated,
                        DescribeInspectCleanupRequired(cleanup),
                        DescribeInspectOptimalTreatment(DescribeOptimalHint(mechanism, wound.Type, cleanup)));
                }

                if (wounds.ExternalBleeding == ExternalBleedTier.Arterial)
                    AddArterialBleedingSite(groups, partName, partOrder);
            }

            if (HasComp<CMUEscharComponent>(partUid))
            {
                var header = Color(Loc.GetString("cmu-medical-inspect-injuries-burn-eschar"), DetailedBurnColor);
                var key = header;

                if (!groups.TryGetValue(key, out var group))
                {
                    group = new InspectInjuryGroup(partOrder, header);
                    groups.Add(key, group);
                }
                else if (partOrder < group.Order)
                {
                    group.Order = partOrder;
                }

                group.AddCleanup(Loc.GetString(
                    "cmu-medical-inspect-injuries-cleanup-required-with-entries",
                    ("entries", DescribeCleanupEntry("charred-tissue"))));
            }
        }

        foreach (var (type, symmetry) in GetMissingPartSlots(body))
        {
            var partName = FormatPartName(type, symmetry);
            var partOrder = BodyPartSortOrder(type, symmetry);
            var header = Color(Loc.GetString("cmu-medical-examine-severed"), SeveredColor);
            var key = header;

            if (!groups.TryGetValue(key, out var group))
            {
                group = new InspectInjuryGroup(partOrder, header);
                groups.Add(key, group);
            }
            else if (partOrder < group.Order)
            {
                group.Order = partOrder;
            }

            group.AddSite(partName);
        }

        if (groups.Count == 0)
            return Loc.GetString("cmu-medical-detailed-examine-none");

        var ordered = new List<InspectInjuryGroup>(groups.Values);
        ordered.Sort((a, b) =>
        {
            var order = a.Order.CompareTo(b.Order);
            return order != 0
                ? order
                : string.Compare(a.Header, b.Header, StringComparison.Ordinal);
        });

        var lines = new List<string>(ordered.Count);
        foreach (var group in ordered)
        {
            lines.Add(group.Render());
        }

        return string.Join('\n', lines);
    }

    public ExternalBleedTier GetWorstExternalBleeding(EntityUid body)
    {
        var bleeding = ExternalBleedTier.None;

        foreach (var (partUid, _) in _body.GetBodyChildren(body))
        {
            if (!TryComp<BodyPartWoundComponent>(partUid, out var wounds) ||
                wounds.ExternalBleeding <= bleeding)
            {
                continue;
            }

            bleeding = wounds.ExternalBleeding;
        }

        return bleeding;
    }

    private void AddArterialBleedingSite(Dictionary<string, InspectInjuryGroup> groups, string partName, int partOrder)
    {
        const string key = "arterial bleeding";
        var header = Color(Loc.GetString("cmu-medical-inspect-injuries-arterial-bleeding"), DetailedBleedColor);

        if (!groups.TryGetValue(key, out var group))
        {
            group = new InspectInjuryGroup(partOrder, header, DetailedBleedColor);
            groups.Add(key, group);
        }
        else if (partOrder < group.Order)
        {
            group.Order = partOrder;
        }

        group.AddSite(partName);
    }

    private static bool IsOptimallyTreatedForDetailedExamine(BodyPartWoundComponent wounds, int index)
    {
        var cleanup = index < wounds.Cleanup.Count ? wounds.Cleanup[index] : WoundCleanupFlags.None;
        return GetTreatmentQuality(wounds, index) == WoundTreatmentQuality.Optimal &&
               cleanup == WoundCleanupFlags.None;
    }

    private List<(BodyPartType Type, BodyPartSymmetry Symmetry)> GetMissingPartSlots(EntityUid body)
    {
        var missing = new List<(BodyPartType Type, BodyPartSymmetry Symmetry)>();
        if (!TryComp<BodyComponent>(body, out var bodyComp))
            return missing;

        if (_body.GetRootPartOrNull(body, bodyComp) is not { } root)
            return missing;

        AddMissingChildSlots(root.Entity, root.BodyPart, missing);

        foreach (var (partUid, part) in _body.GetBodyChildren(body, bodyComp))
        {
            if (partUid == root.Entity)
                continue;

            AddMissingChildSlots(partUid, part, missing);
        }

        return missing;
    }

    private void AddMissingChildSlots(
        EntityUid parent,
        BodyPartComponent parentPart,
        List<(BodyPartType Type, BodyPartSymmetry Symmetry)> missing)
    {
        foreach (var (slotId, slot) in parentPart.Children)
        {
            if (!IsReportableMissingPart(slot.Type))
                continue;

            var containerId = SharedBodySystem.GetPartSlotContainerId(slotId);
            if (_containers.TryGetContainer(parent, containerId, out var container) &&
                container.ContainedEntities.Count > 0)
            {
                continue;
            }

            if (TryGetPartSymmetry(slotId, parentPart.Symmetry, out var symmetry))
                missing.Add((slot.Type, symmetry));
        }
    }

    private static bool IsReportableMissingPart(BodyPartType type)
    {
        return type is BodyPartType.Arm
            or BodyPartType.Hand
            or BodyPartType.Leg
            or BodyPartType.Foot;
    }

    private static bool TryGetPartSymmetry(string slotId, BodyPartSymmetry parentSymmetry, out BodyPartSymmetry symmetry)
    {
        if (slotId.Contains("left", StringComparison.OrdinalIgnoreCase))
        {
            symmetry = BodyPartSymmetry.Left;
            return true;
        }

        if (slotId.Contains("right", StringComparison.OrdinalIgnoreCase))
        {
            symmetry = BodyPartSymmetry.Right;
            return true;
        }

        if (parentSymmetry is BodyPartSymmetry.Left or BodyPartSymmetry.Right)
        {
            symmetry = parentSymmetry;
            return true;
        }

        symmetry = BodyPartSymmetry.None;
        return false;
    }

    private string DescribeVisibleWound(BodyPartWoundComponent wounds, int index)
    {
        var wound = wounds.Wounds[index];
        var size = index < wounds.Sizes.Count ? wounds.Sizes[index] : WoundSize.Deep;
        var sizeKey = size switch
        {
            WoundSize.Small => "small",
            WoundSize.Gaping => "gaping",
            WoundSize.Massive => "massive",
            _ => "deep",
        };

        var kindKey = wound.Type switch
        {
            WoundType.Burn => "burn",
            WoundType.Surgery => "surgery",
            _ => GetVisibleWoundKind(wounds, index),
        };

        var bleeding = wounds.ExternalBleeding != ExternalBleedTier.None &&
                       !IsWoundTreatedForExamine(wounds, index);

        return Loc.GetString("cmu-medical-examine-wound",
            ("size", sizeKey),
            ("kind", kindKey),
            ("treated", IsWoundTreatedForExamine(wounds, index) ? "yes" : "no"),
            ("bleeding", bleeding ? "yes" : "no"));
    }

    private static string GetVisibleWoundKind(BodyPartWoundComponent wounds, int index)
    {
        if (index < wounds.Mechanisms.Count && wounds.Mechanisms[index] == WoundMechanism.Burn)
            return "burn";

        return "trauma";
    }

    private string DescribeVisibleFracture(FractureSeverity severity, bool stabilized)
    {
        var severityKey = severity switch
        {
            FractureSeverity.Hairline => "hairline",
            FractureSeverity.Simple => "simple",
            FractureSeverity.Compound => "compound",
            FractureSeverity.Comminuted => "comminuted",
            _ => "other",
        };

        return Loc.GetString("cmu-medical-examine-fracture",
            ("severity", severityKey),
            ("stabilized", stabilized ? "yes" : "no"));
    }

    private string DescribeDetailedWound(BodyPartWoundComponent wounds, int index)
    {
        var details = GetDetailedWoundDetails(wounds, index);
        return ToDetailedLines(new List<string>
        {
            details.Header,
            details.Body,
        });
    }

    private string GetInspectWoundHeader(WoundMechanism mechanism, WoundType type)
    {
        return Color(DescribeInspectWoundTitle(mechanism, type), WoundColorFor(mechanism, type));
    }

    private string DescribeInspectWoundTitle(WoundMechanism mechanism, WoundType type)
    {
        return Loc.GetString("cmu-medical-inspect-injuries-title",
            ("mechanism", DetailedMechanismKey(mechanism, type)));
    }

    private string InspectSeverity(WoundSize size)
    {
        return Loc.GetString("cmu-medical-inspect-injuries-severity",
            ("size", DetailedSizeKey(size)));
    }

    private string DescribeInspectCleanupRequired(WoundCleanupFlags cleanup)
    {
        if (cleanup == WoundCleanupFlags.None)
            return Loc.GetString("cmu-medical-inspect-injuries-cleanup-required");

        var entries = new List<string>(4);
        if ((cleanup & WoundCleanupFlags.RetainedFragment) != WoundCleanupFlags.None)
            entries.Add(DescribeCleanupEntry("retained-fragments"));
        if ((cleanup & WoundCleanupFlags.PoorClosure) != WoundCleanupFlags.None)
            entries.Add(DescribeCleanupEntry("poor-closure"));
        if ((cleanup & WoundCleanupFlags.CharredTissue) != WoundCleanupFlags.None)
            entries.Add(DescribeCleanupEntry("charred-tissue"));
        if ((cleanup & WoundCleanupFlags.CrushDebris) != WoundCleanupFlags.None)
            entries.Add(DescribeCleanupEntry("crush-debris"));
        if ((cleanup & WoundCleanupFlags.DirtyDressing) != WoundCleanupFlags.None)
            entries.Add(DescribeCleanupEntry("dirty-dressing"));

        return Loc.GetString("cmu-medical-inspect-injuries-cleanup-required-with-entries",
            ("entries", ToSentence(entries)));
    }

    private string DescribeInspectOptimalTreatment(string optimalTreatment)
    {
        return optimalTreatment.Length == 0
            ? string.Empty
            : Loc.GetString("cmu-medical-inspect-injuries-optimal-treatment",
                ("treatment", optimalTreatment));
    }

    private DetailedWoundDetails GetDetailedWoundDetails(BodyPartWoundComponent wounds, int index)
    {
        var wound = wounds.Wounds[index];
        var size = index < wounds.Sizes.Count ? wounds.Sizes[index] : WoundSize.Deep;
        var mechanism = index < wounds.Mechanisms.Count ? wounds.Mechanisms[index] : LegacyMechanismFor(wound.Type);
        var quality = GetTreatmentQuality(wounds, index);
        var cleanup = index < wounds.Cleanup.Count ? wounds.Cleanup[index] : WoundCleanupFlags.None;

        var header = Color(Loc.GetString(
            "cmu-medical-detailed-examine-wound",
            ("size", DetailedSizeKey(size)),
            ("mechanism", DetailedMechanismKey(mechanism, wound.Type))),
            WoundColorFor(mechanism, wound.Type));
        var details = new List<string>
        {
            Color(
                Loc.GetString(
                    "cmu-medical-detailed-examine-treatment",
                    ("quality", TreatmentQualityKey(quality)),
                    ("treated", wound.Treated ? "yes" : "no")),
                TreatmentColorFor(quality, wound.Treated)),
        };

        var cleanupText = quality == WoundTreatmentQuality.Adequate
            ? DescribeCleanup(cleanup)
            : string.Empty;
        if (cleanupText.Length > 0)
            details.Add(Color(cleanupText, DetailedCleanupColor));

        var optimalHint = DescribeOptimalHint(mechanism, wound.Type, cleanup);
        if (quality != WoundTreatmentQuality.Optimal && optimalHint.Length > 0)
        {
            details.Add(Color(Loc.GetString(
                "cmu-medical-detailed-examine-optimal",
                ("hint", optimalHint)),
                DetailedHintColor));
        }

        return new DetailedWoundDetails(header, ToDetailedLines(details));
    }

    private static bool IsWoundTreatedForExamine(BodyPartWoundComponent wounds, int index)
    {
        return wounds.Wounds[index].Treated || GetTreatmentQuality(wounds, index) != WoundTreatmentQuality.Untreated;
    }

    private static WoundTreatmentQuality GetTreatmentQuality(BodyPartWoundComponent wounds, int index)
    {
        return index < wounds.TreatmentQualities.Count
            ? wounds.TreatmentQualities[index]
            : WoundTreatmentQuality.Untreated;
    }

    private static string ToDetailedLines(List<string> sections)
    {
        return string.Join("\n  ", sections);
    }

    private string PartHeader(BodyPartType type, BodyPartSymmetry symmetry)
    {
        return $"[bold]{Color(FormatPartName(type, symmetry), DetailedPartColor)}[/bold]";
    }

    private static string Color(string text, string color)
    {
        return $"[color={color}]{text}[/color]";
    }

    private static string WoundColorFor(WoundMechanism mechanism, WoundType type)
    {
        if (mechanism == WoundMechanism.Burn || type == WoundType.Burn)
            return DetailedBurnColor;

        return DetailedWoundColor;
    }

    private static string TreatmentColorFor(WoundTreatmentQuality quality, bool treated)
    {
        return quality switch
        {
            WoundTreatmentQuality.Optimal => DetailedOptimalColor,
            WoundTreatmentQuality.Adequate => DetailedAdequateColor,
            _ => treated ? TreatedWoundColor : DetailedUntreatedColor,
        };
    }

    private static string DescribeDetailedFracture(FractureSeverity severity, bool stabilized)
    {
        var prefix = stabilized ? "stabilized " : string.Empty;
        return severity switch
        {
            FractureSeverity.Hairline => $"{prefix}hairline fracture",
            FractureSeverity.Simple => $"{prefix}simple fracture",
            FractureSeverity.Compound => $"{prefix}compound fracture",
            FractureSeverity.Comminuted => $"{prefix}comminuted fracture",
            _ => "fracture",
        };
    }

    private static string DetailedSizeKey(WoundSize size) => size switch
    {
        WoundSize.Small => "small",
        WoundSize.Deep => "deep",
        WoundSize.Gaping => "gaping",
        WoundSize.Massive => "massive",
        _ => "deep",
    };

    private static string DetailedMechanismKey(WoundMechanism mechanism, WoundType type) => mechanism switch
    {
        WoundMechanism.Bullet => "bullet",
        WoundMechanism.Stab => "stab",
        WoundMechanism.Slash => "slash",
        WoundMechanism.Crush => "crush",
        WoundMechanism.Burn => "burn",
        WoundMechanism.Blast => "blast",
        WoundMechanism.Fragment => "fragment",
        WoundMechanism.Surgical => "surgical",
        _ => type == WoundType.Burn ? "burn" : "wound",
    };

    private static string TreatmentQualityKey(WoundTreatmentQuality quality) => quality switch
    {
        WoundTreatmentQuality.Optimal => "optimal",
        WoundTreatmentQuality.Adequate => "adequate",
        _ => "other",
    };

    private string DescribeCleanup(WoundCleanupFlags cleanup)
    {
        if (cleanup == WoundCleanupFlags.None)
            return string.Empty;

        var entries = new List<string>(4);
        if ((cleanup & WoundCleanupFlags.RetainedFragment) != WoundCleanupFlags.None)
            entries.Add(DescribeCleanupEntry("retained-fragments"));
        if ((cleanup & WoundCleanupFlags.PoorClosure) != WoundCleanupFlags.None)
            entries.Add(DescribeCleanupEntry("poor-closure"));
        if ((cleanup & WoundCleanupFlags.CharredTissue) != WoundCleanupFlags.None)
            entries.Add(DescribeCleanupEntry("charred-tissue"));
        if ((cleanup & WoundCleanupFlags.CrushDebris) != WoundCleanupFlags.None)
            entries.Add(DescribeCleanupEntry("crush-debris"));
        if ((cleanup & WoundCleanupFlags.DirtyDressing) != WoundCleanupFlags.None)
            entries.Add(DescribeCleanupEntry("dirty-dressing"));

        return Loc.GetString("cmu-medical-detailed-examine-cleanup-needed",
            ("entries", ToSentence(entries)));
    }

    private string DescribeCleanupEntry(string cleanup)
    {
        return Loc.GetString("cmu-medical-detailed-examine-cleanup",
            ("cleanup", cleanup));
    }

    private string DescribeOptimalHint(WoundMechanism mechanism, WoundType type, WoundCleanupFlags cleanup)
    {
        var hint = OptimalHintKey(mechanism, type, cleanup);
        return hint.Length == 0
            ? string.Empty
            : Loc.GetString("cmu-medical-detailed-examine-optimal-hint",
                ("hint", hint));
    }

    private static string OptimalHintKey(WoundMechanism mechanism, WoundType type, WoundCleanupFlags cleanup)
    {
        if ((cleanup & WoundCleanupFlags.RetainedFragment) != WoundCleanupFlags.None)
            return "remove-shrapnel";
        if ((cleanup & WoundCleanupFlags.PoorClosure) != WoundCleanupFlags.None)
            return "sealing-dressing";
        if ((cleanup & WoundCleanupFlags.CharredTissue) != WoundCleanupFlags.None)
            return "burn-dressing";
        if ((cleanup & WoundCleanupFlags.CrushDebris) != WoundCleanupFlags.None)
            return "compression-dressing";

        return mechanism switch
        {
            WoundMechanism.Bullet or WoundMechanism.Stab or WoundMechanism.Fragment => "hemostatic-dressing",
            WoundMechanism.Slash or WoundMechanism.Surgical => "sealing-dressing",
            WoundMechanism.Crush or WoundMechanism.Blast => "compression-dressing",
            WoundMechanism.Burn => "burn-dressing",
            _ when type == WoundType.Burn => "burn-dressing",
            _ when (cleanup & WoundCleanupFlags.DirtyDressing) != WoundCleanupFlags.None => "antiseptic-dressing",
            _ => string.Empty,
        };
    }

    private static string BleedTierKey(ExternalBleedTier tier) => tier switch
    {
        ExternalBleedTier.Minor => "minor",
        ExternalBleedTier.Moderate => "moderate",
        ExternalBleedTier.Severe => "severe",
        ExternalBleedTier.Arterial => "arterial",
        _ => "none",
    };

    private static WoundMechanism LegacyMechanismFor(WoundType type) => type switch
    {
        WoundType.Burn => WoundMechanism.Burn,
        WoundType.Surgery => WoundMechanism.Surgical,
        _ => WoundMechanism.Generic,
    };

    private string FormatPartName(BodyPartType type, BodyPartSymmetry symmetry)
    {
        var key = (type, symmetry) switch
        {
            (BodyPartType.Head, _) => "head",
            (BodyPartType.Torso, _) => "torso",
            (BodyPartType.Arm, BodyPartSymmetry.Left) => "left-arm",
            (BodyPartType.Arm, BodyPartSymmetry.Right) => "right-arm",
            (BodyPartType.Hand, BodyPartSymmetry.Left) => "left-hand",
            (BodyPartType.Hand, BodyPartSymmetry.Right) => "right-hand",
            (BodyPartType.Leg, BodyPartSymmetry.Left) => "left-leg",
            (BodyPartType.Leg, BodyPartSymmetry.Right) => "right-leg",
            (BodyPartType.Foot, BodyPartSymmetry.Left) => "left-foot",
            (BodyPartType.Foot, BodyPartSymmetry.Right) => "right-foot",
            _ => "other",
        };

        var fallback = symmetry switch
        {
            BodyPartSymmetry.Left => "Left " + type.ToString().ToLowerInvariant(),
            BodyPartSymmetry.Right => "Right " + type.ToString().ToLowerInvariant(),
            _ => type.ToString(),
        };

        return Loc.GetString("cmu-medical-examine-part",
            ("part", key),
            ("fallback", fallback));
    }

    private static int BodyPartSortOrder(BodyPartType type, BodyPartSymmetry symmetry)
    {
        return type switch
        {
            BodyPartType.Head => 0,
            BodyPartType.Torso => 10,
            BodyPartType.Arm when symmetry == BodyPartSymmetry.Left => 20,
            BodyPartType.Hand when symmetry == BodyPartSymmetry.Left => 21,
            BodyPartType.Arm when symmetry == BodyPartSymmetry.Right => 30,
            BodyPartType.Hand when symmetry == BodyPartSymmetry.Right => 31,
            BodyPartType.Leg when symmetry == BodyPartSymmetry.Left => 40,
            BodyPartType.Foot when symmetry == BodyPartSymmetry.Left => 41,
            BodyPartType.Leg when symmetry == BodyPartSymmetry.Right => 50,
            BodyPartType.Foot when symmetry == BodyPartSymmetry.Right => 51,
            _ => 100 + ((int) type * 10) + SymmetrySortOrder(symmetry),
        };
    }

    private static int SymmetrySortOrder(BodyPartSymmetry symmetry)
    {
        return symmetry switch
        {
            BodyPartSymmetry.Left => 0,
            BodyPartSymmetry.None => 1,
            BodyPartSymmetry.Right => 2,
            _ => 3,
        };
    }

    private string ToSentence(List<string> parts)
    {
        return parts.Count switch
        {
            0 => string.Empty,
            1 => parts[0],
            2 => Loc.GetString("cmu-medical-examine-sentence-two",
                ("a", parts[0]),
                ("b", parts[1])),
            _ => Loc.GetString("cmu-medical-examine-sentence-many",
                ("rest", string.Join(", ", parts.GetRange(0, parts.Count - 1))),
                ("last", parts[parts.Count - 1])),
        };
    }

    private static string ToSemicolonList(List<string> parts)
    {
        return string.Join("; ", parts);
    }

    private readonly record struct BodyPartExamineSummary(int Order, string Part, string Conditions);

    private readonly record struct DetailedWoundDetails(string Header, string Body);

    private sealed class InspectInjuryGroup
    {
        private readonly HashSet<string> _cleanupLines = new();
        private readonly HashSet<string> _optimalLines = new();
        private readonly HashSet<string> _siteLines = new();

        public int Order;
        public readonly string Header;
        public readonly List<string> CleanupLines = new();
        public readonly List<string> OptimalLines = new();
        public readonly List<string> SiteLines = new();
        private readonly string _siteColor;

        public InspectInjuryGroup(int order, string header, string siteColor = DetailedInjurySiteColor)
        {
            Order = order;
            Header = header;
            _siteColor = siteColor;
        }

        public void AddWound(
            string part,
            string severity,
            WoundTreatmentQuality quality,
            bool treated,
            string cleanupRequired,
            string optimalTreatment)
        {
            if (quality == WoundTreatmentQuality.Adequate)
                AddCleanup(cleanupRequired);

            if (optimalTreatment.Length > 0)
                AddOptimal(optimalTreatment);

            if (quality == WoundTreatmentQuality.Untreated && !treated)
                AddSite($"{severity} {part}");
        }

        public void AddCleanup(string cleanup)
        {
            if (_cleanupLines.Add(cleanup))
                CleanupLines.Add(cleanup);
        }

        public void AddOptimal(string treatment)
        {
            if (_optimalLines.Add(treatment))
                OptimalLines.Add(treatment);
        }

        public void AddSite(string site)
        {
            if (_siteLines.Add(site))
                SiteLines.Add(site);
        }

        public string Render()
        {
            var lines = new List<string>
            {
                $"[bold]{Header}[/bold]",
            };

            foreach (var cleanup in CleanupLines)
                lines.Add($"  {Color(cleanup, DetailedCleanupColor)}");

            foreach (var treatment in OptimalLines)
                lines.Add($"  {Color(treatment, DetailedHintColor)}");

            if (SiteLines.Count > 0)
                lines.Add($"  {Color(string.Join(", ", SiteLines), _siteColor)}");

            return string.Join('\n', lines);
        }
    }
}
