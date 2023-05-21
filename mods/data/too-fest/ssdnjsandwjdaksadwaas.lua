local ic1y = 0
local ic2y = 0

function onCreatePost()
    ic1y = getProperty('iconP1.y')
    ic2y = getProperty('iconP2.y')

    --[[
    setObjectCamera('dadGroup', 'other')
    setProperty('dadGroup.y', -50)
    setProperty('dadGroup.x', -10)
    ]]
end

local asd = 1
function onUpdate(elapsed)
    
    setProperty('iconP2.angle', getProperty('iconP2.angle')+asd*asd%asd)
    setProperty('iconP1.angle', getProperty('iconP1.angle')-asd)
    asd = asd - 0.001

end

function onBeatHit()
    if curBeat % 2 == 0 then
        setProperty('iconP1.y', ic1y +50)
        doTweenY('i1', 'iconP1', ic1y, 0.2, 'elasticOut')
        setProperty('iconP2.y', ic1y -50)
        doTweenY('i2', 'iconP2', ic1y, 0.2, 'elasticOut')
    else
        setProperty('iconP1.y', ic1y -50)
        doTweenY('i11', 'iconP1', ic1y, 0.2, 'elasticOut')
        setProperty('iconP2.y', ic1y +50)
        doTweenY('i22', 'iconP2', ic1y, 0.2, 'elasticOut')
    end
end

function onEvent(n,v1,v2)
    if n == 'NoteSpin' then
        triggerEvent('Add Camera Zoom', 0.1, 0.1)
    end
end
