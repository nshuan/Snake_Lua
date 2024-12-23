local map = require("map")

function love.draw()
    map.create()
    love.graphics.setColor(1, 0, 0)
    love.graphics.circle("fill", 100, 100, 10, 100)
end
