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

cmu-medical-examine-sentence-two = { $a } and { $b }
cmu-medical-examine-sentence-many = { $rest }, and { $last }
