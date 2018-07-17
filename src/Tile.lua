Tile = Class{__inlcudes = Entity}

function Tile:init(def)
  self.x = def.x
  self.y = def.y
end

function Tile:update(dt)

end

function Tile:render()
  love.graphics.draw(
    textures['tileset'],
    sets['tileset'][40],
    self.x, self.y
  )
end
