local Vector2 = require("Engine/vector2")
local event_manager = require("Engine/event_manager")

local spawner = {}
spawner.__index = spawner

function spawner:new(map_topleft, map_size, bait_radius)
    local s = setmetatable({}, spawner)
    math.randomseed(os.time()) -- Seed random generator

    s.bait_radius = bait_radius
    s.top_left_bait = map_topleft:add(Vector2:new(bait_radius, bait_radius))
    s.bottom_right_bait =map_topleft:add(map_size):subtract(Vector2:new(bait_radius, bait_radius))
    s.current_bait_pos = Vector2:new(math.random(s.top_left_bait.x, s.bottom_right_bait.x), math.random(s.top_left_bait.y, s.bottom_right_bait.y))

    event_manager:on("snake_eat", spawn)

    return s
end

function spawner:spawn()
    self.current_bait_pos = Vector2:new(math.random(self.top_left_bait.x, self.bottom_right_bait.x), math.random(self.top_left_bait.y, self.bottom_right_bait.y))
end

function spawner:draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.circle("fill", self.current_bait_pos.x, self.current_bait_pos.y, self.bait_radius)
end

return spawner
