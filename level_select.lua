-----------------------------------------------------------------------------------------
--
-- level_select.lua
-- Created by: Amelie BO
-- Special thanks to Wal Wal for helping in the design of this framework.
-- Date: Month Day, Year
-- Description: This is the instructions page, displaying a back button to the main menu.
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Libraries
local composer = require( "composer" )
local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "level_select"

-- Creating Scene Object
scene = composer.newScene( sceneName ) -- This function doesn't accept a string, only a variable containing a string

-----------------------------------------------------------------------------------------
-- GLOBAL VARIABLES
-----------------------------------------------------------------------------------------
SoundOn = true

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------
local bkg_image
local backButton
local muteButton
local unmuteButtton
local level1Button
local level2Button
local level3Button

-----------------------------------------------------------------------------------------
-- SOUNDS
-----------------------------------------------------------------------------------------
-- create sound variables
local bkgSound = audio.loadSound ( "Sounds/bkgMusic.mp3" ) -- Setting variable to mp3 file
local bkgSoundChannel

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

-- Creating Transitioning Function back to main menu
local function BackTransition( )
    composer.gotoScene( "main_menu", {effect = "fade", time = 200})
end

-- Creating Transition to Level1 Screen
local function Level1ScreenTransition( )
    composer.gotoScene( "Level1_popup", {effect = "fade", time = 200})
end    

-- Creating Transition to Level2 Screen
local function Level2ScreenTransition( )
    composer.gotoScene( "Level2_popup", {effect = "fade", time = 200})
end    

local function Level3ScreenTransition( )
    composer.gotoScene( "level3_popup", {effect = "fade", time = 200})
end    
-----------------------------------------------------------------------------------------
    local function Mute(touch)
     if (touch.phase == "ended") then
     -- pause the sound
     audio.pause(bkgSound)
     -- set the boolean variable to be false (sound is now muted)
     soundOn = false
     -- hide the mute
     muteButton.isVisible = false
     -- make the unmute button visible
     unmuteButton.isVisible = true
 end
end

    local function Unmute(touch)
     if (touch.phase == "ended") then
     -- pause the sound
     audio.play(bkgSound)
     -- set the boolean variable to be false (sound is now muted)
     soundOn = true
     -- hide the mute
     muteButton.isVisible = true
     -- make the unmute button visible
     unmuteButton.isVisible = false
 end
end

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------
    -- BACKGROUND AND DISPLAY OBJECTS
    -----------------------------------------------------------------------------------------

    -- Insert the background image and set it to the center of the screen
    bkg_image = display.newImageRect("Images/LevelSelectAmelieBO@2x.png", display.contentWidth, display.contentHeight)
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight

    -- Associating display objects with this scene 
    sceneGroup:insert( bkg_image )

    -- Send the background image to the back layer so all other objects can be on top
    bkg_image:toBack()

    -----------------------------------------------------------------------------------------
    -- BUTTON WIDGETS
    -----------------------------------------------------------------------------------------

    -- Creating Back Button
    backButton = widget.newButton( 
    {
        -- Setting Position
        x = display.contentWidth*0.8/8,
        y = display.contentHeight*1.5/16,
        width = 150, 
        height = 80,

        -- Setting Dimensions
        -- width = 1000,
        -- height = 106,

        -- Setting Visual Properties
        defaultFile = "Images/BackButtoUnpressedYourName@2x.png", 
        overFile = "Images/BackButtonPressedAbishaJ@2x.png",

        -- Setting Functional Properties
        onRelease = BackTransition

    } )

    -- creating level 1 play button
    level1Button = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/4.5,
            y = display.contentHeight*3/8,
            width = 180, 
            height = 180,


            -- Insert the images here
            defaultFile = "Images/Level1ButtonUnpressedAmelie@2x.png",
            overFile = "Images/Level1ButtonPressedAmelie@2x (1).png",

            -- When the button is released, call the Level1 screen transition function
            onRelease = Level1ScreenTransition          
        } )

    -- creating level 2 play button
    level2Button = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/2,
            y = display.contentHeight*3/8,
            width = 180, 
            height = 180,


            -- Insert the images here
            defaultFile = "Images/Level2ButtonUnpressedAmelie@2x (1).png",
            overFile = "Images/Level2ButtonPressedAmellie@2x.png",

            -- When the button is released, call the Level1 screen transition function
            onRelease = Level2ScreenTransition          
        } )

    -- creating level 3 play button
    level3Button = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/1.3,
            y = display.contentHeight*3/8,
            width = 180, 
            height = 180,


            -- Insert the images here
            defaultFile = "Images/Level3ButtonUnpressedAmelie@2x.png",
            overFile = "Images/Level3ButtonPressedAmelie@2x.png",

            -- When the button is released, call the Level1 screen transition function
            onRelease = Level3ScreenTransition          
        } )

