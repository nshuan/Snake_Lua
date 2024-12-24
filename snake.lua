local vector2 = require("Math2D/vector2")

local snake = {}
snake.__index = snake

-- constructor
function snake:new(coordinate, size)
    local v = setmetatable({}, snake)
    v.coordinate = coordinate or vector2:new(0, 0)
    v.size = size or Vector2:new(10, 10)
    v.speed = 10
    return v
end

function snake:set_speed(speed)
    self.speed = speed
end

function snake:move(map, direction, dt)
    local new_pos = self.coordinate:add(direction:normalize():mul(self.speed * dt))
    if map:is_in_map(new_pos, self.size) then
        self.coordinate = new_pos
        return true
    end
    return false
end

function snake:draw()
    love.graphics.setColor(1, 1, 0)
    love.graphics.rectangle("fill", self.coordinate.x, self.coordinate.y, self.size.x, self.size.y)    
end

return snake
