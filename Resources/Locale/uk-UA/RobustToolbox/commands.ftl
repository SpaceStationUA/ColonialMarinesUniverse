### Локалізація для команд консолі рушія

cmd-hint-float = [float]

## Загальні помилки команд

cmd-invalid-arg-number-error = Неправильна кількість аргументів.

cmd-parse-failure-integer = {$arg} не є дійсним цілим числом.
cmd-parse-failure-float = {$arg} не є дійсним числом з плаваючою комою.
cmd-parse-failure-bool = {$arg} не є дійсним булевим значенням.
cmd-parse-failure-uid = {$arg} не є дійсним UID сутності.
cmd-parse-failure-mapid = {$arg} не є дійсним MapId.
cmd-parse-failure-enum = {$arg} не є значенням enum {$enum}.
cmd-parse-failure-grid = {$arg} не є дійсним ґридом.
cmd-parse-failure-cultureinfo = "{$arg}" не є дійсним CultureInfo.
cmd-parse-failure-entity-exist = UID {$arg} не відповідає існуючій сутності.
cmd-parse-failure-session = Немає сесії з нікнеймом: {$username}

cmd-error-file-not-found = Не вдалося знайти файл: {$file}.
cmd-error-dir-not-found = Не вдалося знайти каталог: {$dir}.

cmd-failure-no-attached-entity = До цієї оболонки не прикріплено сутності.

## Команда 'help'
cmd-help-desc = Показує загальну довідку або довідку для конкретної команди.
cmd-help-help = Використання: {$command} [назва команди]
    Якщо назву команди не вказано, показується загальна довідка. Якщо вказано — показується довідка для тієї команди.

cmd-help-no-args = Щоб показати довідку для конкретної команди, напишіть 'help <команда>'. Щоб переглянути всі доступні команди — напишіть 'list'. Щоб шукати команди — використовуйте 'list <фільтр>'.
cmd-help-unknown = Невідома команда: { $command }
cmd-help-top = { $command } - { $description }
cmd-help-invalid-args = Неправильна кількість аргументів.
cmd-help-arg-cmdname = [назва команди]

## Команда 'cvar'
cmd-cvar-desc = Отримує або встановлює CVar.
cmd-cvar-help = Використання: {$command} <назва | ?> [значення]
    Якщо передано значення, воно буде розпарсене та збережене як нове значення CVar.
    Якщо ні — буде показане поточне значення CVar.
    Використовуйте 'cvar ?', щоб отримати список усіх зареєстрованих CVar.

cmd-cvar-invalid-args = Потрібно надати рівно один або два аргументи.
cmd-cvar-not-registered = CVar '{ $cvar }' не зареєстровано. Використовуйте 'cvar ?', щоб отримати список усіх зареєстрованих CVar.
cmd-cvar-parse-error = Вхідне значення має невірний формат для типу { $type }
cmd-cvar-compl-list = Список доступних CVar
cmd-cvar-arg-name = <назва | ?>
cmd-cvar-value-hidden = <значення приховано>

## Команда 'cvar_subs'
cmd-cvar_subs-desc = Виводить список підписок OnValueChanged для CVar.
cmd-cvar_subs-help = Використання: {$command} <назва>

cmd-cvar_subs-invalid-args = Потрібно надати рівно один аргумент.
cmd-cvar_subs-arg-name = <назва>

## Команда 'list'
cmd-list-desc = Виводить список доступних команд з опціональним фільтром.
cmd-list-help = Використання: {$command} [фільтр]
    Виводить усі доступні команди. Якщо вказано аргумент, він буде використаний як фільтр за назвою.

cmd-list-heading = СТОР НАЗВА             ОПИС{"\u000A"}-------------------------{"\u000A"}

cmd-list-arg-filter = [фільтр]

## Команда '>' (remote exec)
cmd-remoteexec-desc = Виконує команди на стороні сервера.
cmd-remoteexec-help = Використання: > <команда> [арг] [арг] [арг...]
    Виконує команду на сервері. Це потрібно, якщо команда з такою ж назвою існує на клієнті — інакше спочатку виконається клієнтська.

## Команда 'gc'
cmd-gc-desc = Запустити GC (Garbage Collector).
cmd-gc-help = Використання: {$command} [покоління]
    Використовує GC.Collect() для запуску збирача сміття.
    Якщо передано аргумент, він парситься як номер покоління GC, і викликається GC.Collect(int).
    Використовуйте команду 'gfc' для повного GC з ущільненням LOH.
