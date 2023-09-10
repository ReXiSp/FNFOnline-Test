--first time doing this stuff so good luck rummaging though my coding

local noflashy

local noteXCenter = {412,524,636,748}-- Notes center : 0 , 1 , 2 , 3
local swap1 = {636,524,412,748} 
local swap2 = {412,748,636,534} 
local noteYPlace = {50,570} -- Up , Down
local ha = 0 -- idk the variable wont work inside the function so its outside
local flashalpha = '88'

function inTable(tbl, item)
    for key, value in pairs(tbl) do
        if value == item then return key end
    end
    return false
end

function onCreate()
    if songName ~= "aleph-0" then
        return close()
    end
    return Function_Continue
end

function onCreatePost()
    -- luaDebugMode = true
    addHaxeLibrary("PlayState")
    precacheImage('carpet1')
    precacheImage('carpet2')
    precacheImage('carpet3')
    precacheImage('carpet4')
    precacheImage('carpet5')
    precacheImage('carpet6')
    precacheImage('carpet7')
    precacheImage('circle1')
    precacheImage('circle2')
    precacheImage('fractal')
    precacheImage('fractalsmall')
    precacheImage('flare')
    precacheImage('vignette')
    precacheImage('numbers')
    precacheImage('grid')
    precacheImage('grid2')
    precacheImage('grid3')
    precacheImage('gray1')
    precacheImage('gray2')
    precacheImage('gray3')
    precacheImage('gray4')
    precacheImage('numg1')
    precacheImage('numg2')
    precacheImage('triangle')
    precacheImage('sponge')
    precacheImage('title')

    makeLuaSprite('dark', '', -600,-300)
    makeGraphic("dark", 1,1, "000000")
    setProperty('dark.alpha', 0)
    scaleObject('dark', 8000, 8000)

    makeLuaSprite('vignette', 'vignette', 0,0)
    setObjectCamera('vignette',  'camOther')
    screenCenter('vignette')

    makeLuaSprite('topb', '', 0, -1850) -- -1850 is default top -1400 is mid
    makeGraphic("topb", 2,1, "000000")
    scaleObject('topb', 2000, 2000)

    makeLuaSprite('botb', '', 0,950) -- 950 is default top 550 is mid
    makeGraphic("botb", 2,1, "000000")
    scaleObject('botb', 2000, 2000)

    makeLuaSprite('grid3', 'grid3', -150,-150)

    makeLuaSprite('numg1', 'numg1', -150,-150)

    makeLuaSprite('numg2', 'numg2', -150,-150)

    setProperty('numg1.alpha', 0.5)
    setProperty('numg2.alpha', 0.5)
    setProperty('grid3.alpha', 0.5)

    scaleObject('numg1', 1.25, 1.25)
    scaleObject('numg2', 1.25, 1.25)
    scaleObject('grid3', 3.125, 3.125)

    makeLuaSprite('fractal', 'fractal', -150,-150)
    scaleObject('fractal', 3.125, 3.125)

    makeLuaSprite('circle1', 'circle1', 0,0)
    setProperty('circle1.alpha', 0)

    makeLuaSprite('circle2', 'circle2', 0,0)

    makeLuaSprite('grid', 'grid', -150,-150)
    scaleObject('grid', 2.5, 2.5)

    makeLuaSprite('gray', 'gray1', -150,-150)
    scaleObject('gray', 2.5, 2.5)

    makeLuaSprite('bgnum', 'bgnum', -150,-150)
    scaleObject('bgnum', 2.5, 2.5)

    makeLuaSprite('fgnum', 'numbers', -150,-150)
    scaleObject('fgnum', 2.5, 2.5)

    makeLuaSprite('flare', 'flare', -75,-375)
    scaleObject('flare', 6, 6)


    makeLuaSprite('grid2', 'grid2', -150,-150)
    scaleObject('grid2', 3.125, 3.125)

    makeLuaSprite('carpet', 'carpet1', -150,-150)
    scaleObject('carpet', 3.125, 3.125)

    makeLuaSprite('triangle', 'triangle', -400,-150)

    makeLuaSprite('sponge', 'sponge', -400,-150)
    scaleObject('sponge', 1.25, 1.25)

    makeLuaSprite('fractalsmall', 'fractalsmall', -400,-150)
    scaleObject('fractalsmall', 1.25, 1.25)

    makeLuaText('text1', '', 500, 400, 325)
    setTextSize('text1', 100)
    setTextFont('text1', 'cambria.ttc')
    setObjectCamera('text1', 'game')
    setProperty("text1.antialiasing", getPropertyFromClass("ClientPrefs", 'globalAntialiasing'))



    makeLuaSprite('title', 'title', 395, 285)
    scaleObject('title', 0.75, 0.75)

    makeLuaSprite('solid', '', -600,-300)
    makeGraphic('solid', 1,1, "FFFFFF")
    setProperty('solid.alpha', 0)
    setObjectOrder('solid', 999)
    scaleObject('solid', 8000, 8000)
end

function onSongStart()
    addLuaSprite('dark')
    addLuaText('text1')
    addLuaSprite('solid')
end

function onStepHit()
    if (curStep == 68) then
        normOffset = 314
        invisStuffs = {'boyfriend', 'gf', 'dad', 'healthBar', 'healthBarBG', 'iconP1', 'iconP2', 'timeBar', 'timeBarBG', 'timeTxt'}
            for i = 0,7 do
                noteTweenX('awfaienf'..i, i, noteXCenter[(i % 4) +1], 1, 'circOut')
                if i < 4 then
                    setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
        end
        
        --[[for i = 0,3 do
            setPropertyFromGroup('strumLineNotes', i, 'x', getPropertyFromGroup('strumLineNotes', i+4, 'x'))
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
        end]]
        

        addLuaSprite('sponge')
        setObjectOrder('sponge', getObjectOrder('dark') - 1)
        setProperty('dark.alpha', 1)
        addLuaSprite('grid')
        setProperty('solid.alpha', 0.25)
        setProperty('solid.color', getColorFromHex("FF0000"))
        doTweenColor('afrsgsd', 'solid', '0x4400FF00', 0.833)
        setProperty('camGame.zoom', 2)
        doTweenZoom('aifaugfy', 'camGame', 1, 0.833, 'circOut')
        
        for x = 1,10 do
            setProperty(invisStuffs[x]..'.visible', false) 
        end
    end
