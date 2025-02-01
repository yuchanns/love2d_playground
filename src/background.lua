local class = require("lib.30log")

local M = class("Background")

function M:load()
  -- Create checkerboard shader
  local shader = love.graphics.newShader [[
    extern number tileSize;
    extern vec3 lightColor;
    extern vec3 darkColor;

    vec4 effect(vec4 color, Image tex, vec2 tc, vec2 sc) {
      float x = floor(sc.x / tileSize);
      float y = floor(sc.y / tileSize);
      vec3 resultColor = mod(x + y, 2.0) == 0.0 ? lightColor : darkColor;
      return vec4(resultColor, 1.0);
    }
  ]]

  shader:send("tileSize", 32)
  shader:send("lightColor", { 0.7, 0.7, 0.7 })
  shader:send("darkColor", { 0.5, 0.5, 0.5 })

  local width, height = love.graphics.getDimensions()
  width, height = width * 10, height * 10
  self.canvas = love.graphics.newCanvas(width, height)

  -- Save states
  local previousCanvas = love.graphics.getCanvas()
  local previousShader = love.graphics.getShader()

  -- Draw using shader
  love.graphics.setCanvas(self.canvas)
  love.graphics.setShader(shader)
  love.graphics.rectangle("fill", 0, 0, width, height)

  -- Restore states
  love.graphics.setCanvas(previousCanvas)
  love.graphics.setShader(previousShader)
end

function M:draw()
  love.graphics.draw(self.canvas)
end

return M
