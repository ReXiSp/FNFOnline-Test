function onCreatePost()
    doTweenZoom('intro', 'camera', 0.85, 1.2, 'bounceOut')
end

local defZ = 0.85
function onUpdate(elapsed)
    if gfSection then
        setProperty('defaultCamZoom', defZ + 0.15)
    elseif mustHitSection then
        setProperty('defaultCamZoom', defZ + 0)
    else
        setProperty('defaultCamZoom', defZ + 0)
    end
end