end
if curStep == 80 then
    --setProperty('grid.alpha', 0)
    setProperty('solid.alpha', 0)
    setProperty('camGame.x', 0)
    setProperty('camGame.y', 0)
    setTextString('text1', '')
    --setProperty('grid.alpha', 0)
    addLuaSprite('bgnum')
    addLuaSprite('grid2')
    addLuaSprite('triangle')
    doTweenZoom('gsogega', 'camGame', 5, 4, 'circIn')
end
    if curStep == 98 then
        doTweenZoom('cameraZoomy', 'camHUD', 0.5 , 1, 'circOut')
        cameraFlash('camGame', '0x'..flashalpha..'FFFF00', 1, false)
    end
    if curStep == 121 then
        doTweenAlpha('cameraAlphy', 'camHUD',0, 0.25)
        --doTweenAlpha('awasda', 'triangle',0, 0.25)    
        doTweenZoom('cameraZoomy', 'camHUD', 0.75, 1, 'circOut')
        setProperty('solid.color', getColorFromHex("FFFFFF"))
        doTweenAlpha('asdawsd', 'solid', 0.95 , 0.25)           
    end
    if curStep == 127 then
        addLuaSprite('fgnum')
        setProperty('camHUD.alpha', 1)
        doTweenAlpha("adjksajdaio", "camHUD", 1, 0.000000000001, "linear")
        setProperty('camHUD.x', 360)
        doTweenX('cameraMovey1', 'camHUD',0, 1, 'circOut')
        doTweenAlpha('asdawsd', 'solid', 0 , 0.25)
        setProperty('camGame.zoom', 1)
        removeLuaSprite('triangle')
        cancelTween('gsogega')
    end
    gridy = getProperty('grid2.y')
    gridx = getProperty('grid2.x')
    if curStep == 133 then
        setProperty('camGame.zoom', 1)
        doTweenX('cameraMovey1', 'camHUD',-640, 0.5, 'circIn')
        doTweenY('cameraMovey2', 'camHUD',-480, 0.5, 'circIn')
        doTweenX('gameMovey1', 'grid2', gridx-64, 0.5, 'circIn')
        doTweenY('gameMovey2', 'grid2', gridy-48, 0.5, 'circIn')
    end
    if curStep == 139 then
        setProperty('camHUD.x', 640)
        setProperty('camHUD.y', 480)
        doTweenX('cameraMovey1', 'camHUD',0, 0.5, 'circOut')
        doTweenY('cameraMovey2', 'camHUD',0, 0.5, 'circOut')
        doTweenX('gameMovey1', 'grid2', gridx-64, 0.5, 'circOut')
        doTweenY('gameMovey2', 'grid2', gridy-48, 0.5, 'circOut')
    end
    if curStep == 145 then
        doTweenX('cameraMovey1', 'camHUD',180, 0.5, 'circIn')
        doTweenY('cameraMovey2', 'camHUD',-480, 0.5, 'circIn')
        doTweenX('gameMovey1', 'grid2', gridx+18, 0.5, 'circIn')
        doTweenY('gameMovey2', 'grid2', gridy-48, 0.5, 'circIn')
    end
    if curStep == 150 then
        setProperty('camHUD.x', -180)
        setProperty('camHUD.y', 480)
        doTweenX('cameraMovey1', 'camHUD',0, 0.5, 'circOut')
        doTweenY('cameraMovey2', 'camHUD',0, 0.5, 'circOut')
        doTweenX('gameMovey1', 'grid2', gridx+18, 0.5, 'circOut')
        doTweenY('gameMovey2', 'grid2', gridy-48, 0.5, 'circOut')
    end
    if curStep == 156 then
        doTweenX('cameraMovey1', 'camHUD',-640, 0.5, 'circIn')
        doTweenY('cameraMovey2', 'camHUD',-480, 0.5, 'circIn')
        doTweenX('gameMovey1', 'grid2', gridx-64, 0.5, 'circIn')
        doTweenY('gameMovey2', 'grid2', gridy-48, 0.5, 'circIn')
    end
    if curStep == 162 then
        setProperty('camHUD.x', 640)
        setProperty('camHUD.y', 480)
        doTweenX('cameraMovey1', 'camHUD',0, 0.5, 'circOut')
        doTweenY('cameraMovey2', 'camHUD',0, 0.5, 'circOut')
        doTweenX('gameMovey1', 'grid2', gridx-64, 0.5, 'circOut')
        doTweenY('gameMovey2', 'grid2', gridy-48, 0.5, 'circOut')
    end
    if curStep == 167 then
        doTweenZoom('cameraZoomy', 'camHUD', 1.1, 0.25, 'circOut')
        doTweenZoom('gameZoomy', 'camGame', 1.1, 0.25, 'circOut')
        doTweenX('cameraMovey1', 'camHUD',640, 1, 'circIn')
        doTweenY('cameraMovey2', 'camHUD',480, 1, 'circIn')
        doTweenX('gameMovey1', 'grid2', gridx+64, 0.5, 'circIn')
        doTweenY('gameMovey2', 'grid2', gridy+48, 0.5, 'circIn')
    end
    if curStep == 173 then
        doTweenZoom('cameraZoomy', 'camHUD', 0.75, 1, 'circOut')
        doTweenZoom('gameZoomy', 'camGame', 1, 1, 'circOut')
        setProperty('camHUD.x', -640)
        setProperty('camHUD.y', -480)
        doTweenX('cameraMovey1', 'camHUD',0, 0.5, 'circOut')
        doTweenY('cameraMovey2', 'camHUD',0, 0.5, 'circOut')
        doTweenX('gameMovey1', 'grid2', gridx+64, 0.5, 'circOut')
        doTweenY('gameMovey2', 'grid2', gridy+48, 0.5, 'circOut')
    end
    if curStep == 179 then
        doTweenX('cameraMovey1', 'camHUD',640, 0.5, 'circIn')
        doTweenY('cameraMovey2', 'camHUD',-480, 0.5, 'circIn')
        doTweenX('gameMovey1', 'grid2', gridx+64, 0.5, 'circIn')
        doTweenY('gameMovey2', 'grid2', gridy-48, 0.5, 'circIn')
    end
    if curStep == 185 then
        setProperty('camHUD.x', -640)
        setProperty('camHUD.y', 480)
        doTweenX('cameraMovey1', 'camHUD',0, 0.5, 'circOut')
        doTweenY('cameraMovey2', 'camHUD',0, 0.5, 'circOut')
        doTweenX('gameMovey1', 'grid2', gridx+64, 0.5, 'circOut')
        doTweenY('gameMovey2', 'grid2', gridy-48, 0.5, 'circOut')
    end
    if curStep == 192 then
        doTweenX('cameraMovey1', 'camHUD',-640, 0.5, 'circIn')
        doTweenX('gameMovey1', 'grid2', gridx-64, 0.5, 'circIn')
    end
    if curStep == 196 then
        setProperty('camHUD.x', 640)
        doTweenX('cameraMovey1', 'camHUD',0, 0.5, 'circOut')
        doTweenX('gameMovey1', 'grid2', gridx-64, 0.5, 'circOut')
    end
    if curStep == 208 then
        doTweenZoom('cameraZoomy', 'camHUD', 0.001, 0.1)
        setProperty('grid2.alpha', 0)
        setProperty('fgnum.alpha', 0)
        setProperty('bgnum.alpha', 0)
        setProperty('solid.alpha', 0.25)
        setProperty('solid.color', getColorFromHex("FF0000"))
        doTweenColor('afrsgsd', 'solid', '0x4400FF00', 0.5)
        setProperty('camGame.zoom', 4)
        doTweenZoom('aifaugfy', 'camGame', 1, 0.5, 'circOut')
        setTextSize('text1', 65)
        setProperty('grid.angle', 75)
    end
    if curStep == 212 then 
        setProperty('camHUD.zoom', 5)
        doTweenZoom('cameraZoomy', 'camHUD', 0.75, 0.5, 'expoOut')
    end
    if curStep == 214 then
        doTweenX('cameraMovey1', 'camHUD',640, 0.5, 'circIn')
        doTweenY('cameraMovey2', 'camHUD',360, 0.5, 'circIn')
        doTweenX('gameMovey1', 'grid2', gridx+64, 0.5, 'circIn')
        doTweenY('gameMovey2', 'grid2', gridy+36, 0.5, 'circIn')
        setProperty('grid.angle', 0)
        setProperty('grid.alpha', 0)
        cancelTween('afrsgsd')
        setProperty('solid.alpha', 0)
        setTextString('text1', '')
        setTextSize('text1', 50)
        setProperty('camGame.y', 0)
        setProperty('camGame.x', 0)
    end
    if curStep == 220 then
        cameraFlash('camGame', '0x'..flashalpha..'EEEEFF', 0.25, false)
        setProperty('grid.alpha', 1)
        setProperty('grid2.alpha', 1)
        setProperty('fgnum.alpha', 1)
        setProperty('bgnum.alpha', 1)
        setProperty('camHUD.x', -640)
        setProperty('camHUD.y', -360)
        doTweenX('cameraMovey1', 'camHUD',0, 0.5, 'circOut')
        doTweenY('cameraMovey2', 'camHUD',0, 0.5, 'circOut')
        doTweenX('gameMovey1', 'grid2', gridx+64, 0.5, 'circOut')
        doTweenY('gameMovey2', 'grid2', gridy+36, 0.5, 'circOut')
    end
    if curStep == 225 then
        doTweenX('cameraMovey1', 'camHUD', 180, 0.5, 'circIn')
        doTweenY('cameraMovey2', 'camHUD',-480, 0.5, 'circIn')
        doTweenX('gameMovey1', 'grid2', gridx+18, 0.5, 'circIn')
        doTweenY('gameMovey2', 'grid2', gridy-48, 0.5, 'circIn')
    end
    if curStep == 231 then
        setProperty('camHUD.x', -180)
        setProperty('camHUD.y', 480)
        doTweenX('cameraMovey1', 'camHUD',0, 0.5, 'circOut')
        doTweenY('cameraMovey2', 'camHUD',0, 0.5, 'circOut')
        doTweenX('gameMovey1', 'grid2', gridx+18, 0.5, 'circOut')
        doTweenY('gameMovey2', 'grid2', gridy-14, 0.5, 'circOut')
    end
    if curStep == 236 then
        doTweenX('cameraMovey1', 'camHUD', -640, 0.5, 'circIn')
        doTweenX('gameMovey1', 'grid2', gridx-64, 0.5, 'circIn')
    end
    if curStep == 243 then
        setProperty('camHUD.x', 640)
        doTweenX('cameraMovey1', 'camHUD',0, 0.5, 'circOut')
        doTweenX('gameMovey1', 'grid2', gridx-64, 0.5, 'circOut')
    end
    if curStep == 248 then
        doTweenX('cameraMovey1', 'camHUD', 180, 0.5, 'circIn')
        doTweenY('cameraMovey2', 'camHUD', 480, 0.5, 'circIn')
        doTweenZoom('cameraZoomy', 'camHUD', 0.5, 0.25, 'circOut')
        doTweenZoom('gameZoomy', 'camGame', 0.75, 0.25, 'circOut')
        doTweenX('gameMovey1', 'grid2', gridx+18, 0.5, 'circIn')
        doTweenY('gameMovey2', 'grid2', gridy+48, 0.5, 'circIn')
    end
    if curStep == 253 then
        setProperty('camHUD.x', -180)
        setProperty('camHUD.y', -480)
        doTweenX('cameraMovey1', 'camHUD',0, 0.5, 'circOut')
        doTweenY('cameraMovey2', 'camHUD',0, 0.5, 'circOut')
        doTweenZoom('cameraZoomy', 'camHUD', 0.75, 1, 'circOut')
        doTweenZoom('gameZoomy', 'camGame', 1, 1, 'circOut')
        doTweenX('gameMovey1', 'grid2', gridx+18, 0.5, 'circOut')
        doTweenY('gameMovey2', 'grid2', gridy+48, 0.5, 'circOut')
    end
    if curStep == 260 then
        doTweenX('cameraMovey1', 'camHUD', -360, 0.5, 'circIn')
        doTweenX('gameMovey1', 'grid2', gridx-36, 0.5, 'circIn')
    end
    if curStep == 265 then
        setProperty('camHUD.x', 360)
        doTweenX('cameraMovey1', 'camHUD', 0, 0.5, 'circOut')
        doTweenX('gameMovey1', 'grid2', gridx-36, 0.5, 'circOut')
    end
    if curStep == 271 then
        doTweenX('cameraMovey1', 'camHUD',-640, 0.5, 'circIn')
        doTweenY('cameraMovey2', 'camHUD',-480, 0.5, 'circIn')
        doTweenX('gameMovey1', 'grid2', gridx-64, 0.5, 'circIn')
        doTweenY('gameMovey2', 'grid2', gridy-48, 0.5, 'circIn')
    end
    if curStep == 277 then
        setProperty('camHUD.x', 640)
        setProperty('camHUD.y', 480)
        doTweenX('cameraMovey1', 'camHUD',0, 0.5, 'circOut')
        doTweenY('cameraMovey2', 'camHUD',0, 0.5, 'circOut')
        doTweenX('gameMovey1', 'grid2', gridx-64, 0.5, 'circOut')
        doTweenY('gameMovey2', 'grid2', gridy-48, 0.5, 'circOut')
    end
    if curStep == 283 then
        doTweenY('cameraMovey2', 'camHUD',-480, 0.5, 'circIn')
        doTweenY('gameMovey2', 'grid2', gridy-48, 0.5, 'circIn')
    end
    if curStep == 288 then
        setProperty('camHUD.y', 480)
        doTweenY('cameraMovey2', 'camHUD',0, 0.5, 'circOut')
        doTweenY('gameMovey2', 'grid2', gridy-48, 0.5, 'circOut')
    end
    if curStep == 294 then
        doTweenX('cameraMovey1', 'camHUD',640, 0.5, 'circIn')
        doTweenX('gameMovey2', 'grid2', gridx+64, 0.5, 'circIn')
    end
    if curStep == 300 then
        setProperty('camHUD.x', -640)
        doTweenX('cameraMovey1', 'camHUD',0, 0.5, 'circOut')
        doTweenX('gameMovey2', 'grid2', gridx+64, 0.5, 'circOut')
    end
    if curStep == 306 then
        doTweenZoom('cameraZoomy', 'camHUD', 1, 1, 'circOut')
        cameraFlash('camGame', '0x'..flashalpha..'FFFF00', 1, false)
        setProperty('grid2.alpha', 0)
        setProperty('grid.alpha', 0)
        setProperty('fgnum.alpha', 0)
        setProperty('bgnum.alpha', 0)
        addLuaSprite('grid3')
        addLuaSprite('numg1')
        addLuaSprite('numg2')
        doTweenX('17', 'numg1', -400, 15)
        doTweenX('27', 'numg2', -400, 15)
        doTweenX('37', 'grid3', -400, 15)
    end
    if curStep == 367 then
        for i = 0,7 do
            noteTweenY('noteMoveyioe'..i, i, noteYPlace[(downscroll and 1 or 2)], 1.29, 'circInOut')
            noteTweenDirection("noteFlippy" ..i, i, -90, 1.29, 'circInOut')
            origAngle = getPropertyFromGroup('strumLineNotes', i, 'angle')
            noteTweenAngle('spinsies'..i, i, origAngle - 1440, 7.714, 'circOut')
            if i < 4 then
                setPropertyFromGroup('strumLineNotes', i,'alpha', 1)
            end
        end
        doTweenZoom('caajawde', 'camHUD', 0.85, 1, 'circOut')
        doTweenZoom('gameZoomy', 'camGame', 1.5, 0.645, 'circIn')
    end
    if curStep == 374 then
        doTweenZoom('gameZoomy', 'camGame', 1, 0.645, 'circOut')
        doTweenAngle('01', 'numg1', 25, 8)
        doTweenAngle('02', 'numg2', 25, 8)
        doTweenAngle('03', 'grid3', 25, 8)
    end
    if curStep == 447 then
        for i = 0,7 do 
            noteTweenX('afdaifuehja'..i, i, noteXCenter[(i % 4) + 1], 0.5)
        end
    end
    if curStep == 446 then
        for i = 4,7 do
        noteTweenDirection("noteFlippy" ..i, i, 90, 0.01)
        noteTweenY("RESETY"..i, i, _G['defaultPlayerStrumY'..i-4], 0.5, 'circOut')
        noteTweenAngle('spinsies'..i, i, 0, 1, 'circOut')
        end
        for i = 0,3 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
        end
        cancelTween('17')
        cancelTween('27')
        cancelTween('37')
        cancelTween('01')
        cancelTween('02')
        cancelTween('03')
        removeLuaSprite('numg1')
        removeLuaSprite('numg2')
        setProperty('grid3.alpha', 0)
    end
    if curStep == 463 then
        local locr = {4320,-4320}
        for i = 4,7 do
            origAngle = getPropertyFromGroup('strumLineNotes', i, 'angle')
            setPropertyFromGroup('strumLineNotes', i, 'y', locr[(downscroll and 1 or 2)])
            setPropertyFromGroup('strumLineNotes', i, 'angle', origAngle - 1440)
            noteTweenAngle('spinsieasdwa'..i, i, origAngle, 3.214, 'circOut')
            noteTweenY("RESETawdY"..i, i, _G['defaultPlayerStrumY'..i-4], 3.214, 'circOut')
        end
        setProperty('camHUD.zoom', 1.5)
        doTweenZoom('caajhfefiuwe', 'camHUD', 0.85, 3.214, 'circOut')

        setProperty('sponge.alpha', 0.5)
        setProperty('sponge.y', 400)
        doTweenY('asdawdasd','sponge',-400,4)
        setObjectOrder('sponge', getObjectOrder('dark') + 1)
        setProperty('camGame.zoom', 2.5)
        doTweenZoom('asdwasda', 'camGame', 1, 4)
        setProperty('text1.alpha', 0)
        screenCenter('text1')
        setTextString('text1', '106')
        setTextSize('text1', 100)
    end
    if curStep == 1094 then
        doTweenX('cammyMove', 'camHUD', 0, 0.1, 'circOut')
        for i = 0,7 do
            noteTweenDirection("noteFlippy" ..i, i, 90, 1, 'circOut')
            noteTweenAngle('noteawder'..i, i, 0, 1, 'circOut')
        end
    end
    if
    curStep == 500 or
    curStep == 564 or
    curStep == 627 or
    curStep == 690 or
    curStep == 754 or
    curStep == 817 or
    curStep == 880 or
    curStep == 944
    then
        local color = ((math.random(55,77)) * 10000) + (math.random(9955,9999))
        setProperty('text1.alpha', 0.5)
        cancelTween('weeweewoo')
        cancelTween('asdawdasd')
        cancelTween('asdwasda')
        cancelTween('asdwasasa')
        setProperty('sponge.x', 350)
        doTweenX('weeweewoo','sponge',-400,4)
        setProperty('sponge.alpha', 1)
        cameraFlash('camGame', '0x'..flashalpha..'FFFFFF', 0.25, true)
        setProperty('camGame.zoom', 1.5)
        setProperty('sponge.color', getColorFromHex(color))
        setProperty('sponge.angle', math.random(0,360))

        setTextBorder('text1', 2, color)
    end
    if curStep >= 500 and curStep <= 1093 then
        setTextString('text1', curBeat + 127)
    end
    if curStep == 1094 then
        setProperty('camGame.zoom', 2)
        doTweenZoom('camGamerio', 'camGame', 1, 2, 'circOut')
        cameraFlash('camGame', '0x'..flashalpha..'EEEEFF', 0.25, false)
        setProperty('grid.alpha', 1)
        setProperty('grid2.alpha', 1)
        setProperty('fgnum.alpha', 1)
        setProperty('bgnum.alpha', 1)
        setTextSize('text1', 125)
        setTextWidth('text1', 1250)
        setTextString('text1', 'T e m p t a t i o n')
        setProperty('text1.scale.x', 2)
        setProperty('text1.scale.y', 2)
        doTweenX('TEMPYTATION', 'text1.scale', 1, 2, 'circOut')
        doTweenY('TATIONTEMPY', 'text1.scale', 1, 2, 'circOut')
        screenCenter('text1')
        addLuaSprite('flare')
        setObjectOrder('flare', getObjectOrder('text1') - 1)
    end
    if curStep == 1157 then
        setProperty('grid.alpha', 0)
        setProperty('grid2.alpha', 0)
        setProperty('fgnum.alpha', 0)
        setProperty('bgnum.alpha', 0)
        setProperty('flare.alpha', 0)
        setTextString('text1', '')
        addLuaSprite('gray')
        setProperty('gray.alpha', 0)
        addLuaSprite('topb', true)
        addLuaSprite('botb', true)
        setObjectOrder('flare', getObjectOrder('botb') + 1)
        doTweenY('close1', 'topb', -1385, 3.5, 'circInOut')
        doTweenY('close2', 'botb', 565, 3.5, 'circInOut')
    end
    if curStep >= 1157 and curStep <= 1222 then
        setProperty('gray.alpha', 1)
        loadGraphic('gray', 'gray'..((curStep / 2) % 4) + 1)
    end
    if curStep == 1008 then
        setTextBorder('text1', 2, "0xFF000000")
        setProperty('camGame.zoom', 1)
        setProperty('sponge.color', getColorFromHex("FFFFFF"))
        setProperty('sponge.angle', 0)
        setProperty('sponge.alpha', 0)
    end
    if {curStep > 547 and curStep < 1008} then
        zoom1 = {552, 627, 678, 754, 805, 880, 932, 1008}
        zoom2 = {548, 624, 674, 750, 802, 876, 928, 1002}
        zoom3 = {556, 620, 682, 748, 809, 872, 936, 999}
        zoom4 = {560, 612, 686, 738, 813, 863, 940, 991}
        zoom5 = {564, 616, 690, 742, 817, 866, 944, 996}
    if inTable(zoom1, curStep) then
        doTweenZoom('cameraZoomy1', 'camHUD', 0.85 , 0.05, 'circOut')
        for i = 0,7 do
            noteTweenX('peales'..i, i, noteXCenter[(i % 4) +1], 0.25, 'circOut')
        end
        cameraFlash('camGame', '0x'..flashalpha..'FFFFFF', 0.25, true)
    end
    if inTable(zoom2, curStep) then
        doTweenZoom('cameraZoomy1', 'camHUD', 0.74 , 0.05, 'circOut')
        for i = 0,7 do
        noteTweenX('peales'..i, i, swap1[(i % 4) +1], 0.25, 'circOut')
        end
        cameraFlash('camGame', '0x'..flashalpha..'FFFFFF', 0.25, true)
    end
    if inTable(zoom3, curStep) then
        doTweenZoom('cameraZoomy1', 'camHUD', 0.63 , 0.05, 'circOut')
        for i = 0,7 do
        noteTweenX('peales'..i, i, noteXCenter[(i % 4) +1], 0.25, 'circOut')
        end
        cameraFlash('camGame', '0x'..flashalpha..'FFFFFF', 0.25, true)
    end
    if inTable(zoom4, curStep) then
        doTweenZoom('cameraZoomy1', 'camHUD', 0.52 , 0.05, 'circOut')
        for i = 0,7 do
        noteTweenX('peales'..i, i, swap2[(i % 4) +1], 0.25, 'circOut')
        end
        cameraFlash('camGame', '0x'..flashalpha..'FFFFFF', 0.25, true)
    end
    if inTable(zoom5, curStep) then
        doTweenZoom('cameraZoomy1', 'camHUD', 0.30 , 0.05, 'circOut')
        for i = 0,7 do
            noteTweenX('peales'..i, i, noteXCenter[(i % 4) +1], 0.25, 'circOut')
        end
        cameraFlash('camGame', '0x'..flashalpha..'FFFFFF', 0.25, true)
    end
    if curStep == 1222 then
        setProperty('camHUD.angle', -360)
        doTweenAngle('cameadway', 'camHUD', 0, 1, 'circOut')
        doTweenZoom('asfarga', 'camHUD', 0.20, 1, 'circOut')
        setProperty('flare.alpha', 1)
        setProperty('flare.scale.x', 1.5)
        setProperty('flare.scale.y', 1.5)
        doTweenX('funnylol', 'flare.scale', 6, 1, 'circOut')
        doTweenY('lolfunny', 'flare.scale', 6, 1, 'circOut')
        removeLuaSprite('gray')
    end
    if curStep == 1265 then
        doTweenZoom('awdafa', 'camHUD', 0.85, 0.5, 'circOut')
    end
    if curStep == 1269 then
        addLuaSprite('fractal')
        setObjectOrder('fractal', getObjectOrder('topb') - 1)
        doTweenX('weeee', 'fractal', -400, 5)
        setProperty('flare.alpha', 0)
        doTweenY('close1', 'topb', -1850, 1, 'circOut')
        doTweenY('close2', 'botb', 950, 1, 'circOut')
        cameraFlash('camGame', '0x'..flashalpha..'FFFFFF', 1, true)
    end
    if
    (curStep == 1281) or
    (curStep == 1313) or
    (curStep == 1345) or
    (curStep == 1377) then
        cancelTween('weeee')
        setProperty('fractal.color', getColorFromHex('0xFF888888'))
    end
    if
    (curStep == 1297) or
    (curStep == 1321) or
    (curStep == 1361) or
    (curStep == 1385) then
        doTweenX('weeee', 'fractal', -400, 5)
        setProperty('fractal.color', getColorFromHex('0xFFFFFFFF'))
    end
    if curStep == 1385 then
        doTweenAlpha('solid', 'solid', 1, 0.720, 'circOut')
        setProperty('solid.color', getColorFromHex('0xFFFFFFFF'))
    end
    if curStep == 1216 or curStep == 127 or curStep == 196 then
        for i = 0, getProperty('notes.length') - 1 do
            setPropertyFromGroup('notes', i, 'copyX', true)
        end
    end
    if curStep == 1396 then
        for i = 0,7 do
            origAngle = getPropertyFromGroup('strumLineNotes', i, 'angle')
            noteTweenAngle('awdasda'..i, i, 0, 2, 'circOut')
        end
        setObjectCamera('circle1', 'camOther')
        setObjectCamera('circle2', 'camOther')
        setObjectCamera('text1', 'camOther')
        setObjectCamera('solid', 'camOther')
        setProperty('fractal.alpha', 0)
        setProperty('solid.alpha', 1)
        setObjectOrder('circle1', getObjectOrder('solid') + 1)
        addLuaSprite('circle1')
        screenCenter('circle1')
        --setProperty('circle1.x', getProperty('circle1.x') + 225)
        --setProperty('circle1.y', getProperty('circle1.y') + 200)
        doTweenAlpha('circle1', 'circle1', 1, 1, 'circOut')
        doTweenX('lololololol1', 'circle1.scale', 0.25, 1.920, 'circIn')
        doTweenY('lololololol2', 'circle1.scale', 0.25, 1.920, 'circIn')
    end
    if curStep == 1429 then
        removeLuaSprite('circle1')
        setProperty('solid.alpha', 0)
        addLuaSprite('circle2')
        screenCenter('circle2')
        setProperty('circle2.scale.x', 0.25)
        setProperty('circle2.scale.y', 0.25)
        doTweenX('adwaswadsdwa1', 'circle2.scale', 2, 1.860, 'circOut')
        doTweenY('adwaswadsdwa2', 'circle2.scale', 2, 1.860, 'circOut')
        setTextString('text1', 'A l e p h - Z e r o')
        setTextSize('text1', 75)
        setTextWidth('text1', 750)
        setTextBorder('text1', 0, '000000')
        screenCenter('text1')
        setProperty('circle2.scale.x', 0.5)
        doTweenX('asawdasda1', 'text1.scale', 1.25, 1.860, 'circOut')
        doTweenY('asawdasda2', 'text1.scale', 1.25, 1.860, 'circOut')
        setProperty('text1.color', getColorFromHex("99FF99"))
        doTweenColor('asdwasdaw', 'text1', '0xFFFF99FF', 1.860)
        setProperty('circle2.color', getColorFromHex("99FF99"))
        doTweenColor('afrsgsd', 'circle2', '0xFFFF99FF', 1.860)
    end
    if curStep == 1458 then
        cameraFlash('camOther', '0x'..flashalpha..'FFFF00', 1, false)
        removeLuaSprite('circle1')
        removeLuaSprite('circle2')
        setTextString('text1', '')
        setProperty('fractal.alpha', 1)
        setProperty('fgnum.alpha', 1)
        setProperty('bgnum.alpha', 1)
        setProperty('fractal.color', getColorFromHex("FF8888"))
        setObjectOrder('bgnum', getObjectOrder('fractal') + 1)
        setObjectOrder('fgnum', getObjectOrder('fractal') + 2)
        doTweenZoom('weewoohaha', 'camGame', 2, 15.360)
        scaleObject('fractal', 1.5, 1.5)
        setProperty('fractal.x', -400)
    end
    if
    curStep == 1586 then
        cameraFlash('camOther', '0x'..flashalpha..'FFFF00', 1, false)
        addLuaSprite('fractalsmall')
        addLuaSprite('vignette')
        addLuaSprite('carpet')
        setProperty('fgnum.alpha', 0)
        setProperty('bgnum.alpha', 0)
        setProperty('fractal.alpha', 0)
        cancelTween('weewoohaha')
        setProperty('topb.alpha', 0)
        setProperty('botb.alpha', 0)
    end
    if
    curStep == 1586 or
    curStep == 1610 or
    curStep == 1650 or
    curStep == 1674 then
        cancelTween('weeweewoo')
        setProperty('fractalsmall.x', 350)
        doTweenX('weeweewoo','fractalsmall',-400,4)
        setProperty('camGame.zoom', 3)
        setProperty('fractalsmall.angle', math.random(0,360))
        setProperty('vignette.alpha', 1)
        setProperty('carpet.alpha', 0)
        setProperty('flare.alpha', 0)
    end
    if curStep == 1578 then
        for i = 4, 7 do
        --setPropertyFromGroup('strumLineNotes', i, 'x', noteXCenter[(i % 4) + 1])
        --setPropertyFromGroup('strumLineNotes', i, 'y', noteYPlace[(downscroll and 2 or 1)])
        noteTweenX('aeiozsduy'..i, i, noteXCenter[(i % 4) + 1], 0.5, 'circOut')
        noteTweenY('aawezdfuy'..i, i, noteYPlace[(downscroll and 2 or 1)], 0.5, 'circOut')
        doTweenAngle('wawodfa', 'camHUD', 0, 0.5,'circOut')
        end
    end
    if
    (curStep == 1603) or
    (curStep == 1643) or
    (curStep == 1647) or
    (curStep == 1667) or
    (curStep == 1671) or
    (curStep == 1707) or
    (curStep == 1711) then
        ha = ha + 1
        cancelTween('funnylol')
        cancelTween('lolfunny')
        doTweenY('awuhai', 'camHUD', 0, 0.5, 'circOut')
        doTweenAngle('awfasefeafa', 'camHUD', 0, 0.5, 'circOut')
        setProperty('carpet.alpha', 1)
        loadGraphic('carpet', 'carpet'..ha)
        setProperty('flare.alpha', 1)
        setProperty('camGame.zoom', 0.75)
        cameraFlash('camOther', '0x'..flashalpha..'FFFFFF', 0.5, true)
        setProperty('flare.scale.x', 20)
        setProperty('flare.scale.y', 20)
        setProperty('flare.y', -375 + math.random(-50,50))
        doTweenX('funnylol', 'flare.scale', 6, 0.5, 'circOut')
        doTweenY('lolfunny', 'flare.scale', 6, 0.5, 'circOut')
    end
    if curStep == 1713 then
        cameraFlash('camOther', '0x'..flashalpha..'FFFFFF', 0.5, true)
        setProperty('vignette.alpha', 0)
        setProperty('fractalsmall.alpha', 0)
        setProperty('flare.alpha', 0)
        setProperty('carpet.alpha', 0)
        setProperty('grid3.alpha', 0.25)
        setProperty('grid3.angle', 0)
        addLuaSprite('title')
        setProperty('camGame.zoom', 1.25)
        doTweenZoom('weehoo', 'camGame', 1, 2, 'circOut')
    end
    if curStep == 1728 then
        runTimer('offsyncbs', 0.242)
    end
