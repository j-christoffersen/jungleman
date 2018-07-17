local IdleState = {}
setmetatable(IdleState, {__index = BaseState})

function IdleState:update(dt)
  self.animation:update(dt)
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
    self.x + orientationOffset, self.y, 0,
    orientationScale, 1)
end

return IdleState
