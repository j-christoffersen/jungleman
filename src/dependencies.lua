-- debug methods

className = function(obj)
  return getmetatable(getmetatable(obj).__index.constructor).name
end

objToString = function(obj)
  local str = '{'

  for k, v in pairs(obj) do
    str = str..'\n  '..k..' = '
    if type(v) == 'table' then
      str = str..'table'
    elseif type(v) == 'function' then
      str = str..'function'
    else
      str = str..v
    end
  end

  return str..'}'
end

-- end debug methods

Class = require 'lib/class'
push = require 'lib/push'
Utils = require 'src/Utils'

require 'src/resources'
require 'src/StateMachine'

-- states
require 'src/states/BaseState'
require 'src/states/MenuState'
require 'src/states/PlayState'

require 'src/Background'

require 'src/Animation'
require 'src/Entity'
require 'src/TileMap'
require 'src/Tile'
