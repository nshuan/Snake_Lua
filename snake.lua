local Vector2 = require("Engine/vector2")
local snake_node = require("snake_node")
local event_manager = require("Engine/event_manager")

local snake = {}
snake.__index = snake

local node_distance = 20

-- constructor
function snake:new(coordinate, radius, length)
    local v = setmetatable({}, snake)
    v.coordinate = coordinate or Vector2:new(0, 0)
    v.radius = radius or 10
    v.speed = 10
    v.root = snake_node:new(coordinate, radius, nil, nil)
    v.root:set_root()

    -- initialize snake with number of node is equal to length
    local current_node = v.root
    local current_length = 1
    while current_length < length do
        local new_node = snake_node:new(current_node.coordinate:subtract(Vector2:new(node_distance, 0)), radius, current_node, nil)
        current_node.tail = new_node
        current_node = new_node
        current_length = current_length + 1
    end

    return v
end

function snake:set_speed(speed)
    self.speed = speed
end

function snake:check_eat(bait_position, bait_radius)
    if bait_position:subtract(self.root.coordinate):magnitude() >= self.radius + bait_radius then
        return false
    end

    return true
end

function snake:move(map, direction, dt)
    local new_pos = self.root.coordinate:add(direction:normalize():mul(self.speed * dt))
    if map:is_in_map(new_pos, self.radius) then
        self.root.coordinate = new_pos
        self.root:move(node_distance)
        return true
    end
    return false
end

function snake:draw()
    self.root:draw()
    self.root:draw_single()
end

return snake
