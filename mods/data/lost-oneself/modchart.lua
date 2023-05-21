local defaultNotePos = {};
local shake = 4;
local windowShake = 10;
shakemodchart = false; 
ForceMechanics = true;
safeFrame = 0;
boooopp = 4;
healthDrainShake = true;

function onCreatePost()

    for i = 0,7 do 
        x = getPropertyFromGroup('strumLineNotes', i, 'x')
 
        y = getPropertyFromGroup('strumLineNotes', i, 'y')
 
        table.insert(defaultNotePos, {x,y})
    end
    diffic = getPropertyFromClass('PlayState', 'storyDifficulty')
    --debugPrint(diffic)

end


function onSongStart()


    setPropertyFromGroup('opponentStrums', 0, 'angle', 360);
    setPropertyFromGroup('opponentStrums', 1, 'angle', 360);
    setPropertyFromGroup('opponentStrums', 2, 'angle', 360);
    setPropertyFromGroup('opponentStrums', 3, 'angle', 360);

    noteTweenX('opponentStrums0', 0, defaultOpponentStrumX0 - 640, 1, 'backInOut')
    noteTweenX('opponentStrums1', 1, defaultOpponentStrumX1 - 640, 1, 'backInOut')
    noteTweenX('opponentStrums2', 2, defaultOpponentStrumX2 - 640, 1, 'backInOut')
    noteTweenX('opponentStrums3', 3, defaultOpponentStrumX3 - 640, 1, 'backInOut')
end

