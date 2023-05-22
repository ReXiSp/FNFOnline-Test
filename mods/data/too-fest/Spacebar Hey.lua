function onUpdate()
	if keyJustPressed('space') then

		-- playSound('vine', 0.6);
		runTimer('yeah', 1, 1)
		stopSound('moron')
		playSound('vine', 0.5, 'moron');
		playAnim('boyfriend', 'hey', true);
		setProperty('boyfriend.specialAnim', true);
		setProperty('bg.alpha', getProperty('bg.alpha')-0.01)
	end
end

function onTimerCompleted(tag, loops, loopsLeft)

	if tag == 'yeah' and getProperty('boyfriend.animation.curAnim.name') == 'hey' then
	playAnim('boyfriend', 'idle', true)
	end
end

function onGameOverStart()
	stopSound('moron')
end
function onEndSong()
	stopSound('moron')
end