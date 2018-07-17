TileMap = Class{}

function TileMap:init(tiles)
  self.tiles = tiles
  print(self.tiles)
end

function TileMap:update(dt)

end

function TileMap:render()
  for i, column in ipairs(self.tiles) do
    for j, tile in pairs(column) do
      print('g')
      if (tile) then tile:render() end
    end
  end
end
