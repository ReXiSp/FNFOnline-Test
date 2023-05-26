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
	
if curStep >= 512 and curStep < 896 then

    songPos = getSongPosition()
    local currentBeat = (songPos/3000)*(curBpm/19.5)
    noteTweenY('defaultPlayerStrumY0', 4, defaultPlayerStrumY0 + 150*math.sin((currentBeat+8*0.75)*math.pi), 0.6)
    noteTweenY('defaultPlayerStrumY1', 5, defaultPlayerStrumY1 - 150*math.sin((currentBeat+8*0.75)*math.pi), 0.6)
    noteTweenY('defaultPlayerStrumY2', 6, defaultPlayerStrumY2 + 150*math.sin((currentBeat+8*0.75)*math.pi), 0.6)
    noteTweenY('defaultPlayerStrumY3', 7, defaultPlayerStrumY3 - 150*math.sin((currentBeat+8*0.75)*math.pi), 0.6)

    noteTweenY('defaultOpponentStrum0', 0, defaultOpponentStrumY0 + 150*math.sin((currentBeat+8*0.75)*math.pi), 0.6)
    noteTweenY('defaultOpponentStrum1', 1, defaultOpponentStrumY1 - 150*math.sin((currentBeat+8*0.75)*math.pi), 0.6)
    noteTweenY('defaultOpponentStrum2', 2, defaultOpponentStrumY2 + 150*math.sin((currentBeat+8*0.75)*math.pi), 0.6)
    noteTweenY('defaultOpponentStrum3', 3, defaultOpponentStrumY3 - 150*math.sin((currentBeat+8*0.75)*math.pi), 0.6)
