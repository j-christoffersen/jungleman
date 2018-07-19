textures = {
  ['background1'] = love.graphics.newImage('Jungle Asset Pack/parallax background/plx-1.png'),
  ['background2'] = love.graphics.newImage('Jungle Asset Pack/parallax background/plx-2.png'),
  ['background3'] = love.graphics.newImage('Jungle Asset Pack/parallax background/plx-3.png'),
  ['background4'] = love.graphics.newImage('Jungle Asset Pack/parallax background/plx-4.png'),
  ['background5'] = love.graphics.newImage('Jungle Asset Pack/parallax background/plx-5.png'),

  ['player-idle'] = love.graphics.newImage('Jungle Asset Pack/ Character with outline/sprites/idle_outline_sheet.png'),
  ['player-walking'] = love.graphics.newImage('Jungle Asset Pack/ Character with outline/sprites/running_outline_sheet.png'),
  ['player-jumping'] = love.graphics.newImage('Jungle Asset Pack/ Character with outline/sprites/jump outline.png'),
  ['player-midair'] = love.graphics.newImage('Jungle Asset Pack/ Character with outline/sprites/mid air outline.png'),
  ['player-landing'] = love.graphics.newImage('Jungle Asset Pack/ Character with outline/sprites/landing outline.png'),
  ['player-ledge-grab'] = love.graphics.newImage('Jungle Asset Pack/ Character with outline/sprites/ledge grab outline.png'),

  ['tileset'] = love.graphics.newImage('Jungle Asset Pack/jungle tileset/jungle tileset.png')
}

animations = {
  ['player-idle'] = Utils.generateQuads(textures['player-idle'], 21, 35),
  ['player-walking'] = Utils.generateQuads(textures['player-walking'], 23, 34),
  ['player-midair'] = Utils.generateQuads(textures['player-midair'], 22, 37),
  ['player-ledge-grab'] = Utils.generateQuads(textures['player-ledge-grab'], 22, 42),
}

sets = {
  ['tileset'] = Utils.generateQuads(textures['tileset'], 16, 16),
}
