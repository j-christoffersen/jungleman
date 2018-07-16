Entity = Class{}

function Entity:init(opts)
  opts = opts or {}

  self.width = opts.width or 0
  self.heihgt = opts.height or 0

  self.x = opts.x or 0
  self.y = opts.y or 0

  self.dx = 0
  self.dy = 0
end

function Entity:update(dt)
  self.x = self.x + self.dx * dt
  self.y = self.y + self.dy * dt
end

function Entity:render()

end
