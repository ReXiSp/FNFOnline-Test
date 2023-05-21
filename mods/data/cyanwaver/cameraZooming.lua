local zoomStep = 4
local zooming = false
local addGame = 0.05
local addHud = 0.04

function onCreatePost()
    setProperty('camZooming', true)
end

function onBeatHit()
    if curBeat == 20 then
        zooming = true
        addGame = 0.04
        zoomStep = 4
    end
    if curBeat == 36 then
        zooming = true
        addGame = 0.06
        zoomStep = 4
    end
    if curBeat == 100 then
        zooming = true
        addGame = 0.05
        zoomStep = 8
    end
    if curBeat == 160 then
        zooming = true
        addGame = 0.05
        zoomStep = 16
    end

    if curBeat == 164 then
        zooming = true
        addGame = 0.04
        zoomStep = 2
    end
    if curBeat == 168 then
        zooming = true
        addGame = 0.06
        zoomStep = 16
    end

    if curBeat == 172 then
        zooming = true
        addGame = 0.04
        zoomStep = 2
    end
    if curBeat == 176 then
        zooming = true
        addGame = 0.06
        zoomStep = 16
    end

    if curBeat == 180 then
        zooming = true
        addGame = 0.06
        zoomStep = 4
    end
    if curBeat == 188 then
        zooming = true
        addGame = 0.03
        zoomStep = 1
    end
    if curBeat == 192 then
        zooming = false
    end
    if curBeat == 196 then
        zooming = true
        addGame = 0.04
        zoomStep = 8
    end
    if curBeat == 226 then
        zooming = true
        addGame = 0.06
        zoomStep = 4
    end
    if curBeat == 228 then
        zooming = true
        addGame = 0.04
        zoomStep = 8
    end
    if curBeat == 256 then
        zooming = true
        addGame = 0.04
        zoomStep = 16
    end
    if curBeat == 260 then
        zooming = true
        addGame = 0.05
        zoomStep = 8
    end
    if curBeat == 324 then
        zooming = true
        addGame = 0.03
        zoomStep = 16
    end
    if curBeat == 356 then
        zooming = true
        addGame = 0.03
        zoomStep = 4
    end
    if curBeat == 372 then
        zooming = true
        addGame = 0.04
        zoomStep = 2
    end
    if curBeat == 384 then
        zooming = true
        addGame = 0.04
        zoomStep = 16
    end
    if curBeat == 400 then
        zooming = true
        addGame = 0.04
        zoomStep = 4
    end
    if curBeat == 404 then
        zooming = true
        addGame = 0.06
        zoomStep = 4
    end
    if curBeat == 532 then
        zooming = true
        addGame = 0.06
        setProperty('cameraSpeed', 2)
        setProperty('defaultCamZoom', 0.9)
    end
    if curBeat == 536 then
        zooming = false
        addGame = 0.06
        setProperty('cameraSpeed', 1.5)
        setProperty('defaultCamZoom', 0.75)
        triggerEvent('Add Camera Zoom', addGame, addHud)
    end
end

function onStepHit()

    if zooming == true then
        if curStep % zoomStep == 0 then
            triggerEvent('Add Camera Zoom', addGame, addHud)
        end
    end
end