local win = AmuletTk.WindowModule.win
local isTouchEnv = AmuletTk.isTouchEnv
local libTouchClick = require("../../lib.TouchClick")

local keysGroup = am.group()
for i = 0, 11 do
    for j = 0, 3 do
        local x1 = 720 / 12 * i - 360
        local y1 = 1600 / 4 * j - 800
        local x2 = x1 + 720 / 12
        local y2 = y1 + 1600 / 4
        local color = vec4(1-i/12, i/12, j/5 + 0.2, 1)
        local rect = am.rect(x1, y1, x2, y2, color)
        local playing = false
        local actionCallback = function()
            playing = true
            local pitch = 2 ^ (i / 12 - 3 + j)
            rect.color = vec4(1 - color.rgb, 1)
            rect:action("sound", am.series{
                am.play(55581500, false, pitch),
                function()
                    rect.color = color
                    playing = false
                    return true
                end
            })
        end
        rect:action(function()
            local pos = libTouchClick.getReticlePos();
            if pos.x >= x1 and pos.x <= x2 and pos.y >= y1 and pos.y <= y2 then
                if isTouchEnv and window:touch_active() == true then
                    actionCallback();
                elseif not isTouchEnv and win:mouse_pressed"left" or not playing and win:mouse_down"left" then
                    actionCallback();
                end
            end
        end)
        keysGroup:append(rect)
    end
end

local KeyboardScene = am.group { keysGroup }

return KeyboardScene