cmd-gc-failed-parse = Не вдалося розпарсити аргумент.
cmd-gc-arg-generation = [покоління]

## Команда 'gcf'
cmd-gcf-desc = Запустити GC повністю — з ущільненням LOH і всім іншим.
cmd-gcf-help = Використання: {$command}
    Виконує повне GC.Collect(2, GCCollectionMode.Forced, true, true), а також ущільнює LOH.
    Це, ймовірно, заблокує гру на сотні мілісекунд — попереджаю.

## Команда 'gc_mode'
cmd-gc_mode-desc = Змінити/прочитати режим затримки GC.
cmd-gc_mode-help = Використання: {$command} [тип]
    Якщо аргумент не надано — повертає поточний режим затримки GC.
    Якщо передано — парсить як GCLatencyMode і встановлює цей режим.

cmd-gc_mode-current = поточний режим затримки gc: { $prevMode }
cmd-gc_mode-possible = можливі режими:
cmd-gc_mode-option = - { $mode }
cmd-gc_mode-unknown = невідомий режим затримки gc: { $arg }
cmd-gc_mode-attempt = спроба змінити режим затримки gc: { $prevMode } -> { $mode }
cmd-gc_mode-result = підсумковий режим затримки gc: { $mode }
cmd-gc_mode-arg-type = [тип]

## Команда 'mem'
cmd-mem-desc = Виводить інформацію про керовану пам'ять.
cmd-mem-help = Використання: {$command}

cmd-mem-report = Розмір купи: { TOSTRING($heapSize, "N0") }
    Усього виділено: { TOSTRING($totalAllocated, "N0") }

## Команда 'physics'
cmd-physics-overlay = {$overlay} не є відомим оверлеєм.

## Команда 'lsasm'
cmd-lsasm-desc = Виводить список завантажених збірок за контекстом завантаження.
cmd-lsasm-help = Використання: {$command}

## Команда 'exec'
cmd-exec-desc = Виконує файл-скрипт із доступного для запису користувацького каталогу гри.
cmd-exec-help = Використання: {$command} <fileName>
    Кожен рядок у файлі виконується як окрема команда, якщо тільки не починається з #

cmd-exec-arg-filename = <fileName>

## Команда 'dump_net_comps'
cmd-dump_net_comps-desc = Виводить таблицю мережевих компонентів.
cmd-dump_net_comps-help = Використання: {$command}

cmd-dump_net_comps-error-writeable = Реєстрація ще доступна для запису, мережеві ID не згенеровано.
cmd-dump_net_comps-header = Реєстрації мережевих компонентів:

## Команда 'dump_event_tables'
cmd-dump_event_tables-desc = Виводить таблиці спрямованих подій для сутності.
cmd-dump_event_tables-help = Використання: {$command} <entityUid>

cmd-dump_event_tables-missing-arg-entity = Бракує аргументу сутності.
cmd-dump_event_tables-error-entity = Недійсна сутність.
cmd-dump_event_tables-arg-entity = <entityUid>

## Команда 'monitor'
cmd-monitor-desc = Перемикає монітор у меню F3.
cmd-monitor-help = Використання: {$command} <назва>
    Можливі монітори: { $monitors }
    Можна також використовувати спеціальні значення "-all" і "+all", щоб приховати або показати всі монітори.

cmd-monitor-arg-monitor = <монітор>
cmd-monitor-invalid-name = Недійсна назва монітора.
cmd-monitor-arg-count = Бракує аргументу монітора.
cmd-monitor-minus-all-hint = Приховати всі монітори
cmd-monitor-plus-all-hint = Показати всі монітори


## Команда 'setambientlight'
cmd-set-ambient-light-desc = Дозволяє задати ambient-світло для вказаної мапи (в SRGB).
cmd-set-ambient-light-help = Використання: {$command} [mapid] [r g b a]
cmd-set-ambient-light-parse = Не вдалося розпарсити аргументи як байтові значення кольору.

## Команди мапінгу

