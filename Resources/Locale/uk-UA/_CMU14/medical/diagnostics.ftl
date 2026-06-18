cmu-medical-scanner-body-map-header = Карта Тіла
cmu-medical-scanner-pulse-label = Пульс:
cmu-medical-scanner-body-parts-header = Частини тіла
cmu-medical-scanner-organs-header = Органи
cmu-medical-scanner-fractures-header = Переломи
cmu-medical-scanner-bleeds-header = Внутрішні кровотечі
cmu-medical-scanner-pulse-stopped = [color=red][bold]Пульсу немає — серце зупинилося[/bold][/color]
cmu-medical-scanner-pulse-bpm = { $bpm } уд/хв
cmu-medical-scanner-part-line = { $part }: { $current }/{ $max } HP
cmu-medical-scanner-part-suffix-splinted = (зашиновано)
cmu-medical-scanner-part-suffix-cast = (у гіпсі)
cmu-medical-scanner-part-suffix-wounds = ({ $count } ран{ $count ->
    [one] а
   *[other] и
})
cmu-medical-scanner-organ-line = { $organ }: { $stage } ({ $current }/{ $max })
cmu-medical-scanner-organ-removed = { $organ }: [color=red]ВИДАЛЕНО[/color]
cmu-medical-scanner-fracture-line-exact = { $part }: { $severity } перелом
cmu-medical-scanner-fracture-line-vague = { $part }: виявлено перелом
cmu-medical-scanner-fracture-suppressed = (пригнічено)
cmu-medical-scanner-bleed-exact = { $part }: { $rate } крововтрати/сек
cmu-medical-scanner-bleed-vague = Виявлено внутрішню кровотечу (місце невідоме)

cmu-medical-stethoscope-pulse = Частота серцебиття { $bpm }.
cmu-medical-stethoscope-pulse-qualitative = Пульс { $description }.
cmu-medical-stethoscope-no-pulse = Серцебиття не виявлено.
cmu-medical-stethoscope-no-heart = У грудях пацієнта немає серця.
cmu-medical-stethoscope-lungs-precise = Легені: { $stage }.
cmu-medical-stethoscope-lungs-qualitative = Легені звучать { $description }.
cmu-medical-stethoscope-no-lungs = У грудях пацієнта немає легень.

cmu-medical-scanner-section-head = Голова
cmu-medical-scanner-section-torso = Торс
cmu-medical-scanner-section-arms = Руки
cmu-medical-scanner-section-legs = Ноги
cmu-medical-scanner-section-organs = Органи
cmu-medical-scanner-hp = HP
cmu-medical-scanner-bone = Кістка
cmu-medical-scanner-fracture = Перелом: { $severity }
cmu-medical-scanner-fracture-vague = Перелом: виявлено
cmu-medical-scanner-bleed-internal = Внутрішня Кровотеча
cmu-medical-scanner-pain-unknown = Біль: ?
cmu-medical-scanner-pain-none = Біль: Немає
cmu-medical-scanner-pain-mild = Біль: Легкий
cmu-medical-scanner-pain-moderate = Біль: Помірний
cmu-medical-scanner-pain-severe = Біль: Сильний
cmu-medical-scanner-pain-shock = Біль: шок

# V2-ε Stat-sheet redesign — dark cards + status banner + body chart
cmu-medical-scanner-pain-risk-unknown = ?
cmu-medical-scanner-pain-risk-low = Низький
cmu-medical-scanner-pain-risk-elevated = Підвищений
cmu-medical-scanner-pain-risk-high = Високий
cmu-medical-scanner-pain-risk-imminent = Неминучий
cmu-medical-scanner-pain-risk-active = Активний
cmu-medical-scanner-pain-risk-suppressed-suffix = (пригн.)

# V2-ε Stat-sheet redesign — dark cards + status banner + body chart
cmu-medical-scanner-card-body = Тіло
cmu-medical-scanner-card-organs = Органи
cmu-medical-scanner-card-reagents = Реагенти у кровотоці
cmu-medical-scanner-card-recommended = Рекомендовано
cmu-medical-scanner-card-patient = Пацієнт
cmu-medical-scanner-card-damage = Профіль ушкоджень
cmu-medical-scanner-loading = Отримання телеметрії сканування
cmu-medical-scanner-loading-subtext = розв'язання стану сервера

