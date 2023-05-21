function onCreate()
    
    makeLuaSprite('bg', 'BG/gk/stream', -300,-170)
    setScrollFactor('bg', 1, 1)
    addLuaSprite('bg', false)

    makeLuaSprite('bandage', 'BG/gk/bandage', -20, -20)
    scaleObject('bandage', 0.7, 0.7)
    setObjectCamera('bandage', 'hud')
    addLuaSprite('bandage', true)

    makeLuaSprite('underlay', '', 0, -50)
    makeGraphic('underlay', 465, 2000, '000000')
    setObjectCamera('underlay', 'hud')
    addLuaSprite('underlay', true)
    
end

function onCreatePost()

    for i = 0,getProperty('unspawnNotes.length') do
        setPropertyFromGroup('opponentStrums', i, 'x', -400)
    end
    setProperty('underlay.alpha', 0.7)
    setProperty('boyfriend.alpha', 0)

    setProperty('underlay.x', getPropertyFromGroup('playerStrums', 0, 'x')-10)

end