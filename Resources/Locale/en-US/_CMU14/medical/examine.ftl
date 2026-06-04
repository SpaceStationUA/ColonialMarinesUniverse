cmu-medical-examine-wound-line = [color=red]{ CAPITALIZE(SUBJECT($target)) } { CONJUGATE-HAVE($target) } { $wounds } on { POSS-ADJ($target) } { $part }.[/color]
cmu-medical-examine-fracture-line = [color=#dca94c]{ CAPITALIZE(SUBJECT($target)) } { CONJUGATE-HAVE($target) } { $fracture } in { POSS-ADJ($target) } { $part }.[/color]
cmu-medical-examine-wounds-line = [color=red]{ CAPITALIZE(SUBJECT($target)) } { CONJUGATE-HAVE($target) } wounds: { $parts }.[/color]
cmu-medical-examine-fractures-line = [color=#dca94c]{ CAPITALIZE(SUBJECT($target)) } { CONJUGATE-HAVE($target) } fractures: { $parts }.[/color]
cmu-medical-examine-body-part-line = { $part }: { $conditions }.

cmu-medical-examine-part = { $part ->
    [head] Head
    [torso] Torso
    [left-arm] Left arm
    [right-arm] Right arm
    [left-hand] Left hand
    [right-hand] Right hand
    [left-leg] Left leg
    [right-leg] Right leg
    [left-foot] Left foot
    [right-foot] Right foot
   *[other] { $fallback }
}

cmu-medical-examine-wound = {"a "}{ $treated ->
    [yes] {"treated "}
   *[no] {""}
}{ $size ->
    [small] small
    [gaping] gaping
    [massive] massive
   *[deep] deep
} { $kind ->
    [burn] burn
    [surgery] surgical wound
   *[trauma] trauma wound
}{ $bleeding ->
    [yes] {" (bleeding)"}
   *[no] {""}
}

cmu-medical-examine-fracture = {"a "}{ $stabilized ->
    [yes] {"stabilized "}
   *[no] {""}
}{ $severity ->
    [hairline] hairline fracture
    [simple] broken bone
    [compound] compound fracture
    [comminuted] shattered bone
   *[other] broken bone
}

cmu-medical-examine-charred-burn-tissue = charred burn tissue
cmu-medical-examine-severed = severed
cmu-medical-examine-active-bleeding = active bleeding

cmu-medical-examine-sentence-two = { $a } and { $b }
cmu-medical-examine-sentence-many = { $rest }, and { $last }

cmu-medical-detailed-examine-verb = Inspect injuries
cmu-medical-detailed-examine-verb-message = Take a closer look at their injuries.
cmu-medical-detailed-examine-start = You begin checking { THE($target) } for injuries.
cmu-medical-detailed-examine-none = No obvious injuries found.
cmu-medical-detailed-examine-wound = { $size ->
    [small] small
    [gaping] gaping
    [massive] massive
   *[deep] deep
} { $mechanism ->
    [bullet] bullet wound
    [stab] stab wound
    [slash] slash wound
    [crush] crush wound
    [burn] burn
    [blast] blast wound
    [fragment] fragment wound
    [surgical] surgical wound
   *[wound] wound
}
cmu-medical-detailed-examine-treatment = { $quality ->
    [optimal] optimal treatment
    [adequate] adequate treatment
   *[other] { $treated ->
        [yes] treated
       *[no] untreated
    }
}
cmu-medical-detailed-examine-external-bleeding = external bleeding: { $tier ->
    [minor] minor
    [moderate] moderate
    [severe] severe
    [arterial] arterial
   *[none] none
}
cmu-medical-detailed-examine-burn-eschar = burn eschar: charred tissue
cmu-medical-detailed-examine-cleanup-needed = cleanup needed: { $entries }
cmu-medical-detailed-examine-cleanup = { $cleanup ->
    [retained-fragments] retained fragments
    [poor-closure] poor closure
    [charred-tissue] charred tissue
    [crush-debris] crush debris
    [dirty-dressing] dirty dressing
   *[other] cleanup issue
}
cmu-medical-detailed-examine-optimal = optimal: { $hint }
cmu-medical-detailed-examine-optimal-hint = { $hint ->
    [remove-shrapnel] remove shrapnel
    [hemostatic-dressing] hemostatic dressing
    [sealing-dressing] sealing dressing
    [burn-dressing] burn gel dressing
    [compression-dressing] compression dressing
    [antiseptic-dressing] antiseptic dressing
   *[other] treatment
}
