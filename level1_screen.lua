-----------------------------------------------------------------------------------------
--
-- level1_screen.lua
-- Created by: Your Name
-- Date: Month Day, Year
-- Description: This is the level 1 screen of the game.
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Libraries
local composer = require( "composer" )
local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "level1_screen"

-----------------------------------------------------------------------------------------
-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- GLOBAL VARIABLES
-----------------------------------------------------------------------------------------
SoundOn = true

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- The local variables for this scene
local bkg_image
local backButton
local muteButton
local unmuteButtton

local randomQuestionNumber

-- displays the number of lives the user has
local livesText 

-- variables for questions
local instructionsText

local textQuestion
local correctAnswer
local wrongAnswer1
local wrongAnswer2
local wrongAnswer3

-- Boolean variable that states if user clicked the answer or not
local alreadyClickedAnswer = false

-- displays the number correct that the user has
local numberCorrectText 

-----------------------------------------------------------------------------------------
-- SOUNDS
-----------------------------------------------------------------------------------------
-- create sound variables
local bkgSound = audio.loadSound ( "Sounds/bkgLevel1.mp3" ) -- Setting variable to mp3 file
local bkgSoundChannel

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

-- Creating Transitioning Function back to main menu
local function BackTransition( )
    composer.gotoScene( "main_menu", {effect = "fade", time = 200})
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

