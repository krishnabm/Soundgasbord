local win = AmuletTk.WindowModule.win
local isTouchEnv = AmuletTk.isTouchEnv

local lib = {}
lib.getReticlePos = function() 
    local pos = nil
    if isTouchEnv then 
        pos = win:touch_position()
    else 
        pos = win:mouse_position()
    end
    return pos
end

lib.isNewReticleFire = function() 
    if isTouchEnv then
        return win:touch_began()
    else
        return win:mouse_pressed("left")
    end
end

lib.isActiveReticleFire = function() 
    if isTouchEnv then
        return win:touch_active()
    else
        return win:mouse_down("left")
    end
end

return lib