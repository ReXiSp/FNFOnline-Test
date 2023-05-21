local spr = {'expl','guns','mark','mlg','nosc','moya'}

function onCreate()

    makeLuaSprite('wt', 'BG/2work/no_yasumi', -300, -300)
    setScrollFactor('wt', 0.2, 0.2)
    addLuaSprite('wt', false)
    scaleObject('wt', 2.8,2.8)

    makeLuaSprite('bg', 'BG/2work/bg', -0, 150)
    setScrollFactor('bg', 0.9, 0.9)
    addLuaSprite('bg', false)
    scaleObject('bg', 2.3,2.3)

    makeAnimatedLuaSprite('expl', 'BG/2work/explo', 0, 0)
    addAnimationByPrefix('expl', 'idle', 'idle', 30, false)
    setObjectCamera('expl', 'other')
    addLuaSprite('expl', true)

    makeAnimatedLuaSprite('mlg', 'BG/2work/mlg', 0, 0)
    addAnimationByPrefix('mlg', 'idle', 'idle', 30, false)
    setObjectCamera('mlg', 'other')
    addLuaSprite('mlg', true)
    
    makeAnimatedLuaSprite('mark', 'BG/2work/marker', 0, 0)
    addAnimationByPrefix('mark', 'idle', 'idle', 30, false)
    setObjectCamera('mark', 'other')
    addLuaSprite('mark', true)

    makeAnimatedLuaSprite('nosc', 'BG/2work/noscope', 0, 0)
    addAnimationByPrefix('nosc', 'idle', 'idle', 30, false)
    setObjectCamera('nosc', 'other')

    makeAnimatedLuaSprite('nosc2', 'BG/2work/noscope', 0, 0)
    addAnimationByPrefix('nosc2', 'idle', 'idle', 30, false)
    setObjectCamera('nosc2', 'other')

    if lowQuality then
        spawn()
    end

    --[[
    makeAnimatedLuaSprite('moya', '2work/moyadance', 460, 0)
    addAnimationByPrefix('moya', 'idle', 'moyadance', 24, true)
    setObjectCamera('moya', 'other')
    addLuaSprite('moya', true)
    scaleObject('moya', 0.9,0.9)

    makeAnimatedLuaSprite('expl', '2work/explo', 0, 0)
    addAnimationByPrefix('expl', 'idle', 'idle', 30, false)
    setObjectCamera('expl', 'other')
    addLuaSprite('expl', true)
    
    makeAnimatedLuaSprite('guns', '2work/guns', 0, 0)
    addAnimationByPrefix('guns', 'idle', 'idle', 30, false)
    setObjectCamera('guns', 'other')
    addLuaSprite('guns', true)

    makeAnimatedLuaSprite('mark', '2work/marker', 0, 0)
    addAnimationByPrefix('mark', 'idle', 'idle', 30, false)
    setObjectCamera('mark', 'other')
    addLuaSprite('mark', true)
    
    makeAnimatedLuaSprite('mlg', '2work/mlg', 0, 0)
    addAnimationByPrefix('mlg', 'idle', 'idle', 30, false)
    setObjectCamera('mlg', 'other')
    addLuaSprite('mlg', true)

    makeAnimatedLuaSprite('nosc', '2work/noscope', 0, 0)
    addAnimationByPrefix('nosc', 'idle', 'idle', 30, false)
    setObjectCamera('nosc', 'other')
    addLuaSprite('nosc', true)
]]--
setalpha(0)

end

function onEvent(n,v1,v2)
  if n == 'COOLEVENT' then

    if v1 == '1' then

        addLuaSprite('mark', true)
        playAnim('mark', 'idle', true)
        addLuaSprite('guns', true)
        playAnim('guns', 'idle', true)
        removeLuaSprite('mark',true)

    elseif v1 == '2' then

        addLuaSprite('nosc', true)
        addLuaSprite('nosc2', true)
        playAnim('nosc', 'idle', true)
        playAnim('nosc2', 'idle', true)
        playSound('hitmarkers', 1)
        setProperty('nosc.alpha', 1)
        setProperty('nosc2.alpha', 1)
        makeAnimatedLuaSprite('mark', 'BG/2work/marker', 0, 0)
        addAnimationByPrefix('mark', 'idle', 'idle', 30, false)
        setObjectCamera('mark', 'other')
        addLuaSprite('mark', true)

        removeLuaSprite('glas',false)


    elseif v1 == '3' then

        makeAnimatedLuaSprite('mark', 'BG/2work/marker', 0, 0)
        addAnimationByPrefix('mark', 'idle', 'idle', 30, false)
        setObjectCamera('mark', 'other')
        addLuaSprite('mark', true)
        makeAnimatedLuaSprite('expl', 'BG/2work/explo', 0, 0)
        addAnimationByPrefix('expl', 'idle', 'idle', 30, false)
        setObjectCamera('expl', 'other')
        addLuaSprite('expl', true)
        setProperty('expl.alpha', 1)
        playAnim('expl', 'idle', true)
        playSound('hitmarkers', 1)

    elseif v1 == '4' then

    removeLuaSprite('moya', true)
    removeLuaSprite('mark', true)
    

    else
        spawn()
        playidles()
        setalpha(1)
        playSound('hitmarkers', 1)
    end

  end
  if n == '8bitglasses' then
    makeLuaSprite('glas', 'BG/2work/glasses', 1280, 0)
    addLuaSprite('glas', false)
    setProperty('glas.x', 1280)
    setObjectCamera('glas', 'other')
    doTweenX('8bitglass','glas', 0, 1.5, 'linear')
  end
end

function playidles()
  playAnim('expl', 'idle', true)
  playAnim('mark', 'idle', true)
  playAnim('mlg', 'idle', true)
  playAnim('nosc', 'idle', true)
  playAnim('moya', 'idle', true)
end

function setalpha(alp)
  setProperty('moya.alpha', alp)
  setProperty('expl.alpha', alp)
  setProperty('guns.alpha', alp)
  setProperty('mark.alpha', alp)
  setProperty('mlg.alpha', alp)
  setProperty('nosc.alpha', alp)
  setProperty('nosc2.alpha', alp)
end

function spawn()
    makeAnimatedLuaSprite('moya', 'BG/2work/moyadance', 460, 0)
    addAnimationByPrefix('moya', 'idle', 'moyadance', 24, true)
    setObjectCamera('moya', 'other')
    addLuaSprite('moya', false)
    scaleObject('moya', 0.9,0.9)
    addLuaSprite('mark', true)
    
    makeAnimatedLuaSprite('guns', 'BG/2work/guns', 0, 0)
    addAnimationByPrefix('guns', 'idle', 'idle', 30, false)
    setObjectCamera('guns', 'other')
    addLuaSprite('guns', true)

end