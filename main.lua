--
-- Bacon / Business
-- Challenge No. 2 from Unpossib.ly
-- Dialer that tells you the reason first App
--
-- by bacon.mobile
-- Corona SDK + Lua
-- August 26, 2016
--
-- main.lua
--

-- hide device status bar
-- display.setStatusBar( display.HiddenStatusBar )

-- set all scenes to black
display.setDefault( 'background', 0, 0, 0 );

local composer = require( "composer" )

-- load instructions
composer.gotoScene( "_scenes.start", "fade", 333 )
