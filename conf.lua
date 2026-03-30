-- conf.lua
function love.conf(t)
    -- WINDOW SETTINGS
    t.window.title = "RPG"
    t.window.width = 1280
    t.window.height = 720
    t.window.resizable = false
    t.window.vsync = 1

    -- GAME IDENTITY
    t.identity = "Untitled RPG" -- Change this later to final name

    -- MISC
    t.console = true
    t.version = "11.5"
end