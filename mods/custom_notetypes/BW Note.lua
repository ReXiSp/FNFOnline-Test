function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'BW Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_assets_bw');
		end
	end
end