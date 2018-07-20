local ClassII = require 'src/Class'
local Stateful = require 'src/Stateful'

-- boilerplate
local Player = ClassII({ name = 'Player', extends = Stateful })

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
  self.SPEED = 128
  self.JUMP_SPEED = 384
  self.GRAVITY = 16
  self.DECEL = 8 -- deceleration when midair
  self.JUMP_COOLDOWN_TIME = 4 / gFps -- cooldown for ledge grabbing

  self.width = 23
  self.height = 33

  self.x = 50
  self.y = 50
  self.states = self.constructor.states
  self.state = 'empty'
  
  self.dx = 0
  self.dy = 0

  self:change('idle')
  Stateful.prototype.init(self)
end

function Player.prototype:update(dt)
  self.x = self.x + self.dx * dt
  self.y = self.y + self.dy * dt
end

function Player.prototype:tileBeside()
  return
    (self.direction == 'left' and
    (self.map:tileAt(self.x, self.y) or
    self.map:tileAt(self.x, self.y + TILE_SIZE))) or

    (self.direction == 'right' and
    (self.map:tileAt(self.x + self.width - 1, self.y) or
    self.map:tileAt(self.x + self.width - 1, self.y + TILE_SIZE)))
end

function Player.prototype:tileBesideHigh()
  return
    (self.direction == 'left' and
    self.map:tileAt(self.x, self.y)) or

    (self.direction == 'right' and
    self.map:tileAt(self.x + self.width - 1, self.y))
end

function Player.prototype:tileBelow()
  local tileBelowLeft = self.map:tileAt(self.x, self.y + self.height)
  return tileBelowLeft or self.map:tileAt(self.x + self.width - 1, self.y + self.height)
end

return Player
