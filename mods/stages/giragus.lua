function onCreate()
    makeLuaSprite('bg', '', -500, -200)
    makeGraphic('bg', 3000, 2000, 'FFFFFF')
    addLuaSprite('bg', false)

    makeLuaSprite('gus', 'BG/giragus/amo', -330, -0)
    scaleObject('gus', 1.5, 1.5)
    addLuaSprite('gus', true)
    setObjectCamera('gus', 'other')
    setProperty('gus.alpha', 0)

    makeLuaSprite('grey', 'BG/giragus/yooo', 1280, 200)
    addLuaSprite('grey', true)
    setObjectCamera('grey', 'other')
end

function onEvent(n,v1,v2)
    if n == 'amogus' then
        if v1 == '1' then
            setProperty('gus.alpha', 1)
            doTweenAlpha('gus', 'gus', 0, 0.5, 'linear')
        end
        if v1 == '2' then
            doTweenX('yo', 'grey', 840, 0.4, 'elasticOut')
            runTimer('yoo', 0.7)
        end
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'yoo' then
        doTweenX('yo', 'grey', 1280, 0.3, 'cubeIn')
    end
end