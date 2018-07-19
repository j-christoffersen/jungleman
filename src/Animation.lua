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
end

function Animation:getFrame()
  local currentFrame = math.floor(self.timer * self.fps + 1)

  if currentFrame > self.frameCount then
    local loopLength = self.frameCount + 1 - self.loopStart
    currentFrame = (currentFrame - self.loopStart) % loopLength + self.loopStart
  end

  return self.frames[currentFrame]
end