end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'offsyncbs' then
        cameraFlash('camOther', '0x'..flashalpha..'FFFFFF', 2, true)
        setObjectOrder('dark', 1000)
    end
end

function onUpdate(elapsed)
    runHaxeCode([[
        var game:PlayState = FlxG.state;
        game.camZooming = false;
    ]])
    songPos = getSongPosition()
    currentBeat = (songPos / 1000) * (bpm / 60)
    noflashy = getPropertyFromClass('flixel.FlxG','save.data.noFlashy')
    if noflashy then
        local everythinglol = {'vignette', 'topb', 'botb', 'grid3', 'numg1', 'numg2', 'fractal', 'circle1', 'circle2', 'grid', 'gray', 'bgnum','fgnum','flare','grid2','carpet','triangle','sponge','fractalsmall','title','text1','solid'}
        for i = 1, 22 do
            setProperty(everythinglol[i]..'.visible', false)
        end
        flashalpha = '01'
    end
        if (curStep < 67) then
            setProperty('boyfriend.alpha', math.random(noflashy and 0.95 or 0.75,1))
            setProperty('gf.alpha', math.random(noflashy and 0.95 or 0.75,1))
            setProperty('dad.alpha', math.random(noflashy and 0.95 or 0.75,1))
        end
        if  (curStep >= 69 and curStep <= 75) or
            (curStep >= 79 and curStep <= 82) or
            (curStep >= 208 and curStep <= 214) or
            (curStep >= 324 and curStep <= 326) or
            (curStep >= 330 and curStep <= 334) or 
            (curStep >= 336 and curStep <= 338) or
            (curStep >= 342 and curStep <= 344) or 
            (curStep >= 360 and curStep <= 362) or
            (curStep >= 446 and curStep <= 454) or
            (curStep >= 459 and curStep <= 462) or
            (curStep >= 1713 and curStep <= 1724) then
            for i = 4,7 do 
                setPropertyFromGroup('strumLineNotes', i, 'alpha', math.random(noflashy and 0.95 or 0.5,1))
            end
        end
        if (curStep >= 208 and curStep <= 213) then
            setProperty('camGame.y', math.random(-10, 10))
            setProperty('camGame.x', math.random(-10, 10))
            setTextString('text1', 'denumerable set')
            screenCenter('text1')
        end
        if (curStep >= 69 and curStep <= 79) then
            things = {'i n f i n i t e', '', '  n   i   i   e', 'i     i       e', '    f   n   t  ', '  n       i   e', 'i           t  '}
            setProperty('camGame.y', math.random(-10, 10))
            setProperty('camGame.x', math.random(-10, 10))
            setTextString('text1', things[math.random(1, 7)])
            screenCenter('text1')
        end
        if (curStep == 83) or
            (curStep == 215) or
            (curStep == 363) or
            (curStep == 463) or
            (curStep == 1725) then
            for i = 4,7 do 
                setPropertyFromGroup('strumLineNotes', i, 'alpha', 1)
            end
        end
        if curStep >= 100 and curStep <= 306 then
            setProperty('grid.x',  -150 + (getProperty('grid2.x') / 1.5))
            setProperty('grid.y',  -150 + (getProperty('grid2.y') / 1.5))
            setProperty('bgnum.x',  -150 + (getProperty('grid2.x') / 2))
            setProperty('bgnum.y',  -150 + (getProperty('grid2.y') / 2))
            setProperty('fgnum.x',  -150 + (getProperty('grid2.x') * 1.5))
            setProperty('fgnum.y',  -150 + (getProperty('grid2.y') * 1.5))
        end
        if curStep >= 300 and curStep <= 446 then
            for i = 0,7 do 
                noteTweenX('afdaifuehja'..i, i, noteXCenter[(i % 4) + 1] + 32 * math.sin(((currentBeat / 4) + (i % 4)*0.25) * math.pi), 0.5)
                thing = 50
            end

            for i = 0, getProperty('notes.length') - 1 do
                setPropertyFromGroup('notes', i, 'copyX', false)
                
                strumLine = 'playerStrums'

                time = getPropertyFromGroup('notes', i, 'strumTime')
                receptorX = getPropertyFromGroup(strumLine, getPropertyFromGroup('notes', i, 'noteData') , 'x')
                setPropertyFromGroup('notes', i, 'x', receptorX + math.sin((songPos - time) / 100) * thing)
            end
        end
        if (curStep >= 438 and curStep <= 446) then
            for i = 0,3 do 
                setPropertyFromGroup('strumLineNotes', i, 'alpha', math.random(noflashy and 0.45 or 0, 0.5))
            end
        end
        if (curStep == 447) then
            for i = 0,3 do
                setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
            end
            for i = 0, getProperty('notes.length') - 1 do
                setPropertyFromGroup('notes', i, 'copyX', true)
            end
        end
        if (curStep >= 1136 and curStep <= 1215) or 
            (curStep >= 70 and curStep <= 125)then
            thing = 50
            for i = 0, getProperty('notes.length') - 1 do
                setPropertyFromGroup('notes', i, 'copyX', false)
            
                strumLine = 'playerStrums'

                time = getPropertyFromGroup('notes', i, 'strumTime')
                receptorX = getPropertyFromGroup(strumLine, getPropertyFromGroup('notes', i, 'noteData') , 'x')
                setPropertyFromGroup('notes', i, 'x', receptorX + math.sin((songPos - time) / 50) * thing)
            end
        end
        if curStep >= 1459 and curStep <= 1587 then
            setProperty('bgnum.scale.x', (getProperty('camGame.zoom')) * 1.5)
            setProperty('bgnum.scale.y', (getProperty('camGame.zoom')) * 1.5)
            
            setProperty('fgnum.scale.x', (getProperty('camGame.zoom')) * 2.5)
            setProperty('fgnum.scale.y', (getProperty('camGame.zoom')) * 2.5)
        end 
        if (curStep >= 1428 and curStep <= 1577) then
            for i = 4,7 do 
                --setPropertyFromGroup('strumLineNotes', i, 'x', noteXCenter[(i % 4) + 1] + 16 * math.sin((currentBeat + i*0.25) * math.pi))
                --setPropertyFromGroup('strumLineNotes', i, 'y', noteYPlace[(downscroll and 2 or 1)] + 16 * math.cos((currentBeat + i*0.25) * math.pi))
                noteTweenX('aeiozsduy'..i, i, 605 + 512 * math.sin(((currentBeat / 8) + i*0.25) * math.pi), 0.5)
                noteTweenY('aawezdfuy'..i, i, noteYPlace[(downscroll and 2 or 1)] + 64 * math.cos(((currentBeat / 8) + i*0.25) * math.pi), 0.5)
            end
            doTweenAngle('wawodfa', 'camHUD', math.cos(currentBeat / 2) * 15, 0.5)
        end
        if
            (curStep >= 1586 and curStep <= 1602) or
            (curStep >= 1610 and curStep <= 1642) or
            (curStep >= 1650 and curStep <= 1666) or
            (curStep >= 1674 and curStep <= 1706) then
                setProperty('camHUD.y', noflashy and 0 or (math.random(-10, 10)))
                setProperty('camHUD.angle', math.random(-1, 1))
                setProperty('fractalsmall.y', math.random(-5, 5))
        end
    end



