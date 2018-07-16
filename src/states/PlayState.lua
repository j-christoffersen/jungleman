PlayState = Class{__includes = BaseState}

function PlayState:init()
  self.player = Player({x = 50, y = 50, width = 19, height = 36})
  -- self.tiles = Tiles()
end

function PlayState:update(dt)
  self.player:update(dt)
end

function PlayState:render()
  -- self.tiles:render()
  self.player:render()
end
