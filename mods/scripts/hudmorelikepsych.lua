
local iconP1Char = ""
local iconP1Offsets = {}

local iconP2Char = ""
local iconP2Offsets = {}

function math.remapToRange(value, start1, stop1, start2, stop2)
    return start2 + (value - start1) * ((stop2 - start2) / (stop1 - start1));
end

function math.lerp(a, b, ratio)

    return a + ratio * (b - a)
    
end

function math.boundTo(value, min, max)
    return math.max(min, math.min(max, value))
end

function onCreatePost()
    luaDebugMode = true

    setTextFont("scoreTxt", "vcr.ttf")
    setTextFont("timeTxt", "vcr.ttf")

    --fnf online icons fuck
    -- makeLuaSprite("icon", "icons/icon-ahogo")
    -- makeLuaSprite("icon", "icons/icon-aoken")
    -- makeLuaSprite("icon", "icons/icon-lime")
    -- makeLuaSprite("icon", "icons/icon-shinohaji")
    -- makeLuaSprite("icon", "icons/icon-sin")
    -- makeLuaSprite("icon", "icons/icon-burakku")
    -- makeLuaSprite("icon", "icons/icon-cyan")
    -- makeLuaSprite("icon", "icons/icon-devilg")
    -- makeLuaSprite("icon", "icons/icon-gfangry")
    -- makeLuaSprite("icon", "icons/icon-giraffe")
    -- makeLuaSprite("icon", "icons/icon-moyashiro")
    -- makeLuaSprite("icon", "icons/icon-girufy")
    -- makeLuaSprite("icon", "icons/icon-radio")
    -- makeLuaSprite("icon", "icons/icon-bf")
    -- makeLuaSprite("icon", "icons/icon-pico")
    -- makeLuaSprite("icon", "icons/icon-redmungus")

    makeLuaSprite("iconP1", "icons/icon-face", 614, getProperty("healthBar.y") - 75)
    addLuaSprite("iconP1", true)
    setObjectCamera("iconP1", "hud")
    setProperty("iconP1.flipX", true)
    setScrollFactor("iconP1", 0, 0)

    makeLuaSprite("iconP2", "icons/icon-face", 513, getProperty("healthBar.y") - 75)
    addLuaSprite("iconP2", true)
    setObjectCamera("iconP2", "hud")
    setScrollFactor("iconP2", 0, 0)
    changeIcon(getProperty("boyfriend.healthIcon"), getProperty("dad.healthIcon"))

    setProperty("scoreTxt.visible", false)
    local size = getProperty("scoreTxt.size")
    -- local color = getProperty("scoreTxt.color")
    local alpha = getProperty("scoreTxt.alpha")
    makeLuaText("fscoreTxt", getTextString("scoreTxt"), screenWidth, 0, getProperty("healthBar.y") + 32)
    addLuaText("fscoreTxt", true)
    setTextSize("fscoreTxt", size)
    -- setTextColor("fscoreTxt", color)
    setTextAlignment("fscoreTxt", "center")
    setTextBorder("fscoreTxt", 1.25, "000000")
    setProperty("fscoreTxt.borderSize", 1.25)
    setProperty("fscoreTxt.alpha", alpha)
    setProperty("fscoreTxt.visible", not getPropertyFromClass("ClientPrefs", "hideHud"))

    setHealthBarColors(rgbToHex(getProperty("dad.healthColorArray[0]"), getProperty("dad.healthColorArray[1]"), getProperty("dad.healthColorArray[2]")), rgbToHex(getProperty("boyfriend.healthColorArray[0]"), getProperty("boyfriend.healthColorArray[1]"), getProperty("boyfriend.healthColorArray[2]")))
end

function changeIcon(char1, char2)
    if char1 ~= iconP1Char then
        local name = "icons/"..char1
        if not checkFileExists("images/"..name..".png") then name = "icons/icon-"..char1 end
        if not checkFileExists("images/"..name..".png") then name = "icons/icon-face" end
        
        -- debugPrint(char2)

        loadGraphic("iconP1", name)
        loadGraphic("iconP1", name, math.floor(getProperty("iconP1.width") / 2), math.floor(getProperty("iconP1.height")))
        iconP1Offsets = {(getProperty("iconP1.width") - 150) / 2, (getProperty("iconP1.width") - 150) / 2}
        updateHitbox("iconP1")
        setProperty("iconP1.offset.x", iconP1Offsets[1])
        setProperty("iconP1.offset.y", iconP1Offsets[2])

        addAnimation("iconP1", "normal", {0}, 0, false)
        addAnimation("iconP1", "lose", {1}, 0, false)
        playAnim("iconP1", "normal")
        iconP1Char = char1

        setProperty("iconP1.antialiasing", getPropertyFromClass("ClientPrefs", "globalAntialiasing"))
        if stringEndsWith(char1, "-pixel") then setProperty("iconP1.antialiasing", false) end
    end

    if char2 ~= iconP2Char then
        local name = "icons/"..char2
        if not checkFileExists("images/"..name..".png") then name = "icons/icon-"..char2 end
        if not checkFileExists("images/"..name..".png") then name = "icons/icon-face" end
        
        -- debugPrint(name)

        loadGraphic("iconP2", name)
        loadGraphic("iconP2", name, math.floor(getProperty("iconP2.width") / 2), math.floor(getProperty("iconP2.height")))
        updateHitbox("iconP2")
        iconP2Offsets = {(getProperty("iconP2.width") - 150) / 2, (getProperty("iconP2.width") - 150) / 2}
        setProperty("iconP2.offset.x", iconP2Offsets[1])
        setProperty("iconP2.offset.y", iconP2Offsets[2])

        addAnimation("iconP2", "normal", {0}, 0, false)
        addAnimation("iconP2", "lose", {1}, 0, false)
        playAnim("iconP2", "normal")
        iconP2Char = char2

        setProperty("iconP1.antialiasing", getPropertyFromClass("ClientPrefs", "globalAntialiasing"))
        if stringEndsWith(char2, "-pixel") then setProperty("iconP1.antialiasing", false) end
    end
