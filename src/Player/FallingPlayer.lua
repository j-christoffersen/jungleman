local ClassII = require 'src/Class'
local Player = require 'src/Player/Player'

local FallingPlayer = ClassII{ name = 'FallingPlayer', extends = Player }

function sign(x)
  if x > 0 then return 1
  elseif x < 0 then return -1
  else return 0 end
end

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
  -- location updates

  Player.prototype.update(self, dt)

  -- speed updates

  if love.keyboard.isDown('left') then
    self.direction = 'left'
    self.dx = -self.SPEED
  elseif love.keyboard.isDown('right') then
    self.direction = 'right'
    self.dx = self.SPEED
  else
    local newDx = self.dx - self.DECEL * sign(self.dx)
    if sign(newDx) == sign(self.dx) then
      self.dx = newDx
    else
      self.dx = 0
    end
  end

  self.dy = self.dy + self.GRAVITY

  -- collisions

  local tileBeside = self:tileBeside()
  if tileBeside then
    self.dx = 0
    if tileBeside.x < self.x then
      self.x = tileBeside.x + TILE_SIZE
    else
      self.x = tileBeside.x - self.width
    end
  end

  local tileBelow = self:tileBelow()
  if tileBelow and self.dy >= 0 then
    if love.keyboard.isDown('left') or love.keyboard.isDown('right') then
      self:change('walking', { landing = true })
    else
      self:change('idle')
    end

    self.dy = 0

    self.y = tileBelow.y - self.height
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