cmu-medical-scanner-stat-health = ЗДОРОВ'Я
cmu-medical-scanner-stat-pulse = ПУЛЬС УД/ХВ
cmu-medical-scanner-stat-blood = КРОВ
cmu-medical-scanner-stat-temp = ТЕМП °C
cmu-medical-scanner-stat-shock-risk = РИЗИК ШОКУ
cmu-medical-scanner-stat-pulse-stopped = 0
cmu-medical-scanner-stat-deceased-short = МЕРТВИЙ

cmu-medical-scanner-status-stable = СТАБІЛЬНИЙ
cmu-medical-scanner-status-serious = ВАЖКИЙ
cmu-medical-scanner-status-critical = КРИТИЧНИЙ
cmu-medical-scanner-status-deceased = ПОМЕРЛИЙ

cmu-medical-scanner-severity-healthy = Здоровий
cmu-medical-scanner-severity-bruised = Забитий
cmu-medical-scanner-severity-damaged = Пошкоджений
cmu-medical-scanner-severity-critical = Критичний
cmu-medical-scanner-severity-severed = Відрізаний

cmu-medical-scanner-chip-fracture-vague = Перелом
cmu-medical-scanner-chip-suppressed-suffix = (пригн.)
cmu-medical-scanner-chip-bleed = ВК
cmu-medical-scanner-chip-bleeding = Кровотеча
cmu-medical-scanner-chip-splint = Шина
cmu-medical-scanner-chip-cast = Гіпс
cmu-medical-scanner-chip-tourniquet = ДЖ
cmu-medical-scanner-wound-small = невелика рана
cmu-medical-scanner-wound-deep = глибока рана
cmu-medical-scanner-wound-gaping = зяюча рана
cmu-medical-scanner-wound-massive = масивна рана
cmu-medical-scanner-eschar = струп
cmu-medical-scanner-chip-wounds = { $count } ран{ $count ->
    [one] а
   *[other] и
}

# Skill-gate hints — surface what the examiner can't read so the medic
# knows whether to study up rather than assuming the patient is fine.
cmu-medical-scanner-skill-hint-fractures = Недостатньо підготовки для виявлення переломів чи внутрішніх кровотеч (потрібен Мед-1).
cmu-medical-scanner-skill-hint-organs = Недостатньо підготовки для оцінки ушкоджень органів (потрібен Мед-2).
cmu-medical-scanner-synthetic-physiology = Виявлено синтетичну фізіологію

# Legacy V2-ε Mix B keys (still referenced by tests / fallback paths)
cmu-medical-scanner-vitals-pain = Біль
cmu-medical-scanner-stable-summary = Стабільно: { $list }
cmu-medical-scanner-acute-issues-header = Гострі Проблеми
cmu-medical-scanner-acute-severed = Відрізано: { $part }
cmu-medical-scanner-acute-fracture = { $severity } перелом: { $part }
cmu-medical-scanner-acute-fracture-vague = Перелом: { $part }
cmu-medical-scanner-acute-bleed = Внутрішня кровотеча: { $part }
cmu-medical-scanner-acute-bleed-vague = Виявлено внутрішню кровотечу
cmu-medical-scanner-acute-organ = { $stage }: { $organ }
cmu-medical-scanner-acute-organ-removed = Видалено: { $organ }
cmu-medical-scanner-organ-removed-short = Видалено

# Organ display names — friendly labels keyed off the CMUOrganHuman*
# prototype ids. Per-organ keys keep the locale layer the only place
# that needs editing if we rename for V2.5.
cmu-medical-scanner-organ-heart = Серце
cmu-medical-scanner-organ-lungs = Легені
cmu-medical-scanner-organ-liver = Печінка
cmu-medical-scanner-organ-brain = Мозок
cmu-medical-scanner-organ-kidneys = Нирки
cmu-medical-scanner-organ-stomach = Шлунок
cmu-medical-scanner-organ-eyes = Очі
cmu-medical-scanner-organ-ears = Вуха

