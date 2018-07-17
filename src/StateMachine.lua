StateMachine = Class{}

function StateMachine:init(states)
	self.empty = {
		render = function() end,
		update = function() end,
		enter = function() end,
		exit = function() end
	}
	self.states = states or {} -- [name] -> [function that returns states]
	self.current = self.empty
end

function StateMachine:change(stateName, enterParams)
	assert(self.states[stateName]) -- state must exist!
	self.current.exit(self)
	self.current = self.states[stateName]
	self.current.enter(self, enterParams)
end

function StateMachine:update(dt)
	self.current.update(self, dt)
end

function StateMachine:render()
	self.current.render(self)
end
