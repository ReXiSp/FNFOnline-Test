local allowCountdown = false
local startedFirstDialogue = false
local startedEndDialogue = false
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
	
	if difficulty == 2 then
		if curStep == 672 then
			if middlescroll == false then
				noteTweenX(defaultOpponentStrumX0, 0, -1000, 3, 'linear')
				noteTweenX(defaultOpponentStrumX1, 1, -1000, 3, 'linear')
				noteTweenX(defaultOpponentStrumX2, 2, -1000, 3, 'linear')
				noteTweenX(defaultOpponentStrumX3, 3, -1000, 3, 'linear')
				noteTweenAngle('defaultPlayerStrum0', 0, 360, 3, 'linear')
				noteTweenAngle('defaultPlayerStrum1', 1, 360, 3, 'linear')
				noteTweenAngle('defaultPlayerStrum2', 2, 360, 3, 'linear')
				noteTweenAngle('defaultPlayerStruX3', 3, 360, 3, 'linear')
			else
				noteTweenX(defaultOpponentStrumX0, 0, -1000, 3, 'linear')
				noteTweenX(defaultOpponentStrumX1, 1, -1000, 3, 'linear')
				noteTweenX(defaultOpponentStrumX2, 2, 2280, 3, 'linear')
				noteTweenX(defaultOpponentStrumX3, 3, 2280, 3, 'linear')
				noteTweenAngle('defaultPlayerStrum0', 0, 360, 3, 'linear')
				noteTweenAngle('defaultPlayerStrum1', 1, 360, 3, 'linear')
				noteTweenAngle('defaultPlayerStrum2', 2, 360, 3, 'linear')
				noteTweenAngle('defaultPlayerStruX3', 3, 360, 3, 'linear')

			end
	    end
	
	    if curStep == 848 then
	        ComeBack()
	    end
	
		if curStep >= 1104 and curStep < 1360 then
			songPos = getSongPosition()
			local currentBeat = (songPos/3000)*(curBpm/20)
			if middlescroll == false then
				noteTweenY('defaultOpponentStrum0', 0, defaultOpponentStrumY0 + 150*math.sin((currentBeat+8*0.75)*math.pi), 0.001)
				noteTweenY('defaultOpponentStrum1', 1, defaultOpponentStrumY1 - 150*math.sin((currentBeat+8*0.75)*math.pi), 0.001)
				noteTweenY('defaultOpponentStrum2', 2, defaultOpponentStrumY2 + 150*math.sin((currentBeat+8*0.75)*math.pi), 0.001)
				noteTweenY('defaultOpponentStrum3', 3, defaultOpponentStrumY3 - 150*math.sin((currentBeat+8*0.75)*math.pi), 0.001)
		
				noteTweenX('defaultOpponentStrum4', 0, defaultOpponentStrumX3 + 150*math.cos((currentBeat+8*0.75)*math.pi), 0.001)
				noteTweenX('defaultOpponentStrum5', 1, defaultOpponentStrumX2 - 150*math.cos((currentBeat+8*0.75)*math.pi), 0.001)
				noteTweenX('defaultOpponentStrum6', 2, defaultOpponentStrumX1 + 150*math.cos((currentBeat+8*0.75)*math.pi), 0.001)
				noteTweenX('defaultOpponentStrum7', 3, defaultOpponentStrumX0 - 150*math.cos((currentBeat+8*0.75)*math.pi), 0.001)
			else
				noteTweenY('defaultOpponentStrum0', 0, defaultOpponentStrumY0 + 100*math.sin((currentBeat+8*0.75)*math.pi), 0.2)
				noteTweenY('defaultOpponentStrum1', 1, defaultOpponentStrumY1 - 100*math.sin((currentBeat+8*0.75)*math.pi), 0.2)
				noteTweenY('defaultOpponentStrum2', 2, defaultOpponentStrumY2 + 100*math.sin((currentBeat+8*0.75)*math.pi), 0.2)
				noteTweenY('defaultOpponentStrum3', 3, defaultOpponentStrumY3 - 100*math.sin((currentBeat+8*0.75)*math.pi), 0.2)
		
				noteTweenX('defaultOpponentStrum4', 0, defaultOpponentStrumX3 + 100*math.cos((currentBeat+8*0.75)*math.pi), 0.2)
				noteTweenX('defaultOpponentStrum5', 1, defaultOpponentStrumX2 - 100*math.cos((currentBeat+8*0.75)*math.pi), 0.2)
				noteTweenX('defaultOpponentStrum6', 2, defaultOpponentStrumX1 + 100*math.cos((currentBeat+8*0.75)*math.pi), 0.2)
				noteTweenX('defaultOpponentStrum7', 3, defaultOpponentStrumX0 - 100*math.cos((currentBeat+8*0.75)*math.pi), 0.2)

			end
		end
	
		if curStep >= 1552 and curStep < 1680 then
			songPos = getSongPosition()
			local currentBeat = (songPos/3000)*(curBpm/20)
			noteTweenY('defaultOpponentStrum0', 0, defaultOpponentStrumY0 + 150*math.sin((currentBeat+8*0.75)*math.pi), 0.001)
			noteTweenY('defaultOpponentStrum1', 1, defaultOpponentStrumY1 - 150*math.sin((currentBeat+8*0.75)*math.pi), 0.001)
			noteTweenY('defaultOpponentStrum2', 2, defaultOpponentStrumY2 + 150*math.sin((currentBeat+8*0.75)*math.pi), 0.001)
			noteTweenY('defaultOpponentStrum3', 3, defaultOpponentStrumY3 - 150*math.sin((currentBeat+8*0.75)*math.pi), 0.001)
		end
	
		

		if curStep == 1804 then
			setPropertyFromGroup('opponentStrums', 0, 'x', defaultOpponentStrumX0);
	        setPropertyFromGroup('opponentStrums', 1, 'x', defaultOpponentStrumX1);
	        setPropertyFromGroup('opponentStrums', 2, 'x', defaultOpponentStrumX2);
	        setPropertyFromGroup('opponentStrums', 3, 'x', defaultOpponentStrumX3);
	
	        setPropertyFromGroup('opponentStrums', 0, 'y', defaultOpponentStrumY0);
	        setPropertyFromGroup('opponentStrums', 1, 'y', defaultOpponentStrumY0);
	        setPropertyFromGroup('opponentStrums', 2, 'y', defaultOpponentStrumY0);
	        setPropertyFromGroup('opponentStrums', 3, 'y', defaultOpponentStrumY0);
		end
	
		if curStep == 2032 then
			setPropertyFromGroup('opponentStrums', 0, 'x', defaultOpponentStrumX0);
	        setPropertyFromGroup('opponentStrums', 1, 'x', defaultOpponentStrumX1);
	        setPropertyFromGroup('opponentStrums', 2, 'x', defaultOpponentStrumX2);
		    setPropertyFromGroup('opponentStrums', 3, 'x', defaultOpponentStrumX3);

	        setPropertyFromGroup('opponentStrums', 0, 'y', defaultOpponentStrumY0);
	        setPropertyFromGroup('opponentStrums', 1, 'y', defaultOpponentStrumY0);
	        setPropertyFromGroup('opponentStrums', 2, 'y', defaultOpponentStrumY0);
	        setPropertyFromGroup('opponentStrums', 3, 'y', defaultOpponentStrumY0);
	
			setPropertyFromGroup('opponentStrums', 0, 'angle', 0);
	        setPropertyFromGroup('opponentStrums', 1, 'angle', 0);
	        setPropertyFromGroup('opponentStrums', 2, 'angle', 0);
	        setPropertyFromGroup('opponentStrums', 3, 'angle', 0);
		end
	
		if curStep >= 2064 and curStep < 2384 then
			songPos = getSongPosition()
			local currentBeat = (songPos/3000)*(curBpm/20)
			if middlescroll == false then
				noteTweenX('defaultOpponentStrum4', 0, defaultOpponentStrumX0 + 150*math.sin((currentBeat+8*0.75)*math.pi), 0.001)
				noteTweenX('defaultOpponentStrum5', 1, defaultOpponentStrumX1 - 150*math.sin((currentBeat+8*0.75)*math.pi), 0.001)
				noteTweenX('defaultOpponentStrum6', 2, defaultOpponentStrumX2 + 150*math.sin((currentBeat+8*0.75)*math.pi), 0.001)
				noteTweenX('defaultOpponentStrum7', 3, defaultOpponentStrumX3 - 150*math.sin((currentBeat+8*0.75)*math.pi), 0.001)
			else
				noteTweenX('defaultOpponentStrum4', 0, defaultOpponentStrumX0 + 100*math.sin((currentBeat+8*0.75)*math.pi), 0.2)
				noteTweenX('defaultOpponentStrum5', 1, defaultOpponentStrumX1 - 100*math.sin((currentBeat+8*0.75)*math.pi), 0.2)
				noteTweenX('defaultOpponentStrum6', 2, defaultOpponentStrumX2 + 100*math.sin((currentBeat+8*0.75)*math.pi), 0.2)
				noteTweenX('defaultOpponentStrum7', 3, defaultOpponentStrumX3 - 100*math.sin((currentBeat+8*0.75)*math.pi), 0.2)
			end
		end
	
		if curStep == 2384 then
			if middlescroll == false then
				setPropertyFromGroup('opponentStrums', 0, 'x', defaultOpponentStrumX0);
		        setPropertyFromGroup('opponentStrums', 1, 'x', defaultOpponentStrumX1);
		        setPropertyFromGroup('opponentStrums', 2, 'x', defaultOpponentStrumX2);
		        setPropertyFromGroup('opponentStrums', 3, 'x', defaultOpponentStrumX3);
			
			    setPropertyFromGroup('opponentStrums', 0, 'y', defaultOpponentStrumY0);
			    setPropertyFromGroup('opponentStrums', 1, 'y', defaultOpponentStrumY0);
			    setPropertyFromGroup('opponentStrums', 2, 'y', defaultOpponentStrumY0);
			    setPropertyFromGroup('opponentStrums', 3, 'y', defaultOpponentStrumY0);
		
				noteTweenAngle('defaultOpponentStrum0', 0, -1800, 1.5, 'linear')
				noteTweenAngle('defaultOpponentStrum1', 1, -1800, 1.5, 'linear')
				noteTweenAngle('defaultOpponentStrum2', 2, -1800, 1.5, 'linear')
				noteTweenAngle('defaultOpponentStrum3', 3, -1800, 1.5, 'linear')
		
				noteTweenX('defaultOpponentStrum4', 0, -1000, 2.5)
				noteTweenX('defaultOpponentStrum5', 1, -1000, 2.5)
				noteTweenX('defaultOpponentStrum6', 2, -1000, 2.5)
				noteTweenX('defaultOpponentStrum7', 3, -1000, 2.5)
			
			else
				setPropertyFromGroup('opponentStrums', 0, 'x', defaultOpponentStrumX0);
		        setPropertyFromGroup('opponentStrums', 1, 'x', defaultOpponentStrumX1);
		        setPropertyFromGroup('opponentStrums', 2, 'x', defaultOpponentStrumX2);
		        setPropertyFromGroup('opponentStrums', 3, 'x', defaultOpponentStrumX3);
			
			    setPropertyFromGroup('opponentStrums', 0, 'y', defaultOpponentStrumY0);
			    setPropertyFromGroup('opponentStrums', 1, 'y', defaultOpponentStrumY0);
			    setPropertyFromGroup('opponentStrums', 2, 'y', defaultOpponentStrumY0);
			    setPropertyFromGroup('opponentStrums', 3, 'y', defaultOpponentStrumY0);
		
				noteTweenAngle('defaultOpponentStrum0', 0, -1800, 1.5, 'linear')
				noteTweenAngle('defaultOpponentStrum1', 1, -1800, 1.5, 'linear')
				noteTweenAngle('defaultOpponentStrum2', 2, 1800, 1.5, 'linear')
				noteTweenAngle('defaultOpponentStrum3', 3, 1800, 1.5, 'linear')
		
				noteTweenX('defaultOpponentStrum4', 0, -1000, 2.5)
				noteTweenX('defaultOpponentStrum5', 1, -1000, 2.5)
				noteTweenX('defaultOpponentStrum6', 2, 2280, 2.5)
				noteTweenX('defaultOpponentStrum7', 3, 2280, 2.5)
			end
		end
	end

