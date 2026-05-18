# Команди відтворення

cmd-replay-play-desc = Відновити відтворення повтору.
cmd-replay-play-help = replay_play

cmd-replay-pause-desc = Призупинити відтворення повтору.
cmd-replay-pause-help = replay_pause

cmd-replay-toggle-desc = Відновити або призупинити відтворення повтору.
cmd-replay-toggle-help = replay_toggle

cmd-replay-toggle-screenshot-mode-desc = Перемикає режим скріншотів для повторів, ховаючи віджет керування повтором.
cmd-replay-toggle-screenshot-mode-help = replay_toggle_screenshot_mode

cmd-replay-stop-desc = Зупинити та вивантажити повтор.
cmd-replay-stop-help = replay_stop

cmd-replay-load-desc = Завантажити та запустити повтор.
cmd-replay-load-help = replay_load <тека повтору>
cmd-replay-load-hint = Тека повтору

cmd-replay-skip-desc = Перемотати вперед або назад у часі.
cmd-replay-skip-help = replay_skip <тік або проміжок>
cmd-replay-skip-hint = Тіки або проміжок (HH:MM:SS).

cmd-replay-set-time-desc = Перейти вперед або назад до конкретного часу.
cmd-replay-set-time-help = replay_set <тік або час>
cmd-replay-set-time-hint = Тік або проміжок (HH:MM:SS) від початку

cmd-replay-error-time = "{$time}" не є цілим числом або проміжком часу.
cmd-replay-error-args = Невірна кількість аргументів.
cmd-replay-error-no-replay = Зараз повтор не відтворюється.
cmd-replay-error-already-loaded = Повтор уже завантажено.
cmd-replay-error-run-level = Не можна завантажити повтор, поки ви підключені до сервера.

# Команди запису

cmd-replay-recording-start-desc = Починає запис повтору, опціонально з обмеженням часу.
cmd-replay-recording-start-help = Використання: replay_recording_start [назва] [перезапис] [обмеження часу]
cmd-replay-recording-start-success = Запис повтору розпочато.
cmd-replay-recording-start-already-recording = Повтор уже записується.
cmd-replay-recording-start-error = Сталася помилка при спробі почати запис.
cmd-replay-recording-start-hint-time = [обмеження часу (хв)]
cmd-replay-recording-start-hint-name = [назва]
cmd-replay-recording-start-hint-overwrite = [перезапис (bool)]

cmd-replay-recording-stop-desc = Зупиняє запис повтору.
cmd-replay-recording-stop-help = Використання: replay_recording_stop
cmd-replay-recording-stop-success = Запис повтору зупинено.
cmd-replay-recording-stop-not-recording = Зараз запис повтору не ведеться.

cmd-replay-recording-stats-desc = Показує інформацію про поточний запис повтору.
cmd-replay-recording-stats-help = Використання: replay_recording_stats
cmd-replay-recording-stats-result = Тривалість: {$time} хв, тіків: {$ticks}, розмір: {$size} МБ, швидкість: {$rate} МБ/хв.


# Інтерфейс керування часом
replay-time-box-scrubbing-label = Динамічна прокрутка
replay-time-box-replay-time-label = Час запису: {$current} / {$end}  ({$percentage}%)
replay-time-box-server-time-label = Серверний час: {$current} / {$end}
replay-time-box-index-label = Індекс: {$current} / {$total}
replay-time-box-tick-label = Тік: {$current} / {$total}
