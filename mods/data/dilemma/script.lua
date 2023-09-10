function onCreate()
	addCharacterToList('garDTface', 'dad');
	addCharacterToList('annieDTface', 'bf');
	addCharacterToList('DTDeath', 'bf');
	setPropertyFromClass('GameOverSubstate', 'characterName', 'DTDeath'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'DilemmaDeath'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'DilemmaGameOver'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'DilemmaRetry'); --put in mods/music/
end