end

function onUpdatePost(elapsed)
    if getProperty("healthBar.percent") < 20 then
        playAnim("iconP1", "lose")
    else
        playAnim("iconP1", "normal")
    end

    if getProperty("healthBar.percent") > 80 then
        playAnim("iconP2", "lose")
    else
        playAnim("iconP2", "normal")
    end

    local iconOffset = 26
    setProperty("iconP1.x", getProperty("healthBar.x") + (getProperty("healthBar.width") * (math.remapToRange(getProperty("healthBar.percent"), 0, 100, 100, 0) * 0.01)) + (150 * getProperty("iconP1.scale.x") - 150) / 2 - iconOffset)
    setProperty("iconP2.x", getProperty("healthBar.x") + (getProperty("healthBar.width") * (math.remapToRange(getProperty("healthBar.percent"), 0, 100, 100, 0) * 0.01)) - (150 * getProperty("iconP2.scale.x")) / 2 - iconOffset * 2)

    local mult = math.lerp(1, getProperty("iconP1.scale.x"), math.boundTo(1 - (elapsed * 9 * playbackRate), 0, 1))
    scaleObject("iconP1", mult, mult)
    updateHitbox("iconP1")
    setProperty("iconP1.offset.x", iconP1Offsets[1])
    setProperty("iconP1.offset.y", iconP1Offsets[2])

    local mult = math.lerp(1, getProperty("iconP2.scale.x"), math.boundTo(1 - (elapsed * 9 * playbackRate), 0, 1))
    scaleObject("iconP2", mult, mult)
    updateHitbox("iconP2")
    setProperty("iconP2.offset.x", iconP2Offsets[1])
    setProperty("iconP2.offset.y", iconP2Offsets[2])

    local size = getProperty("scoreTxt.size")
    -- local color = getProperty("scoreTxt.color")
    local alpha = getProperty("scoreTxt.alpha")
    addLuaText("fscoreTxt", true)
    setTextString("fscoreTxt", getTextString("scoreTxt"))
    setTextSize("fscoreTxt", size)
    -- setTextColor("fscoreTxt", color)
    setTextAlignment("fscoreTxt", "center")
    setTextBorder("fscoreTxt", 1.25, "000000")
    setProperty("fscoreTxt.borderSize", getProperty("scoreTxt.borderSize"))
    setProperty("fscoreTxt.x", getProperty("scoreTxt.x"))
    setProperty("fscoreTxt.y", getProperty("scoreTxt.y"))
    setProperty("fscoreTxt.alpha", alpha)
    setProperty("fscoreTxt.scale.x", getProperty("scoreTxt.scale.x"))
    setProperty("fscoreTxt.scale.y", getProperty("scoreTxt.scale.y"))
    setProperty("fscoreTxt.alpha", getProperty("scoreTxt.alpha"))

    setHealthBarColors(rgbToHex(getProperty("dad.healthColorArray[0]"), getProperty("dad.healthColorArray[1]"), getProperty("dad.healthColorArray[2]")), rgbToHex(getProperty("boyfriend.healthColorArray[0]"), getProperty("boyfriend.healthColorArray[1]"), getProperty("boyfriend.healthColorArray[2]")))
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

function onBeatHit()
    scaleObject("iconP1", 1.2, 1.2)
    scaleObject("iconP2", 1.2, 1.2)
end

function onUpdateScore(miss)

    if scoreZoom and not miss and not getProperty("cpuControlled") then
        setProperty("scoreTxt.scale.x", 1.075)
        setProperty("scoreTxt.scale.y", 1.075)
        doTweenX("scoreTxtTweenX", "scoreTxt.scale", 1, 0.2)
        doTweenY("scoreTxtTweenY", "scoreTxt.scale", 1, 0.2)
    end
end