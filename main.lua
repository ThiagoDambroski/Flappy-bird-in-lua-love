push = require 'push'

Class = require 'class'

require 'Bird'


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

local bird = Bird()

function love.load()
    love.graphics.setDefaultFilter('nearest',"nearest")

    love.window.setTitle('flappy bird')

    push:setupScreen(VIRTUAL_WIDTH,VIRUTAL_HEIGHT,WINDOWNS_WIDHT,WINDOWNS_HEIGHT,{
        vsync = true,
        fullscreen = false,
        resizable = true
    })

    love.keyboard.keysPressed = {}

end

function love.resize(w,h)
    push:resize(w,h)

end

function  love.keypressed(key)
    love.keyboard.keysPressed[key] = true
    if key == 'escape' then
        love.event.quit()
    end
    
end

function love.keyboard.wasPressed(key)
    if  love.keyboard.keysPressed[key] then
        return true
    else
        return false
    end
    
end

function love.update(dt)
    backgorundCount = (backgorundCount + BACKGROUND_SPEED * dt) % BACKGROUND_LOOPING_POINT

    groundCount = (groundCount + GROUND_SPEED * dt) % VIRTUAL_WIDTH


    bird:update(dt)

    love.keyboard.keysPressed = {}
end

function love.draw()
    push:start()
    love.graphics.draw(background,- backgorundCount,0)

    love.graphics.draw(ground,- groundCount, VIRUTAL_HEIGHT - 15)

    bird:render()
    push:finish()
end