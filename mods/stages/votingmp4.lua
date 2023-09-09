function onCreate()

    makeLuaSprite('bg1', 'bitchstage/bg', -350, -200)
    setScrollFactor('bg1', 0.9, 0.9)
    addLuaSprite('bg1', false)
    scaleObject('bg1', 0.7, 0.7)

    makeLuaSprite('ded', 'bitchstage/ded', 430, 480)
    setScrollFactor('ded', 1.05, 1.05)
    addLuaSprite('ded', false)
    setProperty('ded.origin.x', 200)
    setProperty('ded.origin.y', 180)

    makeLuaSprite('bg2', 'bitchstage/bg2', -350, -200)
    setScrollFactor('bg2', 1.05, 1.05)
    addLuaSprite('bg2', true)
    scaleObject('bg2', 0.7, 0.7)

    makeLuaSprite('vig', 'bitchstage/vign', -10, -10)
    addLuaSprite('vig', true)
    setObjectCamera('vig', 'hud')
    setProperty('vig.alpha', 0.8)

    makeAnimatedLuaSprite('war', 'bitchstage/warch', 605, 144)
    setScrollFactor('war', 0.95, 0.95)
    addAnimationByPrefix('war', 'walkin', 'idle', 24, false)
    addLuaSprite('war', true)
    scaleObject('war', 0.9, 0.9)
    setProperty('war.alpha', 0)

end

function onCreatePost()
    setProperty("gf.alpha", 0)
end


local beatdur = 0.25
function onBeatHit()
    if songName == 'bitch' or 'bitch-remix' then
        if curBeat < 73 then
            setProperty('ded.scale.x', 1.03)
            setProperty('ded.scale.y', 0.97)
            doTweenX('dedx', 'ded.scale', 1, beatdur, 'sineInOut')
            doTweenY('dedy', 'ded.scale', 1, beatdur, 'sineOut')
        end
    else
        setProperty('ded.scale.x', 1.03)
        setProperty('ded.scale.y', 0.97)
        doTweenX('dedx', 'ded.scale', 1, beatdur, 'sineInOut')
        doTweenY('dedy', 'ded.scale', 1, beatdur, 'sineOut')
    end

end

function onSongStart()
    setProperty('ded.scale.x', 1.03)
    setProperty('ded.scale.y', 0.97)
    doTweenX('dedx', 'ded.scale', 1, beatdur, 'sineInOut')
    doTweenY('dedy', 'ded.scale', 1, beatdur, 'sineOut')
end

function onEvent(n,v1,v2)
    if n == 'warchiefcomes' then
        playAnim('war', 'walkin', true)
        setProperty('war.alpha', 1)
    end
end