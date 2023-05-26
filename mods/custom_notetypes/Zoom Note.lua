function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Zoom Note' then
			--setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_assets_bw');
		end
	end
end

--zooms when sung
--just use this when bf is singing some good higah notes or seomting idk
function goodNoteHit(id, direction, noteType, isSustainNote)
if noteType == 'Zoom Note' then
triggerEvent('Add Camera Zoom', '0.015', '0.015');
end
end