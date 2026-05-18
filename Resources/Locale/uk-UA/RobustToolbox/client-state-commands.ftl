# Loc strings for various entity state & client-side PVS related commands

cmd-reset-ent-help = Використання: {$command} <Entity UID>
cmd-reset-ent-desc = Скинути сутність до останнього отриманого стану з сервера. Це також поверне сутності, які були від'єднані в null-space.

cmd-reset-all-ents-help = Використання: {$command}
cmd-reset-all-ents-desc = Скинути всі сутності до останнього отриманого стану з сервера. Стосується лише сутностей, які не були від'єднані в null-space.

cmd-detach-ent-help = Використання: {$command} <Entity UID>
cmd-detach-ent-desc = Від'єднати сутність у null-space, наче вона вийшла з радіуса PVS.

cmd-local-delete-help = Використання: {$command} <Entity UID>
cmd-local-delete-desc = Видаляє сутність. На відміну від звичайної команди delete, ця працює на КЛІЄНТІ. Якщо сутність не клієнтська, це майже напевно спричинить помилки.

cmd-full-state-reset-help = Використання: {$command}
cmd-full-state-reset-desc = Відкидає всю інформацію про стан сутностей і запитує повний стан із сервера.
