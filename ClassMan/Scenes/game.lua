
local composer = require( "composer" )

local Potato = require("Classes.potatoClass")

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------


--Set up display groups 
local spudGroup
local textGroup

local spudInClass
local spudNonClass

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	local sceneGroup = self.view

	-- Code here runs when the scene is first created but has not yet appeared on screen
	
	--order matters!
	spudGroup = display.newGroup()
	sceneGroup:insert(spudGroup)

	textGroup = display.newGroup()
	sceneGroup:insert(textGroup)


	--Here! the goal is to have a "non-Class" potato on the left side of the screen,
	--and a "Class" potato on the right

	local oneThird = display.contentWidth * 1/3
	local twoThirds = display.contentWidth * 2/3


	--Text above the potatoes
	local leftText = display.newText(textGroup, "Non-Class potato", oneThird - 100, display.contentCenterY-200, native.systemFont, 44)
    leftText:setFillColor(0.75, 0.78, 1)

	local rightText = display.newText(textGroup, "Class potato", twoThirds +10, display.contentCenterY-200, native.systemFont, 44)
    rightText:setFillColor(0.75, 0.78, 1)

	--load the nonClass potato
	spudNonClass = display.newImageRect(spudGroup, "Assets/potato.png", 60,80)
	spudNonClass.x = oneThird
	spudNonClass.y = display.contentCenterY+100

	--load the class potato
	spudInClass = Potato:new{}
	spudInClass:loadImages{}
	spudGroup:insert(spudInClass:getImage{})
	spudInClass:setX(twoThirds)
	spudInClass:setY(display.contentCenterY+100)

end


-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)

	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen

	end
end


-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is on screen (but is about to go off screen)

	elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen

	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
	-- Code here runs prior to the removal of scene's view

end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene
