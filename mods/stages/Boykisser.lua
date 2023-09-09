function onCreate()
	-- background shit
	makeLuaSprite('white bg', 'white bg', -800, -300);
	setScrollFactor('white bg', 0.9, 0.9);
	scaleObject('white bg', 7.5, 7.5);

	makeLuaSprite('meme top bg v2', 'meme top bg v2', 385, 100);
	setScrollFactor('meme top bg v2', 0.9, 0.9);
	scaleObject('fire', 5.5, 5.5);

	addLuaSprite('white bg', false);
	addLuaSprite('meme top bg v2', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end