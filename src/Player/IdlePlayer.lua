local ClassII = require 'src/Class'
local Player = require 'src/Player/Player'

local IdlePlayer = ClassII{ name = 'IdlePlayer', extends = Player }

function IdlePlayer.prototype:enter()
  self.animation = Animation{
    frames = animations['player-idle'],
    fps = gFps,
  }
end

function IdlePlayer.prototype:update(dt)
  Player.prototype.update(self, dt)

  self.animation:update(dt)

  self.dx = 0

  if love.keyboard.isDown('left') then
    self.direction = 'left'
    self:change('walking')
  end

  if love.keyboard.isDown('right') then
    self.direction = 'right'
    self:change('walking')
  end
end

function IdlePlayer.prototype:render()
  -- Player.prototype.render(self)

  local orientationScale
  local orientationOffset

  if self.direction == 'right' then
    orientationScale = 1
    orientationOffset = 0
  else 
    orientationScale = -1
    orientationOffset = self.width
  end

  love.graphics.draw(textures['player-idle'],
    self.animation:getFrame(),
    math.floor(self.x + orientationOffset), math.floor(self.y),
    0,
    orientationScale, 1)
end

Player.states.idle = IdlePlayer
return IdlePlayer
