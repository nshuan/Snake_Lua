local vector2 = {}
vector2.__index = vector2

-- constructor
function vector2:new(x, y)
    local v = setmetatable({}, vector2)
    v.x = x or 0
    v.y = y or 0
    return v
end

-- add another vector
function vector2:add(v)
    return vector2:new(self.x + v.x, self.y + v.y)
end

-- subtract by another vector
function vector2:subtract(v)
    return vector2:new(self.x - v.x, self.y - v.y)
end

-- scale a vector by scaler
function vector2:mul(k)
    return vector2:new(self.x * k, self.y * k)
end

-- calculate the magnitude
function vector2:magnitude()
    return math.sqrt( self.x * self.x + self.y * self.y )
end

-- normalize
function vector2:normalize()
    local mag = self:magnitude()
    if mag == 0 then
        return vector2:new(0, 0)
    end
    return self:mul(1 / mag)
end

-- to string
function vector2:__toString()
    return "(" .. self.x .. ", " .. self.y .. ")"
end

return vector2
