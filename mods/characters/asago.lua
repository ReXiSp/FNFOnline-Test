function onCreate()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'asrghndead')
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'asago_death')
	addCharacterToList('asrghndead', 'boyfriend')
end

function onGameOver()

	setProperty('defaultCamZoom', 0.8)
	setProperty('camGame.zoom', 0.8)

end