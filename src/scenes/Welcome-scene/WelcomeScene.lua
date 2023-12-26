local win = AmuletTk.WindowModule.win
local isTouchEnv = AmuletTk.isTouchEnv
local libTouchClick = require("lib.TouchClick")
local libIOHelpers = require("lib.IOHelpers")
local store = AmuletTk.store

local titleNode = am.translate(0, 300)
    ^ am.scale(5)
    ^ am.rotate(0):action(function(node)
      node.angle = math.sin(math.rad(am.frame_time * 512)) * 0.02
    end)
    ^ am.text("Soundgasbord!", vec4(0.6,0.2,0.8,1))

local startText = nil
if not isTouchEnv then
  startText = "Click to begin!"
else
  startText = "Tap to begin!"
end

local loopCheckMark = am.rect(-5, -5, 5, 5):tag"_loopCheckMark";
loopCheckMark.hidden = true;
local loopSettingNode = am.translate(-100, -100)
    ^ {
        am.translate(150,0)
        ^ am.scale(3)
        ^ am.text('Loop notes'),
        am.translate(-50,5)
        ^ am.scale(2)
        ^ {
            am.rect(-10, -10, 10, 10),
            am.rect(-9, -9, 9, 9, AmuletTk.WindowModule.win.clear_color),
            loopCheckMark:action("loopCheckbox:ToggleLoopAction", function(scene)
                local pos = libTouchClick.getReticlePos();
                local newClick = libTouchClick.isNewReticleFire();
                
                local x1 = -170
                local y1 = -110
                local x2 = -130
                local y2 = -75

                if newClick and libIOHelpers.fireInHitBox(pos,vec2(x1,y1), vec2(x2,y2))  then
                    store.enableLoop = not store.enableLoop;
                    scene.hidden = not scene.hidden;
                    return
                end
            end)
        }
    }
local glissandoCheckMark = am.rect(-5, -5, 5, 5):tag"_glissandoCheckMark";
glissandoCheckMark.hidden = true;

local swipeSettingNode = am.translate(-100, -200)
    ^ {
        am.translate(150,0)
        ^ am.scale(3)
        ^ am.text('Glissando'),
        am.translate(-50,5)
        ^ am.scale(2)
        ^ {
            am.rect(-10, -10, 10, 10),
            am.rect(-9, -9, 9, 9, AmuletTk.WindowModule.win.clear_color),
            glissandoCheckMark:action("glissandoCheckbox:ToggleGlissandoAction", function(scene)
                local pos = libTouchClick.getReticlePos();
                local newClick = libTouchClick.isNewReticleFire();
                
                local x1 = -170
                local y1 = -215
                local x2 = -130
                local y2 = -175

                if newClick and libIOHelpers.fireInHitBox(pos,vec2(x1,y1), vec2(x2,y2))  then
                    store.enableGlissando = not store.enableGlissando;
                    scene.hidden = not scene.hidden;
                    return
                end
            end)
        }
    }

local goButton = am.translate(0, -600)
    ^ {
        am.rect(-252,-35,250,30,vec4(0.9,0.8,1,1)),
        am.rect(-250,-30,250,30,vec4(0.5,0.1,0.7,1)),
        am.scale(3)
        ^ am.text(startText)
    }

local MainMenuScene = am.group { titleNode, loopSettingNode, swipeSettingNode, goButton }

return MainMenuScene
