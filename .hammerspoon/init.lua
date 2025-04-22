local hyper = {"cmd", "alt", "ctrl", "shift"}

hs.hotkey.bind(hyper, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind(hyper, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind(hyper, "h", function() hs.execute("open ~/") end)

local hostname = hs.host.localizedName()
hs.alert.show(hostname)

if hostname == "tech-1" then
  layout = {
    {"taipo", nil, "EB321HQU (1)", {0, 0, 0.5, 1}, nil, nil},
    {"Gmail", nil, "EB321HQU (1)", {0.5, 0, 0.5, 0.5}, nil, nil},
    {"Google Calendar", nil, "EB321HQU (1)", {0.5, 0.5, 0.5, 0.5}, nil, nil},
    {"Google Chrome", nil, "EB321HQU (2)", {0, 0, 0.5, 1}, nil, nil},
    {"Ghostty", nil, "EB321HQU (2)", {0.5, 0, 0.5, 1}, nil, nil},
  }
elseif hostname == "owen-mini" then
elseif hostname == "owen-air" then
end

for _,v in pairs (layout) do
  local app = v[1]
  hs.application.launchOrFocus(app)
end
hs.timer.doAfter(0.5, function()
  hs.layout.apply(layout)
end)
