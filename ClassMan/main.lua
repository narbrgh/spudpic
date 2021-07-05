-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------


local composer = require("composer")

--Hide status bar
display.setStatusBar(display.HiddenStatusBar)

-- Seed random number generator
math.randomseed(os.time())

--Go to the menu screen
composer.gotoScene("Scenes.game")
