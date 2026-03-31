-- main.lua
-- Import external files
local gamera = require("lib.gamera")
local sti = require("lib.sti")
local ui = require("ui")
local bump = require("lib.bump")
local player = require("player")

-- Initialize variables
local world
local map
local cam

-- Initialize variables
function love.load()
    -- Load the map
    map = sti("maps/simple-map.lua", {"bump"})

    -- Create the camera
    local mapW = map.width * map.tilewidth
    local mapH = map.height * map.tileheight
    cam = gamera.new(0, 0, mapW, mapH)
    cam:setScale(3.0) -- set scale (zoom)

    -- Create the UI
    ui:load()

    -- Create the 'world' for collision
    world = bump.newWorld(32)
    map:bump_init(world)

    -- Load the player and pass the world
    player:load(world)
end

-- Update
function love.update(dt)
    -- Update the player
    player:update(dt)

    -- Update the map
    map:update(dt)

    -- Tell the camera to follow the player
    cam:setPosition(math.floor(player.x), math.floor(player.y))

    -- Update the UI
    ui:update(dt)
end

-- Draw the graphics
function love.draw()
    -- Get the camera coordinates for STI
    local l, t, w, h = cam:getVisible()

    -- Draw the map
    love.graphics.setColor(1,1,1) -- set colors so its doesn't look weird
    map:draw(math.floor(-l),math.floor(-t), cam:getScale(), cam:getScale())

    -- Apply camera
    cam:draw(function(l, t, w, h)
        player:draw() -- Draw player object
    end)

    -- Draw the UI
    ui:draw(player)
end