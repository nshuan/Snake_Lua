local map = {}

map_conf = {
    x = 40,
    y = 40,
    width = 720,
    height = 520
}

function map.create()
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("line", map_conf.x, map_conf.y, map_conf.width, map_conf.height)
end

return map
