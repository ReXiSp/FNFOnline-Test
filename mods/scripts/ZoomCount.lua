--swagCounter
--[[
function onCreatePost()

	setProperty("skipCountdown", true)

end
]]
function onSongStart()
	
	
	
end


function onCountdownTick(counter)
	if songName == 'Tutorial' then
		
	else
		if counter == 0 then
			triggerEvent('Add Camera Zoom', 0.08,0.08)
		end
		if counter == 1 then
			triggerEvent('Add Camera Zoom', 0.08,0.08)
		end
		if counter == 2 then
			triggerEvent('Add Camera Zoom', 0.08,0.08)
		end
		if counter == 3 then
			triggerEvent('Add Camera Zoom', 0.08,0.08)
		end
		if counter == 4 then
			triggerEvent('Add Camera Zoom', -0.32, -0.32)
		end
	end
	
end