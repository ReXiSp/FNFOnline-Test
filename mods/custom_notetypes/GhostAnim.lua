function onCreate()
    for notes = 0,getProperty('unspawnNotes.length')-1 do
        if getPropertyFromGroup('unspawnNotes',notes,'noteType') == 'GhostAnim' then
            setPropertyFromGroup('unspawnNotes',notes,'ignoreNote',true)
            setPropertyFromGroup('unspawnNotes',notes,'active',false)
        end
    end
end

local singAnims = {'singLEFT','singDOWN','singUP','singRIGHT'}

function onUpdate(el)

    for notes = 0,getProperty('notes.length')-1 do

        if getPropertyFromGroup('notes',notes,'noteType') == 'GhostAnim' then
            setPropertyFromGroup('notes',notes,'visible', false)
			local noteOfs = 5
			if getPropertyFromGroup('notes',notes,'isSustainNote') then
				noteOfs = 30
			end
            if getPropertyFromGroup('notes',notes,'strumTime') - getSongPosition() <= noteOfs then

                if getPropertyFromGroup('notes',notes,'mustPress') then
                    setProperty('boyfriend.specialAnim', true)
				    playAnim('boyfriend', singAnims[getPropertyFromGroup('notes',notes,'noteData') + 1],true)

                else
                    setProperty('dad.specialAnim', true)
				    playAnim('dad', singAnims[getPropertyFromGroup('notes',notes,'noteData') + 1],true)
                end

                removeFromGroup('notes',notes)
            end
        end
        
    end
end