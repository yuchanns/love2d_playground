local class = require("lib.30log")

local M = class("Background")

function M:load()
  local tileSize = 32

  local lightColor = { 0.7, 0.7, 0.7 }
  local darkColor = { 0.5, 0.5, 0.5 }

  local width, height = love.graphics.getDimensions()
  width = width * 10
  height = height * 10
  self.canvas = love.graphics.newCanvas(width, height)

  love.graphics.setCanvas(self.canvas)

  for y = 0, height, tileSize do
    for x = 0, width, tileSize do
      if (math.floor(x / tileSize) + math.floor(y / tileSize)) % 2 == 0 then
        love.graphics.setColor(lightColor)
      else
        love.graphics.setColor(darkColor)
      end
      love.graphics.rectangle("fill", x, y, tileSize, tileSize)
    end
  end

  love.graphics.setCanvas()
  love.graphics.setColor(1, 1, 1)
end

function M:draw()
  love.graphics.draw(self.canvas)
end

return M
