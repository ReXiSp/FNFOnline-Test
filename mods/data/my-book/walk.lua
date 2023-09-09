local kcount = 0
local tcount = 0

--[[
function onCreate()
    luaDebugMode = true
    setPropertyFromClass("PlayState", "chartingMode", true)
end
]]

function onBeatHit()
    --debugPrint(''..curBeat..'')
    if curBeat == 10 then
        triggerEvent("walk", "koucha")
    end
    if curBeat == 224 then
        triggerEvent("walk", "taa-silfa")
    end
    if curBeat == 300 then
        triggerEvent("walk", "koucha")
    end
    if curBeat == 400 then
        triggerEvent("walk", "taa-silfa")
    end
    if curBeat == 480 then
        triggerEvent("walk", "koucha")
    end
    if curBeat == 560 then
        triggerEvent("walk", "taa-silfa")
    end
end

function onEvent(n,v1,v2)
    if n == 'walk' then

        if v1 == 'koucha' then
            if kcount % 2 == 0 then
                setProperty("walk1.flipX", false)
                setProperty("walk1.x", 1650)
                doTweenX("ko", "walk1", -1300, 20, "linear")
            else
                setProperty("walk1.flipX", true)
                setProperty("walk1.x", -1300)
                doTweenX("ko", "walk1", 1650, 20, "linear")
            end
            kcount = kcount + 1
            --debugPrint(''..kcount..'')

        elseif v1 == 'taa-silfa' then

            if tcount % 2 == 0 then
                setProperty("walk2.flipX", false)
                setProperty("walk2.x", -1300)
                doTweenX("ts", "walk2", 1650, 20, "linear")
            else
                setProperty("walk2.flipX", true)
                setProperty("walk2.x", 1650)
                doTweenX("ts", "walk2", -1300, 20, "linear")
            end
            tcount = tcount + 1
            --debugPrint(''..tcount..'')

        end
    end
end