cm-gun-unskilled = Схоже, ви не знаєте, як користуватися {THE($gun)}
cm-gun-no-ammo-message = У вас закінчилися набої!
cm-gun-use-delay = Потрібно зачекати {$seconds} с перед наступним пострілом!
cm-gun-pump-examine = [bold]Натисніть свою клавішу [color=cyan]унікальної дії[/color] (за замовчуванням Пробіл), щоб помпувати перед пострілом.[/bold]
cm-gun-pump-first-with = Спершу треба прокачати помпу зброї за допомогою {$key}!
cm-gun-pump-first = Спершу треба прокачати помпу зброї!

rmc-breech-loaded-open-shoot-attempt = Спершу треба закрити казенник!
rmc-breech-loaded-not-ready-to-shoot = Спершу треба відкрити та закрити казенник!
rmc-breech-loaded-closed-load-attempt = Спершу треба відкрити казенник!
rmc-breech-loaded-closed-extract-attempt = Спершу треба відкрити казенник!
rmc-breech-loaded-toggle-attempt-cooldown = Треба зачекати, перш ніж знову {$action} камеру!
rmc-breech-loaded-open = відкривати
rmc-breech-loaded-close = закривати

rmc-wield-use-delay = Треба зачекати {$seconds} с перед тим, як взяти {THE($wieldable)} обома руками!
rmc-shoot-use-delay = Треба зачекати {$seconds} с перед пострілом із {THE($wieldable)}!

rmc-shoot-harness-required = Потрібен ремінь
rmc-wear-smart-gun-required = Щоб надіти це, у вас має бути зі собою смарт-ган.
rmc-gun-arc-blocked = Ви не можете стріляти поза сектором обстрілу зброї.

rmc-shoot-id-lock-unauthorized = Спусковий механізм заблоковано. Користувача не авторизовано.
rmc-id-lock-unauthorized = Дію відхилено. Користувача не авторизовано.
rmc-id-lock-authorization = Ви піднімаєте {$gun}, реєструючи себе як його власника.
rmc-id-lock-authorization-combat = {$gun} пищить, реєструючи вас як свого власника.
rmc-id-lock-toggle-lock = Ви {$action} ID-замок на {$gun}.

rmc-id-lock-color-unauthorized = червоний
rmc-id-lock-color-authorized = шартрез
rmc-id-lock-toggle-on = замикати
rmc-id-lock-toggle-off = відмикати

rmc-iff-toggle = Ви {$action} IFF на {$gun}.
rmc-iff-toggle-off = вимикаєте
rmc-iff-toggle-on = вмикаєте

rmc-revolver-spin = Ви крутите барабан.

rmc-examine-text-weapon-accuracy = Поточний множник точності: [color={$colour}]{TOSTRING($accuracy, "F2")}[/color].

rmc-examine-text-scatter-max = Поточний максимальний розкид: [color={$colour}]{TOSTRING($scatter, "F1")}[/color] град.
rmc-examine-text-scatter-min = Поточний мінімальний розкид: [color={$colour}]{TOSTRING($scatter, "F1")}[/color] град.
rmc-examine-text-shots-to-max-scatter = Щоб досягти максимального розкиду, потрібно [color={$colour}]{$shots}[/color] пострілів.
rmc-examine-text-iff = [color=cyan]Ця зброя ігнорує своїх і стріляє повз них![/color]
rmc-examine-text-id-lock-no-user = [color=chartreuse]Не зареєстровано. Підніміть, щоб зареєструвати себе власником.[/color]
rmc-examine-text-id-lock = [color=chartreuse]Зареєстровано на [/color][color={$color}]{$name}[/color][color=chartreuse].[/color]
rmc-examine-text-id-lock-unlocked = [color=chartreuse]Зареєстровано на [/color][color={$color}]{$name}[/color][color=chartreuse], але обмеження стрільби розблоковано.[/color]
rmc-examine-text-execute = [color=red]З цієї зброї можна страчувати людей за наявності відповідної навички![/color]

