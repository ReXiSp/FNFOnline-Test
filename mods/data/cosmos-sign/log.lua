local allowCountdown = false
local JPmode = true;
local allowEndShit = false
function onCreatePost()
	JPmode = getPropertyFromClass('ClientPrefs', 'jpmode')
	addLuaScript("Dialog-lua/Main")
	setProperty('camFollowPos.x',460)
	setProperty('camFollowPos.y',486)
	if isStoryMode and not seenCutscene then
		makeLuaSprite('CutBlack', '', 0, 0)
	    makeGraphic('CutBlack', screenWidth, screenHeight, '000000')
    	setObjectCamera('CutBlack', 'camHUD')
		addLuaSprite('CutBlack', false)
	end
end

function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

--[[function onEndSong()
    if not allowEndShit and isStoryMode then
		runTimer('startDialogueE', 0.8);
        allowEndShit = true;
        return Function_Stop;
    end
    return Function_Continue;
end]]

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		if JPmode then
			triggerEvent('StartJPDialogue','Cosmos Sign J-S');
		else
			triggerEvent('StartJPDialogue','Cosmos Sign E-S');
		end
	end
	if tag == 'startDialogueE' then -- Timer completed, play dialogue
		if JPmode then
			triggerEvent('StartJPDialogue','Cosmos Sign J-E');
		else
			triggerEvent('StartJPDialogue','Cosmos Sign E-E');
		end
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end

function onEvent(n, v1, v2)
	if n == "skipJPDialogue" then
		debugPrint('error!')
		allowCountdown = true
        startCountdown()
	end
	if n == "EndJPDialogue" then
		--debugPrint(v1)
		if v1 == "Cosmos Sign J-S" or v1 == "Cosmos Sign E-S" then
			allowCountdown = true
        	startCountdown()
		elseif v1 == "Cosmos Sign J-E" or v1 == "Cosmos Sign E-E" then
			allowEndShit = true
			endSong()
		end
	end
end

--function onUpdatePost()
	--debugPrint(getProperty('camFollowPos.x').."I"..getProperty('camFollowPos.y'))
--end