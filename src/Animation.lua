Animation = Class{}

function Animation:init(def)
  self.timer = 0;
  self.frames = def.frames
  self.frameCount = #def.frames
  self.fps = def.fps
end

function Animation:update(dt)
  self.timer = (self.timer + dt) % (self.frameCount / self.fps)
end

function Animation:getFrame()
  local currentFrame = math.floor(self.timer * self.fps) + 1
  return self.frames[currentFrame]
end
