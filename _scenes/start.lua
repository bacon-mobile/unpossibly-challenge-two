--
-- Bacon / Business
-- Challenge No. 2 from Unpossib.ly
-- Dialer that tells you the reason first App
--
-- by bacon.mobile
-- Corona SDK + Lua
-- August 26, 2016
--
-- start.lua
--

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require( "widget" )

local numericFieldPhone
local radioFieldReason
phoneNum = nil
reasonTxt = ""
switch = nil

-- Handle press events for the radio-buttons
local function onSwitchPress( event )
    switch = event.target
    if (switch.id == "RadioButton1") then
      reasonTxt = "I would like to talk to you about bacon with breakfast."
   end
       if (switch.id == "RadioButton2") then
         print("two")
      reasonTxt = "I would like to talk to you about bacon with lunch."
   end
       if (switch.id == "RadioButton3") then
      reasonTxt = "I would like to talk to you about business."
   end
    print( "Switch with ID '"..switch.id.."' is on: "..tostring(switch.isOn).." reasonTxt = "..reasonTxt)
end

local function numericListenerPhone( event )
    if ( event.phase == "began" ) then

    elseif ( event.phase == "ended" or event.phase == "submitted" ) then
      native.setKeyboardFocus( nil )
      phoneNum = event.target.text

    elseif ( event.phase == "editing" ) then
    end
end

local function radioListenerReason( event )
    if ( event.phase == "began" ) then

    elseif ( event.phase == "ended" or event.phase == "submitted" ) then
      native.setKeyboardFocus( nil )
      reasonTxt = event.target.text

    elseif ( event.phase == "editing" ) then
    end
end

local function gotoDial()
   composer.removeScene( "_scenes.dial" )
   composer.gotoScene( "_scenes.dial", { time=333, effect="crossFade" } )
end
 
-- "scene:create()"
function scene:create( event )
 
   local sceneGroup = self.view
   
   local textTitle = display.newText( sceneGroup, "Bacon / Business", display.contentCenterX, display.contentWidth / 8, native.systemFont, 21 )
textTitle:setFillColor( 120/255, 80/255, 255/255, 1 )
   local textSubTitle = display.newText( sceneGroup, "Challenge No. 2 from Unpossib.ly  |  Caller Reason", display.contentCenterX, display.contentWidth / 8 + 22, native.systemFont, 12 )
textSubTitle:setFillColor( 160/255, 120/255, 255/255, 1 )
   local textInstruction = display.newText( sceneGroup, "Phone Number:", display.contentCenterX, display.contentWidth / 8 + 75, native.systemFont, 16 )
textInstruction:setFillColor( 210/255, 210/255, 210/255, 1 )

numericFieldPhone = native.newTextField( display.contentCenterX, display.contentWidth / 7 + 100, 80, 28 )
numericFieldPhone.inputType = "number"
numericFieldPhone:addEventListener( "userInput", numericListenerPhone )

   local textInstruction1 = display.newText( sceneGroup, "What is the reason for this call?", display.contentCenterX, display.contentWidth / 8 + 165, native.systemFont, 16 )
textInstruction1:setFillColor( 210/255, 210/255, 210/255, 1 )

-- Create a group for the radio button set
local radioGroup = display.newGroup()

-- Create three associated radio buttons (inserted into the same display group)
local radioButton1 = widget.newSwitch(
    {
        left = 50,
        top = 220,
        style = "radio",
        id = "RadioButton1",
        initialSwitchState = true,
        onPress = onSwitchPress
    }
)
radioGroup:insert( radioButton1 )

local radioButton2 = widget.newSwitch(
    {
        left = 150,
        top = 220,
        style = "radio",
        id = "RadioButton2",
        onPress = onSwitchPress
    }
)
radioGroup:insert( radioButton2 )

local radioButton3 = widget.newSwitch(
    {
        left = 250,
        top = 220,
        style = "radio",
        id = "RadioButton3",
        onPress = onSwitchPress
    }
)
radioGroup:insert( radioButton3 )

   local continueButton = display.newText( sceneGroup, "DIAL", display.contentCenterX, display.contentWidth * 1.4, native.systemFont, 21 )
continueButton:setFillColor( 120/255, 80/255, 255/255, 1 )
continueButton:addEventListener( "tap", gotoDial )
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
   
   -- cleanup fields
   if numericFieldPhone then
    numericFieldPhone :removeSelf()
    numericFieldPhone = nil
   end

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