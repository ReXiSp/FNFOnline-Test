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

	makeAnimatedLuaSprite('backcastLK', 'backgrounds/shialfabeta/BackLukyle', 950, 370);
	addAnimationByPrefix('backcastLK', 'Idle', 'BackLukyle idle', 24, false);
	setScrollFactor('backcastLK', 0.9, 0.9);

	addLuaSprite('backcastLK', false);

	if songName == 'Frying' then
		

		makeAnimatedLuaSprite('backcastK', 'backgrounds/shialfabeta/backKamio', 1400, 350);
		addAnimationByPrefix('backcastK', 'Idle', 'backKamio idle', 24, false);
		setScrollFactor('backcastK', 0.9, 0.9);

		makeAnimatedLuaSprite('backcastB', 'backgrounds/shialfabeta/backBeta', -100, 580);
		addAnimationByPrefix('backcastB', 'Idle', 'backBeta idle', 24, false);
		--setScrollFactor('backcastB', 0.7, 0.7);
		
		addLuaSprite('backcastK',false);
		addLuaSprite('backcastB',false);
	end

	if songName == 'Pick-a-fight' then
		makeAnimatedLuaSprite('backcastSsis', 'backgrounds/shialfabeta/backShiansis', -200, 350);
		addAnimationByPrefix('backcastSsis', 'Idle', 'backShiansis idle', 24, false);
		setScrollFactor('backcastSsis', 0.9, 0.9);

		makeAnimatedLuaSprite('backcastB', 'backgrounds/shialfabeta/backBeta', -100, 580);
		addAnimationByPrefix('backcastB', 'Idle', 'backBeta idle', 24, false);

		

		addLuaSprite('backcastSsis',false);
		addLuaSprite('backcastB',false);
	end

	if songName == 'GOMADARE' then
		makeAnimatedLuaSprite('backcastBsis', 'backgrounds/shialfabeta/backBetasis', -100, 430);
		addAnimationByPrefix('backcastBsis', 'Idle', 'backBetasis idle', 24, false);
		setScrollFactor('backcastBsis', 0.9, 0.9);
		setProperty('backcastBsis.flipX', true);
		scaleObject('backcastBsis', 1.1,1.1);

		addLuaSprite('backcastBsis',false);
	end
	
	
	addLuaSprite('stageroad', false);
	
	
	
end

function onBeatHit()
	if songName == 'GOMADARE' then
		if curStep >= 384 then
			objectPlayAnimation('backcastLK','Idle',true)
			objectPlayAnimation('backcastBsis','Idle',true)

		end

	else
		objectPlayAnimation('backcastLK','Idle',true)
		objectPlayAnimation('backcastK','Idle',true)
		objectPlayAnimation('backcastB','Idle',true)
		objectPlayAnimation('backcastSsis','Idle',true)
		objectPlayAnimation('backcastBsis','Idle',true)
	end
	
end