---@class love dummy ident
love = require("love")

local Sprite = require("src.sprite")
local Background = require("src.background")

local sprite
local background

function love.load()
  background = Background()
  background:load()
  local assets = require("src.assets")
  sprite = Sprite(assets.img_fern)
  sprite:load()
end

function love.update(dt)
  -- Update the animation
  sprite:update(dt)
end

function love.draw()
  background:draw()
  -- Draw the animation
  sprite:draw()
end

function love.resize(w, h)
  -- Recreate background when window size changes
  love.load()
end
