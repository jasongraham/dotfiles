-----------------------
--- Workspace Rules ---
-----------------------
--
-- See https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

hl.workspace_rule({
  workspace = "1",
  monitor = "DP-2",
  default = true,
})
hl.workspace_rule({
  workspace = "2",
  monitor = "DP-1",
})

--------------------
--- Window Rules ---
--------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/

hl.window_rule({
  name = "Ignore Maximize",
  suppress_event = "maximize",
  match = { class = ".*" },
})

hl.window_rule({
  name = "No drag in Xwayland",
  no_focus = true,
  match = {
    class = "^$",
    title = "^$",
    xwayland = true,
    float = true,
    fullscreen = false,
    pin = false,
  },
})

-- Have steam start in a tiled mode
hl.window_rule({
  name = "Tiled mode for Steam",
  tile = true,
  match = { class = "^(steam)" },
})

hl.window_rule({
  name = "No transparency in fullscreen",
  opaque = true,
  match = { fullscreen = true },
})

hl.window_rule({
  name = "No transparency for Firefox with Youtube",
  opaque = true,
  match = {
    class = "^(firefox)",
    title = "^(.*)(- YouTube)(.*)$",
  },
})

hl.window_rule({
  name = "No transparency with MPV",
  opaque = true,
  match = {
    class = "^(mpv)",
    title = "^(.*)(- mpv)(.*)$",
  },
})

hl.window_rule({
  name = "Hold focus on wofi",
  stay_focused = true,
  match = { class = "^(wofi)" },
})

hl.window_rule({
  name = "Float weather popup on top left of screen",
  float = true,
  move = "monitor_w*0.01 monitor_h*0.04",
  size = "monitor_w*0.6 monitor_h*0.7",
  stay_focused = true,
  match = { class = "^(wttr)" },
})

hl.window_rule({
  name = "Float wiremix popup on top left of screen",
  float = true,
  move = "monitor_w*0.39 monitor_h*0.04",
  size = "monitor_w*0.6 monitor_h*0.7",
  stay_focused = true,
  match = { class = "^(wiremix)" },
})

-------------------
--- Layer Rules ---
-------------------
-- https://wiki.hypr.land/Configuring/Basics/Window-Rules/#layer-rules

hl.layer_rule({
  name = "Wofi layer",
  blur = true,
  ignore_alpha = 0.1,
  dim_around = true,
  match = { namespace = "wofi" },
})

hl.layer_rule({
  name = "Waybar layer",
  blur = true,
  blur_popups = true,
  ignore_alpha = 0.1,
  animation = "slide",
  match = { namespace = "waybar" },
})
