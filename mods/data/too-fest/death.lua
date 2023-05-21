function onGameOver()
    openCustomSubstate('Death Movie', true)
    return Function_Stop;
end

function onCustomSubstateCreate(name)
    if name == 'Death Movie' then
        startVideo('TooFest_Gameover')
        runTimer("loool", 5, 1)
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == "loool" then
        restartSong(true)
    end
end