cmu-medical-stethoscope-pain-mild = Пацієнту, схоже, незручно.
cmu-medical-stethoscope-pain-moderate = Пацієнт відчуває помітний біль.
cmu-medical-stethoscope-pain-severe = Пацієнт відчуває сильний біль.
cmu-medical-stethoscope-pain-shock = Пацієнт у шоці.

cmu-medical-scanner-chip-shrapnel = { $count } улам.
cmu-medical-scanner-wound-typed = { $size } { $mechanism }
cmu-medical-scanner-wound-size-small = невелика
cmu-medical-scanner-wound-size-deep = глибока
cmu-medical-scanner-wound-size-gaping = зяюча
cmu-medical-scanner-wound-size-massive = масивна
cmu-medical-scanner-wound-mechanism-generic = рана
cmu-medical-scanner-wound-mechanism-bullet = кульова рана
cmu-medical-scanner-wound-mechanism-stab = колота рана
cmu-medical-scanner-wound-mechanism-slash = різана рана
cmu-medical-scanner-wound-mechanism-crush = розчавлена рана
cmu-medical-scanner-wound-mechanism-burn = опік
cmu-medical-scanner-wound-mechanism-blast = вибухова рана
cmu-medical-scanner-wound-mechanism-fragment = уламкова рана
cmu-medical-scanner-wound-mechanism-surgical = хірургічна рана
cmu-medical-scanner-stabilizer-missing = Стабілізатор: відсутній
cmu-medical-scanner-stabilizer-ready = Стабілізатор: готовий
cmu-medical-scanner-stabilizer-cooling = Стабілізатор: охолодження ({ $seconds }с)
cmu-medical-scanner-stabilizer-empty = Стабілізатор: порожній
cmu-medical-scanner-stabilizer-unavailable = Стабілізатор: недоступний
cmu-medical-scanner-stabilizer-active = Стабілізація { $organ } ({ $seconds }с)
cmu-medical-scanner-stabilizer-vial-loaded-suffix = + флакон
cmu-medical-scanner-stabilizer-vial-bypass-suffix = + флакон обходу
cmu-medical-scanner-stat-no-pulse-short = НЕМАЄ ПУЛЬСУ
cmu-medical-scanner-shock-risk-unknown = --
cmu-medical-scanner-shock-risk-none = НЕМАЄ
cmu-medical-scanner-shock-risk-low = НИЗЬКИЙ
cmu-medical-scanner-shock-risk-elevated = ПІДВИЩЕНИЙ
cmu-medical-scanner-shock-risk-high = ВИСОКИЙ
cmu-medical-scanner-shock-risk-shock = ШОК
cmu-medical-scanner-shock-risk-suppressed = ПРИГНІЧЕНО
cmu-medical-scanner-chip-prosthetic = Протез
cmu-medical-scanner-ledger-summary-only = Детальна анатомічна телеметрія недоступна.
cmu-medical-scanner-ledger-alert-internal-bleeding = Внутрішня кровотеча
cmu-medical-scanner-ledger-alert-active-bleeding = Активна кровотеча
cmu-medical-scanner-ledger-alert-broken-limb = Зламана кінцівка
cmu-medical-scanner-ledger-alert-organ-damage = Ушкодження органа
cmu-medical-scanner-ledger-alert-open-stump = Відкрита кукса
cmu-medical-scanner-ledger-alert-missing-limb = Відсутня кінцівка
cmu-medical-scanner-ledger-alert-open-incision = Відкритий розріз
cmu-medical-scanner-ledger-alert-tourniquet = Турнікет
cmu-medical-scanner-ledger-alert-necrotic-region = Некротична кінцівка
cmu-medical-scanner-ledger-alert-core-fracture = Перелом корпуса
cmu-medical-scanner-ledger-alert-suppressed-bleeding = Кровотечу пригнічено, але не оброблено
cmu-medical-scanner-ledger-alert-severe-burn = Сильний опік