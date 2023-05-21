
local graphicTag = "vsimpostorv5_lime_"

function onCreate()
    luaDebugMode = true
    setProperty("gfGroup.visible", false)

    makeAnimatedLuaSprite(graphicTag.."o2main", "limegreen/O2Background", -200, -250)
    addLuaSprite(graphicTag.."o2main", false)
    addAnimationByPrefix(graphicTag.."o2main", "stage", "bg jads.png", 0, true)
    playAnim(graphicTag.."o2main", "stage")

    makeAnimatedLuaSprite(graphicTag.."o2fan", "limegreen/fansss", 223, 13)
    addLuaSprite(graphicTag.."o2fan", false)
    addAnimationByPrefix(graphicTag.."o2fan", "fan", "fansss instance", 24, true)
    playAnim(graphicTag.."o2fan", "fan")

    makeLuaSprite(graphicTag.."o2lever", "limegreen/switch", -65, 255)
    addLuaSprite(graphicTag.."o2lever")

    close()
end