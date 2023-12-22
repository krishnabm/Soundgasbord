local WinModule = require("window.WindowModule")
local HelloWorldScene = require("scenes.HelloWorld-scene.HelloWorldScene")

local window = WinModule.win

window.scene:append(HelloWorldScene)
