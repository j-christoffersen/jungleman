require 'src/dependencies'

-- physical screen dimensions
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

-- virtual resolution dimensions
VIRTUAL_WIDTH = 384
VIRTUAL_HEIGHT = 216

gFps = 12

function love.keypressed(key)
  love.keyboard.keysPressed[key] = true
end

function love.keyboard.wasPressed(key)
  if love.keyboard.keysPressed[key] then
      return true
  else
      return false
  end
end

function love.load()
  love.window.setTitle('Jungleman')

  love.graphics.setDefaultFilter('nearest', 'nearest')

  push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
    vsync = true,
    fullscreen = false,
    resizable = true,
  })

  love.keyboard.keysPressed = {}

  background = Background()

  stateMachine = StateMachine {
    ['menu'] = MenuState,
    ['play'] = PlayState,
  }
  stateMachine:change('menu')
end

function love.update(dt)
  background:update(dt)
  stateMachine:update(dt)

  love.keyboard.keysPressed = {}
end

function love.draw()
  push:start()

  background:render()
  
  stateMachine:render()

  push:finish()
end
