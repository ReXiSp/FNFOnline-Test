function onCreate()

    makeLuaSprite('bg', '', -200,-200)
    makeGraphic('bg', 2000, 1000, 'FFFFFF')
    setScrollFactor('bg', 0, 0)
    addLuaSprite('bg', false)
    
    --ドラゴンカーセックス！？！？？！？？！！？？？！？！？！！？！？！？？？？？？？？？？？？？？？？
    makeLuaSprite('back', 'back', -380,-230)
    scaleObject('back', 1.05, 1.05)
    setScrollFactor('back', 0.6, 0.6)
    addLuaSprite('back', false)

    --ラフ、画像は削除済である
    --[[
    makeLuaSprite('ref', 'reference', -180,-180)
    scaleObject('ref', 1.05, 1.05)
    setScrollFactor('ref', 0.2, 0.2)
    addLuaSprite('ref', false)
    setProperty('ref.alpha', 0.3)
    ]]

    --さっきくそテキトーに描いた
    makeLuaSprite('chair', 'chair', 422,400)
    scaleObject('chair', 1.0, 1.0)
    setScrollFactor('chair', 0.95, 0.95)
    addLuaSprite('chair', false)

    makeLuaSprite('desk', 'desk', -430,-170)
    setScrollFactor('desk', 1.05, 1)
    addLuaSprite('desk', false)
    
    makeLuaSprite('pc', 'pc', -630,-170)
    setScrollFactor('pc', 1.1, 1.05)
    addLuaSprite('pc', true)

    --大丈夫じゃない、大問題だ
    makeLuaSprite('discordd', 'discordd', -10,-10)
    setScrollFactor('discordd', 0, 0)
    addLuaSprite('discordd', true)

    makeLuaSprite('blackout', '', -200,-200)
    makeGraphic('blackout', 2000, 1000, '000000')
    setScrollFactor('blackout', 0, 0)
    addLuaSprite('blackout', true)

    setObjectOrder('dadGroup', getObjectOrder('desk'))
end

function onCreatePost()
    setProperty('camHUD.alpha', 0)
    setScrollFactor('dadGroup', 0.9, 1)
end

--見づらい、没
--[[
function onUpdate()
    for i = 0, getProperty('unspawnNotes.length') do
        setPropertyFromGroup('playerStrums', i, 'alpha', 0.8)
        setPropertyFromGroup('opponentStrums', i, 'alpha', 0.8)
    end
end
]]

function onBeatHit()

    if curBeat == 1 then
        doTweenAlpha('bo', 'blackout', 0, 2, 'linear')
    end
    if curBeat == 8 then
        doTweenAlpha('dis', 'discordd', 0, 2, 'linear')
        doTweenAlpha('hud', 'camHUD', 1, 2, 'linear')
    end

end