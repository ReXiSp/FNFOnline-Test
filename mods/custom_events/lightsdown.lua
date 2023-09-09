function onCreate()

	makeLuaSprite('ld', '', -10, -10);
	makeGraphic('ld',2000,1000,'000000')
    setObjectCamera('ld','hud')
	addLuaSprite('ld', false)
	setProperty('ld.alpha', 0)

end

function onEvent(n,v1,v2)
    if n == 'lightsdown' then
        doTweenAlpha("lightsdown", "ld", 1, 1, "sineInOut")
    end
end