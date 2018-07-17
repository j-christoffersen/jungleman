local IdleState = require 'src/Player/IdleState'
local WalkingState = require 'src/Player/WalkingState'

Player = Class{__includes = Entity}

function Player:init()
  Entity.init(self, {
    x = 50,
    y = 50,
    width = 23,
    height = 35,
    states = {
      ['idle'] = IdleState,
      ['walking'] = WalkingState,
    }
  })
  self:change('idle')

  self.direction = 'right'
end

function Player:update(dt)
  Entity.update(self, dt)
end

function Player:render()
  Entity.render(self)
end
