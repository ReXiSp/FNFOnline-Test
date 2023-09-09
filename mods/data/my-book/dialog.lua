

function onCreatePost()
    addLuaScript("Dialog-lua/Main")
    --triggerEvent('ShortCutDialogue',"MyBook",0);

    makeLuaSprite('screenBlack', '', 0,0)
    makeGraphic('screenBlack', 1280, 720, '000000')
    setScrollFactor('screenBlack', 0, 0)
    addLuaSprite('screenBlack', false)
    setObjectCamera('screenBlack', 'camHUD')
    --setObjectOrder('screenBlack', getObjectOrder('aoken-dialogue'))
    setProperty('screenBlack.alpha', 0)

    makeLuaSprite('dialogueBB', '', 0,498)
    makeGraphic('dialogueBB', 1280, 60, '000000')
    setScrollFactor('dialogueBB', 0, 0)
    addLuaSprite('dialogueBB', true)
    setObjectCamera('dialogueBB', 'camHUD')
    setProperty('dialogueBB.alpha', 0)

end

function onStartCountdown()
    runTimer('startDialogue', 0.8);
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then
        triggerEvent('ShortCutDialogue',"MyBook",0);
	end
end

function onBeatHit()
    --debugPrint(curBeat)
    if curBeat == 236 then
        triggerEvent('ShortCutDialogue',"MyBook",1);
    elseif curBeat == 244 then
        triggerEvent('ShortCutDialogue',"MyBook",2);
    elseif curBeat == 251 then
        triggerEvent('ShortCutDialogue',"MyBook",3);
    elseif curBeat == 260 then
        triggerEvent('ShortCutDialogue',"MyBook",4);
    end
end