end
    if curStep == 896 then
		cancelTween('defaultPlayerStrumY0')
		cancelTween('defaultPlayerStrumY1')
		cancelTween('defaultPlayerStrumY2')
		cancelTween('defaultPlayerStrumY3')
		cancelTween('defaultOpponentStrum0')
		cancelTween('defaultOpponentStrum1')
		cancelTween('defaultOpponentStrum2')
		cancelTween('defaultOpponentStrum3')
        setPropertyFromGroup('opponentStrums', 0, 'y', defaultOpponentStrumY0);
        setPropertyFromGroup('opponentStrums', 1, 'y', defaultOpponentStrumY0);
        setPropertyFromGroup('opponentStrums', 2, 'y', defaultOpponentStrumY0);
        setPropertyFromGroup('opponentStrums', 3, 'y', defaultOpponentStrumY0);

        setPropertyFromGroup('playerStrums', 0, 'y', defaultOpponentStrumY0);
        setPropertyFromGroup('playerStrums', 1, 'y', defaultOpponentStrumY0);
        setPropertyFromGroup('playerStrums', 2, 'y', defaultOpponentStrumY0);
        setPropertyFromGroup('playerStrums', 3, 'y', defaultOpponentStrumY0);
    end
    if curStep >= 1408 and curStep < 1663 then
        songPos = getSongPosition()
        local currentBeat = (songPos/3000)*(curBpm/20)
        noteTweenX('defaultPlayerStrumX0', 4, defaultPlayerStrumX0 + 110*math.sin((currentBeat+7*0.05)*math.pi), 0.6)
        noteTweenX('defaultPlayerStrumX1', 5, defaultPlayerStrumX1 + 110*math.sin((currentBeat+7*0.05)*math.pi), 0.6)
        noteTweenX('defaultPlayerStrumX2', 6, defaultPlayerStrumX2 + 110*math.sin((currentBeat+7*0.05)*math.pi), 0.6)
        noteTweenX('defaultPlayerStrumX3', 7, defaultPlayerStrumX3 + 110*math.sin((currentBeat+7*0.05)*math.pi), 0.6)
        
        noteTweenY('defaultPlayerStrumY0', 4, defaultPlayerStrumY0 + 20*math.sin((currentBeat+1*0.25)*math.pi), 0.6)
        noteTweenY('defaultPlayerStrumY1', 5, defaultPlayerStrumY1 + 20*math.sin((currentBeat+2*0.25)*math.pi), 0.6)
        noteTweenY('defaultPlayerStrumY2', 6, defaultPlayerStrumY2 + 20*math.sin((currentBeat+3*0.25)*math.pi), 0.6)
        noteTweenY('defaultPlayerStrumY3', 7, defaultPlayerStrumY3 + 20*math.sin((currentBeat+4*0.25)*math.pi), 0.6)
    
        noteTweenX('defaultOpponentStrumX0', 0, defaultOpponentStrumX0 + 110*math.sin((currentBeat+7*0.05)*math.pi), 0.6)
        noteTweenX('defaultOpponentStrumX1', 1, defaultOpponentStrumX1 + 110*math.sin((currentBeat+7*0.05)*math.pi), 0.6)
        noteTweenX('defaultOpponentStrumX2', 2, defaultOpponentStrumX2 + 110*math.sin((currentBeat+7*0.05)*math.pi), 0.6)
        noteTweenX('defaultOpponentStrumX3', 3, defaultOpponentStrumX3 + 110*math.sin((currentBeat+7*0.05)*math.pi), 0.6)
        
        noteTweenY('defaultOpponentStrum0', 0, defaultOpponentStrumY0 + 20*math.sin((currentBeat+1*0.25)*math.pi), 0.6)
        noteTweenY('defaultOpponentStrum1', 1, defaultOpponentStrumY1 + 20*math.sin((currentBeat+2*0.25)*math.pi), 0.6)
        noteTweenY('defaultOpponentStrum2', 2, defaultOpponentStrumY2 + 20*math.sin((currentBeat+3*0.25)*math.pi), 0.6)
        noteTweenY('defaultOpponentStrum3', 3, defaultOpponentStrumY3 + 20*math.sin((currentBeat+4*0.25)*math.pi), 0.6)
    end 
    if curStep == 1663 then
		cancelTween('defaultPlayerStrumY0')
		cancelTween('defaultPlayerStrumY1')
		cancelTween('defaultPlayerStrumY2')
		cancelTween('defaultPlayerStrumY3')
		cancelTween('defaultOpponentStrum0')
		cancelTween('defaultOpponentStrum1')
		cancelTween('defaultOpponentStrum2')
		cancelTween('defaultOpponentStrum3')
        setPropertyFromGroup('opponentStrums', 0, 'y', defaultOpponentStrumY0);
        setPropertyFromGroup('opponentStrums', 1, 'y', defaultOpponentStrumY0);
        setPropertyFromGroup('opponentStrums', 2, 'y', defaultOpponentStrumY0);
        setPropertyFromGroup('opponentStrums', 3, 'y', defaultOpponentStrumY0);

        setPropertyFromGroup('playerStrums', 0, 'y', defaultOpponentStrumY0);
        setPropertyFromGroup('playerStrums', 1, 'y', defaultOpponentStrumY0);
        setPropertyFromGroup('playerStrums', 2, 'y', defaultOpponentStrumY0);
        setPropertyFromGroup('playerStrums', 3, 'y', defaultOpponentStrumY0);

        setPropertyFromGroup('opponentStrums', 0, 'x', defaultOpponentStrumX0);
        setPropertyFromGroup('opponentStrums', 1, 'x', defaultOpponentStrumX1);
        setPropertyFromGroup('opponentStrums', 2, 'x', defaultOpponentStrumX2);
        setPropertyFromGroup('opponentStrums', 3, 'x', defaultOpponentStrumX3);

        setPropertyFromGroup('playerStrums', 0, 'x', defaultPlayerStrumX0);
        setPropertyFromGroup('playerStrums', 1, 'x', defaultPlayerStrumX1);
        setPropertyFromGroup('playerStrums', 2, 'x', defaultPlayerStrumX2);
        setPropertyFromGroup('playerStrums', 3, 'x', defaultPlayerStrumX3);
    end
    if curStep >= 1664 and curStep < 2176 then
        songPos = getSongPosition()
        local currentBeat = (songPos/3000)*(curBpm/19.5)
        setPropertyFromGroup('playerStrums', 0, 'x', defaultPlayerStrumX0);
        setPropertyFromGroup('playerStrums', 1, 'x', defaultPlayerStrumX1);
        setPropertyFromGroup('playerStrums', 2, 'x', defaultPlayerStrumX2);
        setPropertyFromGroup('playerStrums', 3, 'x', defaultPlayerStrumX3);
        noteTweenY('defaultPlayerStrumY0', 4, defaultPlayerStrumY0 + 150*math.sin((currentBeat+8*0.75)*math.pi), 0.6)
        noteTweenY('defaultPlayerStrumY1', 5, defaultPlayerStrumY1 - 150*math.sin((currentBeat+8*0.75)*math.pi), 0.6)
        noteTweenY('defaultPlayerStrumY2', 6, defaultPlayerStrumY2 + 150*math.sin((currentBeat+8*0.75)*math.pi), 0.6)
        noteTweenY('defaultPlayerStrumY3', 7, defaultPlayerStrumY3 - 150*math.sin((currentBeat+8*0.75)*math.pi), 0.6)
    
        noteTweenY('defaultOpponentStrum0', 0, defaultOpponentStrumY0 + 150*math.sin((currentBeat+8*0.75)*math.pi), 0.6)
        noteTweenY('defaultOpponentStrum1', 1, defaultOpponentStrumY1 - 150*math.sin((currentBeat+8*0.75)*math.pi), 0.6)
        noteTweenY('defaultOpponentStrum2', 2, defaultOpponentStrumY2 + 150*math.sin((currentBeat+8*0.75)*math.pi), 0.6)
        noteTweenY('defaultOpponentStrum3', 3, defaultOpponentStrumY3 - 150*math.sin((currentBeat+8*0.75)*math.pi), 0.6)
    end
    if curStep == 2176 then
		cancelTween('defaultPlayerStrumY0')
		cancelTween('defaultPlayerStrumY1')
		cancelTween('defaultPlayerStrumY2')
		cancelTween('defaultPlayerStrumY3')
		cancelTween('defaultOpponentStrum0')
		cancelTween('defaultOpponentStrum1')
		cancelTween('defaultOpponentStrum2')
		cancelTween('defaultOpponentStrum3')
        setPropertyFromGroup('opponentStrums', 0, 'y', defaultOpponentStrumY0);
        setPropertyFromGroup('opponentStrums', 1, 'y', defaultOpponentStrumY0);
        setPropertyFromGroup('opponentStrums', 2, 'y', defaultOpponentStrumY0);
        setPropertyFromGroup('opponentStrums', 3, 'y', defaultOpponentStrumY0);

        setPropertyFromGroup('playerStrums', 0, 'y', defaultOpponentStrumY0);
        setPropertyFromGroup('playerStrums', 1, 'y', defaultOpponentStrumY0);
        setPropertyFromGroup('playerStrums', 2, 'y', defaultOpponentStrumY0);
        setPropertyFromGroup('playerStrums', 3, 'y', defaultOpponentStrumY0);

        setPropertyFromGroup('opponentStrums', 0, 'x', defaultOpponentStrumX0);
        setPropertyFromGroup('opponentStrums', 1, 'x', defaultOpponentStrumX1);
        setPropertyFromGroup('opponentStrums', 2, 'x', defaultOpponentStrumX2);
        setPropertyFromGroup('opponentStrums', 3, 'x', defaultOpponentStrumX3);

        setPropertyFromGroup('playerStrums', 0, 'x', defaultPlayerStrumX0);
        setPropertyFromGroup('playerStrums', 1, 'x', defaultPlayerStrumX1);
        setPropertyFromGroup('playerStrums', 2, 'x', defaultPlayerStrumX2);
        setPropertyFromGroup('playerStrums', 3, 'x', defaultPlayerStrumX3);
        end
end
