Background = Class{}

function Background:init()
  self.x = 0
  self.vx = 15
end

function Background:update(dt)
  self.x = self.x + self.vx * dt
  self.x = self.x % VIRTUAL_WIDTH
end

function Background:render()
  love.graphics.draw(textures['background1'], 0, 0)
  love.graphics.draw(textures['background2'], math.floor(self.x), 0)
  love.graphics.draw(textures['background2'], math.floor(self.x - VIRTUAL_WIDTH), 0)
  love.graphics.draw(textures['background3'], math.floor((self.x * 2) % VIRTUAL_WIDTH), 0)
  love.graphics.draw(textures['background3'], math.floor((self.x * 2) % VIRTUAL_WIDTH - VIRTUAL_WIDTH), 0)
  love.graphics.draw(textures['background4'], math.floor((self.x * 3) % VIRTUAL_WIDTH), 0)
  love.graphics.draw(textures['background4'], math.floor((self.x * 3) % VIRTUAL_WIDTH - VIRTUAL_WIDTH), 0)
  love.graphics.draw(textures['background5'], math.floor((self.x * 4) % VIRTUAL_WIDTH), 0)
  love.graphics.draw(textures['background5'], math.floor((self.x * 4) % VIRTUAL_WIDTH - VIRTUAL_WIDTH), 0)
end