function onUpdate(elapsed)
    randomNumberX = math.random(defaultWindowX - 5, getPropertyFromClass("openfl.Lib", "application.window.x") + getRandomInt(-windowShake, windowShake))
    --randomNumberY = math.random(180 - 5, getPropertyFromClass("openfl.Lib", "application.window.y") + getRandomInt(-windowShake, windowShake))

    if curStep <= 5 then
        setPropertyFromGroup('opponentStrums', 0, 'x', -1000);
        setPropertyFromGroup('opponentStrums', 1, 'x', -1000);
        setPropertyFromGroup('opponentStrums', 2, 'x', -1000);
        setPropertyFromGroup('opponentStrums', 3, 'x', -1000);

        setPropertyFromGroup('playerStrums', 0, 'x', 1400);
        setPropertyFromGroup('playerStrums', 1, 'x', 1400);
        setPropertyFromGroup('playerStrums', 2, 'x', 1400);
        setPropertyFromGroup('playerStrums', 3, 'x', 1400);
    end

    if curStep >= 287 and curStep < 543 then
        songPos = getSongPosition()
        local currentBeat = (songPos/3000)*(curBpm/30)
        noteTweenX('defaultPlayerStrumX0', 4, defaultPlayerStrumX0 - 120*math.sin((currentBeat+4*0.25)*math.pi), 0.6)
        noteTweenX('defaultPlayerStrumX1', 5, defaultPlayerStrumX1 - 80*math.sin((currentBeat+5*0.25)*math.pi), 0.6)
        noteTweenX('defaultPlayerStrumX2', 6, defaultPlayerStrumX2 - 120*math.sin((currentBeat+6*0.25)*math.pi), 0.6)
        noteTweenX('defaultPlayerStrumX3', 7, defaultPlayerStrumX3 - 80*math.sin((currentBeat+7*0.25)*math.pi), 0.6)
    end

    if curStep >= 671 and curStep < 799 then

		songPos = getSongPosition()
		local currentBeat = (songPos/3000)*(curBpm/30)
		doTweenAngle('turn', 'camHUD', 1 + 2.5*math.sin((currentBeat+2*0.25)*math.pi), 1, 'circOut')
		doTweenAngle('turn1', 'camGame', 1 - 2.5*math.sin((currentBeat+2*0.25)*math.pi), 1, 'circOut')

        songPos = getSongPosition()
        local currentBeat2 = (songPos/3000)*(curBpm/60)

        noteTweenY('defaultPlayerStrumY4', 4, defaultPlayerStrumY0 + 80*math.sin((currentBeat2+4*0.5)*math.pi), 0.6)
        noteTweenY('defaultPlayerStrumY5', 5, defaultPlayerStrumY1 + 80*math.sin((currentBeat2+5*0.5)*math.pi), 0.6)
        noteTweenY('defaultPlayerStrumY6', 6, defaultPlayerStrumY2 + 80*math.sin((currentBeat2+6*0.5)*math.pi), 0.6)
        noteTweenY('defaultPlayerStrumY7', 7, defaultPlayerStrumY3 + 80*math.sin((currentBeat2+7*0.5)*math.pi), 0.6)

		end

    if curStep >= 1760 and curStep < 2016 then
        songPos = getSongPosition()
        local currentBeat = (songPos/3000)*(curBpm/30)
        noteTweenY('defaultPlayerStrumY0', 4, defaultPlayerStrumY0 + 80*math.sin((currentBeat+4*0.75)*math.pi), 0.6)
        noteTweenY('defaultPlayerStrumY1', 5, defaultPlayerStrumY1 + 80*math.sin((currentBeat+5*0.75)*math.pi), 0.6)
        noteTweenY('defaultPlayerStrumY2', 6, defaultPlayerStrumY2 + 80*math.sin((currentBeat+6*0.75)*math.pi), 0.6)
        noteTweenY('defaultPlayerStrumY3', 7, defaultPlayerStrumY3 + 80*math.sin((currentBeat+7*0.75)*math.pi), 0.6)

        noteTweenX('defaultPlayerStrumX0', 4, defaultPlayerStrumX0 + 120*math.sin((currentBeat+4*0.05)*math.pi), 0.6)
		noteTweenX('defaultPlayerStrumX1', 5, defaultPlayerStrumX1 + 120*math.sin((currentBeat+5*0.05)*math.pi), 0.6)
		noteTweenX('defaultPlayerStrumX2', 6, defaultPlayerStrumX2 + 120*math.sin((currentBeat+6*0.05)*math.pi), 0.6)
		noteTweenX('defaultPlayerStrumX3', 7, defaultPlayerStrumX3 + 120*math.sin((currentBeat+7*0.05)*math.pi), 0.6)
    end
    
    if curStep >= 2016 and curStep < 2272 then
        songPos = getSongPosition()
        local currentBeat = (songPos/3000)*(curBpm/30)
        noteTweenY('defaultPlayerStrumY0', 4, defaultPlayerStrumY0 + 80*math.sin((currentBeat+4*0.75)*math.pi), 0.6)
        noteTweenY('defaultPlayerStrumY1', 5, defaultPlayerStrumY1 + 80*math.sin((currentBeat+5*0.75)*math.pi), 0.6)
        noteTweenY('defaultPlayerStrumY2', 6, defaultPlayerStrumY2 + 80*math.sin((currentBeat+6*0.75)*math.pi), 0.6)
        noteTweenY('defaultPlayerStrumY3', 7, defaultPlayerStrumY3 + 80*math.sin((currentBeat+7*0.75)*math.pi), 0.6)
    
    end

    if curStep >= 2272 and curStep < 2400 then
        songPos = getSongPosition()
		local currentBeat = (songPos/3000)*(curBpm/30)
		doTweenAngle('turn', 'camHUD', 1 + 2.5*math.sin((currentBeat+2*0.25)*math.pi), 1, 'circOut')
		doTweenAngle('turn1', 'camGame', 1 - 2.5*math.sin((currentBeat+2*0.25)*math.pi), 1, 'circOut')
    end

    if curStep >= 2560 and curStep < 2815 then
		doTweenAngle('turn', 'camHUD', 1 + 2.5*math.sin((currentBeat+2*0.25)*math.pi), 1, 'circOut')
		doTweenAngle('turn1', 'camGame', 1 - 2.5*math.sin((currentBeat+2*0.25)*math.pi), 1, 'circOut')

        songPos = getSongPosition()
        local currentBeat = (songPos/3000)*(curBpm/30)

        noteTweenY('defaultPlayerStrumY4', 4, defaultPlayerStrumY0 + 80*math.sin((currentBeat+4*0.5)*math.pi), 0.6)
        noteTweenY('defaultPlayerStrumY5', 5, defaultPlayerStrumY1 + 80*math.sin((currentBeat+5*0.5)*math.pi), 0.6)
        noteTweenY('defaultPlayerStrumY6', 6, defaultPlayerStrumY2 + 80*math.sin((currentBeat+6*0.5)*math.pi), 0.6)
        noteTweenY('defaultPlayerStrumY7', 7, defaultPlayerStrumY3 + 80*math.sin((currentBeat+7*0.5)*math.pi), 0.6)

        noteTweenX('defaultPlayerStrumX0', 4, defaultPlayerStrumX0 - 120*math.sin((currentBeat+4*0.25)*math.pi), 0.6)
        noteTweenX('defaultPlayerStrumX1', 5, defaultPlayerStrumX1 - 80*math.sin((currentBeat+5*0.25)*math.pi), 0.6)
        noteTweenX('defaultPlayerStrumX2', 6, defaultPlayerStrumX2 - 120*math.sin((currentBeat+6*0.25)*math.pi), 0.6)
        noteTweenX('defaultPlayerStrumX3', 7, defaultPlayerStrumX3 - 80*math.sin((currentBeat+7*0.25)*math.pi), 0.6)

		end

    health = getProperty('health')

    songPos = getPropertyFromClass('Conductor', 'songPosition');
 
    currentBeat = (songPos / 300) * (bpm / 160)


    if safeFrame >= 1 then
        setPropertyFromClass("openfl.Lib", "application.window.x", randomNumberX) 
        setPropertyFromClass("openfl.Lib", "application.window.y", defaultWindowY)
    end

    if shakemodchart then
        for i = 4,7 do
            setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + getRandomInt(-shake, shake) + math.sin((currentBeat + i*0.25) * math.pi))
        end                                                        
    end                                                           
