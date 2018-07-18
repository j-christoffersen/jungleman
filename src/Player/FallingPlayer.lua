local ClassII = require 'src/Class'
local Player = require 'src/Player/Player'

local FallingPlayer = ClassII{ name = 'FallingPlayer', extends = Player }

function FallingPlayer.prototype:enter()
  self.animation = Animation{
    frames = animations['player-midair'],
    fps = gFps,
  }
end

function FallingPlayer.prototype:update(dt)
  Player.prototype.update(self, dt)

  if love.keyboard.isDown('left') then
    self.direction = 'left'
  elseif love.keyboard.isDown('right') then
    self.direction = 'right'
  end

  local speed = 100

  if self.direction == 'left' then
    self.dx = -speed
  elseif self.direction == 'right' then
    self.dx = speed
  end

  self.dy = self.dy + 10

  if self.map:tileAt(self.x + self.width / 2, self.y + self.height) then
    self:change('idle')
    self.dy = 0
  end
end

function FallingPlayer.prototype:render()
  local orientationScale
  local orientationOffset

  if self.direction == 'right' then
    orientationScale = 1
    orientationOffset = 0
  else 
    orientationScale = -1
    orientationOffset = self.width
  end

  love.graphics.draw(textures['player-midair'],
    self.animation:getFrame(),
    math.floor(self.x + orientationOffset), math.floor(self.y),
    0,
    orientationScale, 1)
end

Player.states.falling = FallingPlayer
return FallingPlayer
