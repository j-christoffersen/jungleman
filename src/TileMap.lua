TileMap = Class{}

function TileMap:init(tiles)
  self.tiles = tiles
end

function TileMap:tileAt(x, y)
  i = math.floor(x / 16) + 1
  j = math.floor(y / 16) + 1

  return self.tiles[i][j]
end

function TileMap:update(dt)

end

function TileMap:render()
  for i, column in ipairs(self.tiles) do
    for j, tile in pairs(column) do
      if (tile) then tile:render() end
    end
  end
end
