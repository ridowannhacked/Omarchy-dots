-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")

-- 1. Free up the old Omarchy defaults
hl.unbind("ALT + SPACE")
hl.unbind("ALT + W")

-- 2. Move the built-in Omarchy launcher to ALT + D
o.bind("ALT + D", "Omarchy menu", "omarchy-menu toggle")

-- 3. Move close window to ALT + Q
o.bind("ALT + Q", "Close Window", hl.dsp.window.close())

-- 4. Move power menu to ALT + P
hl.unbind("ALT + P")
o.bind("ALT + P", "Power Menu", "omarchy-menu toggle system")

-- 5. User Apps (Firefox, Kitty, Neovim)
hl.unbind("ALT + B")
o.bind("ALT + B", "Firefox", "firefox")

hl.unbind("ALT + RETURN")
o.bind("ALT + RETURN", "Kitty", "kitty")

hl.unbind("ALT + V")
o.bind("ALT + V", "Neovim", "kitty -e nvim")

-- 6. Toggle Top Bar (DWM leader n)
hl.unbind("ALT + N")
o.bind("ALT + N", "Toggle Bar", "omarchy-toggle-bar")

-- 7. Monocle Layout Toggle (Maximize)
hl.unbind("ALT + M")
o.bind("ALT + M", "Monocle (Maximize)", hl.dsp.window.fullscreen({ mode = "maximized" }))
-- Note: ALT + T is already Omarchy's default to toggle Tiling vs Floating!


