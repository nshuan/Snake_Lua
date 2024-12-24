require("Math2D/vector2")

local snake_node = {}
snake_node.__index = snake_node

function snake_node:new(coordinate, size, head, tail)
    local v = setmetatable({}, snake_node)
    v.coordinate = coordinate
    v.size = size
    v.head = head
    v.tail = tail
    v.is_root = false
    return v
end

function snake_node:set_root()
    self.is_root = true
end

function snake_node:move(tail_distance)
    if self.head ~= nil then
        local direction = self.coordinate:subtract(self.head.coordinate)
        local new_coord = direction:mul(1/direction:magnitude()):mul(tail_distance):add(self.head.coordinate)
        self.coordinate = new_coord
    end
        
    if self.tail == nil then
        return nil
    end

    self.tail:move(tail_distance)
end

function snake_node:draw()
    if self.is_root then
        love.graphics.setColor(1, 0, 0)
        love.graphics.ellipse("fill", self.coordinate.x, self.coordinate.y, self.size.x / 2 * 1.1, self.size.y / 2 * 1.1, 100)     
    else
        love.graphics.setColor(1, 1, 0)
        love.graphics.ellipse("fill", self.coordinate.x, self.coordinate.y, self.size.x / 2, self.size.y / 2, 100) 
    end

    if self.tail == nil then
        return nil
    end

    self.tail:draw()   
end

function snake_node:draw_single()
    if self.is_root then
        love.graphics.setColor(1, 0, 0)
        love.graphics.ellipse("fill", self.coordinate.x, self.coordinate.y, self.size.x / 2 * 1.1, self.size.y / 2 * 1.1, 100)     
    else
        love.graphics.setColor(1, 1, 0)
        love.graphics.ellipse("fill", self.coordinate.x, self.coordinate.y, self.size.x / 2, self.size.y / 2, 100) 
    end
end

return snake_node