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
	local currentBeat = (songPos/3000)*(curBpm/40)
	--noteTweenY('defaultOpponentStrum0', 0, defaultOpponentStrumY0 + 50*math.sin((currentBeat+8*0.25)*math.pi), 0.6)
	--noteTweenY('defaultOpponentStrum1', 1, defaultOpponentStrumY1 + 50*math.sin((currentBeat+7*0.25)*math.pi), 0.6)
	--noteTweenY('defaultOpponentStrum2', 2, defaultOpponentStrumY2 + 50*math.sin((currentBeat+6*0.25)*math.pi), 0.6)
	--noteTweenY('defaultOpponentStrum3', 3, defaultOpponentStrumY3 + 50*math.sin((currentBeat+5*0.25)*math.pi), 0.6)

	--noteTweenY('defaultPlayerStrum0', 4, defaultPlayerStrumY0 + 50*math.sin((currentBeat+8*0.25)*math.pi), 0.6)
	--noteTweenY('defaultPlayerStrum1', 5, defaultPlayerStrumY1 + 50*math.sin((currentBeat+7*0.25)*math.pi), 0.6)
	--noteTweenY('defaultPlayerStrum2', 6, defaultPlayerStrumY2 + 50*math.sin((currentBeat+6*0.25)*math.pi), 0.6)
	--noteTweenY('defaultPlayerStrum3', 7, defaultPlayerStrumY3 + 50*math.sin((currentBeat+5*0.25)*math.pi), 0.6)
	
	noteTweenX('defaultOpponentStrum0', 0, defaultOpponentStrumX0 + 50*math.cos((currentBeat+8*0.25)*math.pi), 1.2)
	noteTweenX('defaultOpponentStrum1', 1, defaultOpponentStrumX1 + 50*math.cos((currentBeat+7*0.25)*math.pi), 1.2)
	noteTweenX('defaultOpponentStrum2', 2, defaultOpponentStrumX2 + 50*math.cos((currentBeat+6*0.25)*math.pi), 1.2)
	noteTweenX('defaultOpponentStrum3', 3, defaultOpponentStrumX3 + 50*math.cos((currentBeat+5*0.25)*math.pi), 1.2)

	noteTweenX('defaultPlayerStrum0', 4, defaultPlayerStrumX0 + 50*math.cos((currentBeat+8*0.25)*math.pi), 1.2)
	noteTweenX('defaultPlayerStrum1', 5, defaultPlayerStrumX1 + 50*math.cos((currentBeat+7*0.25)*math.pi), 1.2)
	noteTweenX('defaultPlayerStrum2', 6, defaultPlayerStrumX2 + 50*math.cos((currentBeat+6*0.25)*math.pi), 1.2)
	noteTweenX('defaultPlayerStrum3', 7, defaultPlayerStrumX3 + 50*math.cos((currentBeat+5*0.25)*math.pi), 1.2)

	
end