-------------------------------------------------------------------------------
-- Object creation for mute button
muteButton = display.newImageRect("Images/unmuteButtonPressedAmelieBo@2x .png", 60, 60)
muteButton.x = display.contentWidth*0.8/10
muteButton.y = display.contentHeight*9/10 
muteButton.isVisible = true

unmuteButton = display.newImageRect("Images/muteButtonUnpressedAmelieBo@2x .png", 60, 60)
unmuteButton.x = display.contentWidth*0.8/10
unmuteButton.y = display.contentHeight*9/10
unmuteButton.isVisible = true 

-- level1 text
level1 = display.newText("Level 1", display.contentWidth*1.1/5, display.contentHeight*5/9, nil, 40) 
level1:setTextColor(1, 1, 1)

-- level2 text
level2 = display.newText("Level 2", display.contentWidth*2.5/5, display.contentHeight*5/9, nil, 40) 
level2:setTextColor(1, 1, 1)

-- level3 text
level3 = display.newText("Level 3", display.contentWidth*3.85/5, display.contentHeight*5/9, nil, 40) 
level3:setTextColor(1, 1, 1)

-- neptune text
Neptune = display.newText("Neptune", display.contentWidth*1.1/5, display.contentHeight*5.5/9, nil, 32) 
Neptune:setTextColor(1, 1, 1)

-- jupiter text
Jupiter = display.newText("Jupiter", display.contentWidth*2.5/5, display.contentHeight*5.5/9, nil, 32) 
Jupiter:setTextColor(1, 1, 1)

-- mercury text
Mercury = display.newText("Mercury", display.contentWidth*3.85/5, display.contentHeight*5.5/9, nil, 32) 
Mercury:setTextColor(1, 1, 1)

    -----------------------------------------------------------------------------------------

    -- Associating Buttons with this scene
    sceneGroup:insert( backButton )
    sceneGroup:insert( muteButton )
    sceneGroup:insert( unmuteButton )
    sceneGroup:insert( level1Button )
    sceneGroup:insert( level2Button )
    sceneGroup:insert( level3Button )
    sceneGroup:insert( level1 )
    sceneGroup:insert( level2 )
    sceneGroup:insert( level3 )
    sceneGroup:insert( Neptune )
    sceneGroup:insert( Jupiter )
    sceneGroup:insert( Mercury )
    
end --function scene:create( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
        -- start the instruction screen music
        bkgSoundChannel = audio.play( bkgSound, { channel=4, loops=-1} ) 
        muteButton:addEventListener( "touch", Mute)
        unmuteButton:addEventListener( "touch", Unmute)
    end

end -- function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
                -- stop the rocket sound channel for this screen
        audio.stop(bkgSoundChannel)

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- called iediately after scene goes off screen.
        muteButton:removeEventListener("touch", Mute)
        unmuteButton:removeEventListener("touch", Unmute)
    end

end --function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------


    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.

end --function scene:destroy( event )

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene