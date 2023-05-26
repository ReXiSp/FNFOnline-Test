function onCreate()
	-- background shit
	makeLuaSprite('stagesky', 'backgrounds/shialfabeta/cafesky', -400, -250);
	setScrollFactor('stagesky', 0.5, 0.5);
	
	makeLuaSprite('stagebackground', 'backgrounds/shialfabeta/caferoad', -400, -250);
	setScrollFactor('stagebackground', 0.9, 0.9);
	--scaleObject('stagefront', 1.1, 1.1);

	makeLuaSprite('stageroad', 'backgrounds/shialfabeta/cafemainroad', -400, -250);

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		
	end

	addLuaSprite('stagesky', false);
	addLuaSprite('stagebackground', false);

	

	makeLuaSprite('backcastLK2', 'backgrounds/bonus/table', 950, 480);
	setScrollFactor('backcastLK2', 0.9, 0.9);
	scaleObject('backcastLK2', 1.08, 1.09)
	addLuaSprite('backcastLK2', false);

	makeAnimatedLuaSprite('backSS', 'backgrounds/bonus/backShiansis', -300, 250)
	makeAnimatedLuaSprite('backBS', 'backgrounds/bonus/backBetasis', 350, 380)
	makeAnimatedLuaSprite('backR', 'backgrounds/bonus/backRitia', 450, 280)
	makeAnimatedLuaSprite('backP', 'backgrounds/bonus/backPoffy', 1000, 370)
	makeAnimatedLuaSprite('backK', 'backgrounds/bonus/backKamio', 1400, 230)

	addAnimationByPrefix('backSS', 'Idle', 'backShiansis idle', 24, false)
	addAnimationByPrefix('backBS', 'Idle', 'backBetasis idle', 24, false)
	addAnimationByPrefix('backR', 'Idle', 'backRitia idle', 24, false)
	addAnimationByPrefix('backP', 'Idle', 'backPoffy idle', 24, false)
	addAnimationByPrefix('backK', 'Idle', 'backKamio idle', 24, false)

	setScrollFactor('backSS', 0.9, 0.9)
	setScrollFactor('backBS', 0.9, 0.9)
	setScrollFactor('backR', 0.9, 0.9)
	setScrollFactor('backP', 0.9, 0.9)
	setScrollFactor('backK', 0.9, 0.9)

	addLuaSprite('backSS')
	addLuaSprite('backR')
	addLuaSprite('backBS')
	addLuaSprite('backP')
	addLuaSprite('backK')

	addLuaSprite('stageroad', false);
	
	
	
end

function onBeatHit()
	objectPlayAnimation('backSS', 'Idle', true)
	objectPlayAnimation('backBS', 'Idle', true)
	objectPlayAnimation('backR', 'Idle', true)
	objectPlayAnimation('backP', 'Idle', true)
	objectPlayAnimation('backK', 'Idle', true)
	
end