cmd-savemap-desc = Серіалізує мапу на диск. Не зберігає post-init мапу без force.
cmd-savemap-help = Використання: {$command} <MapID> <Path> [force]
cmd-savemap-not-exist = Цільова мапа не існує.
cmd-savemap-init-warning = Спроба зберегти post-init мапу без примусового збереження.
cmd-savemap-attempt = Спроба зберегти мапу {$mapId} до {$path}.
cmd-savemap-success = Мапу успішно збережено.
cmd-savemap-error = Не вдалося зберегти мапу! Деталі — у логу сервера.
cmd-hint-savemap-id = <MapID>
cmd-hint-savemap-path = <Path>
cmd-hint-savemap-force = [bool]

cmd-loadmap-desc = Завантажує мапу з диска у гру.
cmd-loadmap-help = Використання: {$command} <MapID> <Path> [x] [y] [rotation] [consistentUids]
cmd-loadmap-nullspace = Не можна завантажити в мапу 0.
cmd-loadmap-exists = Мапа {$mapId} вже існує.
cmd-loadmap-success = Мапу {$mapId} завантажено з {$path}.
cmd-loadmap-error = Сталася помилка під час завантаження мапи з {$path}.
cmd-hint-loadmap-x-position = [x-позиція]
cmd-hint-loadmap-y-position = [y-позиція]
cmd-hint-loadmap-rotation = [обертання]
cmd-hint-loadmap-uids = [float]

cmd-hint-savebp-id = <Grid EntityID>

## Команда 'flushcookies'
# Примітка: команда flushcookies — з Robust.Client.WebView, її немає в основному коді рушія.

cmd-flushcookies-desc = Скинути сховище CEF cookies на диск.
cmd-flushcookies-help = Використання: {$command}
    Це гарантує, що cookies коректно збережуться на диск у разі некоректного завершення роботи.
    Зауваж, що сама операція асинхронна.

cmd-ldrsc-desc = Попередньо кешує ресурс.
cmd-ldrsc-help = Використання: {$command} <шлях> <тип>

cmd-rldrsc-desc = Перезавантажує ресурс.
cmd-rldrsc-help = Використання: {$command} <шлях> <тип>

cmd-gridtc-desc = Отримує кількість плиток ґриду.
cmd-gridtc-help = Використання: {$command} <gridId>


# Клієнтські команди
cmd-guidump-desc = Дампить дерево GUI у /guidump.txt у даних користувача.
cmd-guidump-help = Використання: {$command}

cmd-uitest-desc = Відкрити фіктивне UI-вікно для тестування.
cmd-uitest-help = Використання: {$command}

## Команда 'uitest2'
cmd-uitest2-desc = Відкриває OS-вікно для тестування UI-контролів.
cmd-uitest2-help = Використання: {$command} <вкладка>
cmd-uitest2-arg-tab = <вкладка>
cmd-uitest2-error-args = Очікувався щонайбільше один аргумент.
cmd-uitest2-error-tab = Недійсна вкладка: '{$value}'
cmd-uitest2-title = UITest2


cmd-setclipboard-desc = Встановлює системний буфер обміну.
cmd-setclipboard-help = Використання: {$command} <текст>

cmd-getclipboard-desc = Отримує системний буфер обміну.
cmd-getclipboard-help = Використання: {$command}

cmd-togglelight-desc = Перемикає рендеринг світла.
cmd-togglelight-help = Використання: {$command}

cmd-togglefov-desc = Перемикає поле зору для клієнта.
cmd-togglefov-help = Використання: {$command}

