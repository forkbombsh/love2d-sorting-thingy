local sortingThread = love.thread.newThread("sortingThread.lua")
sortingThread:start()
local chan = love.thread.getChannel("sort")
local vivid = require("vivid")
local ntab = {}

function love.load()
    love.window.maximize()
end

function love.update(dt)
    local temp = chan:pop()
    if temp ~= nil then
        ntab = temp
    end
end

function love.draw()
    for i = 1, #ntab do
        if ntab[i] ~= nil and type(ntab[i]) ~= "string" then
            -- love.graphics.setColor(vivid.HSVtoRGB(ntab[i] / #ntab, 1, 1))
            love.graphics.setColor(1, 1, 1)
            love.graphics.rectangle("fill", (i - 1) / #ntab * love.graphics.getWidth(),
                love.graphics.getHeight() - ((ntab[i] - 1) / #ntab * love.graphics.getHeight()),
                (love.graphics.getWidth() / #ntab),
                (ntab[i] - 1) / #ntab * love.graphics.getHeight())
        elseif ntab[i] == "done" then
            love.graphics.setColor(0, 1, 0)
            love.graphics.rectangle("fill", (i - 1) / #ntab * love.graphics.getWidth(),
                love.graphics.getHeight() - ((i - 1) / #ntab * love.graphics.getHeight()),
                (love.graphics.getWidth() / #ntab),
                (i - 1) / #ntab * love.graphics.getHeight())
        end
    end
end
