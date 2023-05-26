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
			startVideo('cscut1');
			allowCountdown = true;
		elseif keyJustPressed('left') then
			setProperty('skip.visible', false)
			startDialogue('dialogue', '');
			allowCountdown = true;
		end
	end
	
end
