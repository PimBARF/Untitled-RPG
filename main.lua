-- main.lua
-- Import external files
local bump = require("lib.bump")
local camera = require("camera")
local player = require("player")

local world

-- Initialize variables
function love.load()
    -- Create the 'world' for collision
    world = bump.newWorld(32)

    -- Load the player and pass the world
    player:load(world)

    -- Add a wall for testing purposes
    local wall = { name = "wall" }
    world:add(wall, 500, 200, 100, 100)
end

-- Update
function love.update(dt)
    player:update(dt)

    -- Set the camera target to the player
    camera:setTarget(player.x, player.y)
end

-- Draw the graphics
function love.draw()
    -- Apply camera
    camera:apply()
        -- Draw the world and everything inside
        player:draw() -- Draw player object
        love.graphics.rectangle("line", 500, 200, 100, 100) -- Draw test wall
    -- Detach camera
    camera:detach()

    -- Draw UI elements here --
end