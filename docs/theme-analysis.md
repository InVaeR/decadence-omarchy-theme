# Анализ популярных Omarchy-тем и рекомендации для Decadence

> Дата: 2026-09-20
> Цель: изучить, как устроены похожие проекты на GitHub, выявить лучшие практики и определить, чего не хватает теме **Decadence**.

---

## 1. Изученные репозитории

| Репозиторий | ⭐ | Суть | Масштаб |
|---|---|---|---|
| [omacom/aether](https://github.com/omacom/aether) | 719 | Приложение-темизатор для Omarchy (Wails/Go), не тема | 628 коммитов, 17 докстраниц, AUR-пакет |
| [HANCORE-linux/waybar-themes](https://github.com/HANCORE-linux/waybar-themes) | 621 | Коллекция из ~85 версий конфигов Waybar | ~2000 коммитов, MIT |
| [OldJobobo/omarchy-lumon-theme](https://github.com/OldJobobo/omarchy-lumon-theme) | 169 | Тема по «Разделению» (Lumon Industries), navy+cyan | ~45 файлов темы |
| [Grenish/omarchy-akane-theme](https://github.com/Grenish/omarchy-akane-theme) | 108 | Японская тема (navy+вермильон+золото) | ~25 файлов темы |
| [hembramnishant50-glitch/omarchy-coppernight-theme](https://github.com/hembramnishant50-glitch/omarchy-coppernight-theme) | 99 | Максимальный охват приложений (indigo+copper) | ~45 файлов темы |

---

## 2. Ключевые наблюдения по каждому проекту

### Aether (719★)
- Не тема, а **движок темизации**: 20+ преднастроенных приложений, генерация конфигов из шаблонов.
- Средне-квадратичная экстракция палитры из обоев, WCAG-проверка контраста, 250+ Base16-схем.
- **Лучшая документация из всех**: 17 страниц docs, демо-видео, 3 способа установки, CLI-режим.
- Кросс-промо: ссылается на waybar-themes и omarchy-theme-hook как на комплементарные проекты.

### HANCORE waybar-themes (621★)
- **Версионирование как каталог**: каждая версия — папка + changelog + скриншот + команда установки в одну строку.
- Раздел «сброс Waybar к дефолту Omarchy» — снижает страх пользователей что-то сломать.
- Урок: даже простая коллекция выстреливает, если есть **скриншот для каждого варианта**.

### Lumon theme (169★)
- **Манифест `.omarchy-theme.yml`** с метаданными (`gallery`, `category`) — для каталогов тем.
- Полный набор конфигов: 5 терминалов, Hyprland, hyprlock, Waybar, Walker, mako, SwayOSD, GTK, btop, Neovim, Obsidian, Discord, Chromium.
- README с «вселенной» темы (лор «Разделения») — сильная брендированность.
- Скрипты-хелперы `install-*/uninstall-*` для компонентов, которые Omarchy не подхватывает сам.
- В README честно указано: Omarchy **не запускает post-install хуки автоматически**.

### Akane theme (108★)
- Самый чистый пример **Quattro-подхода**: `colors.toml` — мастер-палитра, Omarchy сам генерирует конфиги.
- Двойная совместимость: файлы и для Quattro, и для legacy-версий Omarchy.
- README: палитра-таблица с колонкой «откуда цвет взят» (provenance), **превью экрана блокировки отдельно**, tip `omarchy theme bg next`.
- Полезные поля в `colors.toml`: `hyprland_active_border = "rgba(...)"` с градиентом, уровни фонов `darker/lighter`.

### Coppernight (99★)
- **Самый широкий охват приложений**: Emacs, Vim, Sublime, tmux, fish, zsh, starship, lazygit, yazi, fastfetch, cava, git-delta, Stylus-пак из 136+ юзерстайлов, opencode, Claude.
- README-маркетинг: якорная навигация, таблица «файл → что делает», палитра со свотчами, contributing-секция.
- **Антипримеры**: битые скриншоты (JWT-ссылки на GitHub-usercontent истекают), закоммиченные `.bak`-файлы, бейдж на несуществующий LICENSE, заявленный в описании Waybar/Hyprlock отсутствует в репо.

---

## 3. Общая структура «эталонной» Omarchy-темы

Стандартный набор файлов, сложившийся в топовых темах:

```
theme/
├── .omarchy-theme.yml    # метаданные (gallery, category)
├── colors.toml           # МАСТЕР-палитра (Quattro генерирует из неё конфиги)
├── hyprland.lua          # опции Hyprland для Quattro
├── hyprland.conf         # legacy-вариант
├── hyprlock.conf         # экран блокировки
├── waybar.css            # панель
├── walker.css            # лаунчер
├── mako.ini              # уведомления
├── swayosd.css           # OSD (громкость/яркость)
├── gtk.css               # GTK-приложения
├── icons.theme           # курсоры/иконки
├── keyboard.rgb          # RGB-клавиатуры
├── alacritty.toml / kitty.conf / ghostty.conf / foot.ini
├── btop.theme / neovim.lua / helix.toml / chromium.theme
├── backgrounds/          # обои
└── preview.png / preview-unlock.png
```

Важно: в эпоху **Quattro** основная работа делается через `colors.toml` — Omarchy сам генерирует терминалы, Hyprland Lua, Neovim, VS Code, Helix, btop, Chromium. Отдельные файлы нужны для приложений вне генератора или legacy-совместимости.

---

## 4. Gap-анализ Decadence

### Что уже хорошо
- ✅ Мастер-палитра `colors.toml` в актуальном Quattro-формате (уровни фонов, яркие цвета).
- ✅ `palette.json` с расширенными токенами — редкая фича, удобна для своих дотфайлов.
- ✅ 9 эксклюзивных 4K-обоев + галерея в README.
- ✅ Оба превью: рабочий стол **и** экран блокировки (как у Akane).
- ✅ Чистый README без мусорных файлов.

### Чего не хватает (приоритизировано)

| Приоритет | Что | Зачем | У кого подсмотреть |
|---|---|---|---|
| 🔴 Высокий | `.omarchy-theme.yml` (gallery, category) | Попадание в каталоги тем и в галерею Omarchy | Lumon |
| 🔴 Высокий | `hyprlock.conf` + стилизованный экран блокировки | `unlock.png` без конфига не даёт стиля — только фон | Lumon, Akane |
| 🔴 Высокий | Починить пути в `palette.json` | Сейчас указывает на `Wallpapers/Decadence_1.png`, а папка — `backgrounds/Decadence_01.png` | — |
| 🟡 Средний | `hyprland.lua` (borders, gaps, blur, анимации) | Тема = не только цвета, но и «ощущение» рабочего стола | Coppernight, Akane |
| 🟡 Средний | Секция Changelog в README | Пользователи видят, что тема живая | HANCORE |
| 🟡 Средний | Указать версию Omarchy-совместимости явно (Quattro) | Снижает число issues «не работает» | Akane |
| 🟢 Низкий | `waybar.css`, `walker.css`, `mako.ini` | Если хочется кастомной панели — иначе достаточно Quattro-генерации | Lumon |
| 🟢 Низкий | Темы редакторов вне генератора (Helix, Zed, Obsidian) | Расширение аудитории | Coppernight |
| 🟢 Низкий | Скриншоты хостить в репо, не на GitHub-CDN | JWT-ссылки у Coppernight протухли — извлекать уроки | — |
| 🟢 Низкий | GitHub topics: `omarchy`, `omarchy-theme`, `hyprland` | Находимость в поиске | Akane |

---

## 5. Конкретный план действий

### Быстрые победы (до часа работы)
1. Добавить `.omarchy-theme.yml`:
   ```yaml
   gallery: true
   category: aesthetic
   ```
2. Исправить `wallpapers` в `palette.json` → `backgrounds/Decadence_01.png` … `_09.png`.
3. Проставить topics в настройках репозитория: `omarchy`, `omarchy-theme`, `hyprland`, `archlinux`, `dark-theme`, `gold`.
4. В README добавить бейдж/строку «Requires Omarchy Quattro+».

### Средний срок
5. `hyprlock.conf`: часики и подпись в золоте (`#d4a843`), мраморный текст (`#f5f0eb`) — стиль уже задан в `palette.json` (`semantic.selection_fg`, `marble.primary`).
6. `hyprland.lua`: активная рамка с золотым градиентом `rgba(d4a843ee) rgba(e8c05aee) 45deg`, скругления, blur с тёплым оттенком.
7. Секция Changelog (v1.0.0 — релиз, v1.1.0 — 4K обои, и т.д.).

### Долгий срок (по желанию)
8. Темы для Obsidian/Helix/Zed поверх токенов из `palette.json`.
9. Отдельная light-вариация «Decadence Day» (мраморный светлый фон + то же золото) — её нет ни у одной из изученных тем, потенциальная ниша.

---

## 6. Вывод

Decadence уже сильнее большинства по контенту (эксклюзивные 4K-обои, расширенный `palette.json`, превью блок-скрина), но отстаёт по **интеграции с экосистемой**: нет манифеста, нет конфигов компонентов, экран блокировки — только картинка. Топовые темы выигрывают не количеством обоев, а тем, что после `omarchy theme install <url>` у пользователя стилизовано **всё**: панель, лаунчер, уведомления, локскрин, терминалы. Первые три пункта из раздела 5 закрывают самый заметный разрыв при минимальных усилиях.
