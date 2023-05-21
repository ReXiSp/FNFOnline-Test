function onCreate()

    makeLuaSprite('bg', 'BG/lost/broken', -500, -500)
    scaleObject('bg', 0.9, 0.9)
    setScrollFactor('bg', 0.8, 0.8)
    addLuaSprite('bg', false)

    makeAnimatedLuaSprite('mo', 'BG/lost/brokenmonitor', -500, -500)
    addAnimationByPrefix('mo', 'idle', 'brokenmonitor', 24, true)
    scaleObject('mo', 0.9, 0.9)
    setScrollFactor('mo', 0.8, 0.8)
    addLuaSprite('mo', false)

    makeAnimatedLuaSprite('ra', 'BG/lost/brokenradio', 1600, 500)
    addAnimationByPrefix('ra', 'idle', 'brokenradio', 24, false)
    scaleObject('ra', 0.9, 0.9)
    setScrollFactor('ra', 0.8, 0.8)
    addLuaSprite('ra', false)


    makeLuaSprite('vig', 'BG/lost/vign', -10, -10)
    addLuaSprite('vig', true)
    setObjectCamera('vig', 'other')
    setProperty('vig.alpha', 0.75)
    setObjectOrder('vig', 0)

end

function onBeatHit()
    if curBeat % 2 == 0 then
        playAnim('ra', 'idle', true)
    end
end

function onCountdownTick(tick)
    if tick % 2 == 0 then
        playAnim('ra', 'idle', true)
    end
end
    