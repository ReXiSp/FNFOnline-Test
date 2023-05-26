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

	if songName == 'convide' or songName == 'chiamare' or songName == 'violet-violence' then
		makeAnimatedLuaSprite('backcastP', 'backgrounds/k/BackPhoto', 1200, 320)
		addAnimationByPrefix('backcastP', 'Idle', 'BackPhoto idle', 24, false)

		makeLuaSprite('singingmachine', 'backgrounds/k/singingmachine', 1350, 450)

		makeAnimatedLuaSprite('backcastN', 'backgrounds/k/BackNanase', 1100, 365)
		addAnimationByPrefix('backcastN', 'Idle', 'BackNanase idle', 24, false)

		setScrollFactor('backcastP', 0.7, 0.7)
		setScrollFactor('backcastN', 0.7, 0.7)
		setScrollFactor('singingmachine', 0.7, 0.7)

		setProperty('backcastP.visible', false)
		setProperty('backcastN.visible', false)

		if songName == 'violet-violence' then
			setProperty('backcastP.visible', true)
			setProperty('backcastN.visible', true)
		end

		addLuaSprite('backcastP')
		addLuaSprite('singingmachine')
		addLuaSprite('backcastN')

	end

	if songName == 'Loud' then
		makeAnimatedLuaSprite('backcastA', 'backgrounds/aromel/BackAroma', 920, 15);
		addAnimationByPrefix('backcastA', 'Idle', 'BackAroma idle', 24, false);

		makeAnimatedLuaSprite('backcastS', 'backgrounds/aromel/BackSly', 1200, 250);
		addAnimationByPrefix('backcastS', 'Idle', 'BackSly idle', 24, false);
		setScrollFactor('backcastS', 0.7, 0.7);
		
		makeLuaSprite('stageroad', 'backgrounds/aromel/road', -400, -150);
		
		addLuaSprite('backcastA',false);
		addLuaSprite('backcastS',false);
	end

	if songName == 'Rapid' then
		makeAnimatedLuaSprite('backcastC','backgrounds/aromel/BackCamellia', 300, 180);
		addAnimationByPrefix('backcastC', 'Idle', 'BackCamellia idle', 24, false);
		setScrollFactor('backcastC', 0.7, 0.7);

		makeLuaSprite('stageroad', 'backgrounds/aromel/road2', -400, -150);

		addLuaSprite('backcastC',false);
	end

	if songName == 'Reconciliation' then
		makeLuaSprite('stageroad', 'backgrounds/aromel/road3', -400, -150);

	end
	
	
	addLuaSprite('stageroad', false);
	
	
	
end

function onBeatHit()
	objectPlayAnimation('backcastA','Idle',true)
	objectPlayAnimation('backcastS','Idle',true)
	objectPlayAnimation('backcastC','Idle',true)
	objectPlayAnimation('backcastP', 'Idle', true)
	objectPlayAnimation('backcastN', 'Idle', true)
end