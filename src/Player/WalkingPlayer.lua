local ClassII = require 'src/Class'
local Player = require 'src/Player/Player'

local WalkingPlayer = ClassII{ name = 'WalkingPlayer', extends = Player }

function WalkingPlayer.prototype:enter()
  self.animation = Animation{
    frames = animations['player-walking'],
    fps = gFps,
  }

  if params then
    self.landing = params.landing
  end
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

  if love.keyboard.isDown('up') then
    self:change('falling', { jump = true })
    self.dy = -self.JUMP_SPEED
  end

  if self.direction == 'left' then
    self.dx = -self.SPEED
  elseif self.direction == 'right' then
    self.dx = self.SPEED
  end

  if not self.map:tileAt(self.x + self.width / 2, self.y + self.height) then
    self:change('falling')
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
  if (self.landing) then
    love.graphics.draw(textures['player-landing'],
      math.floor(self.x + orientationOffset), math.floor(self.y),
      0,
      orientationScale, 1)

    self.landing = false
  else
    love.graphics.draw(textures['player-walking'],
      self.animation:getFrame(),
      math.floor(self.x + orientationOffset), math.floor(self.y),
      0,
      orientationScale, 1)
  end
end

Player.states.walking = WalkingPlayer
return WalkingPlayer
