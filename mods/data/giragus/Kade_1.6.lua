--[[
    just a kade engine 1.6 hud that i made cause why not
    if you have any custom difficulty better you go into line 48 to put it in work
    nps counter by @Rocco Productions#7428
]]--
local Strumposx = {0,0,0,0}
local Strumposy = {0,0,0,0}
local Strumposopx = {0,0,0,0}
local Strumposopy = {0,0,0,0}
local notescale = 0.7;
local noteXpos = -45;
function onCreatePost()
    setPropertyFromClass('openfl.Lib','application.window.title',"Friday Night Funkin': Kade Engine")
    setTimeBarColors('00FF00', '808080');
    setProperty('timeBarBG.scale.x', 1.61);
    setProperty('timeBar.scale.x', 1.62);
    setProperty('timeTxt.visible', false);

    makeLuaText('songPosTxt', songName, 0, getProperty('timeBarBG.x') + (getProperty('timeBarBG.width') / 2) - (getProperty('songLength') * 5), getProperty('timeBarBG.y'));
    setTextSize('songPosTxt', 16);
    setProperty('songPosTxt.borderSize', 1);
    addLuaText('songPosTxt');
    --debugPrint(getProperty('songPosTxt.y'))

    makeLuaText('kadeEngineWatermark', songName..' - '..difficultyFromInt(difficulty)..' | KE 1.4.2', 0, 4, getProperty('healthBarBG.y') + 50);
    setTextAlignment('kadeEngineWatermark', 'right');
    setProperty('kadeEngineWatermark.size', 16);
    setProperty('kadeEngineWatermark.borderSize', 1);
    addLuaText('kadeEngineWatermark');

    setHealthBarColors('FF0000', '66FF33');

    for i = 0, getProperty('unspawnNotes.length')-1 do
        setPropertyFromGroup('unspawnNotes', i, 'noteSplashDisabled', true);
    end
    Strumposx[1] = defaultPlayerStrumX0
    Strumposy[1] = defaultPlayerStrumY0
    Strumposx[2] = defaultPlayerStrumX1
    Strumposy[2] = defaultPlayerStrumY1
    Strumposx[3] = defaultPlayerStrumX2
    Strumposy[3] = defaultPlayerStrumY2
    Strumposx[4] = defaultPlayerStrumX3
    Strumposy[4] = defaultPlayerStrumY3

    Strumposopx[1] = defaultOpponentStrumX0
    Strumposopy[1] = defaultOpponentStrumY0
    Strumposopx[2] = defaultOpponentStrumX1
    Strumposopy[2] = defaultOpponentStrumY1
    Strumposopx[3] = defaultOpponentStrumX2
    Strumposopy[3] = defaultOpponentStrumY2
    Strumposopx[4] = defaultOpponentStrumX3
    Strumposopy[4] = defaultOpponentStrumY3
end
function onUpdatePost()
    setProperty('iconP1.origin.x', 0);
    setProperty('iconP1.origin.y', 0);
    setProperty('iconP2.origin.x', 100);
    setProperty('iconP2.origin.y', 0);
    setProperty('iconP1.scale.x', lerp(getProperty('iconP1.scale.x'), 1, 0.50));
    setProperty('iconP1.scale.y', getProperty('iconP1.scale.x'));
    setProperty('iconP2.scale.x', lerp(getProperty('iconP2.scale.x'), 1, 0.50));
    setProperty('iconP2.scale.y', getProperty('iconP2.scale.x'));
    setProperty('songPosTxt.alpha', getProperty('timeBar.alpha'));
    noteCount = getProperty('notes.length');
    for i = 0, noteCount-1 do
        setPropertyFromGroup('notes', i, 'scale.x',notescale)
        setPropertyFromGroup('notes', i, 'scale.y',notescale)
        setPropertyFromGroup('notes', i, 'alpha',1)
        nd = getPropertyFromGroup('notes', i, 'noteData');
        isSustainNote = getPropertyFromGroup('notes', i, 'isSustainNote');
        if getPropertyFromGroup('notes', i, 'mustPress') then
            if downscroll then
                if isSustainNote then
                    setPropertyFromGroup('notes', i, 'y',(getPropertyFromGroup('playerStrums',nd,'y') - 50 + 0.45 * (getSongPosition() - getPropertyFromGroup('notes', i, 'strumTime')) * getProperty('songSpeed')))
                else
                    setPropertyFromGroup('notes', i, 'y',(getPropertyFromGroup('playerStrums',nd,'y') + 0.45 * (getSongPosition() - getPropertyFromGroup('notes', i, 'strumTime')) * getProperty('songSpeed')))
                end
            else
                setPropertyFromGroup('notes', i, 'y',(getPropertyFromGroup('playerStrums',nd,'y') - 0.45 * (getSongPosition() - getPropertyFromGroup('notes', i, 'strumTime')) * getProperty('songSpeed')))
            end
        else
            if isSustainNote then
                    if downscroll then
                        setPropertyFromGroup('notes', i, 'y',(getPropertyFromGroup('opponentStrums',nd,'y') + 0.45 * (getSongPosition() - getPropertyFromGroup('notes', i, 'strumTime')) * getProperty('songSpeed')))
                    else
                        setPropertyFromGroup('notes', i, 'y',(getPropertyFromGroup('opponentStrums',nd,'y') - 100 - 0.45 * (getSongPosition() - getPropertyFromGroup('notes', i, 'strumTime')) * getProperty('songSpeed')))
                    end
            else
                if downscroll then
                    setPropertyFromGroup('notes', i, 'y',(getPropertyFromGroup('opponentStrums',nd,'y') + 0.45 * (getSongPosition() - getPropertyFromGroup('notes', i, 'strumTime')) * getProperty('songSpeed')))
                else
                    setPropertyFromGroup('notes', i, 'y',(getPropertyFromGroup('opponentStrums',nd,'y') - 0.45 * (getSongPosition() - getPropertyFromGroup('notes', i, 'strumTime')) * getProperty('songSpeed')))
                end
            end
        end
    end
    for i = 0,3 do
        setPropertyFromGroup('playerStrums',i,'x',Strumposx[i+1]+noteXpos)
        setPropertyFromGroup('playerStrums',i,'y',Strumposy[i+1])
        setPropertyFromGroup('opponentStrums',i,'x',Strumposopx[i+1]+noteXpos)
        setPropertyFromGroup('opponentStrums',i,'y',Strumposopy[i+1])
    end
end
function opponentNoteHit(id, noteData, noteType, isSustainNote)
    runHaxeCode([[
        game.opponentStrums.members[]]..noteData..[[].playAnim('static', true);
    ]]);
    setPropertyFromGroup('notes', id, 'visible',false)
end
function onEvent(name, value1, value2)
    if name == 'Change Character' then
        setHealthBarColors('FF0000', '66FF33');
    end
end
local difficultyArray = {'Easy', 'Normal', 'Hard'};
function difficultyFromInt(difficulty)
    return difficultyArray[difficulty+1] --adding 1 because lua starts on 1 not 0
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    setPropertyFromGroup('notes', id, 'visible',false)
end
function lerp(a,b,t) return a * (1-t) + b * t end --https://love2d.org/forums/viewtopic.php?t=83180

function onDestroy()
    setPropertyFromClass('openfl.Lib','application.window.title',"Friday Night Funkin': Psych Engine")
end