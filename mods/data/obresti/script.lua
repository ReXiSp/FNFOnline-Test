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

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then
		startDialogue('dialogue', '');
		elseif tag == 'startDialogueEnd' then
		startDialogue('dialogueEnd', '');
	end
end

function onUpdate(elapsed)

	songPos = getSongPosition()
	local currentBeat = (songPos/3000)*(curBpm/20)
	noteTweenY('defaultOpponentStrum0', 0, defaultOpponentStrumY0 + 50*math.sin((currentBeat+8*0.25)*math.pi), 0.6)
	noteTweenY('defaultOpponentStrum1', 1, defaultOpponentStrumY1 + 50*math.sin((currentBeat+7*0.25)*math.pi), 0.6)
	noteTweenY('defaultOpponentStrum2', 2, defaultOpponentStrumY2 + 50*math.sin((currentBeat+6*0.25)*math.pi), 0.6)
	noteTweenY('defaultOpponentStrum3', 3, defaultOpponentStrumY3 + 50*math.sin((currentBeat+5*0.25)*math.pi), 0.6)

	noteTweenY('defaultPlayerStrum0', 4, defaultPlayerStrumY0 + 50*math.sin((currentBeat+8*0.25)*math.pi), 0.6)
	noteTweenY('defaultPlayerStrum1', 5, defaultPlayerStrumY1 + 50*math.sin((currentBeat+7*0.25)*math.pi), 0.6)
	noteTweenY('defaultPlayerStrum2', 6, defaultPlayerStrumY2 + 50*math.sin((currentBeat+6*0.25)*math.pi), 0.6)
	noteTweenY('defaultPlayerStrum3', 7, defaultPlayerStrumY3 + 50*math.sin((currentBeat+5*0.25)*math.pi), 0.6)
	
	--noteTweenX('defaultOpponentStrum4', 0, defaultOpponentStrumX0 + 150*math.cos((currentBeat+8*0.25)*math.pi), 0.6)
	--noteTweenX('defaultOpponentStrum5', 1, defaultOpponentStrumX1 - 150*math.cos((currentBeat+8*0.25)*math.pi), 0.6)
	--noteTweenX('defaultOpponentStrum6', 2, defaultOpponentStrumX2 + 150*math.cos((currentBeat+8*0.25)*math.pi), 0.6)
	--noteTweenX('defaultOpponentStrum7', 3, defaultOpponentStrumX3 - 150*math.cos((currentBeat+8*0.25)*math.pi), 0.6)

	
end
