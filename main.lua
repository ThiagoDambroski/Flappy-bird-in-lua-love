push = require 'push'

WINDOWNS_WIDHT = 1280
WINDOWNS_HEIGHT = 720

VIRTUAL_WIDTH = 512
VIRUTAL_HEIGHT = 288

local background = love.graphics.newImage('background.png')
local backgorundCount = 0 

local ground = love.graphics.newImage('ground.png')
local groundCount = 0

local BACKGROUND_SPEED = 30
local GROUND_SPEED = 60

local BACKGROUND_LOOPING_POINT = 413

function love.load()
    love.graphics.setDefaultFilter('nearest',"nearest")

    love.window.setTitle('flappy bird')

    push:setupScreen(VIRTUAL_WIDTH,VIRUTAL_HEIGHT,WINDOWNS_WIDHT,WINDOWNS_HEIGHT,{
        vsync = true,
        fullscreen = false,
        resizable = true
    })

end

function love.resize(w,h)
    push:resize(w,h)

end

function  love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
    
end

function love.update(dt)
    backgorundCount = (backgorundCount + BACKGROUND_SPEED * dt) % BACKGROUND_LOOPING_POINT

    groundCount = (groundCount + GROUND_SPEED * dt) % VIRTUAL_WIDTH
    
end

function love.draw()
    push:start()
    love.graphics.draw(background,- backgorundCount,0)

    love.graphics.draw(ground,- groundCount, VIRUTAL_HEIGHT - 15)
    push:finish()
end