end

function onBeatHit()

    if beatHitFuncs[curBeat] then 
        beatHitFuncs[curBeat]() 
    end
end

beatHitFuncs = {
    [24] = function()

    end,

    [28] = function()
        cancel1()
        
    end,

    [68] = function()

    end,

    [72] = function()
        ForceMechanics = true;
        --shakemodchart = true;
        bopping = true;
    end,

    [136] = function()
        cancel1()
        bopping = false;

    end,

--[[     [144] = function()
        if diffic == 2 then
            if downScroll then
                noteTweenY('reverseModchart0', 4, 50, 1, 'bounceOut')
                noteTweenY('reverseModchart1', 5, 50, 1, 'bounceOut')

                setPropertyFromGroup('playerStrums', 0, 'downScroll', false);
                setPropertyFromGroup('playerStrums', 1, 'downScroll', false);
            else 
                noteTweenY('reverseModchart0', 4, 500, 1, 'bounceOut')
                noteTweenY('reverseModchart1', 5, 500, 1, 'bounceOut')

                setPropertyFromGroup('playerStrums', 0, 'downScroll', true);
                setPropertyFromGroup('playerStrums', 1, 'downScroll', true);
            end
        end
    end, ]]

    [164] = function()
		doTweenZoom('zoomback', 'camGame', 1.75, 1, "quartIn")

        --[[ if diffic == 2 then
            noteTweenY('resetY4', 4, defaultPlayerStrumY0, 1, 'elasticOut')
            noteTweenY('resetY5', 5, defaultPlayerStrumY1, 1.25, 'elasticOut')
            noteTweenY('resetY6', 6, defaultPlayerStrumY2, 1.5, 'elasticOut')
            noteTweenY('resetY7', 7, defaultPlayerStrumY3, 1.75, 'elasticOut')

            if downScroll then
                setPropertyFromGroup('playerStrums', 0, 'downScroll', true);
                setPropertyFromGroup('playerStrums', 1, 'downScroll', true);
                setPropertyFromGroup('playerStrums', 2, 'downScroll', true);
                setPropertyFromGroup('playerStrums', 3, 'downScroll', true);
            else
                setPropertyFromGroup('playerStrums', 0, 'downScroll', false);
                setPropertyFromGroup('playerStrums', 1, 'downScroll', false);
                setPropertyFromGroup('playerStrums', 2, 'downScroll', false);
                setPropertyFromGroup('playerStrums', 3, 'downScroll', false);
            end            
        end ]]

    end,

    [168] = function()
        bopping = true;

    end,

    [200] = function()
        --cancel1()

        doTweenAngle('Reset', 'camHUD', 0, 1, 'circOut')
        doTweenAngle('Reset1', 'camGame', 0, 1, 'circOut')
        cancelTween('turn')
        cancelTween('turn1')

        noteTweenX('movingggg0', 4, defaultPlayerStrumX0 - 675, 1, 'elasticOut')
        noteTweenX('movingggg1', 5, defaultPlayerStrumX1 - 450, 1.25, 'elasticOut')
        noteTweenX('movingggg2', 6, defaultPlayerStrumX2 - 225, 1.5, 'elasticOut')
        noteTweenX('movingggg3', 7, defaultPlayerStrumX3, 1.75, 'elasticOut')

        noteTweenY('resetY4', 4, defaultPlayerStrumY0, 1, 'elasticOut')
        noteTweenY('resetY5', 5, defaultPlayerStrumY1, 1.25, 'elasticOut')
        noteTweenY('resetY6', 6, defaultPlayerStrumY2, 1.5, 'elasticOut')
        noteTweenY('resetY7', 7, defaultPlayerStrumY3, 1.75, 'elasticOut')

        cancelTween('defaultPlayerStrumY4')
        cancelTween('defaultPlayerStrumY5')
        cancelTween('defaultPlayerStrumY6')
        cancelTween('defaultPlayerStrumY7')

    end,

    [232] = function()
        --cancel1()

        doTweenAngle('Reset', 'camHUD', 0, 1, 'circOut')
        doTweenAngle('Reset1', 'camGame', 0, 1, 'circOut')
        cancelTween('turn')
        cancelTween('turn1')

        noteTweenX('movingggg0', 4, defaultPlayerStrumX0, 1, 'elasticOut')
        noteTweenX('movingggg1', 5, defaultPlayerStrumX1, 1.25, 'elasticOut')
        noteTweenX('movingggg2', 6, defaultPlayerStrumX2, 1.5, 'elasticOut')
        noteTweenX('movingggg3', 7, defaultPlayerStrumX3, 1.75, 'elasticOut')
        bopping = false;

    end,

    [272] = function()
        setProperty('chromaMechanic', false);
        healthDrainShake = false;
    end,

    [366] = function()
        bopping = true;
        boooopp = 2;
    end,

    [368] = function()
        shakemodchart = true;
        boooopp = 8;
    end,

    [400] = function()
        shake = 8;
    end,

    [416] = function()
        shake = 12;
        boooopp = 6;
    end,

    [424] = function()
        shake = 16;
        boooopp = 2;
    end,

    [428] = function()
        shake = 16;
        boooopp = 1;
    end,

    [432] = function()
        bopping = false;
        boooopp = 4;
        shakemodchart = false;
        cancel1()

    end,

    [438] = function()
        bopping = true;
    end,

    [440] = function()
        boooopp = 8;
        setProperty('chromaMechanic', true);
        healthDrainShake = true
    end,

    [504] = function()
        cancel1()
        shakemodchart = false; 
        boooopp = 4;


    end,

    [564] = function()
        boooopp = 2;
    end,

    [567] = function()
        boooopp = 1;
    end,

    [564] = function()
        boooopp = 2;
    end,
    
    [568] = function()
        boooopp = 4;
        cancel1()

    end,

    [600] = function()
        doTweenAngle('Reset', 'camHUD', 0, 1, 'circOut')
        doTweenAngle('Reset1', 'camGame', 0, 1, 'circOut')
        cancelTween('turn')
        cancelTween('turn1')


    end,

    [704] = function()
        doTweenAngle('Reset', 'camHUD', 0, 1, 'circOut')
        doTweenAngle('Reset1', 'camGame', 0, 1, 'circOut')
        cancelTween('turn')
        cancelTween('turn1')
        cancel1()
    end,

    [712] = function()

        bopping = false;
        setProperty('botplayTxt.visible', false)
        for i = 0,3 do
            setPropertyFromGroup('playerStrums', i, 'visible', false)
        end
        removeLuaScript('data/lost-oneself/modchart')
        
    end,


}