local function AskQuestion()
    -- randomly choose 1 out of the 20 questions
    randomQuestionNumber = math.random(1,20)

    -- if the random question number is 1, then ask question 
    if (randomQuestionNumber == 1) then

        -- make fist question visible
        textQuestion.text = "There are eight PLANITS in our solar system."

         -- make answers visible
        correctAnswer.text = "Planets"
        wrongAnswer1.text = "Plainets"
        wrongAnswer2.text = "Plenets"
        wrongAnswer3.text = "Planeits"

    -- if the random question number is 2, then ask question 
    elseif (randomQuestionNumber == 2) then

        -- make fist question visible
        textQuestion.text = "A person who travels to outerspace is called an ASTRONOT."

         -- make answers visible
        correctAnswer.text = "astronaut"
        wrongAnswer1.text = "astronut"
        wrongAnswer2.text = "astroneaut"
        wrongAnswer3.text = "atsronaut"

    -- if the random question number is 3, then ask question 
    elseif (randomQuestionNumber == 3) then

        -- make fist question visible
        textQuestion.text = "The earth made one REVELUSHION around the sun."

         -- make answers visible
        correctAnswer.text = "  revolution "
        wrongAnswer1.text = "  revallusion "
        wrongAnswer2.text = "  reveolution "
        wrongAnswer3.text = "  revalushyon "

    -- if the random question number is 4, then ask question 
    elseif (randomQuestionNumber == 4) then

        -- make fist question visible
        textQuestion.text = "The ATMASFERE layer closest to the earth."

         -- make answers visible
        correctAnswer.text = "    atmosphere  "
        wrongAnswer1.text = "    atmosfeer  "
        wrongAnswer2.text = "    atmosphear  "
        wrongAnswer3.text = "    atmaspheare  "

    -- if the random question number is 5, then ask question 
    elseif (randomQuestionNumber == 5) then

        -- make fist question visible
        textQuestion.text = "A group of stars forming a \n recognizable pattern is a CONSTALATION. "

         -- make answers visible
        correctAnswer.text = "constellation"
        wrongAnswer1.text = "constalasion"
        wrongAnswer2.text = "conestalation"
        wrongAnswer3.text = "constellasion"

        -- if the random question number is 6, then ask question 
    elseif (randomQuestionNumber == 6) then

        -- make fist question visible
        textQuestion.text = "A MITIOR flew across space."

         -- make answers visible
        correctAnswer.text = "meteor"
        wrongAnswer1.text = "mitear"
        wrongAnswer2.text = "metteor"
        wrongAnswer3.text = "metoir"

    -- if the random question number is 7, then ask question 
    elseif (randomQuestionNumber == 7) then

        -- make fist question visible
        textQuestion.text = "We live on planet ERF."

         -- make answers visible
        correctAnswer.text = "earth"
        wrongAnswer1.text = "erath"
        wrongAnswer2.text = "erth"
        wrongAnswer3.text = "earf"

    -- if the random question number is 8, then ask question 
    elseif (randomQuestionNumber == 8) then

        -- make fist question visible
        textQuestion.text = "An EICKLIPSE happens when one object in\nspace blocks another from view. "

         -- make answers visible
        correctAnswer.text = "eclipse"
        wrongAnswer1.text = "eklypse"
        wrongAnswer2.text = "eclypsse"
        wrongAnswer3.text = "ecllips"

    -- if the random question number is 9, then ask question 
    elseif (randomQuestionNumber == 9) then

        -- make fist question visible
        textQuestion.text = "An EICUINOX is when the sun is over the equator."

         -- make answers visible
        correctAnswer.text = "equinox"
        wrongAnswer1.text = "ekuinoks"
        wrongAnswer2.text = "equinocks"
        wrongAnswer3.text = "ecuinux"

    -- if the random question number is 10, then ask question 
    elseif (randomQuestionNumber == 10) then

        -- make fist question visible
        textQuestion.text = "Through space XPLORASION humans have learned a lot."

         -- make answers visible
        correctAnswer.text = "space exploration"
        wrongAnswer1.text = "spase explorashion"
        wrongAnswer2.text = "space exploraietion"
        wrongAnswer3.text = "space esplorration"

    -- if the random question number is 11, then ask question 
    elseif (randomQuestionNumber == 11) then

        -- make fist question visible
        textQuestion.text = "A SATELIT is a small object that\norbits around a larger object."

         -- make answers visible
        correctAnswer.text = "satellite "
        wrongAnswer1.text = "satellight"
        wrongAnswer2.text = "satlelite"
        wrongAnswer3.text = "satlite"

    -- if the random question number is 12, then ask question 
    elseif (randomQuestionNumber == 12) then

        -- make fist question visible
        textQuestion.text = "A SOULTTIS is when the sun is farthest\nnorth or south from the equator."

         -- make answers visible
        correctAnswer.text = "solstice"
        wrongAnswer1.text = "solstisse"
        wrongAnswer2.text = "soultice"
        wrongAnswer3.text = "solestise"

    -- if the random question number is 13, then ask question 
    elseif (randomQuestionNumber == 13) then

        -- make fist question visible
        textQuestion.text = "SAETTURN has 62 moons. "

         -- make answers visible
        correctAnswer.text = "Saturn"
        wrongAnswer1.text = "Satourn"
        wrongAnswer2.text = "Satorne"
        wrongAnswer3.text = "Satturne"

    -- if the random question number is 14, then ask question 
    elseif (randomQuestionNumber == 14) then

        -- make fist question visible
        textQuestion.text = "PLUETTOE is the largest dwarf planet."

         -- make answers visible
        correctAnswer.text = "Pluto"
        wrongAnswer1.text = "Plueto"
        wrongAnswer2.text = "Ploutoe"
        wrongAnswer3.text = "Plotu"

    -- if the random question number is 15, then ask question 
    elseif (randomQuestionNumber == 15) then

        -- make fist question visible
        textQuestion.text = "One day on VENOSS is longer than one year."

         -- make answers visible
        correctAnswer.text = "venus"
        wrongAnswer1.text = "vienus"
        wrongAnswer2.text = "vennis"
        wrongAnswer3.text = "veinos"

    -- if the random question number is 16, then ask question 
    elseif (randomQuestionNumber == 16) then

        -- make fist question visible
        textQuestion.text = "The UENIVERSSE is everything we can touch, feel and sense. "

         -- make answers visible
        correctAnswer.text = "universe"
        wrongAnswer1.text = "unieverce"
        wrongAnswer2.text = "unyvers"
        wrongAnswer3.text = "universce"

    -- if the random question number is 17, then ask question 
    elseif (randomQuestionNumber == 17) then

        -- make fist question visible
        textQuestion.text = "CUMMITTS are found traveling throughout space."

         -- make answers visible
        correctAnswer.text = "Comets"
        wrongAnswer1.text = "Commits"
        wrongAnswer2.text = "Cumits"
        wrongAnswer3.text = "Commetts"

    -- if the random question number is 18, then ask question 
    elseif (randomQuestionNumber == 18) then

        -- make fist question visible
        textQuestion.text = "A NEBUELLA is an interstellar cloud of dust."

         -- make answers visible
        correctAnswer.text = "nebula"
        wrongAnswer1.text = "nebuela"
        wrongAnswer2.text = "nibulla"
        wrongAnswer3.text = "neboula"

    -- if the random question number is 19, then ask question 
    elseif (randomQuestionNumber == 19) then

        -- make fist question visible
        textQuestion.text = "The MELKY Way is our galaxy."

         -- make answers visible
        correctAnswer.text = "Milky Way"
        wrongAnswer1.text = "Millcky Way"
        wrongAnswer2.text = "Malcy Way"
        wrongAnswer3.text = "Milkie Way"

    -- if the random question number is 20, then ask question 
    elseif (randomQuestionNumber == 20) then

        -- make fist question visible
        textQuestion.text = "A GALASI is a system of millions or billions of stars."

         -- make answers visible
        correctAnswer.text = "galaxy"
        wrongAnswer1.text = "galaxie"
        wrongAnswer2.text = "gallaxie"
        wrongAnswer3.text = "gallixy"    
        
    end
