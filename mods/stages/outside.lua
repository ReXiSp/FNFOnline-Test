function onCreate()
    makeLuaSprite('bg', 'BG/week2/sin/bg', -260, -0)
    setScrollFactor('bg', 0.85, 0.85)
    addLuaSprite('bg', false)
    scaleObject('bg', 0.5, 0.5)

    makeAnimatedLuaSprite('gfs', 'BG/week2/sin/gfspeaker', 130, 200)
    addAnimationByIndices('gfs', 'danceLeft', 'gfspeaker', '0,1,2,3,4,5,6,7,8,9,10,11,12,13,14')
    addAnimationByIndices('gfs', 'danceRight', 'gfspeaker', '15,16,17,18,19,20,21,22,23,24,25,26,27,28,29')
    addLuaSprite('gfs', false)

    makeAnimatedLuaSprite('cyan', 'BG/week2/sin/ccugh', -180, 200)
    addAnimationByPrefix('cyan', 'idle', 'cc', 24, false)
    setScrollFactor('bg', 0.9, 0.9)
    addLuaSprite('cyan', false)

end

function onCreatePost()

    setScrollFactor('dadGroup', 0.95, 0.95)
    setScrollFactor('gfGroup', 0.9, 0.9)
    setScrollFactor('gfs', 0.95, 0.95)

    setScrollFactor('boyfriend', 1.2, 1.1)

end

function onBeatHit()
    if curBeat % 2 == 0 then      
        playAnim('gfs', 'danceLeft')
        playAnim('cyan', 'idle', true)
    else
        playAnim('gfs', 'danceRight')
        playAnim('cyan', 'idle', true)
    end
end

function onCountdownTick(tick)
    if tick % 2 == 0 then      
        playAnim('gfs', 'danceLeft')
        playAnim('cyan', 'idle', true)
    else
        playAnim('gfs', 'danceRight')
        playAnim('cyan', 'idle', true)
    end
end
