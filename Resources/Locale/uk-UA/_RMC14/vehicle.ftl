rmc-vehicle-wheel-repaired = Колесо відремонтовано.
rmc-vehicle-crash-immobile = Двигун глохне від удару!
rmc-vehicle-crash-immobile-try-again = Двигун ще оговтується після удару.
rmc-vehicle-crash-immobile-recovered = Двигун знову заводиться.
rmc-vehicle-ride-climb = Залізти
rmc-vehicle-ride-climb-self = Ви залазите на {$vehicle}.
rmc-vehicle-ride-climb-others = {$user} залазить на {$vehicle}.
rmc-vehicle-ride-climb-down = Злізти
rmc-vehicle-ride-climb-down-self = Ви злазите з {$vehicle}.
rmc-vehicle-ride-climb-down-others = {$user} злазить з {$vehicle}.
rmc-hardpoint-remove-verb = Зняти {$slot}
rmc-hardpoint-repaired = Точку кріплення відремонтовано.
rmc-hardpoint-intact = Точка кріплення вже ціла.
rmc-hardpoint-integrity-examine = Цілісність: [color={$color}]{$current}/{$max} ({$percent}%)[/color]
rmc-hardpoint-armor-modifiers-examine = Модифікатори шкоди: кислота {$acid}, удар {$slash}, куля {$bullet}, вибух {$explosive}, тупа {$blunt}
rmc-hardpoint-condition-pristine = У бездоганному стані.
rmc-hardpoint-condition-good = У хорошому стані.
rmc-hardpoint-condition-worn = Виявляє ознаки зносу.
rmc-hardpoint-condition-bad = У поганому стані.
rmc-hardpoint-condition-critical = Ледь тримається.
rmc-hardpoint-ui-title = Точки кріплення
rmc-hardpoint-ui-empty-slot = Порожньо
rmc-hardpoint-ui-integrity = {$current}/{$max} ({$percent}%)
rmc-hardpoint-ui-no-integrity = Немає даних про цілісність
rmc-hardpoint-ui-remove = Зняти
rmc-hardpoint-ui-removing = Знімаю...
rmc-hardpoint-failure-vehicle-header = Несправності транспорту
rmc-hardpoint-failure-hardpoint-header = Несправності точки кріплення
rmc-hardpoint-failure-title-on-label = {$failure} на {$label}
rmc-hardpoint-failure-effect-line = Ефект: {$effect}
rmc-hardpoint-failure-repair-line = Ремонт: крок {$step}/{$count} - {$instruction} Використайте {$tool}.
rmc-hardpoint-failure-status-with-step = {$failure} ({$step}/{$count}: {$tool})
rmc-hardpoint-failure-diagnostic-status = {$failure} - {$effect}
rmc-hardpoint-failure-hull-summary = Корпус: {$failures}
rmc-hardpoint-failure-repair-step-complete = Крок ремонту "{$failure}" завершено. Далі: {$tool}.
rmc-hardpoint-failure-name = { $failure ->
    [armor-compromised] пробиття бронеплити
    [feed-jam] заклинювання системи подачі
    [runaway-trigger] неконтрольований спуск
    [turret-traverse-damage] пошкоджене поворотне кільце
    [engine-misfire] перебої двигуна
    [transmission-slip] пробуксовування трансмісії
    [warped-frame] деформована рама
    [damaged-mount] пошкоджене кріплення
    [tire-blowout] пробите колесо
    [thrown-tread] скинута гусениця
    [engine-overheat] перегрів двигуна
    [electrical-short] коротке замикання
    [fuel-leak] витік пального
   *[hardpoint-failure] несправність точки кріплення
}
rmc-hardpoint-failure-alert-name = { $failure ->
    [armor-compromised] Пробиття бронеплити
    [feed-jam] Заклинювання подачі зброї
    [runaway-trigger] Неконтрольований спуск
    [turret-traverse-damage] Пошкодження повороту турелі
    [engine-misfire] Перебої двигуна
    [transmission-slip] Пробуксовування трансмісії
    [warped-frame] Деформована рама
    [damaged-mount] Пошкоджене кріплення
    [tire-blowout] Пробите колесо
    [thrown-tread] Скинута гусениця
    [engine-overheat] Перегрів двигуна
    [electrical-short] Коротке замикання
    [fuel-leak] Витік пального
   *[hardpoint-failure] Несправність точки кріплення
}
rmc-hardpoint-failure-effect = { $failure ->
    [armor-compromised] Бронезахист цієї точки кріплення не працює.
    [feed-jam] Ця зброя може випадково заклинити або дати осічку.
    [runaway-trigger] Ця зброя може вистрілити сама, поки встановлена.
    [turret-traverse-damage] Швидкість повороту турелі сильно знижена.
    [engine-misfire] Прискорення й максимальна швидкість транспорту знижені.
    [transmission-slip] Прискорення, задній хід і максимальна швидкість транспорту знижені.
    [warped-frame] Рама транспорту чіпляє поверхню й погіршує рух.
    [damaged-mount] Потужність цієї точки кріплення знижена, доки кріплення не посадять на місце.
    [tire-blowout] Транспорт втрачає швидкість і зчеплення через пошкоджене колесо.
    [thrown-tread] Транспорт ледве рухається, доки гусеницю не посадять назад.
    [engine-overheat] Двигун захлинається, а прискорення сильно знижене.
    [electrical-short] Електроживлення цієї точки кріплення нестабільне й ослаблене.
    [fuel-leak] Блекфут втрачає пальне з часом, доки витік не полагодять.
   *[hardpoint-failure] Точка кріплення несправна.
}
rmc-hardpoint-failure-repair-armor-compromised-1 = Затягніть кріплення броні й вирівняйте плиту затискачем.
rmc-hardpoint-failure-repair-armor-compromised-2 = Заваріть і залатайте пробиті шви броні.
rmc-hardpoint-failure-repair-feed-jam-1 = Відкрийте кришку подачі й приберіть погнуті ланки стрічки.
rmc-hardpoint-failure-repair-feed-jam-2 = Прокрутіть привід подачі мультитулом.
rmc-hardpoint-failure-repair-runaway-trigger-1 = Відкрийте корпус спуску й ізолюйте зношену тягу шептала.
rmc-hardpoint-failure-repair-runaway-trigger-2 = Скиньте реле керування вогнем мультитулом.
rmc-hardpoint-failure-repair-runaway-trigger-3 = Посадіть тягу спуску назад і затягніть її.
rmc-hardpoint-failure-repair-turret-traverse-damage-1 = Затягніть і заново виставте поворотне кільце.
rmc-hardpoint-failure-repair-turret-traverse-damage-2 = Піддомкратьте підшипник турелі й посадіть кільце назад.
rmc-hardpoint-failure-repair-engine-misfire-1 = Відкрийте люк доступу до двигуна.
rmc-hardpoint-failure-repair-engine-misfire-2 = Імпульсно перевірте контур запалювання мультитулом.
rmc-hardpoint-failure-repair-engine-misfire-3 = Затягніть опори двигуна після стабілізації контуру.
rmc-hardpoint-failure-repair-transmission-slip-1 = Підійміть і посадіть трансмісію назад сервісним домкратом.
rmc-hardpoint-failure-repair-transmission-slip-2 = Затягніть болти корпусу трансмісії.
rmc-hardpoint-failure-repair-warped-frame-1 = Піддомкратьте раму й зніміть напругу з деформованої ділянки.
rmc-hardpoint-failure-repair-warped-frame-2 = Нагрійте й вирівняйте деформовані елементи рами зварювальним апаратом.
rmc-hardpoint-failure-repair-warped-frame-3 = Повторно затягніть розпірки рами.
rmc-hardpoint-failure-repair-damaged-mount-1 = Піддомкратьте точку кріплення над пошкодженим кронштейном.
rmc-hardpoint-failure-repair-damaged-mount-2 = Посадіть кріплення назад і затягніть фіксатори.
rmc-hardpoint-failure-repair-tire-blowout-1 = Відтисніть порвану шину від обода.
rmc-hardpoint-failure-repair-tire-blowout-2 = Піддомкратьте маточину й встановіть запасний колісний вузол.
rmc-hardpoint-failure-repair-tire-blowout-3 = Затягніть гайки колеса по черзі.
rmc-hardpoint-failure-repair-thrown-tread-1 = Піддомкратьте ходову частину й послабте натяг гусениці.
rmc-hardpoint-failure-repair-thrown-tread-2 = Відтисніть скинуті ланки гусениці назад на опорні котки.
rmc-hardpoint-failure-repair-thrown-tread-3 = Зафіксуйте натягувач і затягніть пальці гусениці.
rmc-hardpoint-failure-repair-engine-overheat-1 = Відкрийте кожух двигуна й випустіть накопичене тепло.
rmc-hardpoint-failure-repair-engine-overheat-2 = Відтисніть деформований кожух вентилятора від радіатора.
rmc-hardpoint-failure-repair-engine-overheat-3 = Імпульсно перевіряйте контролер насоса охолодження, доки потік не стабілізується.
rmc-hardpoint-failure-repair-electrical-short-1 = Відріжте обгорілу проводку від джгута точки кріплення.
rmc-hardpoint-failure-repair-electrical-short-2 = Простежте й скиньте керувальний контур мультитулом.
rmc-hardpoint-failure-repair-electrical-short-3 = Закрийте люк доступу й закріпіть замінений джгут.
rmc-hardpoint-failure-repair-fuel-leak-1 = Відкрийте сервісну панель пального й ізолюйте розірвану магістраль.
rmc-hardpoint-failure-repair-fuel-leak-2 = Залатайте паливну магістраль, що протікає.
rmc-hardpoint-failure-repair-fuel-leak-3 = Затягніть муфту паливної магістралі.
rmc-vehicle-ammo-loader-no-vehicle = Завантажувач не підʼєднано до транспорту.
rmc-vehicle-ammo-loader-no-hardpoint = Сумісну точку кріплення не встановлено.
rmc-vehicle-ammo-loader-wrong-ammo = Ці набої не підходять до завантажувача.
rmc-vehicle-ammo-loader-full = {$target} вже повний.
rmc-vehicle-ammo-loader-empty = {$box} порожній.
rmc-vehicle-ammo-loader-loaded = Заряджено {$amount} набоїв у {$target}.
rmc-vehicle-ammo-loader-unloaded = Вилучено {$amount} набоїв з {$target}.
rmc-vehicle-ammo-loader-box-full = {$box} переповнено.
rmc-vehicle-ammo-loader-in-use = Завантажувач уже використовується.
rmc-vehicle-ammo-loader-hold-ammo = Щоб зарядити, потрібно тримати коробку з набоями в руці.
rmc-vehicle-ammo-loader-not-enough = У коробці з набоями недостатньо набоїв на магазин.
rmc-vehicle-ammo-loader-ui-ammo = Набої: {$current}/{$max}
rmc-vehicle-ammo-loader-ui-no-hardpoints = Сумісних точок кріплення немає.
rmc-vehicle-ammo-loader-ui-slot = Слот: {$slot} ({$type})
rmc-vehicle-ammo-loader-ui-chambered = У набої: {$current}/{$max}
rmc-vehicle-ammo-loader-ui-stored = Збережено: {$current}/{$max}
rmc-vehicle-ammo-loader-ui-load = Навантаження
rmc-vehicle-ammo-loader-ui-full = Повний
rmc-vehicle-ammo-loader-ui-no-ammo = Без набоїв
rmc-vehicle-ammo-loader-ui-ready-slot = 1 ствол
rmc-vehicle-ammo-loader-ui-slot-tooltip = {$current}/{$max} набоїв
rmc-vehicle-weapons-ui-title = Озброєння транспорту
rmc-vehicle-weapons-ui-empty-slot = Порожньо
rmc-vehicle-weapons-ui-select = Вибрати
rmc-vehicle-weapons-ui-selected = Обрано
rmc-vehicle-weapons-ui-unavailable = Недоступно
rmc-vehicle-weapons-ui-ammo = Набої: {$current}/{$max}
rmc-vehicle-weapons-ui-ammo-none = Набої: --
rmc-vehicle-weapons-ui-chambered = У набої: {$current}/{$max}
rmc-vehicle-weapons-ui-stored = Збережено: {$current}/{$max}
rmc-vehicle-weapons-ui-operator = Оператор: {$name}
rmc-vehicle-weapons-ui-operator-self = Оператор: ви
rmc-vehicle-weapons-ui-in-use = Використовується
rmc-vehicle-weapons-ui-slot = Слот: {$slot}
rmc-vehicle-weapons-ui-turret-slot = Слот турелі: {$slot}
rmc-vehicle-weapons-ui-mounted-to = Встановлено на: {$slot}
rmc-vehicle-weapons-ui-hardpoint-in-use = {$operator} вже керує цією точкою кріплення.
rmc-vehicle-weapons-ui-auto-on = Авто-турель: увімкнено
rmc-vehicle-weapons-ui-auto-off = Авто-турель: вимкнено
rmc-vehicle-weapons-ui-stabilization-on = Стабілізація: увімкнено
rmc-vehicle-weapons-ui-stabilization-off = Стабілізація: вимкнено
rmc-vehicle-weapons-ui-none-selected = Точку кріплення не обрано
rmc-vehicle-weapons-ui-integrity = Цілісність: {$current}/{$max} ({$percent}%)
rmc-vehicle-weapons-ui-no-integrity = Цілісність: --
rmc-vehicle-weapons-ui-cooldown-ready = ГОТОВО
rmc-vehicle-weapons-ui-cooldown-recharging = Перезаряджання: {$seconds} с
rmc-vehicle-portgun-need-seat = Потрібно сидіти за бортовою гарматою.
rmc-vehicle-portgun-no-vehicle = Бортову гармату не підʼєднано до транспорту.
rmc-vehicle-portgun-no-gun = Бортову гармату не встановлено.
rmc-vehicle-portgun-in-use = {$operator} вже керує бортовою гарматою.
rmc-vehicle-portgun-active = Ви вже керуєте бортовою гарматою.
rmc-vehicle-portgun-examine-ammo = Набої: {$current}/{$max}
rmc-vehicle-portgun-eject = Витягти магазин
rmc-vehicle-turret-no-base = Сумісну турель не встановлено.
rmc-vehicle-deploy-not-driver = Щоб розгорнути, треба сидіти на місці водія.
rmc-vehicle-deploy-requires-turret = Для розгортання має бути встановлена турель.
rmc-vehicle-deploy-start = Розгортання почалося.
rmc-vehicle-undeploy-start = Згортання почалося.
rmc-vehicle-deploy-finish = Транспорт розгорнуто.
rmc-vehicle-undeploy-finish = Транспорт згорнуто.
rmc-vehicle-deploy-action-name-deploy = Розгорнути
rmc-vehicle-deploy-action-desc-deploy = Розгорнути транспорт.
rmc-vehicle-deploy-action-name-undeploy = Згорнути
rmc-vehicle-deploy-action-desc-undeploy = Згорнути транспорт.
rmc-vehicle-deploy-action-name-deploying = Розгортання...
rmc-vehicle-deploy-action-desc-deploying = Триває розгортання.
rmc-vehicle-deploy-action-name-undeploying = Згортається...
rmc-vehicle-deploy-action-desc-undeploying = Триває згортання.
rmc-vehicle-enter-locked = Транспорт замкнено.
rmc-vehicle-enter-use-doorway = Щоб увійти, треба використати дверний прохід.
rmc-vehicle-enter-busy = Хтось уже заходить.
rmc-vehicle-enter-xeno-full = Усередині немає місця для більшої кількості ксеноморфів.
rmc-vehicle-enter-passenger-full = Усередині немає місця для більшої кількості пасажирів.
rmc-vehicle-hull-destroyed = Корпус транспорту знищено.
rmc-vehicle-exit-busy = Хтось уже використовує цей вихід.
rmc-vehicle-exit-blocked = Вихід заблоковано.
rmc-vehicle-look-inside = Зазирнути всередину
rmc-vehicle-lock-not-driver = Щоб замкнути або відімкнути транспорт, треба сидіти на місці водія.
rmc-vehicle-lock-broken = Замок транспорту зламано.
rmc-vehicle-lock-broken-attempt = Транспорт не можна замкнути, доки не полагоджено зламаний замок.
rmc-vehicle-lock-set-locked = Двері транспорту замкнено.
rmc-vehicle-lock-set-unlocked = Двері транспорту відімкнено.
rmc-vehicle-lock-too-damaged = Замок надто пошкоджений, щоб спрацювати.
rmc-vehicle-lock-broken-open = Замок транспорту тріскає від ушкоджень!
rmc-vehicle-lock-operational-again = Замок транспорту знову працює.
rmc-vehicle-lock-broken-success = Ви ламаєте замок транспорту.
rmc-vehicle-lock-repaired = Ви ремонтуєте замок транспорту.
rmc-vehicle-key-name = ключ транспорту
rmc-vehicle-key-name-copy = дублікат ключа транспорту
rmc-vehicle-key-name-specific = ключ {$vehicle}
rmc-vehicle-key-name-copy-specific = дублікат ключа {$vehicle}
rmc-vehicle-key-bind-success = Ви прив'язуєте ключ до транспорту.
rmc-vehicle-key-copy-success = Ви копіюєте ключ транспорту.
rmc-vehicle-key-copy-invalid = Цей ключ не можна копіювати.
rmc-vehicle-key-copy-requires-source = Спершу потрібно скопіювати наявний ключ транспорту.
rmc-vehicle-key-unbound = Ключ не привʼязано до жодного транспорту.
rmc-vehicle-key-invalid = Ключ не підходить до цього транспорту.
rmc-vehicle-key-examine-blank = [color=lightblue]Цей чистий ключ можна привʼязати до транспорту, використавши на ньому.[/color]
rmc-vehicle-key-examine-duplicator = [color=lightblue]Цей чистий ключ може скопіювати наявний ключ транспорту, якщо застосувати його на цьому ключі.[/color]
rmc-vehicle-key-examine-bound = [color=lightblue]Цей ключ привʼязано до замка транспорту.[/color]
rmc-hardpoint-remove-blocked = Ця точка кріплення зафіксована намертво.
