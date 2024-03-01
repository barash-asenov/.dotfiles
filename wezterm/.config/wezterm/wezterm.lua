-- Pull in the wezterm API
local wezterm = require 'wezterm'

local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Catppuccin Mocha'

config.font_size = 15

-- Basic configurations
config.keys = {
  {
    key = 'LeftArrow',
    mods = 'SHIFT',
    action = act.ActivateTabRelative(-1),
  },
  {
    key = 'RightArrow',
    mods = 'SHIFT',
    action = act.ActivateTabRelative(1),
  },
  {
    key = 'LeftArrow',
    mods = 'CTRL|ALT',
    action = act.MoveTabRelative(-1),
  },
  {
    key = 'RightArrow',
    mods = 'CTRL|ALT',
    action = act.MoveTabRelative(1),
  },
  {
    key = 'F11',
    action = wezterm.action.ToggleFullScreen,
  }
}

-- Key combinations
for i = 1, 9 do
  -- CTRL+ALT + number to activate that tab
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'ALT',
    action = act.ActivateTab(i - 1),
  })
end

-- and finally, return the configuration to wezterm
return config
