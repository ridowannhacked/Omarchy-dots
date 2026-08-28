# My Omarchy Setup (DWM Workflow Port)

This repository contains my complete configuration for Omarchy, customized to replicate my DWM workflow (with `Alt` as the leader key, zero gaps, thin borders, and specific app bindings). 

It is split into two directories:
* **`user-configs/`**: The actual live configurations that run the system (from `~/.config/`).
* **`reference/`**: The raw system files from Omarchy (for reference only, so you can study how the system was built under the hood).

---

## 1. Keybindings & The `Alt` Leader Key
Omarchy uses Hyprland and heavily hardcodes `SUPER` as the leader key. 
To convert this to `Alt` seamlessly, we injected a Lua hook into `user-configs/hypr/hyprland.lua` right before it loads the system defaults. This dynamically swaps `SUPER` and `ALT` for all built-in commands.

**How to customize bindings:**
Edit `user-configs/hypr/bindings.lua`.
Because the Lua hook restores itself, you can write bindings naturally. 
* To remove a default Omarchy binding, use `hl.unbind("ALT + KEY")`.
* To add a new one, use `o.bind("ALT + KEY", "Description", "command")`.

---

## 2. Customizing the Clock and the Top Bar
Omarchy's top bar runs on a Quickshell process. The layout is stored in `user-configs/omarchy/shell.json`.

**Moving widgets (like the clock):**
You don't even need to edit the JSON file manually. You can move the clock using Omarchy's CLI:
```bash
omarchy bar move omarchy.clock --section right
```
*(The bar will hot-reload instantly without needing a restart).*

**Editing the widget's code/look:**
If you want to change how the clock actually looks or is formatted, **never** edit the system files in `/usr/share/omarchy/`. Instead, clone the plugin to your user folder:
```bash
omarchy plugin clone omarchy.clock
```
This creates a copy in `~/.config/omarchy/plugins/` (which you can track in this repo). You can then edit the code there, and it survives all system updates!

---

## 3. Reminders
Omarchy has a fantastic built-in reminder system that hooks directly into the notification daemon. You don't need to configure a cron job or a heavy app.

Just use the CLI command:
```bash
omarchy reminder 15 "Take a break and drink water"
```
* `omarchy reminder show` - Lists active reminders.
* `omarchy reminder clear` - Clears them.

You can easily bind these commands to shortcuts in your `bindings.lua` or add them to your `herdr-dev.sh` script to remind you to take breaks while coding.

---

## 4. Idle and Lock Screen
To control when your screen dims or locks, edit `user-configs/omarchy/shell.json`.
Look for `idle.screensaver` and `idle.lock`. The values are in seconds.
For example, to lock your screen after 10 minutes of inactivity, set:
```json
"idle.lock": 600
```

---

## 5. Neovim & Tmux
Unlike Manjaro or other distros that heavily patch applications, Omarchy just uses the raw upstream `nvim` and `tmux` packages. The files in `user-configs/nvim/` and `user-configs/tmux/` are fully owned by you.
* To use your own config, simply delete Omarchy's defaults in `~/.config/nvim/` and symlink your own dotfiles.
* **Warning:** Never run `omarchy refresh nvim` or `omarchy refresh tmux`, as this will wipe your symlinks and restore Omarchy's starter templates.

---

## Applying this config to a new machine
1. Install Omarchy.
2. Clone this repo.
3. Copy or symlink the contents of `user-configs/` into your `~/.config/` directory.
4. Run `hyprctl reload` to apply the window manager changes.
