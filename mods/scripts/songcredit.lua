
local gra = "impostor_v5_lime"
function onCountdownTick(c)

    if c > 0 then return Function_Continue end

    -- debugPrint(c)
    doTweenX(gra.."_infoBGTwn", gra.."_infoBG", 0, 1, "quintinout")
    doTweenX(gra.."_infoTextTwn", gra.."_infoText", 12, 1, "quintinout")

    setPropertyFromClass("flixel.FlxG", "camera.zoom", getProperty("defaultCamZoom"))
    setProperty("camHUD.zoom", 1)
end

function onCreate()
    local path = "data/"..formatToSongPath(songName).."/"..formatToSongPath("info")..".txt"

    -- debugPrint(path)

    if not checkFileExists(path) then return end

    makeLuaSprite(gra.."_infoBG", "", 0, 192)
    addLuaSprite(gra.."_infoBG")
    setObjectCamera(gra.."_infoBG", "hud")

    makeLuaText(gra.."_infoText", getTextFromFile(path), screenWidth, 0, 200)
    setTextSize(gra.."_infoText", 24)
    setTextFont(gra.."_infoText", "arial.ttf")
    setTextBorder(gra.."_infoText", 1, "000000")
    setTextAlignment(gra.."_infoText")
    addLuaText(gra.."_infoText")

    makeGraphic(gra.."_infoBG", getProperty(gra.."_infoText.textField.textWidth") + 30, getProperty(gra.."_infoText.height") + 9, "FFFFFF")
    setProperty(gra.."_infoBG.alpha", 0.5)

    setProperty(gra.."_infoText.x", -getProperty(gra.."_infoText.textField.textWidth") - 8)
    setProperty(gra.."_infoBG.x", -getProperty(gra.."_infoText.textField.textWidth") - 15)
end

function formatToSongPath(path)
    local invalidChars = "[~&\\;:<>#]"
    local hideChars = "[.,'\"%%?!]"
    path = path:gsub(" ", "-")
    path = path:gsub(invalidChars, "-")
    path = path:gsub(hideChars, "")
    return string.lower(path)
end

function onTweenCompleted(tag)
    if tag == gra.."_infoTextTwn" then
        runTimer(gra.."_infoTextWait", 2)
    end

    if tag == gra.."_infoTextByeTwn" then
        removeLuaSprite(gra.."_infoBG")
        removeLuaText(gra.."_infoText")
    end
end

function onTimerCompleted(t, l, ll)
    if t == gra.."_infoTextWait" then
        doTweenX(gra.."_infoTextByeTwn", gra.."_infoText", -getProperty(gra.."_infoText.textField.textWidth") - 22, 1, "quintinout")
        doTweenX(gra.."_infoBGByeTwn", gra.."_infoBG", -getProperty(gra.."_infoText.textField.textWidth") - 30, 1, "quintinout")
    end
end