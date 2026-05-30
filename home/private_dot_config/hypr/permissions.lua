-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/#permissions

hl.config({ ecosystem = { enforce_permissions = true } })

hl.permission({ binary = "/usr/bin/grim", type = "screencopy", mode = "allow" })
hl.permission({ binary = "/usr/bin/hyprlock", type = "screencopy", mode = "allow" })
hl.permission({ binary = "/usr/lib/xdg-desktop-portal-hyprland", type = "screencopy", mode = "ask" })

-- Shouldn't have anything else asking for permissions
hl.permission({ binary = ".*", type = "screencopy", mode = "deny" })
hl.permission({ binary = ".*", type = "plugin", mode = "deny" })
