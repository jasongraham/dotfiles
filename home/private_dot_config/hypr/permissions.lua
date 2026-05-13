-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/#permissions

hl.permission({ binary = "/usr/bin/grim", type = "screencopy", mode = "allow" })
hl.permission({ binary = "/usr/bin/hyprlock", type = "screencopy", mode = "allow" })
hl.permission({ binary = ".*", type = "screencopy", mode = "deny" })

-- Shouldn't have anything asking for these
hl.permission({ binary = "/usr/lib/xdg-desktop-portal-hyprland", type = "screencopy", mode = "ask" })
hl.permission({ binary = ".*", type = "plugin", mode = "deny" })
