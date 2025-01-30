local class = require("lib.30log")
local anim8 = require("lib/anim8")

local M = class("sprite")

function M:init(image)
  self.image = image
end

function M:load()
  local w, h = self.image:getWidth(), self.image:getHeight()
  self.gw = w / 4
  self.gh = h
  local g = anim8.newGrid(self.gw, self.gh, w, h)
  self.anim = anim8.newAnimation(g('1-4', 1), 0.1)
end

function M:update(dt)
  self.anim:update(dt)
end

function M:draw()
  self.anim:draw(self.image, love.graphics.getWidth() / 2 - self.gw / 2,
    love.graphics.getHeight() / 2 - self.gh / 2)
end

return M
