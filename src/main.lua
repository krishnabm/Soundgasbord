-- Load AmuletTk in _G
require("window.WindowModule")
local libTouchClick = require("lib.TouchClick")
local libIOHelpers = require("lib.IOHelpers")

local win = AmuletTk.WindowModule.win;

-- Scenes
local WelcomeScene = require("scenes.Welcome-scene.WelcomeScene")
local KeyboardScene = require("scenes.Keyboard-scene.KeyboardScene")

win.scene:append(WelcomeScene:tag "_welcomeScene")

--#region Actions
WelcomeScene:action("WelcomeScene:StartAction", function(scene)
    
    local pos = libTouchClick.getReticlePos();
    local activeClick = libTouchClick.isActiveReticleFire();
    local newClick = libTouchClick.isNewReticleFire();
    
    local x1 = -250
    local y1 = -630
    local x2 = 250;
    local y2 = -570;

    if (newClick or activeClick) and libIOHelpers.fireInHitBox(pos,vec2(x1,y1), vec2(x2,y2))  then
        win.scene:replace("_welcomeScene",KeyboardScene:tag "_keyboardScene")
        return
    end
end)
--#endregion
