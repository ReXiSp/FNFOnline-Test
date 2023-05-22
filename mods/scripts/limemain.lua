--UI Change Setting
local uiChange = true
local kadeIcon = true

function math.floorDecimal(value, decimals)
    if decimals < 1 then
        return math.floor(value)
    end

    local tempMult = 1
    for i = 1, decimals do
        tempMult = tempMult * 10
    end
    local newValue = math.floor(value * tempMult)
    return newValue / tempMult;
end

function math.lerp(a, b, ratio)

    return a + ratio * (b - a)
    
end

function math.boundTo(value, min, max)
    return math.max(min, math.min(max, value))
end

--pause menu stuff
function onPause()
    setPropertyFromClass("PauseSubState", "songName", "sussus_muzak")
end

function onCreate()
    if songName ~= "lemon-lime" and songName ~= "chlorophyll" and songName ~= "inflorescence" and songName ~= "stargazer" then
        close()
        return
    end
end

function onCreatePost()
    --note splash
    -- for fnf online lmao
    -- makeAnimatedLuaSprite(graphicTag.."noteSplashes", "limegreen/noteSplashes")
    precacheImage("limegreen/noteSplashes")
    setPropertyFromClass("states.PlayState", "SONG.splashSkin", "limegreen/noteSplashes")
    setPropertyFromClass("PlayState", "SONG.splashSkin", "limegreen/noteSplashes") --for legacy

    if uiChange then
        --score txt
        setTextColor("fscoreTxt", rgbToHex(getProperty("dad.healthColorArray[0]"), getProperty("dad.healthColorArray[1]"), getProperty("dad.healthColorArray[2]")))

        --disable timebar
        setProperty("timeTxt.visible", false)
        setProperty("timeBar.visible", false)
        setProperty("timeBarBG.visible", false)

        --kade camera moves
        setProperty("camZoomingDecay", 4)
        setProperty("cameraSpeed", 1.5)
    end

    --title
    -- setPropertyFromClass("lime.app.Application", "current.window.title", "Friday Night Funkin' Kade Engine")
end

function onUpdateScore(miss)
    if uiChange then
        setTextString("scoreTxt", "Score: "..score.." | Combo Breaks: "..misses.." | Accuracy: "..math.floorDecimal(getProperty("ratingPercent") * 100, 2).."%"..(misses > 0 and "" or " | FC"))
    end
end

local p1scale = 1
local p2scale = 1
function onUpdatePost(elapsed)
    if uiChange then
        local ratio = (kadeIcon and 0.50 or math.boundTo(1 - (elapsed * 30 * playbackRate), 0, 1))
        local mult = math.lerp(1, p1scale, ratio)
        scaleObject("iconP1", mult, mult)
        p1scale = mult
        local mult = math.lerp(1, p2scale, ratio)
        scaleObject("iconP2", mult, mult)
        p2scale = mult
    end

end

function onDestroy()
    -- setPropertyFromClass("lime.app.Application", "current.window.title", "Friday Night Funkin': Psych Engine")
end

function onBeatHit()
    if uiChange then
        p1scale = 1.2
        p2scale = 1.2
    end
end

function rgbToHex(r,g,b)
    -- EXPLANATION:
    -- The integer form of RGB is 0xRRGGBB
    -- Hex for red is 0xRR0000
    -- Multiply red value by 0x10000(65536) to get 0xRR0000
    -- Hex for green is 0x00GG00
    -- Multiply green value by 0x100(256) to get 0x00GG00
    -- Blue value does not need multiplication.

    -- Final step is to add them together
    -- (r * 0x10000) + (g * 0x100) + b =
    -- 0xRR0000 +
    -- 0x00GG00 +
    -- 0x0000BB =
    -- 0xRRGGBB
    local rgb = (r * 0x10000) + (g * 0x100) + b
    return string.format("%x", rgb)
end