local win = AmuletTk.WindowModule.win
local isTouchEnv = AmuletTk.isTouchEnv

local lib = {}
lib.fireInHitBox = function(eventPos, p1, p2) 
    return eventPos.x >= p1.x 
    and eventPos.x <= p2.x 
    and eventPos.y >= p1.y 
    and eventPos.y <= p2.y
end

return lib