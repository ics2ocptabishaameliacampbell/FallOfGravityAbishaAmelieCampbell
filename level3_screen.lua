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
sceneName = "level3_screen"

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
        textQuestion.text = "How many people have been on the moon?"

         -- make answers visible
        correctAnswer.text = "12"
        wrongAnswer1.text = "10"
        wrongAnswer2.text = "5"
        wrongAnswer3.text = "3"

    -- if the random question number is 2, then ask question 
    elseif (randomQuestionNumber == 2) then

        -- make fist question visible
        textQuestion.text = "What planet is closest to the sun?"

         -- make answers visible
        correctAnswer.text = "Mercury"
        wrongAnswer1.text = "Mars"
        wrongAnswer2.text = "Jupiter"
        wrongAnswer3.text = "Earth"

    -- if the random question number is 3, then ask question 
    elseif (randomQuestionNumber == 3) then

        -- make fist question visible
        textQuestion.text = "How many planets are in our solar system?"

         -- make answers visible
        correctAnswer.text = "  8 "
        wrongAnswer1.text = "  9 "
        wrongAnswer2.text = "  10 "
        wrongAnswer3.text = "  12 "

    -- if the random question number is 4, then ask question 
    elseif (randomQuestionNumber == 4) then

        -- make fist question visible
        textQuestion.text = "Which planet is known as “The red planet”?"

         -- make answers visible
        correctAnswer.text = "    Mars  "
        wrongAnswer1.text = "    Jupiter  "
        wrongAnswer2.text = "    Earth  "
        wrongAnswer3.text = "    Neptune  "

    -- if the random question number is 5, then ask question 
    elseif (randomQuestionNumber == 5) then

        -- make fist question visible
        textQuestion.text = "Which planet are we on?"

         -- make answers visible
        correctAnswer.text = "Earth"
        wrongAnswer1.text = "Saturn"
        wrongAnswer2.text = "Mercury"
        wrongAnswer3.text = "Mars"

        -- if the random question number is 6, then ask question 
    elseif (randomQuestionNumber == 6) then

        -- make fist question visible
        textQuestion.text = "What planet is most famous for its ring?"

         -- make answers visible
        correctAnswer.text = "Saturn"
        wrongAnswer1.text = "Mercury"
        wrongAnswer2.text = "Jupiter"
        wrongAnswer3.text = "Uranus"

    -- if the random question number is 7, then ask question 
    elseif (randomQuestionNumber == 7) then

        -- make fist question visible
        textQuestion.text = " What is the star in our solar system called?"

         -- make answers visible
        correctAnswer.text = "The Sun"
        wrongAnswer1.text = "Red Giant"
        wrongAnswer2.text = "Star"
        wrongAnswer3.text = "Meteor"

    -- if the random question number is 8, then ask question 
    elseif (randomQuestionNumber == 8) then

        -- make fist question visible
        textQuestion.text = "What is the biggest planet in our solar system?"

         -- make answers visible
        correctAnswer.text = "Jupiter"
        wrongAnswer1.text = "Saturn"
        wrongAnswer2.text = "Earth"
        wrongAnswer3.text = "Venus"

    -- if the random question number is 9, then ask question 
    elseif (randomQuestionNumber == 9) then

        -- make fist question visible
        textQuestion.text = "What planet is closest to the sun?"

         -- make answers visible
        correctAnswer.text = "Mercury"
        wrongAnswer1.text = "Mars"
        wrongAnswer2.text = "Jupiter"
        wrongAnswer3.text = "Earth"

    -- if the random question number is 10, then ask question 
    elseif (randomQuestionNumber == 10) then

        -- make fist question visible
        textQuestion.text = "How many moons does saturn have?"

         -- make answers visible
        correctAnswer.text = "62"
        wrongAnswer1.text = "1"
        wrongAnswer2.text = "3"
        wrongAnswer3.text = "510"

    -- if the random question number is 11, then ask question 
    elseif (randomQuestionNumber == 11) then

        -- make fist question visible
        textQuestion.text = "What is our galaxy called?"

         -- make answers visible
        correctAnswer.text = "The Milky Way "
        wrongAnswer1.text = "The Starry Galaxy"
        wrongAnswer2.text = "Galaxy Studios"
        wrongAnswer3.text = "The Ice Cream Way"

    -- if the random question number is 12, then ask question 
    elseif (randomQuestionNumber == 12) then

        -- make fist question visible
        textQuestion.text = " What is another word for alien?"

         -- make answers visible
        correctAnswer.text = "extraterrestrial "
        wrongAnswer1.text = "monster"
        wrongAnswer2.text = "space invader"
        wrongAnswer3.text = "teranisaurus rex"

    -- if the random question number is 13, then ask question 
    elseif (randomQuestionNumber == 13) then

        -- make fist question visible
        textQuestion.text = "What planet is blue"

         -- make answers visible
        correctAnswer.text = "Uranus"
        wrongAnswer1.text = "Saturn"
        wrongAnswer2.text = "Earth"
        wrongAnswer3.text = "Pluto"

    -- if the random question number is 14, then ask question 
    elseif (randomQuestionNumber == 14) then

        -- make fist question visible
        textQuestion.text = "How long does it take the earth to do one\nrevolution of the sun?"

         -- make answers visible
        correctAnswer.text = "365 Days"
        wrongAnswer1.text = "56 Days"
        wrongAnswer2.text = "1 Day"
        wrongAnswer3.text = "2 Days"

    -- if the random question number is 15, then ask question 
    elseif (randomQuestionNumber == 15) then

        -- make fist question visible
        textQuestion.text = "What planet is the furthest from the sun?"

         -- make answers visible
        correctAnswer.text = "Neptune"
        wrongAnswer1.text = "Venus"
        wrongAnswer2.text = "Saturn"
        wrongAnswer3.text = "Uranus"

    -- if the random question number is 16, then ask question 
    elseif (randomQuestionNumber == 16) then

        -- make fist question visible
        textQuestion.text = "Who was the first person to walk on the moon?"

         -- make answers visible
        correctAnswer.text = "Neil Armstrong"
        wrongAnswer1.text = "Buzz Aldrin"
        wrongAnswer2.text = "Chris Hadfield"
        wrongAnswer3.text = "Yuri Gagarin"

    -- if the random question number is 17, then ask question 
    elseif (randomQuestionNumber == 17) then

        -- make fist question visible
        textQuestion.text = "What is the name of the force holding us to\nthe Earth?"

         -- make answers visible
        correctAnswer.text = "Gravity"
        wrongAnswer1.text = "The Force"
        wrongAnswer2.text = "Earth"
        wrongAnswer3.text = "Ground"

    -- if the random question number is 18, then ask question 
    elseif (randomQuestionNumber == 18) then

        -- make fist question visible
        textQuestion.text = "What is the biggest planet in our solar\nsystem?"

         -- make answers visible
        correctAnswer.text = "Jupiter"
        wrongAnswer1.text = "Neptune"
        wrongAnswer2.text = "Uranus"
        wrongAnswer3.text = "Saturn"

    -- if the random question number is 19, then ask question 
    elseif (randomQuestionNumber == 19) then

        -- make fist question visible
        textQuestion.text = "What is the smallest planet in our solar\nsystem?"

         -- make answers visible
        correctAnswer.text = "Mercury"
        wrongAnswer1.text = "Pluto"
        wrongAnswer2.text = "Moon"
        wrongAnswer3.text = "Mars"

    -- if the random question number is 20, then ask question 
    elseif (randomQuestionNumber == 20) then

        -- make fist question visible
        textQuestion.text = "What does  ISS stand for?"

         -- make answers visible
        correctAnswer.text = "International Space\nStation"
        wrongAnswer1.text = "International States\nScience"
        wrongAnswer2.text = "Inexplicable Science\nSector"
        wrongAnswer3.text = "International Space\nSchool"    
        
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
        composer.gotoScene("you_lose3")
    elseif (numberCorrect == 3) then
        -- go to you win
        composer.gotoScene("you_win3")

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
    bkg_image = display.newImageRect("Images/Level3ScreenYourName@2x.png", display.contentWidth, display.contentHeight)
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
    instructionsText = display.newText( "Level 3- Click on the correct answer", 515, 70, nil, 40)
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

    -- create character
    character = display.newImageRect("Images/AlexAbishaJ@2x.png", 100, 150)
    character.x = display.contentWidth/2.1
    character.y = display.contentHeight/1.2

    -- create spaceship
    ship = display.newImageRect("Images/RainbowsShipAbishaJ@2x.png", 230, 430)
    ship.x = display.contentWidth/4
    ship.y = display.contentHeight/1.2
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
    sceneGroup:insert( character )
    sceneGroup:insert( ship )
    
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