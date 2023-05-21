local zoomStep = 4
local zooming = true
local addGame = 0.05
local addHud = 0.025

function onCreatePost()
    --setProperty('camZooming', true)
end

function onBeatHit()
end

function onStepHit()
    if curBeat == 0 then
        zooming = false
    end
    if curBeat == 16 then
        zooming = true
        zoomStep = 4
    end
    if curBeat == 48 then
        triggerEvent('Add Camera Zoom', addGame, addHud)
    end
    if curBeat == 49 then
        zooming = true
        zoomStep = 4
    end
    if curBeat == 80 then
        zoomStep = 16
    end
    if curBeat == 88 then
        zoomStep = 2
        addGame = 0.05
    end
    if curBeat == 94 then
        zoomStep = 1
        addGame = 0.05
    end
    if curBeat == 95 then
        addGame = 0.05
    end
    if curBeat == 96 then
        zoomStep = 4
        addGame = 0.05
    end
    if curBeat == 158 then
        zoomStep = 2
        addGame = 0.07
    end
    if curBeat == 159 then
        zoomStep = 1
        addGame = 0.07
    end
    if curBeat == 160 then
        zooming = false
    end
        
    if zooming == true then
        if curStep % zoomStep == 0 then
            triggerEvent('Add Camera Zoom', addGame, addHud)
        end
    end
end