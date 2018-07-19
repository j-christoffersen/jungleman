Animation = Class{}

function Animation:init(def)
  self.timer = 0;
  self.frames = def.frames
  self.loopStart = def.loopStart or 1
  self.frameCount = #def.frames
  self.fps = def.fps
end

function Animation:update(dt)
  self.timer = (self.timer + dt)
  if self.timer * self.fps > self.frameCount then
    print('kk')
    local loopStartTime = (self.loopStart - 1) / self.fps
    local loopLengthTime = (self.frameCount - self.loopStart) / self.fps
    self.timer = (self.timer - loopStartTime) % loopLengthTime + loopStartTime
  end
end

function Animation:getFrame()
  local currentFrame = math.floor(self.timer * self.fps) + 1
  return self.frames[currentFrame]
end
