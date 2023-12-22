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

return lib