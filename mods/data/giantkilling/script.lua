function onCreatePost()

	makeLuaSprite('bye', '', -100, -100);
	makeGraphic('bye',2000,1000,'000000')
    setScrollFactor('bye', 0, 0)
	addLuaSprite('bye', true)
	--setObjectCamera('bye','hud')
	setProperty('bye.visible', false)

end

function onBeatHit()
    if curBeat == 840 then
        setProperty('bye.visible', true)
        setProperty('iconP1.visible', false)
        setProperty('iconP2.visible', false)
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