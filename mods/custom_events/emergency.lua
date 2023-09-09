function onCreate()
    makeLuaSprite("blackout", "", 0, 0)
    makeGraphic("blackout", 1280, 720, "000000")
    setObjectCamera("blackout", "other")
    addLuaSprite("blackout", true)
    setProperty("blackout.alpha", 0)
end

function onEvent(n, v1, v2)
    if n == 'emergency' then
        cameraFlash("other", "0xAAFF0000", 0.7, false)
        setProperty("blackout.alpha", 1)
        --setProperty("camHUD.alpha", 0)
    end
end