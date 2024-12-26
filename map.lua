require("Engine/vector2")

local map = {}
map.__index = map

-- constructor
function map:new(coordinate, size)
    local m = setmetatable({}, map)
    m.root = coordinate
    m.size = size
    m.color = {
        r = 0,
        g = 0,
        b = 0
    }
    m.border_color = {
        r = 1,
        g = 1,
        b = 1
    }
    return m
end

function map:draw()
    
end

function map:draw_mask()
    local window_width, window_height = love.graphics.getDimensions()

    love.graphics.setColor(self.color.r, self.color.g, self.color.b)
    love.graphics.rectangle("fill", 0, 0, window_width, self.root.y)
    love.graphics.rectangle("fill", 0, 0, self.root.x, window_height)
    love.graphics.rectangle("fill", 0, self.root.y + self.size.y, window_width, window_height - self.root.y - self.size.y)
    love.graphics.rectangle("fill", self.root.x + self.size.x, 0, window_width - self.root.x - self.size.x, window_height)
end

function map:draw_outline()
    love.graphics.setColor(self.border_color.r, self.border_color.g, self.border_color.b)
    love.graphics.rectangle("line", self.root.x, self.root.y, self.size.x, self.size.y)
end

function map:is_in_map(coordinate, radius)
    if coordinate.x < self.root.x then
        return false
    end
    if coordinate.x > self.root.x + self.size.x then
        return false
    end
    if coordinate.y < self.root.y then
        return false
    end
    if coordinate.y > self.root.y + self.size.y then
        return false
    end
    return true
end

return map
