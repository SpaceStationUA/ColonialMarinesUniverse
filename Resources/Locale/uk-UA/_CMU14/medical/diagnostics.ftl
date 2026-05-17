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
cmu-medical-scanner-pain-shock = Біль: Шок
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
cmu-medical-scanner-card-patient = Терплячий
cmu-medical-scanner-card-damage = Профіль шкоди
cmu-medical-scanner-loading = Отримання телеметрії сканування
cmu-medical-scanner-loading-subtext = розв'язання стану сервера

cmu-medical-scanner-stat-health = ЗДОРОВ'Я
cmu-medical-scanner-stat-pulse = ПУЛЬС УД/ХВ
cmu-medical-scanner-stat-blood = КРОВ
cmu-medical-scanner-stat-temp = ТЕМП °C
cmu-medical-scanner-stat-shock-risk = РИЗИК ШОКУ
cmu-medical-scanner-stat-pulse-stopped     = 0
cmu-medical-scanner-stat-deceased-short = МЕРТВІ

cmu-medical-scanner-status-stable = СТАБІЛЬНИЙ
cmu-medical-scanner-status-serious = СЕРЙОЗНИЙ
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
cmu-medical-scanner-organ-stomach = Живіт
cmu-medical-scanner-organ-eyes = Очі
cmu-medical-scanner-organ-ears = Вуха

cmu-medical-stethoscope-pain-mild = Пацієнту, схоже, незручно.
cmu-medical-stethoscope-pain-moderate = Пацієнт відчуває помітний біль.
cmu-medical-stethoscope-pain-severe = Пацієнт відчуває сильний біль.
cmu-medical-stethoscope-pain-shock = Пацієнт у шоці.
