function onCreatePost()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Blent Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'kyle/BLENTNOTE_assets'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', 0); --Default value is: 0.023, health gained on hit
			--setPropertyFromGroup('unspawnNotes', i, 'missHealth', '500'); --Default value is: 0.0475, health lost on miss
			--setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', true);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has no penalties
			end
		end
	end
end


function onCreate()
	--Iterate over all notes
	
	makeAnimatedLuaSprite('lightninganim', 'kyle/animations/ThunderAnimation', defaultBoyfriendX-150, defaultBoyfriendY-380);
	addAnimationByPrefix('lightninganim', 'Idle', 'ThunderAnimation Idle', 24, false);
	addAnimationByPrefix('lightninganim', 'attack', 'ThunderAnimation fall', 24, false);
	--objectPlayAnimation('lightninganim', 'attack')
	scaleObject('lightninganim', 1.2, 1.2)
	addLuaSprite('lightninganim',true);
	--precacheImage('kyle/animations/ThunderAnimation');
	
	--debugPrint('Script started!')
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Blent Note' then
		-- put something here if you want
		--characterPlayAnim('dad','lightning' , true);
		
		
		
		objectPlayAnimation('lightninganim', 'attack',true);
		playSound('thunder-attack', 0.5);
		
		characterPlayAnim('girlfriend','scared',true);
		setProperty('girlfriend.specialAnim', true);
		characterPlayAnim('boyfriend', 'dodge', true);
		setProperty('boyfriend.specialAnim', true);
		
		cameraShake('camGame', 0.01, 0.2);
		
		
	end
end

-- Called after the note miss calculations
-- Player missed a note by letting it go offscreen
function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'Blent Note' then
		
		objectPlayAnimation('lightninganim', 'attack',true);
		playSound('thunder-hit', 0.5);
		characterPlayAnim('boyfriend', 'hurt', true);
		setProperty('boyfriend.specialAnim', true);
		characterPlayAnim('girlfriend','scared',true);
		setProperty('girlfriend.specialAnim', true);

		if songName == 'Ecstasy-EX' then
			setProperty('health', getProperty('health')-0.5);
			cameraShake('camGame', 0.05, 2)
			cameraShake('hud', 0.08, 2)
		else

			if week == 'weekBlent' then
				if difficulty == 1 then
					setProperty('health', getProperty('health')-0.5);
					cameraShake('camGame', 0.05, 2)
					cameraShake('hud', 0.08, 2)
		
				end
				if difficulty == 0 then
					setProperty('health', getProperty('health')-0.2);
					cameraShake('camGame', 0.05, 1)
					cameraShake('hud', 0.08, 1)

				end
			else
				if difficulty == 2 then
					setProperty('health', getProperty('health')-0.5);
					cameraShake('camGame', 0.05, 2)
					cameraShake('hud', 0.08, 2)
		
				end
				if difficulty == 1 then
					setProperty('health', getProperty('health')-0.2);
					cameraShake('camGame', 0.05, 1)
					cameraShake('hud', 0.08, 1)

				end
			end
			
		end
		
	end
end

