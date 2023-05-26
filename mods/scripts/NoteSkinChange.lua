function onCreatePost()
	
	-- makeAnimatedLuaSprite("dummy", "noteskins/meltical_notes", 0, 0)
	-- makeAnimatedLuaSprite("dummy", "noteskins/note_aroma", 0, 0)
	-- makeAnimatedLuaSprite("dummy", "noteskins/note_aromel", 0, 0)
	-- makeAnimatedLuaSprite("dummy", "noteskins/note_nanase", 0, 0)
	-- makeAnimatedLuaSprite("dummy", "noteskins/note_JP", 0, 0)
	-- makeAnimatedLuaSprite("dummy", "noteskins/note_silfa", 0, 0)
	-- makeAnimatedLuaSprite("dummy", "noteskins/note_shian", 0, 0)
	-- makeAnimatedLuaSprite("dummy", "noteskins/note_beta", 0, 0)
	-- makeAnimatedLuaSprite("dummy", "noteskins/note_silfa-playable.png", 0, 0)
	-- makeAnimatedLuaSprite("dummy", "noteskins/blent_NOTE", 0, 0)
	-- makeAnimatedLuaSprite("dummy", "noteskins/NOTE_splashes-aroma", 0, 0)
	-- makeAnimatedLuaSprite("dummy", "noteskins/NOTE_splashes-aromel", 0, 0)
	-- makeAnimatedLuaSprite("dummy", "noteskins/NOTE_splashes-beta", 0, 0)
	-- makeAnimatedLuaSprite("dummy", "noteskins/NOTE_splashes-meltical", 0, 0)
	-- makeAnimatedLuaSprite("dummy", "noteskins/NOTE_splashes-nanase", 0, 0)
	-- makeAnimatedLuaSprite("dummy", "noteskins/NOTE_splashes-nanase", 0, 0)
	-- makeAnimatedLuaSprite("dummy", "noteskins/NOTE_splashes-shian", 0, 0)
	-- makeAnimatedLuaSprite("dummy", "noteskins/NOTE_splashes-shilfa", 0, 0)
	-- makeAnimatedLuaSprite("dummy", "noteskins/NOTE_splashes-shilfa-playable", 0, 0)
	-- makeAnimatedLuaSprite("dummy", "noteskins/NOTE_splashes-silfa", 0, 0)
	-- makeAnimatedLuaSprite("dummy", "noteskins/NOTE_splashes-silfa-playable", 0, 0)


	if dadName == 'meltical' then --replace the name for your character name
		for i=0,4,1 do
			setPropertyFromGroup('opponentStrums', i, 'texture', 'noteskins/meltical_notes')
		end
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteskins/meltical_notes'); --Change texture
			end
		end
	end
	if dadName == 'aroma' then --replace the name for your character name
		for i=0,4,1 do
			setPropertyFromGroup('opponentStrums', i, 'texture', 'noteskins/note_aroma')
		end
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteskins/note_aroma'); --Change texture
			end
		end
	end
	if dadName == 'aromelsingle' then --replace the name for your character name
		for i=0,4,1 do
			setPropertyFromGroup('opponentStrums', i, 'texture', 'noteskins/note_aromel')
		end
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteskins/note_aromel'); --Change texture
			end
		end
	end
	if dadName == 'aromeldouble' then --replace the name for your character name
		for i=0,4,1 do
			setPropertyFromGroup('opponentStrums', i, 'texture', 'noteskins/note_aromel')
		end
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteskins/note_aromel'); --Change texture
			end
		end
	end
	if dadName == 'nanase' then --replace the name for your character name
		for i=0,4,1 do
			setPropertyFromGroup('opponentStrums', i, 'texture', 'noteskins/note_nanase')
		end
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteskins/note_nanase'); --Change texture
				setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'noteskins/NOTE_splashes-nanase');
			end
		end
	end

	if dadName == 'plus' then --replace the name for your character name
		for i=0,4,1 do
			setPropertyFromGroup('opponentStrums', i, 'texture', 'noteskins/note_JP')
		end
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteskins/note_JP'); --Change texture
			end
		end
	end
	if dadName == 'photo' then --replace the name for your character name
		for i=0,4,1 do
			setPropertyFromGroup('opponentStrums', i, 'texture', 'noteskins/note_JP')
		end
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteskins/note_JP'); --Change texture
			end
		end
	end
	if dadName == 'jpsingle' then --replace the name for your character name
		for i=0,4,1 do
			setPropertyFromGroup('opponentStrums', i, 'texture', 'noteskins/note_JP')
		end
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteskins/note_JP'); --Change texture
			end
		end
	end
	if dadName == 'jpdouble' then --replace the name for your character name
		for i=0,4,1 do
			setPropertyFromGroup('opponentStrums', i, 'texture', 'noteskins/note_JP')
		end
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteskins/note_JP'); --Change texture
			end
		end
	end

	if dadName == 'silfa' then --replace the name for your character name
		for i=0,4,1 do
			setPropertyFromGroup('opponentStrums', i, 'texture', 'noteskins/note_silfa')
		end
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteskins/note_silfa'); --Change texture
			end
		end
	end
	if dadName == 'Shian' then --replace the name for your character name
		for i=0,4,1 do
			setPropertyFromGroup('opponentStrums', i, 'texture', 'noteskins/note_shian')
		end
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteskins/note_shian'); --Change texture
			end
		end
	end
	if dadName == 'beta' then --replace the name for your character name
		for i=0,4,1 do
			setPropertyFromGroup('opponentStrums', i, 'texture', 'noteskins/note_beta')
		end
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteskins/note_beta'); --Change texture
			end
		end
	end

	if dadName == 'playablemeltical' then --replace the name for your character name
		for i=0,4,1 do
			setPropertyFromGroup('opponentStrums', i, 'texture', 'noteskins/meltical_notes')
		end
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteskins/meltical_notes'); --Change texture
			end
		end
	end
	if dadName == 'playablemelticalw' then --replace the name for your character name
		for i=0,4,1 do
			setPropertyFromGroup('opponentStrums', i, 'texture', 'noteskins/meltical_notes')
		end
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteskins/meltical_notes'); --Change texture
			end
		end
	end
	if dadName == 'cskyleb' then --replace the name for your character name
		for i=0,4,1 do
			setPropertyFromGroup('opponentStrums', i, 'texture', 'noteskins/')
		end
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteskins/'); --Change texture
			end
		end
	end
	if dadName == 'Shianbonus' then --replace the name for your character name
		for i=0,4,1 do
			setPropertyFromGroup('opponentStrums', i, 'texture', 'noteskins/note_shian')
		end
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteskins/note_shian'); --Change texture
			end
		end
	end

	if dadName == 'jpsinglebonus' then --replace the name for your character name
		for i=0,4,1 do
			setPropertyFromGroup('opponentStrums', i, 'texture', 'noteskins/note_JP')
		end
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteskins/note_JP'); --Change texture
			end
		end
	end
	if dadName == 'jpdoublebonus' then --replace the name for your character name
		for i=0,4,1 do
			setPropertyFromGroup('opponentStrums', i, 'texture', 'noteskins/note_JP')
		end
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteskins/note_JP'); --Change texture
			end
		end
	end
	if dadName == 'playablesilfa' then --replace the name for your character name
		for i=0,4,1 do
			setPropertyFromGroup('opponentStrums', i, 'texture', 'noteskins/note_silfa-playable')
		end
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteskins/note_silfa-playable'); --Change texture
			end
		end
	end


	if boyfriendName == 'meltical' then --replace the name for your character name
		for i=0,4,1 do
			setPropertyFromGroup('playerStrums', i, 'texture', 'noteskins/meltical_notes')
		end
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteskins/meltical_notes'); --Change texture
				setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'noteskins/NOTE_splashes-meltical');
			end
		end
	end
	if boyfriendName == 'aroma' then --replace the name for your character name
		for i=0,4,1 do
			setPropertyFromGroup('playerStrums', i, 'texture', 'noteskins/note_aroma')
		end
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteskins/note_aroma'); --Change texture
				setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'noteskins/NOTE_splashes-aroma');
			end
		end
	end
	if boyfriendName == 'aromelsingle' then --replace the name for your character name
		for i=0,4,1 do
			setPropertyFromGroup('playerStrums', i, 'texture', 'noteskins/note_aromel')
		end
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteskins/note_aromel'); --Change texture
				setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'noteskins/NOTE_splashes-aromel');
			end
		end
	end
	if boyfriendName == 'aromeldouble' then --replace the name for your character name
		for i=0,4,1 do
			setPropertyFromGroup('playerStrums', i, 'texture', 'noteskins/note_aromel')
		end
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteskins/note_aromel'); --Change texture
				setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'noteskins/NOTE_splashes-aromel');
			end
		end
	end
	if boyfriendName == 'nanase' then --replace the name for your character name
		for i=0,4,1 do
			setPropertyFromGroup('playerStrums', i, 'texture', 'noteskins/note_nanase')
		end
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteskins/note_nanase'); --Change texture
				setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'noteskins/NOTE_splashes-nanase');
			end
		end
	end

	if boyfriendName == 'plus' then --replace the name for your character name
		for i=0,4,1 do
			setPropertyFromGroup('playerStrums', i, 'texture', 'noteskins/note_JP')
		end
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteskins/note_JP'); --Change texture

			end
		end
	end
	if boyfriendName == 'photo' then --replace the name for your character name
		for i=0,4,1 do
			setPropertyFromGroup('playerStrums', i, 'texture', 'noteskins/note_JP')
		end
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteskins/note_JP'); --Change texture
			end
		end
	end
	if boyfriendName == 'jpsingle' then --replace the name for your character name
		for i=0,4,1 do
			setPropertyFromGroup('playerStrums', i, 'texture', 'noteskins/note_JP')
		end
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteskins/note_JP'); --Change texture
			end
		end
	end
	if boyfriendName == 'jpdouble' then --replace the name for your character name
		for i=0,4,1 do
			setPropertyFromGroup('playerStrums', i, 'texture', 'noteskins/note_JP')
		end
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteskins/note_JP'); --Change texture
			end
		end
	end

	if boyfriendName == 'silfa' then --replace the name for your character name
		for i=0,4,1 do
			setPropertyFromGroup('playerStrums', i, 'texture', 'noteskins/note_silfa')
		end
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteskins/note_silfa'); --Change texture
				setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'noteskins/NOTE_splashes-silfa');
			end
		end
	end
	if boyfriendName == 'Shian' then --replace the name for your character name
		for i=0,4,1 do
			setPropertyFromGroup('playerStrums', i, 'texture', 'noteskins/note_shian')
		end
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteskins/note_shian'); --Change texture
				setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'noteskins/NOTE_splashes-shian');
			end
		end
	end
	if boyfriendName == 'beta' then --replace the name for your character name
		for i=0,4,1 do
			setPropertyFromGroup('playerStrums', i, 'texture', 'noteskins/note_beta')
		end
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteskins/note_beta'); --Change texture
				setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'noteskins/NOTE_splashes-beta');
			end
		end
	end

	if boyfriendName == 'playablemeltical' then --replace the name for your character name
		for i=0,4,1 do
			setPropertyFromGroup('playerStrums', i, 'texture', 'noteskins/meltical_notes')
			
		end
		
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteskins/meltical_notes'); --Change texture
				setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'noteskins/NOTE_splashes-meltical');
			end
		end
	end
	if boyfriendName == 'playablemelticalw' then --replace the name for your character name
		for i=0,4,1 do
			setPropertyFromGroup('playerStrums', i, 'texture', 'noteskins/meltical_notes')
		end
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteskins/meltical_notes'); --Change texture
				setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'noteskins/NOTE_splashes-meltical');
			end
		end
	end
	if boyfriendName == 'cskyleb' then --replace the name for your character name
		for i=0,4,1 do
			setPropertyFromGroup('playerStrums', i, 'texture', 'noteskins/')
		end
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteskins/'); --Change texture
			end
		end
	end

	if boyfriendName == 'jpsinglebonus' then --replace the name for your character name
		for i=0,4,1 do
			setPropertyFromGroup('playerStrums', i, 'texture', 'noteskins/note_JP')
		end
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteskins/note_JP'); --Change texture
			end
		end
	end
	if boyfriendName == 'jpdoublebonus' then --replace the name for your character name
		for i=0,4,1 do
			setPropertyFromGroup('playerStrums', i, 'texture', 'noteskins/note_JP')
		end
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteskins/note_JP'); --Change texture
			end
		end
	end
	if boyfriendName == 'playablesilfa' then --replace the name for your character name
		for i=0,4,1 do
			setPropertyFromGroup('playerStrums', i, 'texture', 'noteskins/note_silfa-playable')
		end
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteskins/note_silfa-playable'); --Change texture
				setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'noteskins/NOTE_splashes-silfa-playable');
			end
		end
	end

	if getProperty('gf.curCharacter') == 'gfbeta' then
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'plr3' or getPropertyFromGroup('unspawnNotes', i, 'gfNote') then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteskins/note_beta'); --Change texture
			end
		end
	end
