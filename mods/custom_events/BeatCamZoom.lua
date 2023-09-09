local addGame = 0.15
local addHUD = 0.15
local BeatZoom = false
local div = 1

function onEvent(n,v1,v2)
        --beatTime = 60 / getPropertyFromClass('Conductor', 'bpm') * 0.95
    if n == 'BeatCamZoom' then
        if v2 == 0 then
            BeatZoom = false
        else
            BeatZoom = true
            div = v1
            addGame = v2
            addHUD = v2 / 2
        end
    end
end

function onBeatHit()

    if BeatZoom == true then
        if curBeat % div == 0 then
            triggerEvent('Add Camera Zoom', addGame, addHUD)
        end
    end

end
