----------------
--- MONITORS ---
----------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

-- DP2 on the left
hl.monitor({
  output = "DP-1",
  mode = "preferred",
  position = "auto",
  scale = "auto",
})
hl.monitor({
  output = "DP-2",
  mode = "preferred",
  position = "auto-left",
  scale = "auto",
})

-- random additional monitors will appear as extensions on the right
hl.monitor({
  output = "",
  mode = "preferred",
  position = "auto",
  scale = "auto",
})

-------------------
--- MY PROGRAMS ---
-------------------

-- Set programs that you use
local terminal = "kitty --single-instance"
local menu = "pidof wofi || wofi"
local pw_manager = "pidof wofi || rofi-rbw"
local session_manager = "~/bin/leave.sh"

-----------------
--- AUTOSTART ---
-----------------

-- https://wiki.hypr.land/Configuring/Basics/Autostart/
-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Expanding-functionality/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:

local function on_start_or_reload()
  hl.exec_cmd("pidof -x weather.sh || ~/bin/weather.sh")
  hl.exec_cmd("pidof mako || mako")
  hl.exec_cmd("pidof hypridle || hypridle")
  hl.exec_cmd("pidof wayland-pipewire-idle-inhibit || wayland-pipewire-idle-inhibit")
  hl.exec_cmd("pidof wlsunset || wlsunset -l 46.7 -L -117.2 -T 4800 -t 3700")
  hl.exec_cmd("pidof wpaperd || wpaperd -d")
  hl.exec_cmd("pidof waybar || waybar")
  hl.exec_cmd("pidof -x udiskie || udiskie")
end

hl.on("hyprland.start", function()
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_SESSION_DESKTOP XDG_CURRENT_DESKTOP")

  on_start_or_reload()
end)

hl.on("config.reloaded", on_start_or_reload)

-----------------------------
--- ENVIRONMENT VARIABLES ---
-----------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_THEME", "Bibata - Modern - Classic")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "Bibata - Modern - Classic")
hl.env("HYPRCURSOR_SIZE", "24")

-- XDG Settings
hl.env("XDG_SESSION_TYPE", "wayland")

-- NVIDIA settings
hl.env("GBM_BACKEND", "nvidia - drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("NVD_BACKEND", "direct")

hl.config({
  cursor = {
    default_monitor = "DP-2",
  },
  -- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
  master = {
    mfact = 0.6,
    new_status = "inherit",
    new_on_top = true,
    special_scale_factor = 0.9,
  },

  -- https://wiki.hypr.land/Configuring/Basics/Variables/#misc
  misc = {
    disable_hyprland_logo = true,
    disable_splash_rendering = true,

    enable_swallow = true,
    swallow_regex = "^(kitty)$",

    mouse_move_enables_dpms = true,
    key_press_enables_dpms = true,
  },

  -- https://wiki.hypr.land/Configuring/Basics/Variables/#ecosystem
  ecosystem = {
    no_update_news = true,
    no_donation_nag = true,
  },
})
-------------
--- INPUT ---
-------------

-- https://wiki.hypr.land/Configuring/Basics/Variables/#input

hl.config({
  input = {
    kb_layout = "us",
    kb_variant = "",
    kb_model = "",
    kb_options = "caps:swapescape",
    kb_rules = "",

    follow_mouse = 1,

    numlock_by_default = true,

    sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

    touchpad = {
      natural_scroll = false,
    },
  },
})

-------------------
--- KEYBINDINGS ---
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Binds/
local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
hl.bind(mainMod .. " + SHIFT + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + X", hl.dsp.window.close())
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("hyprctl reload"))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd(session_manager))
hl.bind(mainMod .. " + SHIFT + SPACE", function()
  hl.dispatch(hl.dsp.window.float({ action = "toggle" }))
end)
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd(pw_manager))

hl.bind(mainMod .. " + F1", hl.dsp.exec_cmd("~/bin/perfmode"))

hl.bind(mainMod .. " + F", function()
  hl.dispatch(hl.dsp.window.fullscreen({ action = "toggle" }))
end)

-- Toggle waybar
hl.bind(mainMod .. " + b", hl.dsp.exec_cmd("pkill -SIGUSR1 waybar || waybar"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- master window manipulation commands
hl.bind(mainMod .. " + RETURN", hl.dsp.layout("swapwithmaster master"))
hl.bind(mainMod .. " + J", hl.dsp.layout("cyclenext"))
hl.bind(mainMod .. " + K", hl.dsp.layout("cycleprev"))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.layout("rollnext"))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.layout("rollprev"))
hl.bind(mainMod .. " + SHIFT + COMMA", hl.dsp.layout("addmaster"))
hl.bind(mainMod .. " + SHIFT + PERIOD", hl.dsp.layout("removemaster"))

-- Resize submap
hl.bind(mainMod .. " + R", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
  hl.bind("L", hl.dsp.layout("mfact +0.02"))
  hl.bind("H", hl.dsp.layout("mfact -0.02"))
  hl.bind("RETURN", hl.dsp.layout("mfact exact 0.6"))
  hl.bind("escape", hl.dsp.submap("reset"))
end)

-- wallpaper submap
hl.bind(mainMod .. " + W", hl.dsp.submap("wallpaper"))
hl.define_submap("wallpaper", function()
  hl.bind("J", hl.dsp.exec_cmd("wpaperctl next"))
  hl.bind("K", hl.dsp.exec_cmd("wpaperctl previous"))
  hl.bind("escape", hl.dsp.submap("reset"))
end)

for i = 0, 9 do
  local key = i % 10
  -- Switch workspaces with mainMod + [0-9]
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  -- Move active window to a workspace with mainMod + SHIFT + [0-9]
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
  "XF86AudioRaiseVolume",
  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86AudioLowerVolume",
  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86AudioMute",
  hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86AudioMicMute",
  hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
  { locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

---------------
--- Sources ---
---------------

require("animations")
require("rules")
require("theme")
require("permissions")