end

-- Function that changes the answers for a new question and places them randomly in one of the positions
local function DisplayRandomAnswers()

    local answerPosition = math.random(1,4)

    if (answerPosition == 1) then                
        
        correctAnswer.x = 700
        correctAnswer.y = 350      
        wrongAnswer1.x = 300 
        wrongAnswer1.y = 285
        wrongAnswer2.x = 700 
        wrongAnswer2.y = 285
        wrongAnswer3.x = 300 
        wrongAnswer3.y = 350

    elseif (answerPosition == 2) then
       
        correctAnswer.x = 300 
        correctAnswer.y = 350      
        wrongAnswer1.x = 700
        wrongAnswer1.y = 350
        wrongAnswer2.x = 300
        wrongAnswer2.y = 285
        wrongAnswer3.x = 700
        wrongAnswer3.y = 285

    elseif (answerPosition == 3) then
       
        correctAnswer.x = 700    
        correctAnswer.y = 285   
        wrongAnswer1.x = 300
        wrongAnswer1.y = 350
        wrongAnswer2.x = 700
        wrongAnswer2.y = 350
        wrongAnswer3.x = 300
        wrongAnswer3.y = 285

    else 
       
        correctAnswer.x = 300  
        correctAnswer.y = 285    
        wrongAnswer1.x = 700
        wrongAnswer1.y = 285
        wrongAnswer2.x = 300
        wrongAnswer2.y = 350
        wrongAnswer3.x = 700
        wrongAnswer3.y = 350
    end
end

local function RestartScene()

    alreadyClickedAnswer = false
    correct.isVisible = false
    incorrect.isVisible = false

    livesText.text = "Number of lives = " .. tostring(lives)
    numberCorrectText.text = "Number correct = " .. tostring(numberCorrect)

    -- if they have 0 lives, go to the You Lose screen
    if (lives == 0) then
        -- go to you lose
        composer.gotoScene("you_lose")
    elseif (numberCorrect == 3) then
        -- go to you win
        composer.gotoScene("you_win")
    else 
        AskQuestion()
        DisplayRandomAnswers()
    end

end

-- Functions that checks if the buttons have been clicked.
local function TouchListenerCorrectAnswer(touch)
    -- get the user answer from the text object that was clicked on
    local userAnswer = correctAnswer.text

    if (touch.phase == "ended") and (alreadyClickedAnswer == false) then

        alreadyClickedAnswer = true

        -- if the user gets the answer right, display Correct and call RestartSceneRight 
        correct.isVisible = true
        -- increase the number correct by 1
        numberCorrect = numberCorrect + 1
        -- call RestartScene after 1 second
        timer.performWithDelay( 1000, RestartScene )      

    end
end

local function TouchListenerWrongAnswer1(touch)
    -- get the user answer from the text object that was clicked on
    local userAnswer = wrongAnswer1.text

    if (touch.phase == "ended") and (alreadyClickedAnswer == false) then

        alreadyClickedAnswer = true


        incorrect.isVisible = true
        -- decrease a life
        lives = lives - 1
        -- call RestartScene after 1 second
        timer.performWithDelay( 1000, RestartScene )            
    end
end

local function TouchListenerWrongAnswer2(touch)
    -- get the user answer from the text object that was clicked on
    local userAnswer = wrongAnswer2.text

    if (touch.phase == "ended") and (alreadyClickedAnswer == false) then

        alreadyClickedAnswer = true


        incorrect.isVisible = true
        -- decrease a life
        lives = lives - 1
        -- call RestartScene after 1 second
        timer.performWithDelay( 1000, RestartScene )            
    end
end


local function TouchListenerWrongAnswer3(touch)
    -- get the user answer from the text object that was clicked on
    local userAnswer = wrongAnswer3.text

    if (touch.phase == "ended") and (alreadyClickedAnswer == false) then

        alreadyClickedAnswer = true
        incorrect.isVisible = true
        -- decrease a life
        lives = lives - 1
        -- call RestartScene after 1 second
        timer.performWithDelay( 1000, RestartScene )            
   

    end
end

-- Function that adds the touch listeners to each of the answer objects
local function AddTextObjectListeners()

    correctAnswer:addEventListener("touch", TouchListenerCorrectAnswer)
    wrongAnswer1:addEventListener("touch", TouchListenerWrongAnswer1)
    wrongAnswer2:addEventListener("touch", TouchListenerWrongAnswer2)
    wrongAnswer3:addEventListener("touch", TouchListenerWrongAnswer3)

end

