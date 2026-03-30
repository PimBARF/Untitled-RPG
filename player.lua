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
function player:load(world)
    self.world = world
    self.x = 400
    self.y = 300
    self.width = 32
    self.height = 32
    self.speed = 300
    self.maxhealth = 100
    self.health = self.maxhealth
    self.maxstamina = 100
    self.stamina = self.maxstamina
    self.maxmana = 100
    self.mana = self.maxmana

    -- Register the player in the world
    self.world:add(self, self.x, self.y, self.width, self.height)
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

    -- Normalize vectors
    local nx, ny = normalize(dx, dy)

    -- Calculate intended movement
    local goalX = self.x + (nx * (self.speed * dt))
    local goalY = self.y + (ny * (self.speed * dt))

    -- Try to move the player using bump
    local actualX, actualY, cols, len = self.world:move(self, goalX, goalY)

    -- Move player object
    self.x = actualX
    self.y = actualY
end

-- Drawing
function player:draw()
    love.graphics.setColor(255,255,255)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

-- Return the player
return player