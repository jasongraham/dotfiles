-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/

-- In increments of 100ms
local faster = 2
local fast = 4
local slow = 10

hl.config({ animations = { enabled = true } })

-- Curves
-- https://easings.net/#easeOutExpo
hl.curve("easeOut", { type = "bezier", points = { { 0.16, 1 }, { 0.3, 1 } } })
-- https://cubic-bezier.com/#.16,1.25,.45,1
hl.curve("easeOutBack", { type = "bezier", points = { { 0.16, 1.25 }, { 0.45, 1 } } })

-- Animations
-- General strategy:
-- 1. Enterences are fast, smaller movements ...
hl.animation({ leaf = "windows", enabled = true, speed = fast, bezier = "easeOut", style = "popin 50%" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = fast, bezier = "easeOutBack", style = "popin 50%" })
hl.animation({ leaf = "layers", enabled = true, speed = faster, bezier = "easeOut", style = "popin" })
hl.animation({ leaf = "workspaces", enabled = true, speed = fast, bezier = "easeOut", style = "slidefade 50%" })
hl.animation({
  leaf = "specialWorkspace",
  enabled = true,
  speed = fast,
  bezier = "easeOut",
  style = "slidefadevert 50%",
})
hl.animation({ leaf = "zoomFactor", enabled = true, speed = fast, bezier = "easeOut" })
hl.animation({ leaf = "monitorAdded", enabled = true, speed = fast, bezier = "easeOut" })
-- ... with slow fadin / settling animation
hl.animation({ leaf = "fade", enabled = true, speed = slow, bezier = "easeOut" })
hl.animation({ leaf = "border", enabled = true, speed = slow, bezier = "easeOut" })
hl.animation({ leaf = "borderangle", enabled = true, speed = slow, bezier = "easeOut" })

-- 2. Exits are slow, bigger movements ...
hl.animation({ leaf = "windowsOut", enabled = true, speed = slow, bezier = "easeOut", style = "popin" })
hl.animation({ leaf = "layersOut", enabled = true, speed = slow, bezier = "easeOut", style = "popin" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = slow, bezier = "easeOut", style = "slidefade" })
hl.animation({
  leaf = "specialWorkspaceOut",
  enabled = true,
  speed = slow,
  bezier = "easeOut",
  style = "slidefadevert",
})
-- ... with fast fadeout
hl.animation({ leaf = "fadeOut", enabled = true, speed = fast, bezier = "easeOut" })

-- 3. Exception: Layers and popups fade quickly both entering and exiting
hl.animation({ leaf = "fadeLayers", enabled = true, speed = faster, bezier = "easeOut" })
hl.animation({ leaf = "fadePopups", enabled = true, speed = faster, bezier = "easeOut" })
