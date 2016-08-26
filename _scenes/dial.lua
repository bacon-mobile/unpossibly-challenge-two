--
-- Bacon / Business
-- Challenge No. 2 from Unpossib.ly
-- Dialer that tells you the reason first App
--
-- by bacon.mobile
-- Corona SDK + Lua
-- August 26, 2016
--
-- dial.lua
--

local composer = require( "composer" )
local scene = composer.newScene()

 local function gotoStart()
   composer.removeScene( "_scenes.start" )
   composer.gotoScene( "_scenes.start", { time=333, effect="crossFade" } )
end
 
-- "scene:create()"
function scene:create( event )
 
   local sceneGroup = self.view

local textTitle = display.newText( sceneGroup, "Bacon / Business", display.contentCenterX, display.contentWidth / 8, native.systemFont, 21 )
textTitle:setFillColor( 120/255, 80/255, 255/255, 1 )
   local textSubTitle = display.newText( sceneGroup, "Challenge No. 2 from Unpossib.ly  |  Caller Reason", display.contentCenterX, display.contentWidth / 8 + 22, native.systemFont, 12 )
textSubTitle:setFillColor( 160/255, 120/255, 255/255, 1 )

   local textWeight = display.newText( sceneGroup, "Sending reason + Dialing your call ... ", display.contentCenterX + 18, display.contentWidth, display.contentWidth, display.contentHeight * 0.7, native.systemFont, 16 )
textWeight:setFillColor( 210/255, 210/255, 210/255, 1 )

    local sendTextAndDial = function(event)
    native.showPopup("sms",{to=phoneNum, body=reasonTxt })
    system.openURL("tel:"..phoneNum)
    end

   local continueButton = display.newText( sceneGroup, "Another Call?", display.contentCenterX, display.contentWidth * 1.4, native.systemFont, 21 )
continueButton:setFillColor( 120/255, 80/255, 255/255, 1 )
continueButton:addEventListener( "tap", gotoStart )
end

 
-- "scene:show()"
function scene:show( event )
 
   local sceneGroup = self.view
   local phase = event.phase
 
   if ( phase == "will" ) then
      -- Called when the scene is still off screen (but is about to come on screen).
   elseif ( phase == "did" ) then
      -- Called when the scene is now on screen.

   end
end
 
-- "scene:hide()"
function scene:hide( event )
 
   local sceneGroup = self.view
   local phase = event.phase
 
   if ( phase == "will" ) then
      -- Called when the scene is on screen (but is about to go off screen).

   elseif ( phase == "did" ) then
      -- Called immediately after scene goes off screen.
   end
end
 
-- "scene:destroy()"
function scene:destroy( event )
 
   local sceneGroup = self.view
 
   -- Called prior to the removal of scene's view ("sceneGroup").

end
 
---------------------------------------------------------------------------------
 
-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
 
---------------------------------------------------------------------------------
 
return scene