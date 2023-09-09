local def = 1
function onStartCountdown()
    def = getProperty('defaultCamZoom')
end

function onEvent(n,v1,v2)
    if n == 'ZoomPlus' then
        setProperty('defaultCamZoom', def + v1)
    end
end