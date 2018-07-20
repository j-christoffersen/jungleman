local ClassII = require 'src/Class'
local Player = require 'src/Player/Player'

local LedgeGrabPlayer = ClassII{ name = 'LedgeGrabPlayer', extends = Player }

function LedgeGrabPlayer.prototype:enter()
  self.animation = Animation{
    frames = animations['player-ledge-grab'],
    fps = gFps,
    loopStart = 4,
  }

  self.jumpCooldownTimer = 0
end

function LedgeGrabPlayer.prototype:update(dt)
  Player.prototype.update(self, dt)

  self.animation:update(dt)

  self.jumpCooldownTimer = self.jumpCooldownTimer + dt

  if love.keyboard.isDown('left') and self.direction == 'right' then
    self.direction = 'left'
    self:change('falling')
  elseif love.keyboard.isDown('right') and self.direction == 'left' then
    self.direction = 'right'
    self:change('falling')
  elseif love.keyboard.isDown('down')then
    self:change('falling')
  end

  if love.keyboard.isDown('up')  and self.jumpCooldownTimer >= self.JUMP_COOLDOWN_TIME then
    self:change('falling', { jump = true })
    self.dy = -self.JUMP_SPEED
  end
end

function LedgeGrabPlayer.prototype:render()
  local orientationScale
  local orientationOffset

  if self.direction == 'right' then
    orientationScale = 1
    orientationOffset = 0
  else 
    orientationScale = -1
    orientationOffset = self.width
  end

  love.graphics.draw(textures['player-ledge-grab'],
    self.animation:getFrame(),
    math.floor(self.x + orientationOffset), math.floor(self.y),
    0,
    orientationScale, 1)
end

Player.states['ledge-grab'] = LedgeGrabPlayer
return LedgeGrabPlayer
