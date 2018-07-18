local Player = require 'src/PlayerII/default'

PlayState = {}
setmetatable(PlayState, {__index = BaseState})

local function generateMap()
  local map = {}

  for i = 1, VIRTUAL_WIDTH / 16 do
    map[i] = {}

    for j = 1, VIRTUAL_HEIGHT / 16 do
      if (j == 13) then
        map[i][j] = Tile{x = 16 * (i - 1), y = 16 * (j - 1)}
      else
        map[i][j] = nil
      end
    end
  end

  return map
end

function PlayState:enter()
  self.player = Player()
  self.tileMap = TileMap(generateMap())
end

function PlayState:update(dt)
  self.player:update(dt)
end

function PlayState:render()
  self.tileMap:render()
  self.player:render()
end
