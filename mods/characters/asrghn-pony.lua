local what = true;
local random = 5;
local fixer = "substates.";
--adnuhsahndijsanjdisabfdfkjhnsdiusaidassdfesdjkkdsjkjdfskjsdfnjekmdjkdjkjhtrue




function onCreate()
	if stringStartsWith(version, '0.6') or stringStartsWith(version, '0.5') then
		fixer = "";
	end
	--debugPrint("fixdata "..fixer)
	math.randomseed(os.time())
    if what and math.random(1,random) == 1 then
	    addCharacterToList('asrghn-pony-dead-wtf', 'boyfriend')
	    setPropertyFromClass(fixer..'GameOverSubstate', 'characterName', 'asrghn-pony-dead-wtf')
	    setPropertyFromClass(fixer..'GameOverSubstate', 'deathSoundName', 'firstDeath_SHIT')
	else
		addCharacterToList('asrghn-pony-dead', 'boyfriend')
	    setPropertyFromClass(fixer..'GameOverSubstate', 'characterName', 'asrghn-pony-dead')
	    setPropertyFromClass(fixer..'GameOverSubstate', 'deathSoundName', 'firstDeath_noMicrophone')
	end

end

function onGameOver()

	--setProperty('defaultCamZoom', 0.8)
	--setProperty('camGame.zoom', 0.8)

end