-- Node with inline actions
local rootNode = am.translate(0, 100)
    ^ am.scale(4)
    ^ am.rotate(0):action(function(node)
      node.angle = math.sin(math.rad(am.frame_time * 512)) * 0.02
    end)
    ^ am.text("Hello World!")

local HelloWorldScene = am.group { rootNode }

return HelloWorldScene
