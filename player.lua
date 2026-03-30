-- player.lua
local player = {}

-- Normalize function
local function normalize(dx, dy)
    local length = math.sqrt(dx^2 + dy^2)
    if length > 0 then
        dx = dx / length
        dy = dy / length
        return dx, dy
    end
    -- If length is 0 (not moving), return zeros
    return 0, 0
end

-- Initializing variables
function player:load()
    self.x = 400
    self.y = 300
    self.width = 32
    self.height = 32
    self.speed = 300
end

-- Movement logic
function player:update(dt)
    -- Init directional x and directional y
    local dx, dy = 0, 0

    -- Get keyboard inputs and assign dx and dy
    if love.keyboard.isDown("up") then dy = -1 end
    if love.keyboard.isDown("down") then dy = 1 end
    if love.keyboard.isDown("left") then dx = -1 end
    if love.keyboard.isDown("right") then dx = 1 end

    -- Normalize vectors and move player
    local nx, ny = normalize(dx, dy)
    self.x = self.x + (nx * (self.speed * dt))
    self.y = self.y + (ny * (self.speed * dt))
end

-- Drawing
function player:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

-- Return the player
return player