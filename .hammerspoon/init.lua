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
hs.hotkey.bind(hyper, "r", function() hs.reload()end)
hs.hotkey.bind(hyper, "s", function() hs.speech.new()end)

local hostname = hs.host.localizedName()
hs.alert.show(hostname)

if hostname == "tech-1" then
  layout = {
    {"taipo", nil, "EB321HQU (1)", {0, 0, 0.4, 1}, nil, nil},
    {"Gmail", nil, "EB321HQU (1)", {0.4, 0, 0.6, 0.5}, nil, nil},
    {"Google Calendar", nil, "EB321HQU (1)", {0.4, 0.5, 0.6, 0.5}, nil, nil},
    {"Google Chrome", nil, "EB321HQU (2)", {0, 0, 0.6, 0.5}, nil, nil},
    {"Gemini", nil, "EB321HQU (2)", {0, 0.5, 0.6, 0.5}, nil, nil},
    {"Ghostty", nil, "EB321HQU (2)", {0.6, 0, 0.4, 1}, nil, nil},
  }
elseif hostname == "owen" then
  local screen = hs.screen.mainScreen()
  hs.alert.show(screen)
  layout = {
    {"taipo", nil, screen, {0.5, 0, 0.5, 0.5}, nil, nil},
    {"Outlook (PWA)", nil, screen , {0.5, 0, 0.5, 0.5}, nil, nil},
    {"Google Chrome", nil, screen, {0, 0, 0.5, 1}, nil, nil},
    {"Ghostty", nil, screen, {0.5, 0, 0.5, 1}, nil, nil},
  }

elseif hostname == "owen-air" or hostname == "tech-owen-air" then
  local screen = hs.screen.mainScreen()
  hs.alert.show(screen)
  layout = {
    {"taipo", nil, screen, {0.5, 0, 0.5, 0.5}, nil, nil},
    {"Outlook (PWA)", nil, screen , {0.5, 0, 0.5, 0.5}, nil, nil},
    {"Google Chrome", nil, screen, {0, 0, 0.5, 1}, nil, nil},
    {"Ghostty", nil, screen, {0.5, 0, 0.5, 1}, nil, nil},
  }
end

for _,v in pairs (layout) do
  local app = v[1]
  hs.application.launchOrFocus(app)
end
hs.timer.doAfter(1, function()
  hs.layout.apply(layout)
end)
