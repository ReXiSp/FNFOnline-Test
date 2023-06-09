local allowCountdown = false
local JPmode = true;
local allowEndShit = false
function onCreatePost()
	JPmode = getPropertyFromClass('ClientPrefs', 'jpmode')
	addLuaScript("Dialog-lua/Main")
	setProperty('camFollowPos.x',930)
	setProperty('camFollowPos.y',230)
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

function onEndSong()
    if not allowEndShit and isStoryMode then
		runTimer('startDialogueE', 0.8);
        allowEndShit = true;
        return Function_Stop;
    end
    return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		if JPmode then
			triggerEvent('StartJPDialogue','Lost Oneself J-S');
		else
			triggerEvent('StartJPDialogue','Lost Oneself E-S');
		end
	end
	if tag == 'startDialogueE' then -- Timer completed, play dialogue
		if JPmode then
			triggerEvent('StartJPDialogue','Lost Oneself J-E');
		else
			triggerEvent('StartJPDialogue','Lost Oneself E-E');
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
		if v1 == "Lost Oneself J-S" or v1 == "Lost Oneself E-S" then
			allowCountdown = true
        	startCountdown()
		elseif v1 == "Lost Oneself J-E" or v1 == "Lost Oneself E-E" then
			allowEndShit = true
			endSong()
		end
	end
end

function onUpdatePost()
	--debugPrint(getProperty('camFollowPos.x').."I"..getProperty('camFollowPos.y'))
end