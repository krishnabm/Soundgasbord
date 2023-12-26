local win = AmuletTk.WindowModule.win
local isTouchEnv = AmuletTk.isTouchEnv
local libTouchClick = require("lib.TouchClick")
local libIOHelpers = require("lib.IOHelpers")

local keysGroup = am.group()
for i = 0, 11 do
    for j = 0, 3 do
        local x1 = 720 / 12 * i - 360
        local y1 = 1600 / 4 * j - 800
        local x2 = x1 + 720 / 12
        local y2 = y1 + 1600 / 4
        local color = vec4(1-i/12, i/12, j/5 + 0.2, 1)
        local rect = am.rect(x1, y1, x2, y2, color)
        local playing = false;
        local startedSoundFrame = 0
        local stoppedSoundFrame = 0
        local actionCallback = function()
            playing = true
            startedSoundFrame = am.frame_time
            local pitch = 2 ^ (i / 12 - 3 + j)
            rect.color = vec4(1 - color.rgb, 1)
            print()
            rect:action("sound", am.series{
                am.play(AmuletTk.store.noteCode, AmuletTk.store.enableLoop, pitch),
                function()
                    rect.color = color
                    playing = false
                    return true
                end
            })
        end
        rect:action(function()
            local pos = libTouchClick.getReticlePos();
            if libIOHelpers.fireInHitBox(pos, vec2(x1,y1), vec2(x2,y2)) then

                if am.frame_time - stoppedSoundFrame <= 0.5 then
                    return
                end

                if am.frame_time - startedSoundFrame >= 0.5 and playing and AmuletTk.store.enableLoop and (libTouchClick.isActiveReticleFire() or libTouchClick.isNewReticleFire()) then
                    rect:cancel("sound")
                    rect.color = color
                    playing = false
                    stoppedSoundFrame = am.frame_time
                    return
                end            

                if AmuletTk.store.enableGlissando then
                    if not playing and libTouchClick.isActiveReticleFire() then
                        actionCallback()
                    end
                else 
                    if libTouchClick.isNewReticleFire() then
                        actionCallback()
                    end
                end

                
            end
        end)
        keysGroup:append(rect)
    end
end

local KeyboardScene = am.group { keysGroup }

return KeyboardScene
