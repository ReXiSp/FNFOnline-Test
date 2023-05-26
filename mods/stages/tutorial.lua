function onCreate()
	-- background shit
	makeLuaSprite('stagesky', 'backgrounds/sky', -400, -150);
	setScrollFactor('stagesky', 0.5, 0.5);
	
	makeLuaSprite('stagebackground', 'backgrounds/ground', -400, -150);
	setScrollFactor('stagebackground', 0.7, 0.7);
	--scaleObject('stagefront', 1.1, 1.1);

	makeLuaSprite('stageroad', 'backgrounds/road', -400, -150);

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		
	end

	addLuaSprite('stagesky', false);
	addLuaSprite('stagebackground', false);
	addLuaSprite('stageroad', false);
	
	
	close(true);
end