end

function onCountdownTick(counter)
	-- counter = 0 -> "Three"
	-- counter = 1 -> "Two"
	-- counter = 2 -> "One"
	-- counter = 3 -> "Go!"
	-- counter = 4 -> Nothing happens lol, tho it is triggered at the same time as onSongStart i think
	if counter == 0 then
		if dadName == 'meltical' then
			for i=0,4,1 do
				setPropertyFromGroup('opponentStrums', i, 'texture', 'noteskins/meltical_notes')
				
				end
		end
		if dadName == 'aroma' then
			for i=0,4,1 do
				setPropertyFromGroup('opponentStrums', i, 'texture', 'noteskins/note_aroma')
			
			end
		end
		if dadName == 'aromelsingle' then
			for i=0,4,1 do
				setPropertyFromGroup('opponentStrums', i, 'texture', 'noteskins/note_aromel')
			
			end
		end
		if dadName == 'aromeldouble' then
			for i=0,4,1 do
				setPropertyFromGroup('opponentStrums', i, 'texture', 'noteskins/note_aromel')
			
			end
		end

		if dadName == 'plus' then
			for i=0,4,1 do
				setPropertyFromGroup('opponentStrums', i, 'texture', 'noteskins/note_JP')
			
			end
		end
		if dadName == 'photo' then
			for i=0,4,1 do
				setPropertyFromGroup('opponentStrums', i, 'texture', 'noteskins/note_JP')
			
			end
		end
		if dadName == 'jpsingle' then
			for i=0,4,1 do
				setPropertyFromGroup('opponentStrums', i, 'texture', 'noteskins/note_JP')
			
			end	
		end
		if dadName == 'jpdouble' then
			for i=0,4,1 do
				setPropertyFromGroup('opponentStrums', i, 'texture', 'noteskins/note_JP')
			
			end
		end

		if dadName == 'silfa' then
			for i=0,4,1 do
				setPropertyFromGroup('opponentStrums', i, 'texture', 'noteskins/note_silfa')
			
			end
		end
		if dadName == 'Shian' then
			for i=0,4,1 do
				setPropertyFromGroup('opponentStrums', i, 'texture', 'noteskins/note_shian')
			
			end
		end
		if dadName == 'Shianbonus' then
			for i=0,4,1 do
				setPropertyFromGroup('opponentStrums', i, 'texture', 'noteskins/note_shian')
			
			end
		end
		if dadName == 'beta' then
			for i=0,4,1 do
				setPropertyFromGroup('opponentStrums', i, 'texture', 'noteskins/note_beta')
			
			end
		end

		if dadName == 'playablemeltical' then
			for i=0,4,1 do
				setPropertyFromGroup('opponentStrums', i, 'texture', 'noteskins/meltical_notes')
				
				end
		end
		if dadName == 'playablemelticalw' then
			for i=0,4,1 do
				setPropertyFromGroup('opponentStrums', i, 'texture', 'noteskins/meltical_notes')
				
				end
		end
		if dadName == 'cskyleb' then
			for i=0,4,1 do
				setPropertyFromGroup('opponentStrums', i, 'texture', 'noteskins/')
				
				end
		end
		if dadName == 'playablesilfa' then
			for i=0,4,1 do
				setPropertyFromGroup('opponentStrums', i, 'texture', 'noteskins/note_silfa-playable')
			
			end
		end

		if dadName == 'jpsinglebonus' then
			for i=0,4,1 do
				setPropertyFromGroup('opponentStrums', i, 'texture', 'noteskins/note_JP')
			
			end	
		end
		if dadName == 'jpdoublebonus' then
			for i=0,4,1 do
				setPropertyFromGroup('opponentStrums', i, 'texture', 'noteskins/note_JP')
			
			end
		end

		if dadName == 'nanase' then
			for i=0,4,1 do
				setPropertyFromGroup('opponentStrums', i, 'texture', 'noteskins/note_nanase')
			
			end
		end


		if boyfriendName == 'meltical' then
			for i=0,4,1 do
				setPropertyFromGroup('playerStrums', i, 'texture', 'noteskins/meltical_notes')
				
				end
		end
		if boyfriendName == 'aroma' then
			for i=0,4,1 do
				setPropertyFromGroup('playerStrums', i, 'texture', 'noteskins/note_aroma')
			
			end
		end
		if boyfriendName == 'aromelsingle' then
			for i=0,4,1 do
				setPropertyFromGroup('playerStrums', i, 'texture', 'noteskins/note_aromel')
			
			end
		end
		if boyfriendName == 'aromeldouble' then
			for i=0,4,1 do
				setPropertyFromGroup('playerStrums', i, 'texture', 'noteskins/note_aromel')
			
			end
		end

		if boyfriendName == 'plus' then
			for i=0,4,1 do
				setPropertyFromGroup('playerStrums', i, 'texture', 'noteskins/note_JP')
			
			end
		end
		if boyfriendName == 'photo' then
			for i=0,4,1 do
				setPropertyFromGroup('playerStrums', i, 'texture', 'noteskins/note_JP')
			
			end
		end
		if boyfriendName == 'jpsingle' then
			for i=0,4,1 do
				setPropertyFromGroup('playerStrums', i, 'texture', 'noteskins/note_JP')
			
			end	
		end
		if boyfriendName == 'jpdouble' then
			for i=0,4,1 do
				setPropertyFromGroup('playerStrums', i, 'texture', 'noteskins/note_JP')
			
			end
		end

		if boyfriendName == 'silfa' then
			for i=0,4,1 do
				setPropertyFromGroup('playerStrums', i, 'texture', 'noteskins/note_silfa')
			
			end
		end
		if boyfriendName == 'Shian' then
			for i=0,4,1 do
				setPropertyFromGroup('playerStrums', i, 'texture', 'noteskins/note_shian')
			
			end
		end
		if boyfriendName == 'beta' then
			for i=0,4,1 do
				setPropertyFromGroup('playerStrums', i, 'texture', 'noteskins/note_beta')
			
			end
		end

		if boyfriendName == 'playablemeltical' then
			for i=0,4,1 do
				setPropertyFromGroup('playerStrums', i, 'texture', 'noteskins/meltical_notes')
				
			end
		end
		if boyfriendName == 'playablemelticalw' then
			for i=0,4,1 do
				setPropertyFromGroup('playerStrums', i, 'texture', 'noteskins/meltical_notes')
				
			end
		end
		if boyfriendName == 'cskyleb' then
			for i=0,4,1 do
				setPropertyFromGroup('playerStrums', i, 'texture', 'noteskins/')
				
			end
		end

		if boyfriendName == 'jpsinglebonus' then
			for i=0,4,1 do
				setPropertyFromGroup('playerStrums', i, 'texture', 'noteskins/note_JP')
			
			end	
		end
		if boyfriendName == 'jpdoublebonus' then
			for i=0,4,1 do
				setPropertyFromGroup('playerStrums', i, 'texture', 'noteskins/note_JP')
			
			end
		end
		if boyfriendName == 'nanase' then
			for i=0,4,1 do
				setPropertyFromGroup('playerStrums', i, 'texture', 'noteskins/note_nanase')
			
			end
		end
		if boyfriendName == 'playablesilfa' then
			for i=0,4,1 do
				setPropertyFromGroup('playerStrums', i, 'texture', 'noteskins/note_silfa-playable')
			
			end
		end
	end
end