function onEvent(n,v1,v2)
    if n == 'IntroSkip' then
        setProperty('discordd.visible', false)
        setProperty('blackout.visible', false)
        setProperty('camHUD.alpha', 1)
    end
end