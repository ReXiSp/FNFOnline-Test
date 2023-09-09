local sc = 0.9
function onCreate()
    --[[
    makeLuaSprite('bgw', '', -200,-200)
    makeGraphic('bgw', 2000, 1000, 'FFFFFF')
    setScrollFactor('bgw', 0, 0)
    addLuaSprite('bgw', false)
    ]]
    makeLuaSprite('bg', 'MBStage/bg', -210,20)
    scaleObject('bg', 1, 1)
    setScrollFactor('bg', 0.8, 0.95)

    makeAnimatedLuaSprite("cyan", "MBStage/cyancat", 950, 300)
    addAnimationByPrefix("cyan", "idle", "idle", 12, false)
    setScrollFactor("cyan", 0.85, 0.95)

    makeAnimatedLuaSprite("ouka", "MBStage/ouka", 1050, 340)
    addAnimationByPrefix("ouka", "idle", "idle", 12, false)
    setScrollFactor("ouka", 0.9, 0.95)

    makeAnimatedLuaSprite("tomb", "MBStage/tombuntu", -220, 300)
    addAnimationByPrefix("tomb", "idle", "idle", 12, false)
    setScrollFactor("tomb", 0.9, 0.95)

    makeAnimatedLuaSprite("walk1", "MBStage/koucha", 1650, 620)
    addAnimationByPrefix("walk1", "idle", "idle", 12, false)
    setScrollFactor("walk1", 1.2, 1.2)

    makeAnimatedLuaSprite("walk2", "MBStage/taa_silfa", -1300, 540)
    addAnimationByPrefix("walk2", "idle", "idle", 12, false)
    setScrollFactor("walk2", 1.2, 1.2)

    scaleObject("cyan", sc, sc)
    scaleObject("ouka", sc, sc)
    scaleObject("tomb", sc, sc)
    scaleObject("walk1", sc, sc)
    scaleObject("walk2", sc, sc)

--エロあるの！？！？！！？！？！！？！？！？！！！？？！？
    makeLuaSprite('erodoujin', 'MBStage/it', 1100, 900)
    scaleObject('erodoujin', 1, 1)
    setScrollFactor('erodoujin', 1.05, 1.0)

    makeLuaSprite('bartop','',0,-30)
    makeGraphic('bartop',1280,150,'000000')
    setObjectCamera('bartop','hud')
    setScrollFactor('bartop',0,0)

    makeLuaSprite('barbot','',0,600)
    makeGraphic('barbot',1280,150,'000000')
    setScrollFactor('barbot',0,0)
    setObjectCamera('barbot','hud') 



    addLuaSprite('bg', false)
    addLuaSprite("cyan", false)
    addLuaSprite("ouka", false)
    addLuaSprite("tomb", false)
    addLuaSprite('erodoujin', true)
    addLuaSprite("walk1", true)
    addLuaSprite("walk2", true)

    addLuaSprite('bartop', true)
    addLuaSprite('barbot', true)

end

function onBeatHit()
    if curBeat % 1 == 0 then
        bgDance()
    end
    if curBeat % 2 == 0 then
        playAnim("ouka", "idle", true)
    end
end

function onCountdownTick(count)
    if curBeat % 1 == 0 then
        bgDance()
    end
    if curBeat % 2 == 0 then
        playAnim("ouka", "idle", true)
    end
end

function bgDance()
    playAnim("cyan", "idle", true)
    --playAnim("ouka", "idle", true)
    playAnim("tomb", "idle", true)
    playAnim("walk1", "idle", true)
    playAnim("walk2", "idle", true)
end