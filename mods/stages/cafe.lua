function onCreate()
    
    makeLuaSprite('cafe', 'BG/week2/cafe', -1200,-400)
    setScrollFactor('cafe', 0.92, 0.92)
    scaleObject('cafe', 0.8, 0.8)
    addLuaSprite('cafe', false)
    
    makeAnimatedLuaSprite('lily', 'BG/week2/lilybg', -160, 50)
    addAnimationByPrefix('lily', 'idle', 'Lilymana', 24, false)
    setScrollFactor('lily', 0.92, 0.92)
    scaleObject('lily', 1.15,1.15)
    addLuaSprite('lily', false)

    makeAnimatedLuaSprite('sharL', 'BG/week2/shartize', 2000, 300)
    addAnimationByIndices('sharL', 'idle', 'shartize', '2,3,4,5,6,7,8,9', 24)
    setScrollFactor('sharL', 1.2, 1.2)
    addLuaSprite('sharL', true)

    makeAnimatedLuaSprite('sharR', 'BG/week2/shartizer', -2000, 300)
    addAnimationByIndices('sharR', 'idle', 'shartizeR', '2,3,4,5,6,7,8,9', 24)
    setScrollFactor('sharR', 1.2, 1.2)
    addLuaSprite('sharR', true)
    
end

function onCreatePost()
    setScrollFactor('gfGroup', 0.97,0.97)
end

function onBeatHit()
    playAnim('lily', 'idle', true)
    playAnim('sharL', 'idle', true)
    playAnim('sharR', 'idle', true)
end


function onEvent(n,v1,v2)
    if n == 'shartizeWalkin' then
        doTweenX('sharR', 'sharR', 2000, 30, 'linear')
    end
end

function onTweenCompleted(tag)
    if tag == 'sharL' then
        setProperty('sharR.x', -2000)
        doTweenX('sharR', 'sharR', 2000, 30, 'linear')
    end
    if tag == 'sharR' then
        setProperty('sharL.x', 2000)
        doTweenX('sharL', 'sharL', -2000, 30, 'linear')
    end
end