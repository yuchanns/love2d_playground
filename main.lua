---@class love dummy ident
love = require("love")

local Sprite = require("src.sprite")

local sprite

function love.load()
  local assets = require("src.assets")
  sprite = Sprite(assets.img_fern)
  sprite:load()
end

function love.update(dt)
  -- Update the animation
  sprite:update(dt)
end

function love.draw()
  -- Draw the animation
  sprite:draw()
end
