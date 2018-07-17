textures = {
  ['background1'] = love.graphics.newImage('Jungle Asset Pack/parallax background/plx-1.png'),
  ['background2'] = love.graphics.newImage('Jungle Asset Pack/parallax background/plx-2.png'),
  ['background3'] = love.graphics.newImage('Jungle Asset Pack/parallax background/plx-3.png'),
  ['background4'] = love.graphics.newImage('Jungle Asset Pack/parallax background/plx-4.png'),
  ['background5'] = love.graphics.newImage('Jungle Asset Pack/parallax background/plx-5.png'),

  ['player'] = love.graphics.newImage('Jungle Asset Pack/ Character with outline/sprites/jump outline.png'),
  ['player-idle'] = love.graphics.newImage('Jungle Asset Pack/ Character with outline/sprites/idle_outline_sheet.png'),
  ['player-walking'] = love.graphics.newImage('Jungle Asset Pack/ Character with outline/sprites/running_outline_sheet.png'),

  ['tileset'] = love.graphics.newImage('Jungle Asset Pack/jungle tileset/jungle tileset.png')
}

animations = {
  ['player-idle'] = Utils.generateQuads(textures['player-idle'], 21, 35),
  ['player-walking'] = Utils.generateQuads(textures['player-walking'], 23, 34),
}

sets = {
  ['tileset'] = Utils.generateQuads(textures['tileset'], 16, 16),
}
