local Class = function(opts)
  local class = {}
  class.prototype = { constructor = class }

  if opts and opts.extends then
    setmetatable(class.prototype, { __index = opts.extends.prototype })
  end

  local wrappedConstructorFunc = function(self, obj)
    obj = obj or {}
    setmetatable(obj, { __index = class.prototype })

    obj:init()

    return obj
  end

  setmetatable(class, { __call = wrappedConstructorFunc })

  if opts and opts.name then
    getmetatable(class).name = name
  end

  return class
end

return Class
