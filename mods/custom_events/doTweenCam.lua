function onEvent(n,v1,v2)
    if n == 'doTweenCam' then
        doTweenZoom('g', 'camGame', v1, v2, 'quintInOut')
        triggerEvent('Set Property', 'defaultCamZoom', v1)
    end
end

