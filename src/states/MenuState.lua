MenuState = Class{__includes = BaseState}

function MenuState:init()
  self.selected = 1
end

function MenuState:update(dt)
  if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
    stateMachine:change('play')
  end
end

function MenuState:render()
  love.graphics.printf('Start', 0, VIRTUAL_HEIGHT / 2, VIRTUAL_WIDTH, 'center')
end