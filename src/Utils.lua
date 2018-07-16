local Utils = {}

function Utils.generateQuads(image, tw, th)
  local sw, sh = image:getDimensions()
  local quads = {}

  for x = 0, sw - tw, tw do
    for y = 0, sh - th, th do
      quads[#quads + 1] = love.graphics.newQuad(x, y, tw, th, sw, sh)
    end
  end

  return quads
end

return Utils
