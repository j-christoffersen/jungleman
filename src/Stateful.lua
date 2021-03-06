local ClassII = require 'src/Class'

local Stateful = ClassII({ name = 'Stateful' })

function Stateful.prototype:init()

end

function Stateful.prototype:change(state, enterParams)
  assert(self.states[state])
  
  self:exit()
  getmetatable(self).__index = self.states[state].prototype
  self:enter(enterParams)
end

function Stateful.prototype:enter() end
function Stateful.prototype:exit() end

function Stateful.prototype:willUpdate(dt)

end

function Stateful.prototype:update(dt)

end

function Stateful.prototype:render() end

return Stateful
