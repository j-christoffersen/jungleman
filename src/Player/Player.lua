local IdleState = require 'src/Player/IdleState'

Player = Class{__includes = Entity}

function Player:init()
  Entity.init(self, {
    x = 50,
    y = 50,
    width = 19,
    height = 36,
    states = {
      ['idle'] = IdleState,
    }
  })
  self:change('idle')

  self.direction = 'right'

  self.animation = Animation{
    frames = animations['player-idle'],
    fps = 12,
  }
end

function Player:update(dt)
  Entity.update(self, dt)

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

  Entity.render(self)
end
