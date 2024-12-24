local vector2 = require("Math2D/vector2")

local globals = {}

directions = {
    up = vector2:new(0, -1),
    left = vector2:new(-1, 0),
    down = vector2:new(0, 1),
    right = vector2:new(1, 0)
}

return globals