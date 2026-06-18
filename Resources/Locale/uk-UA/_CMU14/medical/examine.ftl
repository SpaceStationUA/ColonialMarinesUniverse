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
cmu-medical-examine-severed = відрізано
cmu-medical-examine-active-bleeding = активна кровотеча

cmu-medical-examine-sentence-two = { $a } та { $b }
cmu-medical-examine-sentence-many = { $rest } та { $last }

cmu-medical-detailed-examine-verb = Оглянути травми
cmu-medical-detailed-examine-verb-message = Уважніше оглянути їхні травми.
cmu-medical-detailed-examine-start = Ви починаєте перевіряти { THE($target) } на травми.
cmu-medical-detailed-examine-none = Очевидних травм не виявлено.
cmu-medical-detailed-examine-wound = { $mechanism ->
    [burn] { $size ->
        [small] невеликий
        [gaping] зяючий
        [massive] масивний
       *[deep] глибокий
    } опік
    [bullet] { $size ->
        [small] невелика
        [gaping] зяюча
        [massive] масивна
       *[deep] глибока
    } кульова рана
    [stab] { $size ->
        [small] невелика
        [gaping] зяюча
        [massive] масивна
       *[deep] глибока
    } колота рана
    [slash] { $size ->
        [small] невелика
        [gaping] зяюча
        [massive] масивна
       *[deep] глибока
    } різана рана
    [crush] { $size ->
        [small] невелика
        [gaping] зяюча
        [massive] масивна
       *[deep] глибока
    } розчавлена рана
    [blast] { $size ->
        [small] невелика
        [gaping] зяюча
        [massive] масивна
       *[deep] глибока
    } вибухова рана
    [fragment] { $size ->
        [small] невелика
        [gaping] зяюча
        [massive] масивна
       *[deep] глибока
    } уламкова рана
    [surgical] { $size ->
        [small] невелика
        [gaping] зяюча
        [massive] масивна
       *[deep] глибока
    } хірургічна рана
   *[wound] { $size ->
        [small] невелика
        [gaping] зяюча
        [massive] масивна
       *[deep] глибока
    } рана
}
cmu-medical-detailed-examine-treatment = { $quality ->
    [optimal] оптимально оброблено
    [adequate] достатньо оброблено
   *[other] { $treated ->
        [yes] оброблено
       *[no] не оброблено
    }
}
cmu-medical-detailed-examine-external-bleeding = зовнішня кровотеча: { $tier ->
    [minor] незначна
    [moderate] помірна
    [severe] сильна
    [arterial] артеріальна
   *[none] немає
}
cmu-medical-detailed-examine-burn-eschar = опіковий струп: обвуглена тканина
cmu-medical-detailed-examine-cleanup-needed = потрібне очищення: { $entries }
cmu-medical-detailed-examine-cleanup = { $cleanup ->
    [retained-fragments] застряглі уламки
    [poor-closure] погане закриття
    [charred-tissue] обвуглена тканина
    [crush-debris] залишки розчавлення
    [dirty-dressing] брудна пов’язка
   *[other] проблема очищення
}
cmu-medical-detailed-examine-optimal = оптимально: { $hint }
cmu-medical-detailed-examine-optimal-hint = { $hint ->
    [remove-shrapnel] видалити уламки
    [hemostatic-dressing] гемостатична травматична пов’язка
    [sealing-dressing] герметизувальна травматична пов’язка
    [burn-dressing] опікова травматична пов’язка
    [compression-dressing] компресійна травматична пов’язка
    [antiseptic-dressing] антисептична травматична пов’язка
   *[other] лікування
}
cmu-medical-detailed-examine-window-title = Травми - { $target }
cmu-medical-detailed-examine-window-heading = Звіт про травми
cmu-medical-detailed-examine-window-bleeding = Кровотеча: { $tier }
cmu-medical-inspect-injuries-title = { $mechanism ->
    [bullet] Кульові рани
    [stab] Колоті рани
    [slash] Різані рани
    [crush] Розчавлені рани
    [burn] Опіки
    [blast] Вибухові рани
    [fragment] Уламкові рани
    [surgical] Хірургічні рани
   *[wound] Рани
}
cmu-medical-inspect-injuries-severity = { $size ->
    [small] Незначна
    [gaping] Сильна
    [massive] Масивна
   *[deep] Помірна
}
cmu-medical-inspect-injuries-cleanup-required = Потрібне очищення
cmu-medical-inspect-injuries-cleanup-required-with-entries = Потрібне очищення: { $entries }
cmu-medical-inspect-injuries-optimal-treatment = Оптимально: { $treatment }
cmu-medical-inspect-injuries-burn-eschar = Опіковий струп
cmu-medical-inspect-injuries-arterial-bleeding = Артеріальна кровотеча
cmu-medical-examine-suppressed-bleed = кровотечу тимчасово пригнічено, але не оброблено
cmu-medical-detailed-examine-suppressed-bleed = кровотечу типу { $kind } пригнічено, але не оброблено