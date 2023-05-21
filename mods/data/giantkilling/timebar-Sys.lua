timebermode = true;

function onCreate()
    if getPropertyFromClass('ClientPrefs', 'timeBarType') == 'Time Left' then
        timebermode = true;
    else
        timebermode = false;
    end
    --setBlendMode("timeBar", "ADD")
    setProperty('timeBar.scale.x', 1.4)
    setProperty("timeBar.origin.x", 0)
    timebarimageMax = getProperty('timeBar._frame.frame.width')
end


function formatTime(millisecond)
    local seconds = math.floor(millisecond / 1000)

    return string.format("%01d:%02d", (seconds / 60) % 60, seconds % 60)  
end

function onUpdatePost(elapsed)
    --setProperty("timeBarBG.alpha", 0.2)
    --setTextString('timeTxt', formatTime((songLength)-getSongPosition()))
    if (songLength/getProperty('timeBar.scale.x'))-getSongPosition() < 0 then
        if timebermode then
            setProperty('timeBar._frame.frame.width',timebarimageMax/getProperty('timeBar.scale.x'))
            setTextString('timeTxt',"-"..formatTime(math.abs((songLength/getProperty('timeBar.scale.x'))-getSongPosition())))
        end
    else
        if timebermode then
            setProperty('timeBar._frame.frame.width',timebarimageMax/getProperty('timeBar.scale.x'))
            setTextString('timeTxt',formatTime((songLength/getProperty('timeBar.scale.x'))-getSongPosition()))
        end
    end
end