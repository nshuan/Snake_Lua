local Map = require("map")
local Snake = require("snake")
local Spawner = require("spawner")
local Vector2 = require("Engine/vector2")
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
    },
    snake_radius = 10,
    bait_radius = 5
}

function love.load()
    map = Map:new(map_conf.root_coord, map_conf.size)
    spawner = Spawner:new(map_conf.root_coord, map_conf.size, map_conf.bait_radius)
    snake = Snake:new(map_conf.root_coord:add(Vector2:new(50, 50)), map_conf.snake_radius, 10)
    snake:set_speed(100)
end

function love.update(dt)
    if start == false then
        return nil
    end

    snake:move(map, snake_direction, dt)
    if snake:check_eat(spawner.current_bait_pos, map_conf.bait_radius) then
        spawner:spawn()
    end
end

function love.draw()
    map:draw()
    spawner:draw()
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
