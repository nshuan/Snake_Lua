local Map = require("map")
local Snake = require("snake")
local Vector2 = require("Math2D/vector2")
require("globals")

local start = false
local snake_direction = directions.right

map_conf = {
    root_coord = Vector2:new(40, 40),
    size = Vector2:new(720, 520),
    color = {
        r = 0,
        g = 0,
        b = 0
    },
    border_color = {
        r = 1,
        g = 1,
        b = 1
    }
}

function love.load()
    map = Map:new(map_conf.root_coord, map_conf.size)
    snake = Snake:new(map_conf.root_coord:add(Vector2:new(50, 50)), Vector2:new(20, 20), 100)
    snake:set_speed(100)
end

function love.update(dt)
    if start == false then
        return nil
    end

    snake:move(map, snake_direction, dt)
end

function love.draw()
    map:draw()
    snake:draw()
end

function love.keypressed(key)
    if key == "space" then
        start = not start
    end
    if key == "w" then
        snake_direction = directions.up
    end
    if key == "a" then
        snake_direction = directions.left
    end
    if key == "s" then
        snake_direction = directions.down
    end
    if key == "d" then
        snake_direction = directions.right
    end
end
