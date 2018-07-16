Player = Class{__inlcudes = Entity}

function Player:init(opts)
  Entity.init(self, opts)

  self.direction = 'right'

  self.animation = Animation{
    frames = animations['player-idle'],
    fps = 12,
  }
end

function Player:update(dt)
  Entity.update(self, dt)

  self.animation:update(dt)

  if love.keyboard.wasPressed('left') then
    self.direction = 'left'
  end

  if love.keyboard.wasPressed('right') then
    self.direction = 'right'
  end
end

function Player:render()
  local orientationScale
  local orientationOffset

  if self.direction == 'right' then
    orientationScale = 1
    orientationOffset = 0
  else 
    orientationScale = -1
    orientationOffset = self.width
  end

  love.graphics.draw(textures['player-idle'], self.animation:getFrame(), self.x + orientationOffset, self.y, 0, orientationScale, 1)
end
