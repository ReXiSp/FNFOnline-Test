
function string.split(s, sep)
    if sep == nil then
            sep = "%s"
    end
    local t = {}
    for str in string.gmatch(s, "([^"..sep.."]+)") do
            table.insert(t, str)
    end
    return t
end

function onEvent(name, arg1, arg2)

    -- debugPrint(name)

    if name == "Camera Flash" then

        local splited = string.split(string.gsub(arg2, " ", ""), ",")

        if flashingLights then
            cameraFlash(arg1, splited[1], splited[2], splited[3])
        end 
    end

end

function onCreatePost()

    luaDebugMode = true

end