local Nps = 0;
local MaxNps = 0;
local npsRefresh1 = 0;
local npsRefresh2 = 0;
function onSongStart()
    runTimer(npsTimer1, 0.1, 0);
    runTimer(npsTimer2, 0.5, 0);
end
function goodNoteHit(id, noteData, noteType, isSustainNote)
    if not isSustainNote then
        npsRefresh1 = npsRefresh1 + 1;
    end
    if Nps >= MaxNps then
        MaxNps = Nps;
    end
end
function onTimerCompleted(tag)
    if tag == npsTimer1 then
        npsRefresh2 = npsRefresh1;
        runTimer(npsTimer4, 0.15, 0);
        --debugPrint(Nps, npsRefresh1, npsRefresh2);
    end
    if tag == npsTimer2 then
        Nps = npsRefresh2;
        runTimer(npsTimer3, 1.15, 0);
        --debugPrint(Nps, npsRefresh1, npsRefresh2);
    end
    if tag == npsTimer3 then
        npsRefresh2 = 0;
        --debugPrint(Nps, npsRefresh1, npsRefresh2);
    end
    if tag == npsTimer4 then
        npsRefresh1 = 0;
        --debugPrint(Nps, npsRefresh1, npsRefresh2);
    end
end
local ratingName = 'N/A';
local ranking = 'D'
function onUpdatePost()
    GenerateLetterRank(math.floor((rating * 10000) / 100));
    setTextString('scoreTxt', 'NPS:'..Nps..' (Max '..MaxNps..') | Score:'..getProperty('songScore')..' | Combo Breaks:'..getProperty('songMisses')..' | Accuracy:'..(math.floor(getProperty('ratingPercent') * 10000) / 100)..' % | ('..ratingName..') '..ranking);
    setProperty('scoreTxt.size', 16);
    setProperty('scoreTxt.borderSize', 1);
    scaleObject('scoreTxt', 1, 1);
    setProperty('scoreTxt.y', getProperty('healthBarBG.y')+60);
end
function GenerateLetterRank(accuracy)
    if getProperty('songMisses') == 0 and getProperty('bads') == 0 and getProperty('shits') == 0 and getProperty('goods') == 0 then
        ratingName = 'MFC';
    elseif getProperty('songMisses') == 0 and getProperty('bads') == 0 and getProperty('shits') == 0 and getProperty('goods') >= 1 then
        ratingName = 'GFC';
    elseif getProperty('songMisses') == 0 then
        ratingName = 'FC';
    elseif getProperty('songMisses') <= 10 then
        ratingName = 'SDCB';
    else
        ratingName = 'Clear';
    end
    if accuracy >= 99.9935 then
        ranking = 'AAAAA';
    elseif accuracy >= 99.980 then
        ranking = 'AAAA:';
    elseif accuracy >= 99.970 then
        ranking = 'AAAA.';
    elseif accuracy >= 99.955 then
        ranking = 'AAAA';
    elseif accuracy >= 99.90 then
        ranking = 'AAA:';
    elseif accuracy >= 99.80 then
        ranking = 'AAA.';
    elseif accuracy >= 99.70 then
        ranking = 'AAA';
    elseif accuracy >= 99 then
        ranking = 'AA:';
    elseif accuracy >= 96.50 then
        ranking = 'AA.';
    elseif accuracy >= 93 then
        ranking = 'AA';
    elseif accuracy >= 90 then
        ranking = 'A:';
    elseif accuracy >= 85 then
        ranking = 'A.';
    elseif accuracy >= 80 then
        ranking = 'A';
    elseif accuracy >= 70 then
        ranking = 'B';
    elseif accuracy >= 60 then
        ranking = 'C';
    elseif accuracy < 60 then
        ranking = 'D';
    end
end