local allowCountdown = false
function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
		
		return Function_Stop;
	end
	return Function_Continue;
end

function onCreate()
	if isStoryMode and not seenCutscene then
		makeLuaSprite('skip', 'doyouskipthis', 0, 0)
		setObjectCamera('skip', 'camother')
		addLuaSprite('skip')
	end
	precacheImage('noteskins/blent_NOTE')
	if seenCutscene then
		setProperty('skip.visible', false)
	end
end

function onUpdatePost()
	if not allowCountdown and isStoryMode and not seenCutscene then
		if keyJustPressed('right') then
			setProperty('skip.visible', false)
			startVideo('cscut2');
			allowCountdown = true;
		elseif keyJustPressed('left') then
			setProperty('skip.visible', false)
			startDialogue('dialogue', '');
			allowCountdown = true;
		end
	end
	
end

function onStepHit()
	if curStep == 552 then
		--doTweenAlpha('HUD', 'camHUD', 0, 1, 'linear')
	end
	if curStep == 568 then
		setProperty('defaultCamZoom',1.3);
		
	end
	if curStep == 570 then
		if dadName == 'cskyle' or dadName == 'cskyleb' then --replace the name for your character name
			for i=0,4,1 do
				setPropertyFromGroup('opponentStrums', i, 'texture', 'noteskins/blent_NOTE')
			end
			for i = 0, getProperty('notes.length')-1 do
				if not getPropertyFromGroup('notes', i, 'mustPress') then
					setPropertyFromGroup('notes', i, 'texture', 'noteskins/blent_NOTE'); --Change texture
				end
			end
			for i = 0, getProperty('unspawnNotes.length')-1 do
				if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
					setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteskins/blent_NOTE'); --Change texture
				end
			end
			

		end
		
	end
	if curStep == 572 then
		setProperty('defaultCamZoom',0.8);
		setProperty('camHUD.alpha',1)
	end
end