end

function onStepHit()
	if middlescroll == false then
		if curStep == 1776 then
			setPropertyFromGroup('opponentStrums', 0, 'x', getRandomInt(0,640, '0'));
	        setPropertyFromGroup('opponentStrums', 1, 'x', getRandomInt(0,640, '1'));
	        setPropertyFromGroup('opponentStrums', 2, 'x', getRandomInt(0,640, '2'));
	        setPropertyFromGroup('opponentStrums', 3, 'x', getRandomInt(0,640, '3'));
	
	        setPropertyFromGroup('opponentStrums', 0, 'y', getRandomInt(0,720, '4'));
	        setPropertyFromGroup('opponentStrums', 1, 'y', getRandomInt(0,720, '5'));
	        setPropertyFromGroup('opponentStrums', 2, 'y', getRandomInt(0,720, '6'));
	        setPropertyFromGroup('opponentStrums', 3, 'y', getRandomInt(0,720, '7'));
		end

		if curStep == 1780 then
			setPropertyFromGroup('opponentStrums', 0, 'x', getRandomInt(0,640, '0'));
	        setPropertyFromGroup('opponentStrums', 1, 'x', getRandomInt(0,640, '1'));
	        setPropertyFromGroup('opponentStrums', 2, 'x', getRandomInt(0,640, '2'));
	        setPropertyFromGroup('opponentStrums', 3, 'x', getRandomInt(0,640, '3'));
	
	        setPropertyFromGroup('opponentStrums', 0, 'y', getRandomInt(0,720, '4'));
	        setPropertyFromGroup('opponentStrums', 1, 'y', getRandomInt(0,720, '5'));
	        setPropertyFromGroup('opponentStrums', 2, 'y', getRandomInt(0,720, '6'));
	        setPropertyFromGroup('opponentStrums', 3, 'y', getRandomInt(0,720, '7'));
		end
	
		if curStep == 1784 then
			setPropertyFromGroup('opponentStrums', 0, 'x', getRandomInt(0,640, '0'));
	        setPropertyFromGroup('opponentStrums', 1, 'x', getRandomInt(0,640, '1'));
	        setPropertyFromGroup('opponentStrums', 2, 'x', getRandomInt(0,640, '2'));
	        setPropertyFromGroup('opponentStrums', 3, 'x', getRandomInt(0,640, '3'));
	
	        setPropertyFromGroup('opponentStrums', 0, 'y', getRandomInt(0,720, '4'));
	        setPropertyFromGroup('opponentStrums', 1, 'y', getRandomInt(0,720, '5'));
	        setPropertyFromGroup('opponentStrums', 2, 'y', getRandomInt(0,720, '6'));
	        setPropertyFromGroup('opponentStrums', 3, 'y', getRandomInt(0,720, '7'));
		end
	
		if curStep == 1786 then
			setPropertyFromGroup('opponentStrums', 0, 'x', getRandomInt(0,640, '0'));
	        setPropertyFromGroup('opponentStrums', 1, 'x', getRandomInt(0,640, '1'));
	        setPropertyFromGroup('opponentStrums', 2, 'x', getRandomInt(0,640, '2'));
	        setPropertyFromGroup('opponentStrums', 3, 'x', getRandomInt(0,640, '3'));
	
		    setPropertyFromGroup('opponentStrums', 0, 'y', getRandomInt(0,720, '4'));
	        setPropertyFromGroup('opponentStrums', 1, 'y', getRandomInt(0,720, '5'));
	        setPropertyFromGroup('opponentStrums', 2, 'y', getRandomInt(0,720, '6'));
	        setPropertyFromGroup('opponentStrums', 3, 'y', getRandomInt(0,720, '7'));
		end
	
		if curStep == 1788 then
			setPropertyFromGroup('opponentStrums', 0, 'x', getRandomInt(0,640, '0'));
	        setPropertyFromGroup('opponentStrums', 1, 'x', getRandomInt(0,640, '1'));
	        setPropertyFromGroup('opponentStrums', 2, 'x', getRandomInt(0,640, '2'));
	        setPropertyFromGroup('opponentStrums', 3, 'x', getRandomInt(0,640, '3'));
	
	        setPropertyFromGroup('opponentStrums', 0, 'y', getRandomInt(0,720, '4'));
	        setPropertyFromGroup('opponentStrums', 1, 'y', getRandomInt(0,720, '5'));
	        setPropertyFromGroup('opponentStrums', 2, 'y', getRandomInt(0,720, '6'));
	        setPropertyFromGroup('opponentStrums', 3, 'y', getRandomInt(0,720, '7'));
		end
	
		if curStep == 1790 then
			setPropertyFromGroup('opponentStrums', 0, 'x', getRandomInt(0,640, '0'));
	        setPropertyFromGroup('opponentStrums', 1, 'x', getRandomInt(0,640, '1'));
	        setPropertyFromGroup('opponentStrums', 2, 'x', getRandomInt(0,640, '2'));
	        setPropertyFromGroup('opponentStrums', 3, 'x', getRandomInt(0,640, '3'));
	
	        setPropertyFromGroup('opponentStrums', 0, 'y', getRandomInt(0,720, '4'));
	        setPropertyFromGroup('opponentStrums', 1, 'y', getRandomInt(0,720, '5'));
	        setPropertyFromGroup('opponentStrums', 2, 'y', getRandomInt(0,720, '6'));
	        setPropertyFromGroup('opponentStrums', 3, 'y', getRandomInt(0,720, '7'));
		end
	
		if curStep == 1792 then
			setPropertyFromGroup('opponentStrums', 0, 'x', getRandomInt(0,640, '0'));
			setPropertyFromGroup('opponentStrums', 1, 'x', getRandomInt(0,640, '1'));
			setPropertyFromGroup('opponentStrums', 2, 'x', getRandomInt(0,640, '2'));
			setPropertyFromGroup('opponentStrums', 3, 'x', getRandomInt(0,640, '3'));

			setPropertyFromGroup('opponentStrums', 0, 'y', getRandomInt(0,720, '4'));
			setPropertyFromGroup('opponentStrums', 1, 'y', getRandomInt(0,720, '5'));
	        setPropertyFromGroup('opponentStrums', 2, 'y', getRandomInt(0,720, '6'));
	        setPropertyFromGroup('opponentStrums', 3, 'y', getRandomInt(0,720, '7'));
		end

		if curStep == 1796 then
			setPropertyFromGroup('opponentStrums', 0, 'x', getRandomInt(0,640, '0'));
			setPropertyFromGroup('opponentStrums', 1, 'x', getRandomInt(0,640, '1'));
			setPropertyFromGroup('opponentStrums', 2, 'x', getRandomInt(0,640, '2'));
			setPropertyFromGroup('opponentStrums', 3, 'x', getRandomInt(0,640, '3'));

			setPropertyFromGroup('opponentStrums', 0, 'y', getRandomInt(0,720, '4'));
			setPropertyFromGroup('opponentStrums', 1, 'y', getRandomInt(0,720, '5'));
	        setPropertyFromGroup('opponentStrums', 2, 'y', getRandomInt(0,720, '6'));
	        setPropertyFromGroup('opponentStrums', 3, 'y', getRandomInt(0,720, '7'));
		end

		if curStep == 1800 then
			setPropertyFromGroup('opponentStrums', 0, 'x', getRandomInt(0,640, '0'));
	        setPropertyFromGroup('opponentStrums', 1, 'x', getRandomInt(0,640, '1'));
	        setPropertyFromGroup('opponentStrums', 2, 'x', getRandomInt(0,640, '2'));
	        setPropertyFromGroup('opponentStrums', 3, 'x', getRandomInt(0,640, '3'));
	
	        setPropertyFromGroup('opponentStrums', 0, 'y', getRandomInt(0,720, '4'));
	        setPropertyFromGroup('opponentStrums', 1, 'y', getRandomInt(0,720, '5'));
	        setPropertyFromGroup('opponentStrums', 2, 'y', getRandomInt(0,720, '6'));
	        setPropertyFromGroup('opponentStrums', 3, 'y', getRandomInt(0,720, '7'));
		end

		if curStep == 1802 then
			setPropertyFromGroup('opponentStrums', 0, 'x', getRandomInt(0,640, '0'));
	        setPropertyFromGroup('opponentStrums', 1, 'x', getRandomInt(0,640, '1'));
	        setPropertyFromGroup('opponentStrums', 2, 'x', getRandomInt(0,640, '2'));
	        setPropertyFromGroup('opponentStrums', 3, 'x', getRandomInt(0,640, '3'));

	        setPropertyFromGroup('opponentStrums', 0, 'y', getRandomInt(0,720, '4'));
	        setPropertyFromGroup('opponentStrums', 1, 'y', getRandomInt(0,720, '5'));
	        setPropertyFromGroup('opponentStrums', 2, 'y', getRandomInt(0,720, '6'));
	        setPropertyFromGroup('opponentStrums', 3, 'y', getRandomInt(0,720, '7'));
		end

		if curStep == 2000 then
			setPropertyFromGroup('opponentStrums', 0, 'x', getRandomInt(0,640, '0'));
	        setPropertyFromGroup('opponentStrums', 1, 'x', getRandomInt(0,640, '1'));
	        setPropertyFromGroup('opponentStrums', 2, 'x', getRandomInt(0,640, '2'));
	        setPropertyFromGroup('opponentStrums', 3, 'x', getRandomInt(0,640, '3'));
	
	        setPropertyFromGroup('opponentStrums', 0, 'y', getRandomInt(0,720, '4'));
	        setPropertyFromGroup('opponentStrums', 1, 'y', getRandomInt(0,720, '5'));
	        setPropertyFromGroup('opponentStrums', 2, 'y', getRandomInt(0,720, '6'));
	        setPropertyFromGroup('opponentStrums', 3, 'y', getRandomInt(0,720, '7'));
		end
	
		if curStep == 2002 then
			setPropertyFromGroup('opponentStrums', 0, 'x', getRandomInt(0,640, '0'));
	        setPropertyFromGroup('opponentStrums', 1, 'x', getRandomInt(0,640, '1'));
	        setPropertyFromGroup('opponentStrums', 2, 'x', getRandomInt(0,640, '2'));
	        setPropertyFromGroup('opponentStrums', 3, 'x', getRandomInt(0,640, '3'));
	
	        setPropertyFromGroup('opponentStrums', 0, 'y', getRandomInt(0,720, '4'));
	        setPropertyFromGroup('opponentStrums', 1, 'y', getRandomInt(0,720, '5'));
	        setPropertyFromGroup('opponentStrums', 2, 'y', getRandomInt(0,720, '6'));
	        setPropertyFromGroup('opponentStrums', 3, 'y', getRandomInt(0,720, '7'));
		end

		if curStep == 2004 then
			setPropertyFromGroup('opponentStrums', 0, 'x', getRandomInt(0,640, '0'));
	        setPropertyFromGroup('opponentStrums', 1, 'x', getRandomInt(0,640, '1'));
	        setPropertyFromGroup('opponentStrums', 2, 'x', getRandomInt(0,640, '2'));
	        setPropertyFromGroup('opponentStrums', 3, 'x', getRandomInt(0,640, '3'));
	
	        setPropertyFromGroup('opponentStrums', 0, 'y', getRandomInt(0,720, '4'));
	        setPropertyFromGroup('opponentStrums', 1, 'y', getRandomInt(0,720, '5'));
	        setPropertyFromGroup('opponentStrums', 2, 'y', getRandomInt(0,720, '6'));
	        setPropertyFromGroup('opponentStrums', 3, 'y', getRandomInt(0,720, '7'));
		end
	
		if curStep == 2008 then
			setPropertyFromGroup('opponentStrums', 0, 'x', getRandomInt(0,640, '0'));
	        setPropertyFromGroup('opponentStrums', 1, 'x', getRandomInt(0,640, '1'));
	        setPropertyFromGroup('opponentStrums', 2, 'x', getRandomInt(0,640, '2'));
	        setPropertyFromGroup('opponentStrums', 3, 'x', getRandomInt(0,640, '3'));
	
	        setPropertyFromGroup('opponentStrums', 0, 'y', getRandomInt(0,720, '4'));
	        setPropertyFromGroup('opponentStrums', 1, 'y', getRandomInt(0,720, '5'));
	        setPropertyFromGroup('opponentStrums', 2, 'y', getRandomInt(0,720, '6'));
	        setPropertyFromGroup('opponentStrums', 3, 'y', getRandomInt(0,720, '7'));
		end

		if curStep == 2010 then
			setPropertyFromGroup('opponentStrums', 0, 'x', getRandomInt(0,640, '0'));
	        setPropertyFromGroup('opponentStrums', 1, 'x', getRandomInt(0,640, '1'));
	        setPropertyFromGroup('opponentStrums', 2, 'x', getRandomInt(0,640, '2'));
	        setPropertyFromGroup('opponentStrums', 3, 'x', getRandomInt(0,640, '3'));
	
	        setPropertyFromGroup('opponentStrums', 0, 'y', getRandomInt(0,720, '4'));
	        setPropertyFromGroup('opponentStrums', 1, 'y', getRandomInt(0,720, '5'));
	        setPropertyFromGroup('opponentStrums', 2, 'y', getRandomInt(0,720, '6'));
	        setPropertyFromGroup('opponentStrums', 3, 'y', getRandomInt(0,720, '7'));
		end
	
		if curStep == 2012 then
			setPropertyFromGroup('opponentStrums', 0, 'x', getRandomInt(0,640, '0'));
	        setPropertyFromGroup('opponentStrums', 1, 'x', getRandomInt(0,640, '1'));
	        setPropertyFromGroup('opponentStrums', 2, 'x', getRandomInt(0,640, '2'));
	        setPropertyFromGroup('opponentStrums', 3, 'x', getRandomInt(0,640, '3'));
	
	        setPropertyFromGroup('opponentStrums', 0, 'y', getRandomInt(0,720, '4'));
	        setPropertyFromGroup('opponentStrums', 1, 'y', getRandomInt(0,720, '5'));
	        setPropertyFromGroup('opponentStrums', 2, 'y', getRandomInt(0,720, '6'));
	        setPropertyFromGroup('opponentStrums', 3, 'y', getRandomInt(0,720, '7'));
		end
	
		if curStep == 2016 then
			setPropertyFromGroup('opponentStrums', 0, 'x', getRandomInt(0,640, '0'));
	        setPropertyFromGroup('opponentStrums', 1, 'x', getRandomInt(0,640, '1'));
	        setPropertyFromGroup('opponentStrums', 2, 'x', getRandomInt(0,640, '2'));
	        setPropertyFromGroup('opponentStrums', 3, 'x', getRandomInt(0,640, '3'));
	
	        setPropertyFromGroup('opponentStrums', 0, 'y', getRandomInt(0,720, '4'));
	        setPropertyFromGroup('opponentStrums', 1, 'y', getRandomInt(0,720, '5'));
	        setPropertyFromGroup('opponentStrums', 2, 'y', getRandomInt(0,720, '6'));
	        setPropertyFromGroup('opponentStrums', 3, 'y', getRandomInt(0,720, '7'));
		end
	
		if curStep == 2018 then
			setPropertyFromGroup('opponentStrums', 0, 'x', getRandomInt(0,640, '0'));
	        setPropertyFromGroup('opponentStrums', 1, 'x', getRandomInt(0,640, '1'));
	        setPropertyFromGroup('opponentStrums', 2, 'x', getRandomInt(0,640, '2'));
	        setPropertyFromGroup('opponentStrums', 3, 'x', getRandomInt(0,640, '3'));
	
	        setPropertyFromGroup('opponentStrums', 0, 'y', getRandomInt(0,720, '4'));
	        setPropertyFromGroup('opponentStrums', 1, 'y', getRandomInt(0,720, '5'));
	        setPropertyFromGroup('opponentStrums', 2, 'y', getRandomInt(0,720, '6'));
	        setPropertyFromGroup('opponentStrums', 3, 'y', getRandomInt(0,720, '7'));
		end
	
		if curStep == 2020 then
			setPropertyFromGroup('opponentStrums', 0, 'x', getRandomInt(0,640, '0'));
	        setPropertyFromGroup('opponentStrums', 1, 'x', getRandomInt(0,640, '1'));
	        setPropertyFromGroup('opponentStrums', 2, 'x', getRandomInt(0,640, '2'));
	        setPropertyFromGroup('opponentStrums', 3, 'x', getRandomInt(0,640, '3'));
	
	        setPropertyFromGroup('opponentStrums', 0, 'y', getRandomInt(0,720, '4'));
	        setPropertyFromGroup('opponentStrums', 1, 'y', getRandomInt(0,720, '5'));
	        setPropertyFromGroup('opponentStrums', 2, 'y', getRandomInt(0,720, '6'));
	        setPropertyFromGroup('opponentStrums', 3, 'y', getRandomInt(0,720, '7'));
		end
	
		if curStep == 2022 then
			setPropertyFromGroup('opponentStrums', 0, 'x', getRandomInt(0,640, '0'));
	        setPropertyFromGroup('opponentStrums', 1, 'x', getRandomInt(0,640, '1'));
	        setPropertyFromGroup('opponentStrums', 2, 'x', getRandomInt(0,640, '2'));
	        setPropertyFromGroup('opponentStrums', 3, 'x', getRandomInt(0,640, '3'));
	
	        setPropertyFromGroup('opponentStrums', 0, 'y', getRandomInt(0,720, '4'));
	        setPropertyFromGroup('opponentStrums', 1, 'y', getRandomInt(0,720, '5'));
	        setPropertyFromGroup('opponentStrums', 2, 'y', getRandomInt(0,720, '6'));
	        setPropertyFromGroup('opponentStrums', 3, 'y', getRandomInt(0,720, '7'));
		end
	
		if curStep == 2024 then
			setPropertyFromGroup('opponentStrums', 0, 'x', getRandomInt(0,640, '0'));
	        setPropertyFromGroup('opponentStrums', 1, 'x', getRandomInt(0,640, '1'));
	        setPropertyFromGroup('opponentStrums', 2, 'x', getRandomInt(0,640, '2'));
	        setPropertyFromGroup('opponentStrums', 3, 'x', getRandomInt(0,640, '3'));
	
	        setPropertyFromGroup('opponentStrums', 0, 'y', getRandomInt(0,720, '4'));
	        setPropertyFromGroup('opponentStrums', 1, 'y', getRandomInt(0,720, '5'));
	        setPropertyFromGroup('opponentStrums', 2, 'y', getRandomInt(0,720, '6'));
	        setPropertyFromGroup('opponentStrums', 3, 'y', getRandomInt(0,720, '7'));
		end
	
		if curStep == 2026 then
			setPropertyFromGroup('opponentStrums', 0, 'x', getRandomInt(0,640, '0'));
	        setPropertyFromGroup('opponentStrums', 1, 'x', getRandomInt(0,640, '1'));
	        setPropertyFromGroup('opponentStrums', 2, 'x', getRandomInt(0,640, '2'));
	        setPropertyFromGroup('opponentStrums', 3, 'x', getRandomInt(0,640, '3'));
		
		    setPropertyFromGroup('opponentStrums', 0, 'y', getRandomInt(0,720, '4'));
	        setPropertyFromGroup('opponentStrums', 1, 'y', getRandomInt(0,720, '5'));
	        setPropertyFromGroup('opponentStrums', 2, 'y', getRandomInt(0,720, '6'));
	        setPropertyFromGroup('opponentStrums', 3, 'y', getRandomInt(0,720, '7'));
		end
	
		if curStep == 2027 then
			setPropertyFromGroup('opponentStrums', 0, 'x', getRandomInt(0,640, '0'));
	        setPropertyFromGroup('opponentStrums', 1, 'x', getRandomInt(0,640, '1'));
	        setPropertyFromGroup('opponentStrums', 2, 'x', getRandomInt(0,640, '2'));
	        setPropertyFromGroup('opponentStrums', 3, 'x', getRandomInt(0,640, '3'));
	
	        setPropertyFromGroup('opponentStrums', 0, 'y', getRandomInt(0,720, '4'));
	        setPropertyFromGroup('opponentStrums', 1, 'y', getRandomInt(0,720, '5'));
	        setPropertyFromGroup('opponentStrums', 2, 'y', getRandomInt(0,720, '6'));
	        setPropertyFromGroup('opponentStrums', 3, 'y', getRandomInt(0,720, '7'));
		end
	
		if curStep == 2028 then
			setPropertyFromGroup('opponentStrums', 0, 'x', getRandomInt(0,640, '0'));
			setPropertyFromGroup('opponentStrums', 1, 'x', getRandomInt(0,640, '1'));
			setPropertyFromGroup('opponentStrums', 2, 'x', getRandomInt(0,640, '2'));
			setPropertyFromGroup('opponentStrums', 3, 'x', getRandomInt(0,640, '3'));

			setPropertyFromGroup('opponentStrums', 0, 'y', getRandomInt(0,720, '4'));
			setPropertyFromGroup('opponentStrums', 1, 'y', getRandomInt(0,720, '5'));
			setPropertyFromGroup('opponentStrums', 2, 'y', getRandomInt(0,720, '6'));
			setPropertyFromGroup('opponentStrums', 3, 'y', getRandomInt(0,720, '7'));
		end

		
	else
		if curStep == 1776 then
			setPropertyFromGroup('opponentStrums', 0, 'x', getRandomInt(0,320, '0'));
	        setPropertyFromGroup('opponentStrums', 1, 'x', getRandomInt(0,320, '1'));
	        setPropertyFromGroup('opponentStrums', 2, 'x', getRandomInt(960, 1280, '2'));
	        setPropertyFromGroup('opponentStrums', 3, 'x', getRandomInt(960, 1280, '3'));
	
	        setPropertyFromGroup('opponentStrums', 0, 'y', getRandomInt(0,720, '4'));
	        setPropertyFromGroup('opponentStrums', 1, 'y', getRandomInt(0,720, '5'));
	        setPropertyFromGroup('opponentStrums', 2, 'y', getRandomInt(0,720, '6'));
	        setPropertyFromGroup('opponentStrums', 3, 'y', getRandomInt(0,720, '7'));
		end

		if curStep == 1780 then
			setPropertyFromGroup('opponentStrums', 0, 'x', getRandomInt(0,320, '0'));
	        setPropertyFromGroup('opponentStrums', 1, 'x', getRandomInt(0,320, '1'));
	        setPropertyFromGroup('opponentStrums', 2, 'x', getRandomInt(960, 1280, '2'));
	        setPropertyFromGroup('opponentStrums', 3, 'x', getRandomInt(960, 1280, '3'));
	
	        setPropertyFromGroup('opponentStrums', 0, 'y', getRandomInt(0,720, '4'));
	        setPropertyFromGroup('opponentStrums', 1, 'y', getRandomInt(0,720, '5'));
	        setPropertyFromGroup('opponentStrums', 2, 'y', getRandomInt(0,720, '6'));
	        setPropertyFromGroup('opponentStrums', 3, 'y', getRandomInt(0,720, '7'));
		end
	
		if curStep == 1784 then
			setPropertyFromGroup('opponentStrums', 0, 'x', getRandomInt(0,320, '0'));
	        setPropertyFromGroup('opponentStrums', 1, 'x', getRandomInt(0,320, '1'));
	        setPropertyFromGroup('opponentStrums', 2, 'x', getRandomInt(960, 1280, '2'));
	        setPropertyFromGroup('opponentStrums', 3, 'x', getRandomInt(960, 1280, '3'));
	
	        setPropertyFromGroup('opponentStrums', 0, 'y', getRandomInt(0,720, '4'));
	        setPropertyFromGroup('opponentStrums', 1, 'y', getRandomInt(0,720, '5'));
	        setPropertyFromGroup('opponentStrums', 2, 'y', getRandomInt(0,720, '6'));
	        setPropertyFromGroup('opponentStrums', 3, 'y', getRandomInt(0,720, '7'));
		end
	
		if curStep == 1786 then
			setPropertyFromGroup('opponentStrums', 0, 'x', getRandomInt(0,320, '0'));
	        setPropertyFromGroup('opponentStrums', 1, 'x', getRandomInt(0,320, '1'));
	        setPropertyFromGroup('opponentStrums', 2, 'x', getRandomInt(960, 1280, '2'));
	        setPropertyFromGroup('opponentStrums', 3, 'x', getRandomInt(960, 1280, '3'));
	
		    setPropertyFromGroup('opponentStrums', 0, 'y', getRandomInt(0,720, '4'));
	        setPropertyFromGroup('opponentStrums', 1, 'y', getRandomInt(0,720, '5'));
	        setPropertyFromGroup('opponentStrums', 2, 'y', getRandomInt(0,720, '6'));
	        setPropertyFromGroup('opponentStrums', 3, 'y', getRandomInt(0,720, '7'));
		end
	
		if curStep == 1788 then
			setPropertyFromGroup('opponentStrums', 0, 'x', getRandomInt(0,320, '0'));
	        setPropertyFromGroup('opponentStrums', 1, 'x', getRandomInt(0,320, '1'));
	        setPropertyFromGroup('opponentStrums', 2, 'x', getRandomInt(960, 1280, '2'));
	        setPropertyFromGroup('opponentStrums', 3, 'x', getRandomInt(960, 1280, '3'));
	
	        setPropertyFromGroup('opponentStrums', 0, 'y', getRandomInt(0,720, '4'));
	        setPropertyFromGroup('opponentStrums', 1, 'y', getRandomInt(0,720, '5'));
	        setPropertyFromGroup('opponentStrums', 2, 'y', getRandomInt(0,720, '6'));
	        setPropertyFromGroup('opponentStrums', 3, 'y', getRandomInt(0,720, '7'));
		end
	
		if curStep == 1790 then
			setPropertyFromGroup('opponentStrums', 0, 'x', getRandomInt(0,320, '0'));
	        setPropertyFromGroup('opponentStrums', 1, 'x', getRandomInt(0,320, '1'));
	        setPropertyFromGroup('opponentStrums', 2, 'x', getRandomInt(960, 1280, '2'));
	        setPropertyFromGroup('opponentStrums', 3, 'x', getRandomInt(960, 1280, '3'));
	
	        setPropertyFromGroup('opponentStrums', 0, 'y', getRandomInt(0,720, '4'));
	        setPropertyFromGroup('opponentStrums', 1, 'y', getRandomInt(0,720, '5'));
	        setPropertyFromGroup('opponentStrums', 2, 'y', getRandomInt(0,720, '6'));
	        setPropertyFromGroup('opponentStrums', 3, 'y', getRandomInt(0,720, '7'));
		end
	
		if curStep == 1792 then
			setPropertyFromGroup('opponentStrums', 0, 'x', getRandomInt(0,320, '0'));
			setPropertyFromGroup('opponentStrums', 1, 'x', getRandomInt(0,320, '1'));
			setPropertyFromGroup('opponentStrums', 2, 'x', getRandomInt(960, 1280, '2'));
			setPropertyFromGroup('opponentStrums', 3, 'x', getRandomInt(960, 1280, '3'));

			setPropertyFromGroup('opponentStrums', 0, 'y', getRandomInt(0,720, '4'));
			setPropertyFromGroup('opponentStrums', 1, 'y', getRandomInt(0,720, '5'));
	        setPropertyFromGroup('opponentStrums', 2, 'y', getRandomInt(0,720, '6'));
	        setPropertyFromGroup('opponentStrums', 3, 'y', getRandomInt(0,720, '7'));
		end

		if curStep == 1796 then
			setPropertyFromGroup('opponentStrums', 0, 'x', getRandomInt(0,320, '0'));
			setPropertyFromGroup('opponentStrums', 1, 'x', getRandomInt(0,320, '1'));
			setPropertyFromGroup('opponentStrums', 2, 'x', getRandomInt(960, 1280, '2'));
			setPropertyFromGroup('opponentStrums', 3, 'x', getRandomInt(960, 1280, '3'));

			setPropertyFromGroup('opponentStrums', 0, 'y', getRandomInt(0,720, '4'));
			setPropertyFromGroup('opponentStrums', 1, 'y', getRandomInt(0,720, '5'));
	        setPropertyFromGroup('opponentStrums', 2, 'y', getRandomInt(0,720, '6'));
	        setPropertyFromGroup('opponentStrums', 3, 'y', getRandomInt(0,720, '7'));
		end

		if curStep == 1800 then
			setPropertyFromGroup('opponentStrums', 0, 'x', getRandomInt(0,320, '0'));
	        setPropertyFromGroup('opponentStrums', 1, 'x', getRandomInt(0,320, '1'));
	        setPropertyFromGroup('opponentStrums', 2, 'x', getRandomInt(960, 1280, '2'));
	        setPropertyFromGroup('opponentStrums', 3, 'x', getRandomInt(960, 1280, '3'));
	
	        setPropertyFromGroup('opponentStrums', 0, 'y', getRandomInt(0,720, '4'));
	        setPropertyFromGroup('opponentStrums', 1, 'y', getRandomInt(0,720, '5'));
	        setPropertyFromGroup('opponentStrums', 2, 'y', getRandomInt(0,720, '6'));
	        setPropertyFromGroup('opponentStrums', 3, 'y', getRandomInt(0,720, '7'));
		end

		if curStep == 1802 then
			setPropertyFromGroup('opponentStrums', 0, 'x', getRandomInt(0,320, '0'));
	        setPropertyFromGroup('opponentStrums', 1, 'x', getRandomInt(0,320, '1'));
	        setPropertyFromGroup('opponentStrums', 2, 'x', getRandomInt(960, 1280, '2'));
	        setPropertyFromGroup('opponentStrums', 3, 'x', getRandomInt(960, 1280, '3'));

	        setPropertyFromGroup('opponentStrums', 0, 'y', getRandomInt(0,720, '4'));
	        setPropertyFromGroup('opponentStrums', 1, 'y', getRandomInt(0,720, '5'));
	        setPropertyFromGroup('opponentStrums', 2, 'y', getRandomInt(0,720, '6'));
	        setPropertyFromGroup('opponentStrums', 3, 'y', getRandomInt(0,720, '7'));
		end

		if curStep == 2000 then
			setPropertyFromGroup('opponentStrums', 0, 'x', getRandomInt(0,320, '0'));
	        setPropertyFromGroup('opponentStrums', 1, 'x', getRandomInt(0,320, '1'));
	        setPropertyFromGroup('opponentStrums', 2, 'x', getRandomInt(960, 1280, '2'));
	        setPropertyFromGroup('opponentStrums', 3, 'x', getRandomInt(960, 1280, '3'));
	
	        setPropertyFromGroup('opponentStrums', 0, 'y', getRandomInt(0,720, '4'));
	        setPropertyFromGroup('opponentStrums', 1, 'y', getRandomInt(0,720, '5'));
	        setPropertyFromGroup('opponentStrums', 2, 'y', getRandomInt(0,720, '6'));
	        setPropertyFromGroup('opponentStrums', 3, 'y', getRandomInt(0,720, '7'));
		end
	
		if curStep == 2002 then
			setPropertyFromGroup('opponentStrums', 0, 'x', getRandomInt(0,320, '0'));
	        setPropertyFromGroup('opponentStrums', 1, 'x', getRandomInt(0,320, '1'));
	        setPropertyFromGroup('opponentStrums', 2, 'x', getRandomInt(960, 1280, '2'));
	        setPropertyFromGroup('opponentStrums', 3, 'x', getRandomInt(960, 1280, '3'));
	
	        setPropertyFromGroup('opponentStrums', 0, 'y', getRandomInt(0,720, '4'));
	        setPropertyFromGroup('opponentStrums', 1, 'y', getRandomInt(0,720, '5'));
	        setPropertyFromGroup('opponentStrums', 2, 'y', getRandomInt(0,720, '6'));
	        setPropertyFromGroup('opponentStrums', 3, 'y', getRandomInt(0,720, '7'));
		end
	
		if curStep == 2008 then
			setPropertyFromGroup('opponentStrums', 0, 'x', getRandomInt(0,320, '0'));
	        setPropertyFromGroup('opponentStrums', 1, 'x', getRandomInt(0,320, '1'));
	        setPropertyFromGroup('opponentStrums', 2, 'x', getRandomInt(960, 1280, '2'));
	        setPropertyFromGroup('opponentStrums', 3, 'x', getRandomInt(960, 1280, '3'));
	
	        setPropertyFromGroup('opponentStrums', 0, 'y', getRandomInt(0,720, '4'));
	        setPropertyFromGroup('opponentStrums', 1, 'y', getRandomInt(0,720, '5'));
	        setPropertyFromGroup('opponentStrums', 2, 'y', getRandomInt(0,720, '6'));
	        setPropertyFromGroup('opponentStrums', 3, 'y', getRandomInt(0,720, '7'));
		end

		if curStep == 2010 then
			setPropertyFromGroup('opponentStrums', 0, 'x', getRandomInt(0,320, '0'));
	        setPropertyFromGroup('opponentStrums', 1, 'x', getRandomInt(0,320, '1'));
	        setPropertyFromGroup('opponentStrums', 2, 'x', getRandomInt(960, 1280, '2'));
	        setPropertyFromGroup('opponentStrums', 3, 'x', getRandomInt(960, 1280, '3'));
	
	        setPropertyFromGroup('opponentStrums', 0, 'y', getRandomInt(0,720, '4'));
	        setPropertyFromGroup('opponentStrums', 1, 'y', getRandomInt(0,720, '5'));
	        setPropertyFromGroup('opponentStrums', 2, 'y', getRandomInt(0,720, '6'));
	        setPropertyFromGroup('opponentStrums', 3, 'y', getRandomInt(0,720, '7'));
		end
	
		if curStep == 2012 then
			setPropertyFromGroup('opponentStrums', 0, 'x', getRandomInt(0,320, '0'));
	        setPropertyFromGroup('opponentStrums', 1, 'x', getRandomInt(0,320, '1'));
	        setPropertyFromGroup('opponentStrums', 2, 'x', getRandomInt(960, 1280, '2'));
	        setPropertyFromGroup('opponentStrums', 3, 'x', getRandomInt(960, 1280, '3'));
	
	        setPropertyFromGroup('opponentStrums', 0, 'y', getRandomInt(0,720, '4'));
	        setPropertyFromGroup('opponentStrums', 1, 'y', getRandomInt(0,720, '5'));
	        setPropertyFromGroup('opponentStrums', 2, 'y', getRandomInt(0,720, '6'));
	        setPropertyFromGroup('opponentStrums', 3, 'y', getRandomInt(0,720, '7'));
		end
	
		if curStep == 2016 then
			setPropertyFromGroup('opponentStrums', 0, 'x', getRandomInt(0,320, '0'));
	        setPropertyFromGroup('opponentStrums', 1, 'x', getRandomInt(0,320, '1'));
	        setPropertyFromGroup('opponentStrums', 2, 'x', getRandomInt(960, 1280, '2'));
	        setPropertyFromGroup('opponentStrums', 3, 'x', getRandomInt(960, 1280, '3'));
	
	        setPropertyFromGroup('opponentStrums', 0, 'y', getRandomInt(0,720, '4'));
	        setPropertyFromGroup('opponentStrums', 1, 'y', getRandomInt(0,720, '5'));
	        setPropertyFromGroup('opponentStrums', 2, 'y', getRandomInt(0,720, '6'));
	        setPropertyFromGroup('opponentStrums', 3, 'y', getRandomInt(0,720, '7'));
		end
	
		if curStep == 2018 then
			setPropertyFromGroup('opponentStrums', 0, 'x', getRandomInt(0,320, '0'));
	        setPropertyFromGroup('opponentStrums', 1, 'x', getRandomInt(0,320, '1'));
	        setPropertyFromGroup('opponentStrums', 2, 'x', getRandomInt(960, 1280, '2'));
	        setPropertyFromGroup('opponentStrums', 3, 'x', getRandomInt(960, 1280, '3'));
	
	        setPropertyFromGroup('opponentStrums', 0, 'y', getRandomInt(0,720, '4'));
	        setPropertyFromGroup('opponentStrums', 1, 'y', getRandomInt(0,720, '5'));
	        setPropertyFromGroup('opponentStrums', 2, 'y', getRandomInt(0,720, '6'));
	        setPropertyFromGroup('opponentStrums', 3, 'y', getRandomInt(0,720, '7'));
		end
	
		if curStep == 2020 then
			setPropertyFromGroup('opponentStrums', 0, 'x', getRandomInt(0,320, '0'));
	        setPropertyFromGroup('opponentStrums', 1, 'x', getRandomInt(0,320, '1'));
	        setPropertyFromGroup('opponentStrums', 2, 'x', getRandomInt(960, 1280, '2'));
	        setPropertyFromGroup('opponentStrums', 3, 'x', getRandomInt(960, 1280, '3'));
	
	        setPropertyFromGroup('opponentStrums', 0, 'y', getRandomInt(0,720, '4'));
	        setPropertyFromGroup('opponentStrums', 1, 'y', getRandomInt(0,720, '5'));
	        setPropertyFromGroup('opponentStrums', 2, 'y', getRandomInt(0,720, '6'));
	        setPropertyFromGroup('opponentStrums', 3, 'y', getRandomInt(0,720, '7'));
		end
	
		if curStep == 2022 then
			setPropertyFromGroup('opponentStrums', 0, 'x', getRandomInt(0,320, '0'));
	        setPropertyFromGroup('opponentStrums', 1, 'x', getRandomInt(0,320, '1'));
	        setPropertyFromGroup('opponentStrums', 2, 'x', getRandomInt(960, 1280, '2'));
	        setPropertyFromGroup('opponentStrums', 3, 'x', getRandomInt(960, 1280, '3'));
	
	        setPropertyFromGroup('opponentStrums', 0, 'y', getRandomInt(0,720, '4'));
	        setPropertyFromGroup('opponentStrums', 1, 'y', getRandomInt(0,720, '5'));
	        setPropertyFromGroup('opponentStrums', 2, 'y', getRandomInt(0,720, '6'));
	        setPropertyFromGroup('opponentStrums', 3, 'y', getRandomInt(0,720, '7'));
		end
	
		if curStep == 2024 then
			setPropertyFromGroup('opponentStrums', 0, 'x', getRandomInt(0,320, '0'));
	        setPropertyFromGroup('opponentStrums', 1, 'x', getRandomInt(0,320, '1'));
	        setPropertyFromGroup('opponentStrums', 2, 'x', getRandomInt(960, 1280, '2'));
	        setPropertyFromGroup('opponentStrums', 3, 'x', getRandomInt(960, 1280, '3'));
	
	        setPropertyFromGroup('opponentStrums', 0, 'y', getRandomInt(0,720, '4'));
	        setPropertyFromGroup('opponentStrums', 1, 'y', getRandomInt(0,720, '5'));
	        setPropertyFromGroup('opponentStrums', 2, 'y', getRandomInt(0,720, '6'));
	        setPropertyFromGroup('opponentStrums', 3, 'y', getRandomInt(0,720, '7'));
		end
	
		if curStep == 2026 then
			setPropertyFromGroup('opponentStrums', 0, 'x', getRandomInt(0,320, '0'));
	        setPropertyFromGroup('opponentStrums', 1, 'x', getRandomInt(0,320, '1'));
	        setPropertyFromGroup('opponentStrums', 2, 'x', getRandomInt(960, 1280, '2'));
	        setPropertyFromGroup('opponentStrums', 3, 'x', getRandomInt(960, 1280, '3'));
	
	        setPropertyFromGroup('opponentStrums', 0, 'y', getRandomInt(0,720, '4'));
	        setPropertyFromGroup('opponentStrums', 1, 'y', getRandomInt(0,720, '5'));
	        setPropertyFromGroup('opponentStrums', 2, 'y', getRandomInt(0,720, '6'));
	        setPropertyFromGroup('opponentStrums', 3, 'y', getRandomInt(0,720, '7'));
		end
	
		if curStep == 2027 then
			setPropertyFromGroup('opponentStrums', 0, 'x', getRandomInt(0,320, '0'));
	        setPropertyFromGroup('opponentStrums', 1, 'x', getRandomInt(0,320, '1'));
	        setPropertyFromGroup('opponentStrums', 2, 'x', getRandomInt(960, 1280, '2'));
	        setPropertyFromGroup('opponentStrums', 3, 'x', getRandomInt(960, 1280, '3'));
	
	        setPropertyFromGroup('opponentStrums', 0, 'y', getRandomInt(0,720, '4'));
	        setPropertyFromGroup('opponentStrums', 1, 'y', getRandomInt(0,720, '5'));
	        setPropertyFromGroup('opponentStrums', 2, 'y', getRandomInt(0,720, '6'));
	        setPropertyFromGroup('opponentStrums', 3, 'y', getRandomInt(0,720, '7'));
		end
	
		if curStep == 2028 then
			setPropertyFromGroup('opponentStrums', 0, 'x', getRandomInt(0,320, '0'));
	        setPropertyFromGroup('opponentStrums', 1, 'x', getRandomInt(0,320, '1'));
	        setPropertyFromGroup('opponentStrums', 2, 'x', getRandomInt(960, 1280, '2'));
	        setPropertyFromGroup('opponentStrums', 3, 'x', getRandomInt(960, 1280, '3'));
	
	        setPropertyFromGroup('opponentStrums', 0, 'y', getRandomInt(0,720, '4'));
	        setPropertyFromGroup('opponentStrums', 1, 'y', getRandomInt(0,720, '5'));
	        setPropertyFromGroup('opponentStrums', 2, 'y', getRandomInt(0,720, '6'));
	        setPropertyFromGroup('opponentStrums', 3, 'y', getRandomInt(0,720, '7'));
		end
	end
