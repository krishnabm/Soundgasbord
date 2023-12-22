-- Load AmuletTk in _G
require("window.WindowModule")

local win = AmuletTk.WindowModule.win;
local KeyboardScene = require("scenes.Keyboard-scene.KeyboardScene")

win.scene:append(KeyboardScene)
