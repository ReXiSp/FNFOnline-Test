local SongInfo = {
    {song='test',songtitle='tetstttsttttdetttsttetsteagsaydygyaundsdjas',composer='Cover: Asarigohan'},
    {song='tutorial-remix',songtitle='Tutorial',composer='Remix: CYANCAT'},
    {song='ranker',songtitle='Ranker',composer='Composer: CYANCAT'},
    {song='total exhaustion',songtitle='Total Exhaustion',composer='Composer: Aoken'},
    {song='lost oneself',songtitle='Lost Oneself',composer='Composer: Aoken'},
    {song='giantkilling',songtitle='GiantKilling',composer='Composer: CYANCAT'},
    {song='smoke test',songtitle='Smoke Test',composer='Composer: AJP'},
    {song='cyanwaver',songtitle='Cyanwaver',composer='Composer: CYANCAT'},
    {song='cosmos sign',songtitle='Cosmos Sign',composer='Composer: Aoken'},
    {song='giragus',songtitle='Giragus',composer='Composer: CYANCAT'},
    {song='Too-Fest',songtitle='TOO FEST',composer='Composer:Punkett\nCover: Asarigohan'},
    {song='giantkilling-old',songtitle='GiantKilling[OLD]',composer='owo'},
    {song='leaked it myself',songtitle='Leaked it myself',composer='Remix & Leak: Asarigohan'},
}

function onCreate()
    local songempty = false;
    for i = 1, #SongInfo do
        --debugPrint(SongInfo[i].song)
        if songName == SongInfo[i].song then
            ShowSongTitle = SongInfo[i].songtitle;
            ShowSongcomposer = SongInfo[i].composer;
            songempty = true;
        end
    end
    if songempty == false then
        ShowSongTitle = songName;
        ShowSongcomposer = 'Work is only going to increase. \\\\Shartize';
    end
    makeLuaSprite('ShowSongbg', 'viewsong', -700, 530);
    addLuaSprite('ShowSongbg', true)
    setObjectCamera('ShowSongbg', 'camOther')
    setProperty('ShowSongbg.alpha',1)
    scaleObject('ShowSongbg',1.2,1.2)

    makeLuaText('ShowSongSubText', 'Now you\'re playing', 0, -900, 550)
    setTextFont('ShowSongSubText', 'vcr.ttf')
    setTextColor('ShowSongSubText', 'FFFFFF')
    setTextSize('ShowSongSubText', 30)
    setTextAlignment('ShowSongSubText', 'left')
    setTextBorder('ShowSongSubText', 2, '000000')
    addLuaText('ShowSongSubText')
    setObjectCamera('ShowSongSubText', 'camOther')
    setProperty('ShowSongSubText'..'.antialiasing',true)

    makeLuaText('ShowSongMainText', ShowSongTitle, 400, -1000, 580)
    setTextFont('ShowSongMainText', 'vcr.ttf')
    setTextColor('ShowSongMainText', 'FFFFFF')
    setTextSize('ShowSongMainText', 40)
    setTextAlignment('ShowSongMainText', 'center')
    setTextBorder('ShowSongMainText', 2, '000000')
    addLuaText('ShowSongMainText')
    setObjectCamera('ShowSongMainText', 'camOther')
    setProperty('ShowSongMainText'..'.antialiasing',true)

    makeLuaText('ShowSongmidText', ShowSongcomposer, 400, -900, 630)
    setTextFont('ShowSongmidText', 'vcr.ttf')
    setTextColor('ShowSongmidText', 'FFFFFF')
    setTextSize('ShowSongmidText', 30)
    setTextAlignment('ShowSongmidText', 'center')
    setTextBorder('ShowSongmidText', 2, '000000')
    addLuaText('ShowSongmidText')
    setObjectCamera('ShowSongmidText', 'camOther')
    setProperty('ShowSongmidText'..'.antialiasing',true)
end

function onCountdownTick(counter)
--debugPrint(counter)
    if counter == 0 then
        doTweenX('ShowSongbgtween', 'ShowSongbg', -150, 1, 'elasticOut')
        doTweenX('ShowSongSubTexttween', 'ShowSongSubText', 30, 1, 'elasticOut')
        doTweenX('ShowSongSubMaintween', 'ShowSongMainText', 0, 1, 'elasticOut')
        doTweenX('ShowSongSubmidtween', 'ShowSongmidText', 0, 1, 'elasticOut')
    end
end

function onSongStart()
    doTweenX('ShowSongbgtween', 'ShowSongbg', -700, 1, 'elasticIn')
    doTweenX('ShowSongSubTexttween', 'ShowSongSubText', -900, 1, 'elasticIn')
    doTweenX('ShowSongSubMaintween', 'ShowSongMainText', -1000, 1, 'elasticIn')
    doTweenX('ShowSongSubmidtween', 'ShowSongmidText', -900, 1, 'elasticIn')
end