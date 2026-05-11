hl.permission("/usr/bin/grim", "screencopy", "allow")
hl.permission("/usr/bin/hyprlock", "screencopy", "allow")

-- Shouldn't have anything asking for these
hl.permission("/usr/lib/xdg-desktop-portal-hyprland", "screencopy", "ask")
hl.permission(".*", "plugin", "deny")
