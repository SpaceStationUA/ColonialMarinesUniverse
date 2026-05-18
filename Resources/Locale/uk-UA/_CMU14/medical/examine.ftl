cmu-medical-examine-wound-line = [color=red]{ CAPITALIZE(SUBJECT($target)) } { CONJUGATE-HAVE($target) } { $wounds } на { POSS-ADJ($target) } { $part }.[/color]
cmu-medical-examine-fracture-line = [color=#dca94c]{ CAPITALIZE(SUBJECT($target)) } { CONJUGATE-HAVE($target) } { $fracture } у { POSS-ADJ($target) } { $part }.[/color]
cmu-medical-examine-wounds-line = [color=red]{ CAPITALIZE(SUBJECT($target)) } { CONJUGATE-HAVE($target) } рани: { $parts }.[/color]
cmu-medical-examine-fractures-line = [color=#dca94c]{ CAPITALIZE(SUBJECT($target)) } { CONJUGATE-HAVE($target) } переломи: { $parts }.[/color]
cmu-medical-examine-body-part-line = { $part }: { $conditions }.

cmu-medical-examine-part = { $part ->
    [head] Голова
    [torso] Торс
    [left-arm] Ліва рука
    [right-arm] Права рука
    [left-hand] Ліва кисть
    [right-hand] Права кисть
    [left-leg] Ліва нога
    [right-leg] Права нога
    [left-foot] Ліва ступня
    [right-foot] Права ступня
   *[other] { $fallback }
}

cmu-medical-examine-wound = { $kind ->
    [burn] { $treated ->
        [yes] {"оброблений "}
       *[no] {""}
    }{ $size ->
        [small] невеликий
        [gaping] зяючий
        [massive] масивний
       *[deep] глибокий
    } опік{ $bleeding ->
        [yes] {" (кровоточить)"}
       *[no] {""}
    }
    [surgery] { $treated ->
        [yes] {"оброблена "}
       *[no] {""}
    }{ $size ->
        [small] невелика
        [gaping] зяюча
        [massive] масивна
       *[deep] глибока
    } хірургічна рана{ $bleeding ->
        [yes] {" (кровоточить)"}
       *[no] {""}
    }
   *[trauma] { $treated ->
        [yes] {"оброблена "}
       *[no] {""}
    }{ $size ->
        [small] невелика
        [gaping] зяюча
        [massive] масивна
       *[deep] глибока
    } травматична рана{ $bleeding ->
        [yes] {" (кровоточить)"}
       *[no] {""}
    }
}

cmu-medical-examine-fracture = { $stabilized ->
    [yes] { $severity ->
        [hairline] стабілізована тріщина
        [simple] стабілізована зламана кістка
        [compound] стабілізований відкритий перелом
        [comminuted] стабілізована роздроблена кістка
       *[other] стабілізована зламана кістка
    }
   *[no] { $severity ->
        [hairline] тріщина
        [simple] зламана кістка
        [compound] відкритий перелом
        [comminuted] роздроблена кістка
       *[other] зламана кістка
    }
}

cmu-medical-examine-charred-burn-tissue = обвуглена тканина

cmu-medical-examine-sentence-two = { $a } та { $b }
cmu-medical-examine-sentence-many = { $rest } та { $last }
