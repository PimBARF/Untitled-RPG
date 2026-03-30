-- main.lua
-- Import external files
local player = require("player")

-- Initialize variables
function love.load()
    player:load()
end

-- Update
function love.update(dt)
    player:update(dt)
end

-- Draw the graphics
function love.draw()
    player:draw()
end