require 'src/dependencies'

-- physical screen dimensions
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

-- virtual resolution dimensions
VIRTUAL_WIDTH = 384
VIRTUAL_HEIGHT = 216

function love.load()
  love.window.setTitle('Jungleman')

  push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
    vsync = true,
    fullscreen = false,
    resizable = true,
  })

  backgroundX = 0
  backgroundVX = 5
end

function love.update(dt)
  backgroundX = backgroundX + backgroundVX * dt
  backgroundX = backgroundX % VIRTUAL_WIDTH
end

function love.draw()
  push:start()

  -- backgound
  love.graphics.draw(textures['background1'], 0, 0)
  love.graphics.draw(textures['background2'], backgroundX, 0)
  love.graphics.draw(textures['background2'], backgroundX - VIRTUAL_WIDTH, 0)
  love.graphics.draw(textures['background3'], (backgroundX * 2) % VIRTUAL_WIDTH, 0)
  love.graphics.draw(textures['background3'], (backgroundX * 2) % VIRTUAL_WIDTH - VIRTUAL_WIDTH, 0)
  love.graphics.draw(textures['background4'], (backgroundX * 3) % VIRTUAL_WIDTH, 0)
  love.graphics.draw(textures['background4'], (backgroundX * 3) % VIRTUAL_WIDTH - VIRTUAL_WIDTH, 0)
  love.graphics.draw(textures['background5'], (backgroundX * 4) % VIRTUAL_WIDTH, 0)
  love.graphics.draw(textures['background5'], (backgroundX * 4) % VIRTUAL_WIDTH - VIRTUAL_WIDTH, 0)


  push:finish()
end
