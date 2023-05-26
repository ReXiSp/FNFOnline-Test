local allowCountdown = false
local startedFirstDialogue = false
local startedEndDialogue = false
function onStartCountdown()
	if not allowCountdown and isStoryMode and not startedFirstDialogue then
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



if curStep == 760 then
    setProperty('defaultCamZoom',1.3);
    setPropertyFromGroup('strumLineNotes', 0, 'alpha', 0);
    setPropertyFromGroup('strumLineNotes', 1, 'alpha', 0);
    setPropertyFromGroup('strumLineNotes', 2, 'alpha', 0);
    setPropertyFromGroup('strumLineNotes', 3, 'alpha', 0);
    setPropertyFromGroup('strumLineNotes', 4, 'alpha', 0);
    setPropertyFromGroup('strumLineNotes', 5, 'alpha', 0);
    setPropertyFromGroup('strumLineNotes', 6, 'alpha', 0);
    setPropertyFromGroup('strumLineNotes', 7, 'alpha', 0);

end
if curStep == 767 then
    setProperty('defaultCamZoom',0.8);
    setPropertyFromGroup('strumLineNotes', 0, 'alpha', 1);
    setPropertyFromGroup('strumLineNotes', 1, 'alpha', 1);
    setPropertyFromGroup('strumLineNotes', 2, 'alpha', 1);
    setPropertyFromGroup('strumLineNotes', 3, 'alpha', 1);
    setPropertyFromGroup('strumLineNotes', 4, 'alpha', 1);
    setPropertyFromGroup('strumLineNotes', 5, 'alpha', 1);
    setPropertyFromGroup('strumLineNotes', 6, 'alpha', 1);
    setPropertyFromGroup('strumLineNotes', 7, 'alpha', 1);

end
end


function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.1 then
		setProperty('health', health- 0.01);
    end
end