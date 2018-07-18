local ClassII = require 'src/Class'
local Player = require 'src/Player/Player'

local WalkingPlayer = ClassII{ name = 'WalkingPlayer', extends = Player }

function WalkingPlayer.prototype:enter()
  self.animation = Animation{
    frames = animations['player-walking'],
    fps = gFps,
  }
end

function WalkingPlayer.prototype:update(dt)
  Player.prototype.update(self, dt)

  self.animation:update(dt)

  if love.keyboard.isDown('left') then
    self.direction = 'left'
  elseif love.keyboard.isDown('right') then
    self.direction = 'right'
  else
    self:change('idle')
  end

  local speed = 100

  if self.direction == 'left' then
    self.dx = -speed
  elseif self.direction == 'right' then
    self.dx = speed
  end
end

function WalkingPlayer.prototype:render()
  local orientationScale
  local orientationOffset

  if self.direction == 'right' then
    orientationScale = 1
    orientationOffset = 0
  else 
    orientationScale = -1
    orientationOffset = self.width
  end

  love.graphics.draw(textures['player-walking'],
    self.animation:getFrame(),
    math.floor(self.x + orientationOffset), math.floor(self.y),
    0,
    orientationScale, 1)
end

Player.states.walking = WalkingPlayer
return WalkingPlayer
