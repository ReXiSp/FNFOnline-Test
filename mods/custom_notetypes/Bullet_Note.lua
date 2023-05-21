local noteanimfragahh = true;
local dadstun = false;
function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Bullet_Note' then --Check if the note on the chart is a Bullet Note
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'Bullet_Note'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashHue', 0); --custom notesplash color, why not
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashSat', -20);
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashBrt', 1);
		end
		if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Check if the note on the chart is a Bullet Note
            if getPropertyFromGroup('unspawnNotes', i, 'noteType') == "" then
                setPropertyFromGroup('unspawnNotes', i, 'noAnimation',true)
            end
		end
	end
end
function onUpdate()
	--debugPrint(noteanimfragahh)
	setProperty('dad.stunned', dadstun)
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)
	--debugPrint(id..noteType..noteData)
    if noteanimfragahh == true then
		if noteType == "" then
			dadstun = true;
			runTimer("dad-stun",0.6)
			--setProperty('dad.stunned', true)
			if noteData == 0 then
				playAnim('dad', 'singLEFT', true);
			elseif noteData == 1 then
				playAnim('dad', 'singDOWN', true);
			elseif noteData == 2 then
				playAnim('dad', 'singUP', true);
			elseif noteData == 3 then
				playAnim('dad', 'singRIGHT', true);
			end
			setProperty('dad.specialAnim', true)
		end
	end
end
function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Bullet_Note' then
		dadstun = true;
		runTimer("dad-stun",0.6)
	    playSound('hankshoot', 0.6);
		--triggerEvent("Play Animation","dad","shoot")
		--triggerEvent("Play Animation","bf","shoot")
		runTimer('sin-shoot', 0.2,1);
		characterPlayAnim('dad', 'shoot', true);
		characterPlayAnim('boyfriend', 'shoot', true);
		setProperty('boyfriend.specialAnim', true);
		setProperty('dad.specialAnim', true);
		cameraShake('camGame', 0.01, 0.2)
		noteanimfragahh = false;
    end
end

function noteMiss(id, direction, noteType, isSustainNote)

	if noteType == 'Bullet_Note' then
		setProperty('health', getProperty('health')-0.6);
		runTimer('bleed', 0.2, 20);
		--triggerEvent("Play Animation","dad","shoot")
		runTimer('sin-shoot', 0.2,1);
		playSound('hankshoot', 0.6);
		characterPlayAnim('dad', 'shoot', true);
		dadstun = true;
		runTimer("dad-stun",0.6)
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	--debugPrint(tag)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	if tag == "bleed" then
		if loopsLeft >= 1 then
			setProperty('health', getProperty('health')-0.001);
		end
	end
	if tag == "sin-shoot" then
        noteanimfragahh = true;
    end
	if tag == "dad-stun" then
		dadstun = false;
	end
end