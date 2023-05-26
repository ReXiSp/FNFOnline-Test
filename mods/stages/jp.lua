function onCreate()
	-- background shit
	timing = 120 / bpm * 0.5;
	makeLuaSprite('stagebill', 'backgrounds/jp/bill', -400, -250);
	
	
	makeLuaSprite('stagebacktree', 'backgrounds/jp/citytree', -400, -250);
	makeLuaSprite('stagebacktreebase', 'backgrounds/jp/citytree', -400, -250);
	
	--scaleObject('stagefront', 1.1, 1.1);

	makeLuaSprite('stageroad', 'backgrounds/jpcityroad', -400, -250);

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		
	end

	addLuaSprite('stagebill', false);
	
	makeAnimatedLuaSprite('backW','backgrounds/jp/wellche',-100,100);
	addAnimationByPrefix('backW','Idle','wellche idle',24,false);
	

	

	if songName == 'Obresti' then
		makeAnimatedLuaSprite('ochibi','backgrounds/jp/laetitia',1600,400);
		addAnimationByPrefix('ochibi','Idle','laetitia idle',24,false);
		
		makeAnimatedLuaSprite('madannniki','backgrounds/jp/madann',1150,130);
		addAnimationByPrefix('madannniki','Idle','madann idle',24,false);

		makeAnimatedLuaSprite('queen','backgrounds/jp/thequeenofhatred',500,380);
		addAnimationByPrefix('queen','Idle','thequeenofhatred idle',24,false);

		makeAnimatedLuaSprite('photo','backgrounds/jp/photo',1100,300);
		addAnimationByPrefix('photo','Idle','photo idle',24,false);

		addLuaSprite('backW',false);
		addLuaSprite('ochibi',false);
		addLuaSprite('madannniki',false);
		
		addLuaSprite('queen',false);
		addLuaSprite('stagebacktree', false);
		addLuaSprite('photo',false);

		setProperty('stagebacktreebase.visible', false)
		
	end

	if songName == 'Nuotrauka' then
		makeAnimatedLuaSprite('backW','backgrounds/jp/wellche-red',-100,100);
		addAnimationByPrefix('backW','Idle','wellche-red idle',24,false);

		makeAnimatedLuaSprite('batsu','backgrounds/jp/punishingbird',getProperty('backW.x')+350,getProperty('backW.y')+30)
		addAnimationByPrefix('batsu','Idle','punishingbird idle',24,false);

		makeAnimatedLuaSprite('melwithsinging','backgrounds/jp/singingmachine',1350,270)
		addAnimationByPrefix('melwithsinging','Idle','singingmachine idle',24,false);

		makeAnimatedLuaSprite('plus','backgrounds/jp/plus',250,350)
		addAnimationByPrefix('plus','Idle','plus idle',24,false);

		addLuaSprite('batsu',false);
		addLuaSprite('backW',false);
		addLuaSprite('plus',false);
		addLuaSprite('melwithsinging',false);
		addLuaSprite('stagebacktree', false);

		setProperty('stagebacktreebase.visible', false)

	end

	if songName == 'The-Bond-of-Twins' then
		makeAnimatedLuaSprite('tourou','backgrounds/jp/meatlantern',1500,550)
		addAnimationByPrefix('tourou','Idle','meatlantern idle',24,false);

		makeAnimatedLuaSprite('butterflie','backgrounds/jp/butterflies',1400,50)
		addAnimationByPrefix('butterflie','Idle','butterflies idle',24,false)

		makeLuaSprite('hachijihann','backgrounds/jp/donttouchme',650,400)

		addLuaSprite('backW',false);
		addLuaSprite('hachijihann',false);
		addLuaSprite('stagebacktree', false);
		addLuaSprite('tourou',false);
		addLuaSprite('butterflie',false);

		
		if lowQuality == false then
			makeLuaSprite('altback', 'backgrounds/jp/alt/galaxyroom', -400, -250)
			makeAnimatedLuaSprite('katona', 'backgrounds/jp/alt/Katona', defaultGirlfriendX + 50, defaultGirlfriendY + 50)
			makeAnimatedLuaSprite('himlen', 'backgrounds/jp/alt/Himlen', 1300, 200)
			addAnimationByPrefix('katona', 'Idle', 'Katona idle', 24, false)
			addAnimationByPrefix('himlen', 'Idle', 'Himlen idle', 24, false)

			setProperty('altback.visible', false)
			setProperty('katona.visible', false)
			setProperty('himlen.visible', false)

			addLuaSprite('altback', false)
			addLuaSprite('katona', false)
			addLuaSprite('himlen', false)
		end

		setProperty('stagebacktreebase.visible', false)

	end
	
	addLuaSprite('stagebacktreebase', false)
	addLuaSprite('stageroad', false);
	
	
	
end

function onBeatHit()
	objectPlayAnimation('backW','Idle',true);
	objectPlayAnimation('ochibi','Idle',true);
	objectPlayAnimation('madannniki','Idle',true);
	objectPlayAnimation('queen','Idle',true);
	objectPlayAnimation('batsu','Idle',true);
	objectPlayAnimation('melwithsinging','Idle',true);
	objectPlayAnimation('plus','Idle',true);
	objectPlayAnimation('tourou','Idle',true);
	objectPlayAnimation('butterflie','Idle',true);
	objectPlayAnimation('photo','Idle',true);
	objectPlayAnimation('katona','Idle',true);
	objectPlayAnimation('himlen','Idle',true);
	if songName == 'The-Bond-of-Twins' then
		if lowQuality == false then
			if curStep >= 1114 and curStep < 1118 then
			
				setProperty('altback.visible', true)
				setProperty('katona.visible', true)
				setProperty('himlen.visible', true)
				cameraFlash('camGame', '0xFFFFFF', timing * 4)
			end
	
			if curStep >= 1430 and curStep < 1434 then
			
				setProperty('altback.visible', false)
				setProperty('katona.visible', false)
				setProperty('himlen.visible', false)
				cameraFlash('camGame', '0xFFFFFF', timing * 4)
			end
		end
	end
end