end


function ComeBack()

    if downscroll == false then
	    noteTweenY('defaultPlayerStrumY0', 0, defaultOpponentStrumY3, 1.5 ,'linear')
        noteTweenY('defaultPlayerStrumY1', 1, defaultOpponentStrumY2, 1.5 ,'linear')
        noteTweenY('defaultPlayerStrumY2', 2, defaultOpponentStrumY1, 1.5 ,'linear')
        noteTweenY('defaultPlayerStrumY3', 3, defaultOpponentStrumY0, 1.5 ,'linear')


        setPropertyFromGroup('opponentStrums', 0, 'x', defaultOpponentStrumX3);
        setPropertyFromGroup('opponentStrums', 1, 'x', defaultOpponentStrumX2);
        setPropertyFromGroup('opponentStrums', 2, 'x', defaultOpponentStrumX1);
        setPropertyFromGroup('opponentStrums', 3, 'x', defaultOpponentStrumX0);

        setPropertyFromGroup('opponentStrums', 0, 'y', defaultOpponentStrumY0 + 700);
        setPropertyFromGroup('opponentStrums', 1, 'y', defaultOpponentStrumY1 + 700);
        setPropertyFromGroup('opponentStrums', 2, 'y', defaultOpponentStrumY2 + 700);
        setPropertyFromGroup('opponentStrums', 3, 'y', defaultOpponentStrumY3 + 700);


        noteTweenAngle('defaultPlayerStrum0', 0, 180, 1.5, 'linear')
		noteTweenAngle('defaultPlayerStrum1', 1, 180, 1.5, 'linear')
		noteTweenAngle('defaultPlayerStrum2', 2, 180, 1.5, 'linear')
		noteTweenAngle('defaultPlayerStruX3', 3, 180, 1.5, 'linear')
	end
    

    if downscroll ==  true then
        noteTweenY('defaultPlayerStrumY0', 0, defaultOpponentStrumY3, 1.5 ,'linear')
        noteTweenY('defaultPlayerStrumY1', 1, defaultOpponentStrumY2, 1.5 ,'linear')
        noteTweenY('defaultPlayerStrumY2', 2, defaultOpponentStrumY1, 1.5 ,'linear')
        noteTweenY('defaultPlayerStrumY3', 3, defaultOpponentStrumY0, 1.5 ,'linear')


        setPropertyFromGroup('opponentStrums', 0, 'x', defaultOpponentStrumX3);
        setPropertyFromGroup('opponentStrums', 1, 'x', defaultOpponentStrumX2);
        setPropertyFromGroup('opponentStrums', 2, 'x', defaultOpponentStrumX1);
        setPropertyFromGroup('opponentStrums', 3, 'x', defaultOpponentStrumX0);

        setPropertyFromGroup('opponentStrums', 0, 'y', defaultOpponentStrumY0 - 700);
        setPropertyFromGroup('opponentStrums', 1, 'y', defaultOpponentStrumY1 - 700);
        setPropertyFromGroup('opponentStrums', 2, 'y', defaultOpponentStrumY2 - 700);
        setPropertyFromGroup('opponentStrums', 3, 'y', defaultOpponentStrumY3 - 700);

        

        noteTweenAngle('defaultPlayerStrum0', 0, 180, 1.5, 'linear')
		noteTweenAngle('defaultPlayerStrum1', 1, 180, 1.5, 'linear')
		noteTweenAngle('defaultPlayerStrum2', 2, 180, 1.5, 'linear')
		noteTweenAngle('defaultPlayerStruX3', 3, 180, 1.5, 'linear')
    end

	if middlescroll == false then
		setPropertyFromGroup('strumLineNotes', 0, 'alpha', 1);
		setPropertyFromGroup('strumLineNotes', 1, 'alpha', 1);
		setPropertyFromGroup('strumLineNotes', 2, 'alpha', 1);
		setPropertyFromGroup('strumLineNotes', 3, 'alpha', 1);

	else
		setPropertyFromGroup('strumLineNotes', 0, 'alpha', 0.5);
		setPropertyFromGroup('strumLineNotes', 1, 'alpha', 0.5);
		setPropertyFromGroup('strumLineNotes', 2, 'alpha', 0.5);
		setPropertyFromGroup('strumLineNotes', 3, 'alpha', 0.5);

	end
end





    --function Checking()
        --downScroll = getPropertyClass('ClientPrefs', 'downScroll');
    --end
