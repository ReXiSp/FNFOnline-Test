local allowCountdown = false
local startedFirstDialogue = false
local startedEndDialogue = false

local sound1 = false;
local sound2 = false;

function onStartCountdown()
	if not allowCountdown and isStoryMode and not startedFirstDialogue then
	--if not allowCountdown and not startedFirstDialogue then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		startedFirstDialogue = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onEndSong()
	if not allowCountdown and isStoryMode and not startedEndDialogue then
		setProperty('inCutscene', true);
		runTimer('startDialogueEnd', 0.8);
		startedEndDialogue = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then
		startDialogue('dialogue', '');
		elseif tag == 'startDialogueEnd' then
		startDialogue('dialogueEnd', '');
	end
end

function onUpdate(elapsed)
    

if curStep == 1179 and sound1 == false then
	playSound('silfavoice',0.5);
	sound1 = true;
end
if curStep == 1189 and sound2 == false then
	playSound('glassbreak2',1.2);
	sound2 = true;
end

end


    --function Checking()
        --downScroll = getPropertyClass('ClientPrefs', 'downScroll');
    --end