stepHitFuncs = {
    [1] = function()
		--doTweenZoom('Zoom', 'camGame', 1.5, 19.95, "quintIn")
    end,

}

function onStepHit()
    if stepHitFuncs[curStep] then 
        stepHitFuncs[curStep]() 
    end 

    if curStep % boooopp == 0 and bopping == true then
        triggerEvent('Add Camera Zoom', 0.035, 0.035)
	end

    --debugPrint(safeFrame)

    if safeFrame >= 1 then
        safeFrame = safeFrame - 1;
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if healthDrainShake then
        safeFrame = 2;
    end
end

function cancel1()

    noteTweenX('resetX4', 4, defaultPlayerStrumX0, 1, 'elasticOut')
    noteTweenX('resetX5', 5, defaultPlayerStrumX1, 1.25, 'elasticOut')
    noteTweenX('resetX6', 6, defaultPlayerStrumX2, 1.5, 'elasticOut')
    noteTweenX('resetX7', 7, defaultPlayerStrumX3, 1.75, 'elasticOut')

    noteTweenY('resetY4', 4, defaultPlayerStrumY0, 1, 'elasticOut')
    noteTweenY('resetY5', 5, defaultPlayerStrumY1, 1.25, 'elasticOut')
    noteTweenY('resetY6', 6, defaultPlayerStrumY2, 1.5, 'elasticOut')
    noteTweenY('resetY7', 7, defaultPlayerStrumY3, 1.75, 'elasticOut')

    cancelTween('defaultPlayerStrumX0')
    cancelTween('defaultPlayerStrumX1')
    cancelTween('defaultPlayerStrumX2')
    cancelTween('defaultPlayerStrumX3')

    cancelTween('defaultOpponentStrumX0')
    cancelTween('defaultOpponentStrumX1')
    cancelTween('defaultOpponentStrumX2')
    cancelTween('defaultOpponentStrumX3')

    cancelTween('defaultPlayerStrumY0')
    cancelTween('defaultPlayerStrumY1')
    cancelTween('defaultPlayerStrumY2')
    cancelTween('defaultPlayerStrumY3')

    cancelTween('defaultOpponentStrumY0')
    cancelTween('defaultOpponentStrumY1')
    cancelTween('defaultOpponentStrumY2')
    cancelTween('defaultOpponentStrumY3')
    end