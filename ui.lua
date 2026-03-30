-- ui.lua
local ui = {}

function ui:load()
    self.healthX = 10
    self.healthY = 10
    self.healthWidth = 200
    self.healthHeight = 20
    self.manaX = 10
    self.manaY = 40
    self.manaWidth = 200
    self.manaHeight = 20
    self.staminaX = 10
    self.staminaY = 70
    self.staminaWidth = 200
    self.staminaHeight = 20
end

function ui:update(dt)
end

function ui:draw(player)
    -- Draw health bar outer box
    love.graphics.setColor(1,1,1,0.8)
    love.graphics.rectangle("fill", self.healthX - 2, self.healthY - 2, self.healthWidth + 4, self.healthHeight + 4)
    -- Draw health bar inner box
    love.graphics.setColor(1,0,0)
    love.graphics.rectangle("fill", self.healthX, self.healthY, (player.health / player.maxhealth) * self.healthWidth, self.healthHeight)

    -- Draw mana bar outer box
    love.graphics.setColor(1,1,1,0.8)
    love.graphics.rectangle("fill", self.manaX - 2, self.manaY - 2, self.manaWidth + 4, self.manaHeight + 4)
    -- Draw mana bar inner box
    love.graphics.setColor(0,0,1)
    love.graphics.rectangle("fill", self.manaX, self.manaY, (player.mana / player.maxmana) * self.manaWidth, self.manaHeight)

    -- Draw stamina bar outer box
    love.graphics.setColor(1,1,1,0.8)
    love.graphics.rectangle("fill", self.staminaX - 2, self.staminaY - 2, self.staminaWidth + 4, self.staminaHeight + 4)
    -- Draw stamina bar inner box
    love.graphics.setColor(0,2,0)
    love.graphics.rectangle("fill", self.staminaX, self.staminaY, (player.stamina / player.maxstamina) * self.staminaWidth, self.staminaHeight)
end

-- Return the UI object
return ui