PlayState = {}
setmetatable(PlayState, {__index = BaseState})

function PlayState:enter()
  self.player = Player()
  -- self.tiles = Tiles()
end

function PlayState:update(dt)
  self.player:update(dt)
end

function PlayState:render()
  -- self.tiles:render()
  self.player:render()
end
