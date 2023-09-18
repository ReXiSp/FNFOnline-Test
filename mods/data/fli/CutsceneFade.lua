--i'm just kinda praying this isn't too janky

function onCreate()
	if isStoryMode then
		makeLuaSprite('blackTransition', nil, -250, -250);
		setScrollFactor('blackTransition', 0, 0)
		makeGraphic('blackTransition', screenWidth * 3, screenHeight * 3, '000000')
		addLuaSprite('blackTransition', true);
	end
end

local allowCountdown = false
function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
		startVideo('fly');
		allowCountdown = true;
		return Function_Stop;
	end
	runTimer('blackDelay', 0.2)
	return Function_Continue;
end

function onTimerCompleted(tag)
	if tag == 'blackDelay' then
		doTweenAlpha('blackTransitionTwn', 'blackTransition', 0, 0.5, 'sineOut');
	end
end

function onTweenCompleted(tag)
	if tag == 'blackTransitionTwn' then
		removeLuaSprite('blackTransition', true);
	end
end