local ClassII = require 'src/Class'
local Player = require 'src/Player/Player'

local FallingPlayer = ClassII{ name = 'FallingPlayer', extends = Player }

function FallingPlayer.prototype:enter(params)
  self.animation = Animation{
    frames = animations['player-midair'],
    fps = gFps,
  }

  if params then
    self.jumping = params.jumping
  end
end

function FallingPlayer.prototype:update(dt)
  Player.prototype.update(self, dt)

  if love.keyboard.isDown('left') then
    self.direction = 'left'
  elseif love.keyboard.isDown('right') then
    self.direction = 'right'
  end

  if self.direction == 'left' then
    self.dx = -self.SPEED
  elseif self.direction == 'right' then
    self.dx = self.SPEED
  end

  self.dy = self.dy + self.GRAVITY

  if self.map:tileAt(self.x + self.width / 2, self.y + self.height) then
    if love.keyboard.isDown('left') or love.keyboard.isDown('right') then
      self:change('walking', { landing = true })
    else
      self:change('idle')
    end

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

  if self.jumping then
    love.graphics.draw(textures['player-jumping'],
      math.floor(self.x + orientationOffset), math.floor(self.y),
      0,
      orientationScale, 1)

    self.jumping = false
  else
    love.graphics.draw(textures['player-midair'],
      self.animation:getFrame(),
      math.floor(self.x + orientationOffset), math.floor(self.y),
      0,
      orientationScale, 1)
  end
end

Player.states.falling = FallingPlayer
return FallingPlayer
