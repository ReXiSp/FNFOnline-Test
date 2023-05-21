function onCreate()

    addCharacterToList('gf-lost-dead')
	setPropertyFromClass('GameOverSubstate', 'characterName', 'gf-lost-dead'); --Character json file for the death animation

end

function opponentNoteHit(id, noteData, noteType, isSustainNote)

    if isSustainNote then
        --cameraShake('game', 0.005, 0.3)

        if getProperty('health') >= 0.3 then

            if not difficultyName == '' then
                if getProperty('health') > 1 then
                    setProperty('health', getProperty('health')-0.01)
                else
                  setProperty('health', getProperty('health')-0.007)
                end

            else
                if getProperty('health') > 1 then
                    setProperty('health', getProperty('health')-0.01*0.5)
                else
                  setProperty('health', getProperty('health')-0.007*0.5)
                end
            end

        end

    else
        --cameraShake('game', 0.01, 0.3)
        triggerEvent('Add Camera Zoom', '0.01', '0.01')
        
        if getProperty('health') >= 0.3 then

            if not difficultyName == 'normal' then
                if getProperty('health') > 1 then
                    setProperty('health', getProperty('health')-0.05)
                else
                   setProperty('health', getProperty('health')-0.02)
                end
                
            else
                if getProperty('health') > 1 then
                    setProperty('health', getProperty('health')-0.05*0.5)
                else
                   setProperty('health', getProperty('health')-0.02*0.5)
                end
            end

        end

    end

end

function onCreatePost()

    setScrollFactor('boyfriend', 1.2, 1.2)
    setScrollFactor('dadGroup', 0.95, 0.95)
    setProperty('camGame.zoom', 0.9)
    doTweenZoom('firstFocus', 'camGame', 0.55, 1.5, 'expoOut')


end

function onTweenCompleted(tag)

    if tag == 'firstFocus' then
        setProperty('cameraSpeed', 1.5)
    end

end

function onUpdate(elapsed)

    songPos = getSongPosition()
    local currentBeat = (songPos/1000)*(bpm/110)
    doTweenY('daddddddddddddddy', 'dadGroup', -300-40*math.sin((currentBeat*0.35)*math.pi),0.001)

end

function onGameOver()

    	setProperty('defaultCamZoom', 1.15)
	    setProperty('camGame.zoom', 1.15)
        --cameraShake('game', 0.005, 0.3)

end