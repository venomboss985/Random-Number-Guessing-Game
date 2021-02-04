-- RANDOM GUESSING GAME VER.1.0
--    Made by @venomboss985

math.randomseed(os.time())
randNum = math.random(1, 100)
guessCounter = -1
lives = 11
guess = 0
choice = 0
cusGamemode = 0
cusRange = 0
cusLives = 0

-- MAIN MENU AND GAME LOGIC FOR EVERYTHING

repeat
    -- MAIN MENU
    io.write("\nGUESS THAT NUMBER v1.0\n")
    io.write("How would you like to play?\n")
    io.write("1: 10 guesses\n")
    io.write("2: Least guesses\n")
    io.write("3: Custom game\n")
    io.write("4: Settings (WIP)\n")
    io.write("5: Quit\n")
    io.write("Enter your choice: ")
    while (choice == 0) do
        choice = tonumber(io.read())
        if (type(choice) ~= type(lives)) then
            choice = 0
            io.write("\nTry again: ")
        end
    end

    -- LIMITED GUESSES GAME LOGIC
    if (choice == 1) then
        lives = 11
        randNum = math.random(1, 100)
        repeat
            lives = lives-1
            io.write("\nEnter your guess (", lives, "): ")
            guess = tonumber(io.read())
            if (guess < randNum) then
                io.write("\nToo low... try again")
            elseif (guess > randNum) then
                io.write("\nToo high... try again")
            end
        until (guess == randNum) or (lives == 0)
        if (lives == 0) then
            io.write("\nYou ran out of guesses, the correct number was: ", randNum, "\n")
        elseif (guess == randNum) then
            io.write("\nCongrats, you guessed the number correctly with ", lives, " guesses remaining!\n")
        end
        choice = 0
        guess = 0

    -- LEAST GUESSES GAME LOGIC
    elseif (choice == 2) then
        randNum = math.random(1, 100)
        repeat
            guessCounter = guessCounter+1
            io.write("\nEnter your guess (", guessCounter, "): ")
            guess = tonumber(io.read())
            if (guess < randNum) then
                io.write("\nToo low... try again")
            elseif (guess > randNum) then
                io.write("\nToo high... try again")
            end
        until (guess == randNum)
        if (guessCounter == 0) then
            io.write("\nDamn, first try! Good job!\n")
        else
            io.write("\nYou guessed the right number after ", guessCounter, " attempt(s)!\n")
        end
        choice = 0
        guessCounter = -1
        guess = 0

    -- CUSTOM GAMEMODE LOGIC
    elseif (choice == 3) then
        repeat
            io.write("\nCUSTOM GAMEMODE\n")
            io.write("1. Limited guesses\n")
            io.write("2. Least guesses\n")
            io.write("3. Choose for me\n")
            io.write("4. Go back\n")
            io.write("Choose your preferred gamemode: ")
            while (cusGamemode == 0) do
                cusGamemode = tonumber(io.read())
                if (type(cusGamemode) ~= type(lives)) then
                    cusGamemode = 0
                    io.write("\nTry again: ")
                end
            end
        until (cusGamemode ~= 0)

        -- GAMEMODE SELECTION
        if (cusGamemode == 1) then
            randChoice = 1
        elseif (cusGamemode == 2) then
            randChoice = 2
        elseif (cusGamemode == 3) then
            randChoice = math.random(1,2)
        elseif (cusGamemode == 4)then
            io.write("\nGoing back to main menu...\n")
            cusGamemode = 0
            choice = 0
        end

        -- LIMITED LIVES CUSTOM GAME
        if (randChoice == 1) then
            -- Customization menu
            io.write("\nYou selected LIMITED GUESSES.\n")
            -- Select random range
            repeat
                io.write("What range would you like to play in: ")

                while (cusRange == 0) do
                    cusRange = tonumber(io.read())
                    if (type(cusRange) ~= type(lives)) then
                        cusRange = 0
                        io.write("\nTry again: ")
                    end
                end
            until (cusRange ~= 0)
            io.write("\nYou chose a range between 0 and ", cusRange, ".\n")
            
            -- Select lives
            io.write("How many guesses do you want: ")
            repeat
                while (cusLives == 0) do
                    cusLives = tonumber(io.read())
                    if (type(cusLives) ~= type(lives)) then
                        cusLives = 0
                        io.write("\nTry again: ")
                    end
                end
            until (cusLives ~= 0)
            io.write("You have ", cusLives, " guesses, good luck!")

            lives = cusLives+1
            randNum = math.random(1, cusRange)

            -- Actual game logic
            repeat
                lives = lives-1
                io.write("\nEnter your guess (", lives, "): ")
                guess = tonumber(io.read())
                if (guess < randNum) then
                    io.write("\nToo low... try again")
                elseif (guess > randNum) then
                    io.write("\nToo high... try again")
                end
            until (guess == randNum) or (lives == 0)

            if (lives == 0) then
                io.write("\nYou ran out of guesses, the correct number was: ", randNum, "\n")
            elseif (guess == randNum) then
                io.write("\nCongrats, you guessed the number correctly with ", lives, " guesses remaining!\n")
            end
            randChoice = 0
            choice = 0
            cusGamemode = 0
            guess = 0

        -- LEAST GUESSES CUSTOM GAME
        elseif (randChoice == 2) then
            -- Customization menu
            io.write("\nYou selected LEAST GUESSES.\n")
            -- Select random range
            repeat
                io.write("What range would you like to play in: ")

                while (cusRange == 0) do
                    cusRange = tonumber(io.read())
                    if (type(cusRange) ~= type(lives)) then
                        cusRange = 0
                        io.write("\nTry again: ")
                    end
                end
            until (cusRange ~= 0)
            io.write("\nYou chose a range between 0 and ", cusRange, ".\n")

            randNum = math.random(1, cusRange)

            -- Actual game logic
            repeat
                guessCounter = guessCounter+1
                io.write("\nEnter your guess (", guessCounter, "): ")
                guess = tonumber(io.read())
                if (guess < randNum) then
                    io.write("\nToo low... try again")
                elseif (guess > randNum) then
                    io.write("\nToo high... try again")
                end
            until (guess == randNum)
            if (guessCounter == 0) then
                io.write("\nDamn, first try! Good job!\n")
            else
                io.write("\nYou guessed the right number after ", guessCounter, " attempts!\n")
            end

            randChoice = 0
            choice = 0
            cusGamemode = 0
            guessCounter = -1
            guess = 0
        end
    -- SETTINGS MENU
    elseif (choice == 4) then
        -- Settings logic
        io.write("\nWIP\n")
    end
until (choice == 5)
io.write("\nThanks for playing!\n")
