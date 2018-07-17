Entity = Class{__includes = StateMachine}

function Entity:init(def)
  StateMachine.init(self, def.states)

  def = def or {}

  self.width = def.width or 0
  self.heihgt = def.height or 0

  self.x = def.x or 0
  self.y = def.y or 0

  self.dx = 0
  self.dy = 0
end

function Entity:update(dt)
  StateMachine.update(self, dt)

  self.x = self.x + self.dx * dt
  self.y = self.y + self.dy * dt
end

function Entity:render()
  StateMachine.render(self)
end
