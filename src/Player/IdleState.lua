local IdleState = {}
setmetatable(IdleState, {__index = BaseState})

function IdleState:enter()
  self.animation = Animation{
    frames = animations['player-idle'],
    fps = gFps,
  }
end

function IdleState:update(dt)
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

function IdleState:render()
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

return IdleState
