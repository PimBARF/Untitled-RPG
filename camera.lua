-- camera.lua
local camera = {}

camera.x = 0
camera.y = 0

-- Set the target
function camera:setTarget(x, y)
    self.x = x
    self.y = y
end

-- Apply the camera
function camera:apply()
    love.graphics.push()

    -- Set the camera in the center of the game window
    local cx = love.graphics.getWidth() / 2
    local cy = love.graphics.getHeight() / 2

    love.graphics.translate(-self.x + cx, -self.y + cy)
end

-- Detach the camera
function camera:detach()
    love.graphics.pop()
end

-- Return the camera object
return camera