-- Function that removes the touch listeners from each of the answer objects
local function RemoveTextObjectListeners()

    correctAnswer:removeEventListener("touch", TouchListenerCorrectAnswer)
    wrongAnswer1:removeEventListener("touch", TouchListenerWrongAnswer1)
    wrongAnswer2:removeEventListener("touch", TouchListenerWrongAnswer2)
    wrongAnswer3:removeEventListener("touch", TouchListenerWrongAnswer3)

end

-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    -- Insert the background image
    bkg_image = display.newImageRect("Images/Level1ScreenAmelieBOAbishaJ@2x.png", display.contentWidth, display.contentHeight)
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight

    -- Insert background image into the scene group in order to ONLY be associated with this scene
    


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

-------------------------------------------------------------------------------
-- OBJECT CREATION
-------------------------------------------------------------------------------
-- create image object for mute and unmute buttons
muteButton = display.newImageRect("Images/unmuteButtonPressedAmelieBo@2x .png", 60, 60)
muteButton.x = display.contentWidth*0.8/10
muteButton.y = display.contentHeight*9/10 
muteButton.isVisible = true

unmuteButton = display.newImageRect("Images/muteButtonUnpressedAmelieBo@2x .png", 60, 60)
unmuteButton.x = display.contentWidth*0.8/10
unmuteButton.y = display.contentHeight*9/10
unmuteButton.isVisible = true

-----------------------------------------------------------------------------------------
   -- display question 1
    instructionsText = display.newText( "Level 1- Click on the correct spelling", 515, 70, nil, 40)
    -- set the color of the text to be white
    instructionsText:setTextColor(1, 1, 1)

    -- display question 1
    textQuestion = display.newText( "", 500, 150, nil, 40)
    -- set the color of the text to be white
    textQuestion:setTextColor(1, 1, 1)


    -- display question 1
    correctAnswer = display.newText( "", 700, 350, nil, 40)
    -- set the color of the text to be white
    correctAnswer:setTextColor(1, 1, 1)

    -- display question 1
    wrongAnswer1 = display.newText( "", 300, 285, nil, 40)
    -- set the color of the text to be white
    wrongAnswer1:setTextColor(1, 1, 1)

    -- display question 1
    wrongAnswer2 = display.newText( "", 700, 285, nil, 40)
    -- set the color of the text to be white
    wrongAnswer2:setTextColor(1, 1, 1)

    -- display question 1
    wrongAnswer3 = display.newText( "", 300, 350, nil, 40)
    -- set the color of the text to be white
    wrongAnswer3:setTextColor(1, 1, 1)

    -- create the text object that will say Correct, set the colour and then hide it
    correct = display.newText("Correct", display.contentWidth/2, display.contentHeight/2, nil, 50 )
    correct:setTextColor(51/255, 255/255, 51/255)
    correct.isVisible = false

    -- create the text object that will say Correct, set the colour and then hide it
    incorrect = display.newText("Incorrect", display.contentWidth/2, display.contentHeight/2, nil, 50 )
    incorrect:setTextColor(242/255, 19/255, 19/255)
    incorrect.isVisible = false

     -- create the text object that will hold the number of lives
    livesText = display.newText("Number of lives =", display.contentWidth*4/5, display.contentHeight*8/9, nil, 25) 
    livesText:setTextColor(0, 0, 0)
    livesText.isVisible = true

    -- create the text object that will hold the number of correct answers
    numberCorrectText = display.newText("Number correct =", display.contentWidth*4/5, display.contentHeight*6/7, nil, 25)
    numberCorrectText:setTextColor(0, 0, 0)
    numberCorrectText.isVisible = true
-----------------------------------------------------------------------------------------


    -- Associating Buttons with this scene
    sceneGroup:insert( bkg_image ) 
    sceneGroup:insert( backButton )
    sceneGroup:insert( muteButton )
    sceneGroup:insert( unmuteButton )
    sceneGroup:insert( instructionsText )
    sceneGroup:insert( textQuestion)
    sceneGroup:insert( correctAnswer )
    sceneGroup:insert( wrongAnswer1 )
    sceneGroup:insert( wrongAnswer2 )
    sceneGroup:insert( wrongAnswer3 )
    sceneGroup:insert( correct )
    sceneGroup:insert( incorrect )
    sceneGroup:insert( livesText )
    sceneGroup:insert( numberCorrectText )
    
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

        -- initialize the number of lives and number correct 
        lives = 3
        numberCorrect = 0

        -- start the main menu screen music
        bkgSoundChannel = audio.play( bkgSound, { channel=2, loops=-1} )
        muteButton:addEventListener( "touch", Mute)
        unmuteButton:addEventListener( "touch", Unmute)
        RestartScene()
        AddTextObjectListeners()
    end

end --function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
        audio.stop(bkgSoundChannel)

        -- remove the listeners when leaving the scene
        RemoveTextObjectListeners()

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

end -- function scene:destroy( event )

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