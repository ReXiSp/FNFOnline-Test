function onCreate()
    makeLuaSprite('sabotage', 'BG/giragus/sabotage', 0, 0)
    --addLuaSprite('sabotage', true)
    setProperty('sabotage.alpha', 0)
    setObjectCamera('sabotage', 'hud')
    setBlendMode('sabotage', 'add')

    makeLuaSprite('sabotage2', 'BG/giragus/sabotage', 0, 0)
    addLuaSprite('sabotage2', true)
    setProperty('sabotage2.alpha', 0)
    setObjectCamera('sabotage2', 'hud')
end

function onEvent(n,v1,v2)
    if n == 'sabotage' then

        triggerEvent('Add Camera Zoom', '0.1', '0.05')

        cancelTween('sa')
        setProperty('sabotage.alpha', 1)
        doTweenAlpha('sa', 'sabotage', 0, 0.5, 'linear')

        cancelTween('sa2')
        setProperty('sabotage2.alpha', 0.25)
        doTweenAlpha('sa2', 'sabotage2', 0, 0.5, 'linear')
    end
end