rmc-gun-rack-examine = [bold]Натисніть свою клавішу [color=cyan]унікальної дії[/color] (за замовчуванням Пробіл), щоб дослати патрон перед пострілом.[/bold]
rmc-gun-rack-first-with = Спершу треба дослати патрон у зброю за допомогою {$key}!
rmc-gun-rack-first = Спершу треба дослати патрон у зброю!

rmc-assisted-reload-fail-angle = Щоб перезарядити зброю {$target}, ви маєте стояти позаду нього!
rmc-assisted-reload-fail-full = {CAPITALIZE(POSS-ADJ($target))} {$weapon} вже заряджено.
rmc-assisted-reload-fail-mismatch = {$ammo} не можна зарядити в {$weapon}!
rmc-assisted-reload-start-user = Ви починаєте перезаряджати {$weapon} {$target}! Стійте нерухомо...
rmc-assisted-reload-start-target = {$reloader} починає перезаряджати ваш {$weapon} набоями {$ammo}! Стійте нерухомо...

rmc-gun-stacks-hit-single = У десятку!
rmc-gun-stacks-hit-multiple = У десятку! {$hits} влучань поспіль!
rmc-gun-stacks-reset = {$weapon} пищить, утрачаючи дані наведення, та повертається до звичайного режиму стрільби.

rmc-gun-shoot-air-self = ВИ ПУСКАЄТЕ ЧЕРГУ ВАШОГО { CAPITALIZE($weapon) } У ПОВІТРЯ!
rmc-gun-shoot-air-other = { CAPITALIZE(THE($user)) } ПУСКАЄ ЧЕРГУ { CAPITALIZE(THE($weapon)) } У ПОВІТРЯ!
rmc-gun-shoot-air-blocked = Стеля над вами надто щільна.
rmc-gun-shoot-air-examine = [bold]Натисніть свою клавішу [color=cyan]унікальної дії[/color] (за замовчуванням Пробіл){$harm ->
    [true] {" в режимі шкоди"}
    *[false] {""}
    }, щоб стріляти в повітря.[/bold]

rmc-flare-gun-examine = Останній вистрелений сигнальний снаряд має позначення: [color=#ad3b98][bold]{$id}[/bold][/color]

expendable-light-starshell-ash-empty-name = попіл згаслого освітлювального снаряда
expendable-light-starshell-ash-empty-desc = Залишки згорілого освітлювального снаряда
rmc-sharp-examine = [bold]Натисніть свою клавішу [color=cyan]унікальної дії[/color] (за замовчуванням Пробіл), щоб перемикати затримку детонації при прямому влучанні вибухових і запалювальних дротиків. Поточна затримка: [color=yellow]{TOSTRING($seconds, "F1")} с[/color].[/bold]
rmc-sharp-toggle-delay = Ви встановлюєте для {THE($gun)} затримку детонації при прямому влучанні на {TOSTRING($seconds, "F1")} с.
rmc-vulture-unbraced-user = Відбій від {THE($gun)} б’є по вас без розгорнутої сошки!
rmc-vulture-unbraced-others = {CAPITALIZE(THE($user))} відкидає назад відбоєм {THE($gun)}!
rmc-vulture-bipod-required = Перш ніж користуватися прицілом, треба розгорнути сошку {THE($gun)}.
rmc-vulture-spotter-scope-slot = приціл спостерігача M707
rmc-vulture-spotter-insert-scope = Встановити приціл
rmc-vulture-spotter-eject-scope = Зняти приціл
rmc-vulture-spotter-scope-only = На триногу підходить лише приціл спостерігача M707.
rmc-vulture-must-scope = Щоб налаштувати приціл M707 «Валчер», треба дивитися крізь нього.
rmc-vulture-breath-cooldown = Вам треба перевести подих, перш ніж знову стабілізувати приціл.