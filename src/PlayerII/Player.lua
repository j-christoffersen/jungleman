local ClassII = require 'src/Class'
local Stateful = require 'src/Stateful'

-- boilerplate
local Player = ClassII({ name = 'Player', extends = Stateful })

print(Player)
print(className(Player.prototype))

-- function Player:new(obj)
--   setmetatable(obj, { __index = self.prototype })
--   return self.prototype.init(obj)
-- end
-- end boilerplate

Player.states = {
  empty = {
    exit = function() end
  }
}

function Player.prototype:init()  
  self.x = 50
  self.y = 50
  self.width = 23
  self.height = 35
  self.states = self.constructor.states
  self.state = 'empty'

  self:change('idle')
  Stateful.prototype.init(self)
end

return Player
