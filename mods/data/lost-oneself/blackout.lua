function onBeatHit()
    if curBeat == 712 then
        cameraFade('game', '000000', 0.0000000001)
        setProperty('iconP1.visible', false)
        setProperty('iconP2.visible', false)
        setProperty('iconP2.alpha', 0)
        setProperty('dadwin.visible', false)
        setProperty('dadwin.alpha', 0)
        setProperty('bandage.visible', false)
        setProperty('healthBar.visible', false)
        setProperty('healthBarBG.visible', false)
        setProperty('timeBar.visible', false)
        setProperty('timeTxt.visible', false)
        for i = 0,3 do
            setPropertyFromGroup('playerStrums', i, 'x', -4000)
        end
    end
end