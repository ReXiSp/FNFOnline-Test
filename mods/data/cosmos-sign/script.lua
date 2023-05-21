function onCreate()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'picoback'); --Character json file for the death animation
end

function onGameOver()
    setProperty('camGame.zoom', 0.85)
end