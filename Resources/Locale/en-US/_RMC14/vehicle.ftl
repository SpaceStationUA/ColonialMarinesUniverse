rmc-vehicle-wheel-repaired = Wheel repaired.
rmc-vehicle-crash-immobile = The engine stalls from the impact!
rmc-vehicle-crash-immobile-try-again = The engine is still recovering from the impact.
rmc-vehicle-crash-immobile-recovered = The engine catches again.
rmc-vehicle-ride-climb = Climb on
rmc-vehicle-ride-climb-self = You climb onto {$vehicle}.
rmc-vehicle-ride-climb-others = {$user} climbs onto {$vehicle}.
rmc-vehicle-ride-climb-down = Climb down
rmc-vehicle-ride-climb-down-self = You climb down from {$vehicle}.
rmc-vehicle-ride-climb-down-others = {$user} climbs down from {$vehicle}.
rmc-hardpoint-remove-verb = Remove {$slot}
rmc-hardpoint-repaired = Hardpoint repaired.
rmc-hardpoint-intact = Hardpoint is already intact.
rmc-hardpoint-integrity-examine = Integrity: [color={$color}]{$current}/{$max} ({$percent}%)[/color]
rmc-hardpoint-armor-modifiers-examine = Damage modifiers: acid {$acid}, slash {$slash}, bullet {$bullet}, explosive {$explosive}, blunt {$blunt}
rmc-hardpoint-condition-pristine = It is in pristine condition.
rmc-hardpoint-condition-good = It is in good condition.
rmc-hardpoint-condition-worn = It is showing wear.
rmc-hardpoint-condition-bad = It is in bad condition.
rmc-hardpoint-condition-critical = It is barely holding together.
rmc-hardpoint-ui-title = Hardpoints
rmc-hardpoint-ui-empty-slot = Empty
rmc-hardpoint-ui-integrity = {$current}/{$max} ({$percent}%)
rmc-hardpoint-ui-no-integrity = No integrity data
rmc-hardpoint-ui-remove = Remove
rmc-hardpoint-ui-removing = Removing...
rmc-hardpoint-failure-vehicle-header = Vehicle malfunctions
rmc-hardpoint-failure-hardpoint-header = Hardpoint malfunctions
rmc-hardpoint-failure-title-on-label = {$failure} on {$label}
rmc-hardpoint-failure-effect-line = Effect: {$effect}
rmc-hardpoint-failure-repair-line = Repair: step {$step}/{$count} - {$instruction} Use {$tool}.
rmc-hardpoint-failure-status-with-step = {$failure} ({$step}/{$count}: {$tool})
rmc-hardpoint-failure-diagnostic-status = {$failure} - {$effect}
rmc-hardpoint-failure-hull-summary = Hull: {$failures}
rmc-hardpoint-failure-repair-step-complete = {$failure} repair step complete. Next: {$tool}.
rmc-hardpoint-failure-name = { $failure ->
    [armor-compromised] armor plating breach
    [feed-jam] jammed feed system
    [runaway-trigger] runaway trigger
    [turret-traverse-damage] damaged traverse ring
    [engine-misfire] engine misfire
    [transmission-slip] transmission slip
    [warped-frame] warped frame
    [damaged-mount] damaged mount
    [tire-blowout] tire blowout
    [thrown-tread] thrown tread
    [engine-overheat] engine overheating
    [electrical-short] electrical short
    [fuel-leak] fuel leak
   *[hardpoint-failure] hardpoint failure
}
rmc-hardpoint-failure-alert-name = { $failure ->
    [armor-compromised] Armor plating breach
    [feed-jam] Weapon feed jam
    [runaway-trigger] Runaway trigger
    [turret-traverse-damage] Turret traverse damage
    [engine-misfire] Engine misfire
    [transmission-slip] Transmission slip
    [warped-frame] Warped frame
    [damaged-mount] Damaged mount
    [tire-blowout] Tire blowout
    [thrown-tread] Thrown tread
    [engine-overheat] Engine overheating
    [electrical-short] Electrical short
    [fuel-leak] Fuel leak
   *[hardpoint-failure] Hardpoint failure
}
rmc-hardpoint-failure-effect = { $failure ->
    [armor-compromised] Armor protection from this hardpoint is offline.
    [feed-jam] This weapon can randomly jam or misfire.
    [runaway-trigger] This weapon can discharge on its own while mounted.
    [turret-traverse-damage] Turret traverse speed is severely reduced.
    [engine-misfire] Vehicle acceleration and top speed are reduced.
    [transmission-slip] Vehicle acceleration, reverse speed, and top speed are reduced.
    [warped-frame] The vehicle frame drags and reduces movement performance.
    [damaged-mount] This hardpoint's output is weakened until the mount is reseated.
    [tire-blowout] The vehicle loses speed and traction from a damaged tire.
    [thrown-tread] The vehicle can barely move until the tread is re-seated.
    [engine-overheat] The engine bogs down and acceleration is heavily reduced.
    [electrical-short] This hardpoint's electrical output is unreliable and weakened.
    [fuel-leak] The Blackfoot leaks fuel over time until repaired.
   *[hardpoint-failure] The hardpoint is malfunctioning.
}
rmc-hardpoint-failure-repair-armor-compromised-1 = Tighten the armor fasteners and clamp the plate into alignment.
rmc-hardpoint-failure-repair-armor-compromised-2 = Weld and patch the breached armor seams.
rmc-hardpoint-failure-repair-feed-jam-1 = Open the feed cover and clear bent belt links.
rmc-hardpoint-failure-repair-feed-jam-2 = Cycle the feed actuator with a multitool.
rmc-hardpoint-failure-repair-runaway-trigger-1 = Open the trigger housing and isolate the worn sear linkage.
rmc-hardpoint-failure-repair-runaway-trigger-2 = Reset the fire-control relay with a multitool.
rmc-hardpoint-failure-repair-runaway-trigger-3 = Re-seat and tighten the trigger linkage.
rmc-hardpoint-failure-repair-turret-traverse-damage-1 = Tighten and re-index the traverse ring.
rmc-hardpoint-failure-repair-turret-traverse-damage-2 = Jack the turret bearing clear and re-seat the ring.
rmc-hardpoint-failure-repair-engine-misfire-1 = Open the engine access panel.
rmc-hardpoint-failure-repair-engine-misfire-2 = Pulse the ignition control circuit with a multitool.
rmc-hardpoint-failure-repair-engine-misfire-3 = Tighten the engine mounts after the circuit stabilizes.
rmc-hardpoint-failure-repair-transmission-slip-1 = Lift and re-seat the drivetrain with a maintenance jack.
rmc-hardpoint-failure-repair-transmission-slip-2 = Tighten the transmission housing bolts.
rmc-hardpoint-failure-repair-warped-frame-1 = Jack the frame and relieve pressure from the warped section.
rmc-hardpoint-failure-repair-warped-frame-2 = Heat and straighten the warped frame members with a welder.
rmc-hardpoint-failure-repair-warped-frame-3 = Re-torque the frame braces.
rmc-hardpoint-failure-repair-damaged-mount-1 = Jack the hardpoint clear of the damaged mount.
rmc-hardpoint-failure-repair-damaged-mount-2 = Re-seat and tighten the mount locking hardware.
rmc-hardpoint-failure-repair-tire-blowout-1 = Pry the shredded tire casing clear of the rim.
rmc-hardpoint-failure-repair-tire-blowout-2 = Jack the hub up and seat a replacement wheel assembly.
rmc-hardpoint-failure-repair-tire-blowout-3 = Torque the wheel lugs down in sequence.
rmc-hardpoint-failure-repair-thrown-tread-1 = Jack the running gear up and take tension off the tread.
rmc-hardpoint-failure-repair-thrown-tread-2 = Pry the thrown tread links back onto the road wheels.
rmc-hardpoint-failure-repair-thrown-tread-3 = Lock the tensioner and torque the tread pins.
rmc-hardpoint-failure-repair-engine-overheat-1 = Open the engine shroud and vent trapped heat.
rmc-hardpoint-failure-repair-engine-overheat-2 = Pry the warped fan guard away from the radiator.
rmc-hardpoint-failure-repair-engine-overheat-3 = Pulse the coolant pump controller until flow stabilizes.
rmc-hardpoint-failure-repair-electrical-short-1 = Cut away the burned wiring from the hardpoint harness.
rmc-hardpoint-failure-repair-electrical-short-2 = Trace and reset the control circuit with a multitool.
rmc-hardpoint-failure-repair-electrical-short-3 = Close the access panel and secure the replacement harness.
rmc-hardpoint-failure-repair-fuel-leak-1 = Open the fuel service panel and isolate the ruptured line.
rmc-hardpoint-failure-repair-fuel-leak-2 = Patch the leaking fuel line.
rmc-hardpoint-failure-repair-fuel-leak-3 = Tighten the fuel line coupling.
rmc-vehicle-ammo-loader-no-vehicle = The loader isn't connected to a vehicle.
rmc-vehicle-ammo-loader-no-hardpoint = No compatible hardpoint is installed.
rmc-vehicle-ammo-loader-wrong-ammo = That ammo doesn't fit this loader.
rmc-vehicle-ammo-loader-full = {$target} is already full.
rmc-vehicle-ammo-loader-empty = {$box} is empty.
rmc-vehicle-ammo-loader-loaded = Loaded {$amount} rounds into {$target}.
rmc-vehicle-ammo-loader-unloaded = Removed {$amount} rounds from {$target}.
rmc-vehicle-ammo-loader-box-full = {$box} is full.
rmc-vehicle-ammo-loader-in-use = The loader is already in use.
rmc-vehicle-ammo-loader-hold-ammo = You need to hold the ammo box to load it.
rmc-vehicle-ammo-loader-not-enough = The ammo box doesn't have enough rounds for a magazine.
rmc-vehicle-ammo-loader-ui-ammo = Ammo: {$current}/{$max}
rmc-vehicle-ammo-loader-ui-no-hardpoints = No compatible hardpoints.
rmc-vehicle-ammo-loader-ui-slot = Slot: {$slot} ({$type})
rmc-vehicle-ammo-loader-ui-chambered = Chambered: {$current}/{$max}
rmc-vehicle-ammo-loader-ui-stored = Stored: {$current}/{$max}
rmc-vehicle-ammo-loader-ui-load = Load
rmc-vehicle-ammo-loader-ui-full = Full
rmc-vehicle-ammo-loader-ui-no-ammo = No Ammo
rmc-vehicle-ammo-loader-ui-ready-slot = 1 Gun
rmc-vehicle-ammo-loader-ui-slot-tooltip = {$current}/{$max} rounds
rmc-vehicle-weapons-ui-title = Vehicle Weapons
rmc-vehicle-weapons-ui-empty-slot = Empty
rmc-vehicle-weapons-ui-select = Select
rmc-vehicle-weapons-ui-selected = Selected
rmc-vehicle-weapons-ui-unavailable = Unavailable
rmc-vehicle-weapons-ui-ammo = Ammo: {$current}/{$max}
rmc-vehicle-weapons-ui-ammo-none = Ammo: --
rmc-vehicle-weapons-ui-chambered = Chambered: {$current}/{$max}
rmc-vehicle-weapons-ui-stored = Stored: {$current}/{$max}
rmc-vehicle-weapons-ui-operator = Operator: {$name}
rmc-vehicle-weapons-ui-operator-self = Operator: You
rmc-vehicle-weapons-ui-in-use = In Use
rmc-vehicle-weapons-ui-slot = Slot: {$slot}
rmc-vehicle-weapons-ui-turret-slot = Turret slot: {$slot}
rmc-vehicle-weapons-ui-mounted-to = Mounted to: {$slot}
rmc-vehicle-weapons-ui-hardpoint-in-use = {$operator} is already operating that hardpoint.
rmc-vehicle-weapons-ui-auto-on = Auto Turret: On
rmc-vehicle-weapons-ui-auto-off = Auto Turret: Off
rmc-vehicle-weapons-ui-stabilization-on = Stabilization: On
rmc-vehicle-weapons-ui-stabilization-off = Stabilization: Off
rmc-vehicle-weapons-ui-none-selected = No hardpoint selected
rmc-vehicle-weapons-ui-integrity = Integrity: {$current}/{$max} ({$percent}%)
rmc-vehicle-weapons-ui-no-integrity = Integrity: --
rmc-vehicle-weapons-ui-cooldown-ready = READY
rmc-vehicle-weapons-ui-cooldown-recharging = Reloading: {$seconds}s
rmc-vehicle-portgun-need-seat = You need to be seated at the port gun.
rmc-vehicle-portgun-no-vehicle = The port gun isn't connected to a vehicle.
rmc-vehicle-portgun-no-gun = The port gun isn't installed.
rmc-vehicle-portgun-in-use = {$operator} is already operating the port gun.
rmc-vehicle-portgun-active = You are already operating the port gun.
rmc-vehicle-portgun-examine-ammo = Ammo: {$current}/{$max}
rmc-vehicle-portgun-eject = Eject magazine
rmc-vehicle-turret-no-base = No compatible turret is installed.
rmc-vehicle-deploy-not-driver = You need to be in the driver seat to deploy.
rmc-vehicle-deploy-requires-turret = A turret must be installed to deploy.
rmc-vehicle-deploy-start = Deployment started.
rmc-vehicle-undeploy-start = Retraction started.
rmc-vehicle-deploy-finish = Vehicle deployed.
rmc-vehicle-undeploy-finish = Vehicle retracted.
rmc-vehicle-deploy-action-name-deploy = Deploy
rmc-vehicle-deploy-action-desc-deploy = Deploy the vehicle.
rmc-vehicle-deploy-action-name-undeploy = Retract
rmc-vehicle-deploy-action-desc-undeploy = Retract the vehicle.
rmc-vehicle-deploy-action-name-deploying = Deploying...
rmc-vehicle-deploy-action-desc-deploying = Deployment in progress.
rmc-vehicle-deploy-action-name-undeploying = Retracting...
rmc-vehicle-deploy-action-desc-undeploying = Retraction in progress.
rmc-vehicle-enter-locked = The vehicle is locked.
rmc-vehicle-enter-use-doorway = You need to use a doorway to enter.
rmc-vehicle-enter-busy = Someone is already entering there.
rmc-vehicle-enter-xeno-full = There's no room for more xenos inside.
rmc-vehicle-enter-passenger-full = There's no room for more passengers inside.
rmc-vehicle-hull-destroyed = The vehicle's hull is destroyed.
rmc-vehicle-exit-busy = Someone is already using this exit.
rmc-vehicle-exit-blocked = The exit is blocked.
rmc-vehicle-look-inside = Look inside
rmc-vehicle-lock-not-driver = You need to be in the driver seat to lock or unlock the vehicle.
rmc-vehicle-lock-broken = The vehicle lock is broken.
rmc-vehicle-lock-broken-attempt = The vehicle cannot be locked until the broken lock is repaired.
rmc-vehicle-lock-set-locked = Vehicle doors locked.
rmc-vehicle-lock-set-unlocked = Vehicle doors unlocked.
rmc-vehicle-lock-too-damaged = The lock is too damaged to engage.
rmc-vehicle-lock-broken-open = The vehicle's lock breaks open from the damage!
rmc-vehicle-lock-operational-again = The vehicle's lock is operational again.
rmc-vehicle-lock-broken-success = You break the vehicle lock.
rmc-vehicle-lock-repaired = You repair the vehicle lock.
rmc-vehicle-key-name = vehicle key
rmc-vehicle-key-name-copy = duplicate vehicle key
rmc-vehicle-key-name-specific = {$vehicle} key
rmc-vehicle-key-name-copy-specific = duplicate {$vehicle} key
rmc-vehicle-key-bind-success = You imprint the key to the vehicle.
rmc-vehicle-key-copy-success = You copy the vehicle key.
rmc-vehicle-key-copy-invalid = That key cannot be copied.
rmc-vehicle-key-copy-requires-source = You need to copy an existing vehicle key first.
rmc-vehicle-key-unbound = The key is not bound to any vehicle.
rmc-vehicle-key-invalid = The key does not fit this vehicle.
rmc-vehicle-key-examine-blank = [color=lightblue]This blank key can be imprinted onto a vehicle by using it on the vehicle.[/color]
rmc-vehicle-key-examine-duplicator = [color=lightblue]This blank key can copy an existing vehicle key by using it on that key.[/color]
rmc-vehicle-key-examine-bound = [color=lightblue]This key is bound to a vehicle lock.[/color]
rmc-hardpoint-remove-blocked = That hardpoint is fixed in place.