cmd-togglehardfov-desc = Перемикає жорстке поле зору для клієнта (для дебагу space-station-14#2353).
cmd-togglehardfov-help = Використання: {$command}

cmd-toggleshadows-desc = Перемикає рендеринг тіней.
cmd-toggleshadows-help = Використання: {$command}

cmd-togglelightbuf-desc = Перемикає рендеринг освітлення. Включає тіні, але не FOV.
cmd-togglelightbuf-help = Використання: {$command}

cmd-chunkinfo-desc = Отримує інформацію про чанк під курсором миші.
cmd-chunkinfo-help = Використання: {$command}

cmd-rldshader-desc = Перезавантажує всі шейдери.
cmd-rldshader-help = Використання: {$command}

cmd-cldbglyr-desc = Перемикає шари дебагу FOV та світла.
cmd-cldbglyr-help = Використання: {$command} <шар>: перемкнути <шар>
    cldbglyr: вимкнути всі шари

cmd-key-info-desc = Інформація про клавішу.
cmd-key-info-help = Використання: {$command} <Key>

## Команда 'bind'
cmd-bind-desc = Прив'язує комбінацію клавіш до команди вводу.
cmd-bind-help = Використання: {$command} { cmd-bind-arg-key } { cmd-bind-arg-mode } { cmd-bind-arg-command }
    Зверни увагу: це НЕ зберігає прив'язки автоматично.
    Використовуй команду 'svbind', щоб зберегти налаштування прив'язок.

cmd-bind-arg-key = <НазваКлавіші>
cmd-bind-arg-mode = <РежимПрив'язки>
cmd-bind-arg-command = <КомандаВводу>

cmd-net-draw-interp-desc = Перемикає дебаг-відмалювання мережевої інтерполяції.
cmd-net-draw-interp-help = Використання: {$command}

cmd-net-watch-ent-desc = Виводить усі мережеві оновлення для EntityId у консоль.
cmd-net-watch-ent-help = Використання: {$command} <0|EntityUid>

cmd-net-refresh-desc = Запитує повний стан сервера.
cmd-net-refresh-help = Використання: {$command}

cmd-net-entity-report-desc = Перемикає панель звітів про мережеві сутності.
cmd-net-entity-report-help = Використання: {$command}

cmd-fill-desc = Заповнює консоль для дебагу.
cmd-fill-help = Використання: {$command}
                Заповнює консоль різним сміттям для дебагу.

cmd-cls-desc = Очищає консоль.
cmd-cls-help = Використання: {$command}
               Очищає дебаг-консоль від усіх повідомлень.

cmd-sendgarbage-desc = Надсилає сміття на сервер.
cmd-sendgarbage-help = Використання: {$command}
                       Сервер відповість 'no u'.

cmd-loadgrid-desc = Завантажує ґрид з файлу на існуючу мапу.
cmd-loadgrid-help = Використання: {$command} <MapID> <Path> [x y] [rotation] [storeUids]

cmd-loc-desc = Виводить абсолютне місцезнаходження сутності гравця в консоль.
cmd-loc-help = Використання: {$command}

cmd-tpgrid-desc = Телепортує ґрид у нове місце.
cmd-tpgrid-help = Використання: {$command} <gridId> <X> <Y> [<MapId>]

cmd-rmgrid-desc = Видаляє ґрид з мапи. Стандартний ґрид видалити не можна.
cmd-rmgrid-help = Використання: {$command} <gridId>

cmd-mapinit-desc = Запускає ініціалізацію мапи.
cmd-mapinit-help = Використання: {$command} <mapID>

cmd-lsmap-desc = Виводить список мап.
cmd-lsmap-help = Використання: {$command}

cmd-lsgrid-desc = Виводить список ґридів.
cmd-lsgrid-help = Використання: {$command}

cmd-addmap-desc = Додає нову порожню мапу до раунду. Якщо mapID вже існує — нічого не робить.
cmd-addmap-help = Використання: {$command} <mapID> [pre-init]
cmd-addmap-hint-2 = runMapInit [true / false]

cmd-rmmap-desc = Видаляє мапу зі світу. Видалити nullspace не можна.
cmd-rmmap-help = Використання: {$command} <mapId>

cmd-savegrid-desc = Серіалізує ґрид на диск.
cmd-savegrid-help = Використання: {$command} <gridID> <Path>

cmd-testbed-desc = Завантажує тестовий стенд фізики на вказану мапу.
cmd-testbed-help = Використання: {$command} <mapid> <test>

## Команди 'addcomp'/'rmcomp'

cmd-addcomp-desc = Додає компонент до сутності.
cmd-addcomp-help = Використання: {$command} <uid> <componentName>
cmd-addcompc-desc = Додає компонент до сутності на клієнті.
cmd-addcompc-help = Використання: {$command} <uid> <componentName>

cmd-rmcomp-desc = Видаляє компонент із сутності.
cmd-rmcomp-help = Використання: {$command} <uid> <componentName>
cmd-rmcompc-desc = Видаляє компонент із сутності на клієнті.
cmd-rmcompc-help = Використання: {$command} <uid> <componentName>

## Команди 'addview'/'removeview'

cmd-addview-desc = Підписатися на перегляд сутності для дебагу.
cmd-addview-help = Використання: {$command} <entityUid>
cmd-addviewc-desc = Підписатися на перегляд сутності для дебагу.
cmd-addviewc-help = Використання: {$command} <entityUid>

cmd-removeview-desc = Відписатися від перегляду сутності для дебагу.
cmd-removeview-help = Використання: {$command} <entityUid>

## Команда 'loglevel'
cmd-loglevel-desc = Змінює рівень логування для вказаного sawmill.
cmd-loglevel-help = Використання: {$command} <sawmill> <level>
      sawmill: префікс мітки для повідомлень логу. Це той, рівень якого ти задаєш.
      level: рівень логування. Має відповідати одному зі значень enum LogLevel.

cmd-testlog-desc = Записує тестовий лог у sawmill.
cmd-testlog-help = Використання: {$command} <sawmill> <level> <message>
    sawmill: префікс мітки для повідомлення в логу.
    level: рівень логування. Має відповідати одному зі значень enum LogLevel.
    message: повідомлення для логу. Бери в подвійні лапки, якщо хочеш використовувати пробіли.

## Команда 'vv'
cmd-vv-desc = Відкриває View Variables.
cmd-vv-help = Використання: {$command} <ID сутності|назва IoC-інтерфейсу|назва SIoC-інтерфейсу>

## Команда 'showvelocities'
cmd-showvelocities-desc = Показує твою кутову та лінійну швидкості.
cmd-showvelocities-help = Використання: {$command}

## Команда 'setinputcontext'
cmd-setinputcontext-desc = Встановлює активний input-контекст.
cmd-setinputcontext-help = Використання: {$command} <контекст>

## Команда 'forall'
cmd-forall-desc = Виконує команду для всіх сутностей із заданим компонентом.
cmd-forall-help = Використання: {$command} <bql query> do <команда...>

## Команда 'delete'
cmd-delete-desc = Видаляє сутність із вказаним ID.
cmd-delete-help = Використання: {$command} <UID сутності>

# Системні команди

cmd-showtime-desc = Показує час сервера.
cmd-showtime-help = Використання: {$command}

cmd-restart-desc = Коректно перезапускає сервер (а не лише раунд).
cmd-restart-help = Використання: {$command}

cmd-shutdown-desc = Коректно вимикає сервер.
cmd-shutdown-help = Використання: {$command}

cmd-saveconfig-desc = Зберігає конфігурацію сервера у файл конфігурації.
cmd-saveconfig-help = Використання: {$command}

cmd-netaudit-desc = Виводить інформацію про безпеку NetMsg.
cmd-netaudit-help = Використання: {$command}

# Команди гравця

cmd-tp-desc = Телепортує гравця в будь-яке місце в раунді.
cmd-tp-help = Використання: {$command} <x> <y> [<mapID>]

cmd-tpto-desc = Телепортує поточного гравця або вказаних гравців/сутностей до місцезнаходження першого гравця/сутності.
cmd-tpto-help = Використання: {$command} <username|uid> [username|NetEntity]...
cmd-tpto-destination-hint = пункт призначення (NetEntity або username)
cmd-tpto-victim-hint = сутність для телепортації (NetEntity або username)
cmd-tpto-parse-error = Не вдалося визначити сутність або гравця: {$str}

cmd-listplayers-desc = Виводить список усіх підключених гравців.
cmd-listplayers-help = Використання: {$command}

cmd-kick-desc = Викидає підключеного гравця з сервера, від'єднуючи його.
cmd-kick-help = Використання: {$command} <PlayerIndex> [<Reason>]

# Команда Spin

cmd-spin-desc = Змушує сутність обертатися. За замовчуванням — батьківська сутність гравця.
cmd-spin-help = Використання: {$command} velocity [drag] [entityUid]

# Команда локалізації

cmd-rldloc-desc = Перезавантажує локалізацію (клієнт і сервер).
cmd-rldloc-help = Використання: {$command}

# Дебаг-керування сутностями

cmd-spawn-desc = Спавнить сутність указаного типу.
cmd-spawn-help = Використання: {$command} <prototype> | {$command} <prototype> <relative entity ID> | {$command} <prototype> <x> <y>
cmd-cspawn-desc = Спавнить клієнтську сутність указаного типу під ногами.
cmd-cspawn-help = Використання: {$command} <тип сутності>

cmd-dumpentities-desc = Дампить список сутностей.
cmd-dumpentities-help = Використання: {$command}
                        Дампить список сутностей з UID та прототипами.

cmd-getcomponentregistration-desc = Отримує інформацію про реєстрацію компонента.
cmd-getcomponentregistration-help = Використання: {$command} <componentName>

cmd-showrays-desc = Перемикає дебаг-відмалювання променів фізики. Потрібно ціле число для <raylifetime>.
cmd-showrays-help = Використання: {$command} <raylifetime>

cmd-disconnect-desc = Негайно від'єднатися від сервера й повернутися в головне меню.
cmd-disconnect-help = Використання: {$command}

cmd-entfo-desc = Показує детальну діагностику для сутності.
cmd-entfo-help = Використання: {$command} <entityuid>
    UID сутності можна префіксувати 'c', щоб перетворити на UID клієнтської сутності.

cmd-fuck-desc = Викликає виняток.
cmd-fuck-help = Використання: {$command}

cmd-showpos-desc = Показати позиції всіх сутностей на екрані.
cmd-showpos-help = Використання: {$command}

cmd-showrot-desc = Показати обертання всіх сутностей на екрані.
cmd-showrot-help = Використання: {$command}

cmd-showvel-desc = Показати локальну швидкість усіх сутностей на екрані.
cmd-showvel-help = Використання: {$command}

cmd-showangvel-desc = Показати кутову швидкість усіх сутностей на екрані.
cmd-showangvel-help = Використання: {$command}

cmd-sggcell-desc = Виводить список сутностей у клітинці snap-ґриду.
cmd-sggcell-help = Використання: {$command} <gridID> <vector2i>\nПараметр vector2i — у форматі x<int>,y<int>.

cmd-overrideplayername-desc = Змінює ім'я, що використовується при підключенні до сервера.
cmd-overrideplayername-help = Використання: {$command} <ім'я>

cmd-showanchored-desc = Показує закріплені сутності на конкретній плитці.
cmd-showanchored-help = Використання: {$command}

cmd-dmetamem-desc = Дампить члени типу у форматі, придатному для конфіг-файлу пісочниці.
cmd-dmetamem-help = Використання: {$command} <тип>

cmd-launchauth-desc = Завантажує токени автентифікації з даних лаунчера для тестування живих серверів.
cmd-launchauth-help = Використання: {$command} <ім'я акаунту>

cmd-lightbb-desc = Перемикає показ обмежувальних рамок світла.
cmd-lightbb-help = Використання: {$command}

cmd-monitorinfo-desc = Інформація про монітори.
cmd-monitorinfo-help = Використання: {$command} <id>

cmd-setmonitor-desc = Встановити монітор.
cmd-setmonitor-help = Використання: {$command} <id>

cmd-physics-desc = Показує дебаг-оверлей фізики. Аргумент задає оверлей.
cmd-physics-help = Використання: {$command} <aabbs / com / contactnormals / contactpoints / distance / joints / shapeinfo / shapes>

cmd-hardquit-desc = Миттєво вбиває ігровий клієнт.
cmd-hardquit-help = Використання: {$command}
                    Миттєво вбиває ігровий клієнт без слідів. Серверу не прощаємось.

cmd-quit-desc = Коректно завершує роботу ігрового клієнта.
cmd-quit-help = Використання: {$command}
                Коректно завершує роботу клієнта, повідомляючи підключений сервер тощо.

cmd-csi-desc = Відкриває інтерактивну консоль C#.
cmd-csi-help = Використання: {$command}

cmd-scsi-desc = Відкриває інтерактивну консоль C# на сервері.
cmd-scsi-help = Використання: {$command}

cmd-watch-desc = Відкриває вікно спостереження за змінними.
cmd-watch-help = Використання: {$command}

cmd-showspritebb-desc = Перемикає показ меж спрайтів.
cmd-showspritebb-help = Використання: {$command}

cmd-togglelookup-desc = Показати/приховати межі entitylookup через оверлей.
cmd-togglelookup-help = Використання: {$command}

cmd-net_entityreport-desc = Перемикає панель звітів про мережеві сутності.
cmd-net_entityreport-help = Використання: {$command}

cmd-net_refresh-desc = Запитує повний стан сервера.
cmd-net_refresh-help = Використання: {$command}

cmd-net_graph-desc = Перемикає панель статистики мережі.
cmd-net_graph-help = Використання: {$command}

cmd-net_watchent-desc = Виводить усі мережеві оновлення для EntityId у консоль.
cmd-net_watchent-help = Використання: {$command} <0|EntityUid>

cmd-net_draw_interp-desc = Перемикає дебаг-відмалювання мережевої інтерполяції.
cmd-net_draw_interp-help = Використання: {$command} <0|EntityUid>

cmd-vram-desc = Показує статистику використання відеопам'яті грою.
cmd-vram-help = Використання: {$command}

cmd-showislands-desc = Показує поточні фізичні тіла, задіяні в кожному фізичному «острові».
cmd-showislands-help = Використання: {$command}

cmd-showgridnodes-desc = Показує вузли для розділення ґриду.
cmd-showgridnodes-help = Використання: {$command}

cmd-profsnap-desc = Зробити знімок профілювання.
cmd-profsnap-help = Використання: {$command}

cmd-devwindow-desc = Вікно розробника.
cmd-devwindow-help = Використання: {$command}

cmd-scene-desc = Негайно змінює UI-сцену/стан.
cmd-scene-help = Використання: {$command} <className>

cmd-szr_stats-desc = Звіт зі статистикою серіалізатора.
cmd-szr_stats-help = Використання: {$command}

cmd-hwid-desc = Повертає поточний HWID (HardWare ID).
cmd-hwid-help = Використання: {$command}

cmd-vvread-desc = Отримати значення шляху через VV (View Variables).
cmd-vvread-help = Використання: {$command} <шлях>

cmd-vvwrite-desc = Змінити значення шляху через VV (View Variables).
cmd-vvwrite-help = Використання: {$command} <шлях>

cmd-vvinvoke-desc = Викликати/виконати шлях з аргументами через VV.
cmd-vvinvoke-help = Використання: {$command} <шлях> [аргументи...]

cmd-dump_dependency_injectors-desc = Дампить кеш інжектора залежностей IoCManager.
cmd-dump_dependency_injectors-help = Використання: {$command}
cmd-dump_dependency_injectors-total-count = Усього: { $total }

cmd-dump_netserializer_type_map-desc = Дампить мапу типів NetSerializer і хеш серіалізатора.
cmd-dump_netserializer_type_map-help = Використання: {$command}

cmd-hub_advertise_now-desc = Негайно оголосити на головний hub-сервер.
cmd-hub_advertise_now-help = Використання: {$command}

cmd-echo-desc = Повертає аргументи в консоль.
cmd-echo-help = Використання: {$command} "<повідомлення>"

## Команда 'vfs_ls'
cmd-vfs_ls-desc = Виводить вміст каталогу у VFS.
cmd-vfs_ls-help = Використання: {$command} <шлях>
    Приклад:
    vfs_list /Assemblies

cmd-vfs_ls-err-args = Потрібен рівно 1 аргумент.
cmd-vfs_ls-hint-path = <шлях>

cmd-reloadtiletextures-desc = Перезавантажує атлас текстур плиток для гарячого перезавантаження тайл-спрайтів.
cmd-reloadtiletextures-help = Використання: {$command}

cmd-audio_length-desc = Показує тривалість аудіофайлу.
cmd-audio_length-help = Використання: {$command} { cmd-audio_length-arg-file-name }
cmd-audio_length-arg-file-name = <назва файлу>

## PVS
cmd-pvs-override-info-desc = Виводить інформацію про PVS-перевизначення, пов'язані з сутністю.
cmd-pvs-override-info-empty = Сутність {$nuid} не має PVS-перевизначень.
cmd-pvs-override-info-global = Сутність {$nuid} має глобальне перевизначення.
cmd-pvs-override-info-clients = Сутність {$nuid} має сесійне перевизначення для {$clients}.

## Зміна локалі
cmd-localization_set_culture-desc = Задає DefaultCulture для клієнтського LocalizationManager.
cmd-localization_set_culture-help = Використання: {$command} <cultureName>
cmd-localization_set_culture-culture-name = <cultureName>
cmd-localization_set_culture-changed = Локалізацію змінено на { $code } ({ $nativeName } / { $englishName })
