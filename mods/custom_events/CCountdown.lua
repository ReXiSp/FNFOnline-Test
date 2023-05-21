local xxx = 452.5
local yyy = 182

function onCreate()

    makeLuaSprite('c3', 'BG/week2/cyan3', xxx, yyy)
    setObjectCamera('c3', 'other')

    makeLuaSprite('c2', 'BG/week2/cyan2', xxx, yyy)
    setObjectCamera('c2', 'other')

    makeLuaSprite('c1', 'BG/week2/cyan1', xxx, yyy)
    setObjectCamera('c1', 'other')

    makeLuaSprite('cgo', 'BG/week2/cyango', xxx, yyy)
    setObjectCamera('cgo', 'other')

    addLuaSprite('c3', true)
    addLuaSprite('c2', true)
    addLuaSprite('c1', true)
    addLuaSprite('cgo', true)
    setProperty('c3.alpha', 0)
    setProperty('c2.alpha', 0)
    setProperty('c1.alpha', 0)
    setProperty('cgo.alpha', 0)

end

local dur = 0.3

function onEvent(n,v1,v2)
    
    if n == 'CCountdown' then
        if v1 == '0' then
            setProperty('c3.alpha', 1)
            doTweenAlpha('c3t', 'c3', 0, dur, 'sineIn')
        elseif v1 == '1' then
            setProperty('c2.alpha', 1)
            doTweenAlpha('c2t', 'c2', 0, dur, 'sineIn')
        elseif v1 == '2' then
            setProperty('c1.alpha', 1)
            doTweenAlpha('c1t', 'c1', 0, dur, 'sineIn')
        elseif v1 == '3' then
            setProperty('cgo.alpha', 1)
            doTweenAlpha('cgt', 'cgo', 0, dur, 'sineIn')
        end
    end

end