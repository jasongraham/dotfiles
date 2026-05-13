---------------------
--- LOOK AND FEEL ---
---------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/

-- https://wiki.hypr.land/Configuring/Basics/Variables/#general
hl.config({
  general = {
    gaps_in = 2,
    gaps_out = 5,

    border_size = 2,

    -- https://wiki.hypr.land/Configuring/Basics/Variables/#variable-types
    col = {
      active_border = { colors = { "rgba(7daea3dd)", "rgba(89b482dd)", angle = 45 } },
      inactive_border = "rgba(928374aa)",
    },

    layout = "master",
  },

  -- https://wiki.hypr.land/Configuring/Basics/Variables/#decoration
  decoration = {
    rounding = 5,

    -- Change transparency of focused and unfocused windows
    active_opacity = 0.95,
    inactive_opacity = 0.9,

    -- https://wiki.hypr.land/Configuring/Basics/Variables/#blur
    blur = {
      passes = 3,
      noise = 0.1,
      special = true,
    },

    shadow = {
      color = "rgba(1d2021ee)",
    },
  },
})

hl.exec_cmd("gsettings set org.gnome.desktop.interface font-name 'Fira Code Nerd Font 11'")
hl.exec_cmd("gsettings set org.gnome.desktop.interface document-font-name 'Fira Code Nerd Font 11'")
hl.exec_cmd("gsettings set org.gnome.desktop.interface monospace-font-name 'Fira Code Nerd Font Mono 11'")
hl.exec_cmd("gsettings set org.gnome.desktop.interface font-antialiasing 'rgba'")
hl.exec_cmd("gsettings set org.gnome.desktop.interface font-hinting 'full'")
