function onCreate()

    makeLuaSprite('bg1', 'bg', -350, -200)
    setScrollFactor('bg1', 0.9, 0.9)
    addLuaSprite('bg1', false)
    scaleObject('bg1', 0.7, 0.7)

    makeLuaSprite('ded', 'ded', 430, 480)
    setScrollFactor('ded', 1.05, 1.05)
    addLuaSprite('ded', false)
    setProperty('ded.origin.x', 200)
    setProperty('ded.origin.y', 180)

    makeLuaSprite('bg2', 'bg2', -350, -200)
    setScrollFactor('bg2', 1.05, 1.05)
    addLuaSprite('bg2', true)
    scaleObject('bg2', 0.7, 0.7)

    makeLuaSprite('vig', 'vign', -10, -10)
    addLuaSprite('vig', true)
    setObjectCamera('vig', 'hud')
    setProperty('vig.alpha', 0.8)

    makeAnimatedLuaSprite('war', 'warch', 610, 162)
    addAnimationByPrefix('war', 'walkin', 'idle', 24, false)
    addLuaSprite('war', true)
    scaleObject('war', 0.85, 0.85)
    setProperty('war.alpha', 0)

end

local def = 1.0
function onCreatePost()

    def = getProperty('defaultCamZoom')
    setScrollFactor('boyfriend', 1.15, 1.1)

    for i = 0,3 do
        setPropertyFromGroup('opponentStrums', i, 'x', -1000)
    end
end

function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote)
    triggerEvent('Add Camera Zoom', '0.03', '0.01')
end

local beatdur = 0.25
function onBeatHit()
    if curBeat < 73 then
      setProperty('ded.scale.x', 1.03)
      setProperty('ded.scale.y', 0.97)
      doTweenX('dedx', 'ded.scale', 1, beatdur, 'sineInOut')
      doTweenY('dedy', 'ded.scale', 1, beatdur, 'sineOut')
    end
end

function onSongStart()
    setProperty('ded.scale.x', 1.03)
    setProperty('ded.scale.y', 0.97)
    doTweenX('dedx', 'ded.scale', 1, beatdur, 'sineInOut')
    doTweenY('dedy', 'ded.scale', 1, beatdur, 'sineOut')
end

function onEvent(n,v1,v2)
    if n == 'warchiefcomes' then
        playAnim('war', 'walkin', true)
        setProperty('war.alpha', 1)
    end
end

-----------------------------------------------------------
--Camera Movement Script by NicolasMyt--
-----------------------------------------------------------

local enableSystem = false

local DadX = 0
local DadY = 0

local BfX = 0
local BfY = 0

local BfOfs = 7
local DadOfs = 7

local curCameraState = nil
local cameraMoving = false

--[[If you want to know the credits:
i got a ideia of the script by Washo789, 
the script is made by BF Myt.]]--

function onUpdate()
    if curBeat <= 8 then
        enableSystem = true
    end
    if curBeat >= 73 then
        setProperty('camZooming', false)
    end
    if curBeat <= 70 then
        for i = 0,3 do
            setPropertyFromGroup('playerStrums', i, 'alpha', 0.8)
        end
    end


    if enableSystem == true then
        if mustHitSection == false then
                if gfSection == false or gfSection == nil then
                    DadX = getMidpointX('dad') + 150 + getProperty('dad.cameraPosition[0]') + getProperty('opponentCameraOffset[0]')
                    DadY = getMidpointY('dad') - 100 + getProperty('dad.cameraPosition[1]') + getProperty('opponentCameraOffset[1]')

                    if getProperty('dad.animation.curAnim.name') == 'singLEFT' or getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                        triggerEvent('Camera Follow Pos',DadX-DadOfs,DadY)
                        cameraMoving = true
                    elseif getProperty('dad.animation.curAnim.name') == 'singRIGHT' or getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                        triggerEvent('Camera Follow Pos',DadX+(DadOfs/2),DadY)
                        cameraMoving = true
                    elseif getProperty('dad.animation.curAnim.name') == 'singUP' or getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                        triggerEvent('Camera Follow Pos',DadX,DadY-DadOfs)
                        cameraMoving = true
                    elseif getProperty('dad.animation.curAnim.name') == 'singDOWN' or getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                        triggerEvent('Camera Follow Pos',DadX,DadY+DadOfs)
                        cameraMoving = true
                    elseif getProperty('dad.animation.curAnim.name') == 'idle' or getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                        triggerEvent('Camera Follow Pos',DadX,DadY)
                    else
                        if cameraMoving == true then
                            triggerEvent('Camera Follow Pos',DadX,DadY)
                            cameraMoving = false
                        end
                    end
                end
        else

                BfX = getMidpointX('boyfriend') - 100 - getProperty('boyfriend.cameraPosition[0]') + getProperty('boyfriendCameraOffset[0]')
                BfY = getMidpointY('boyfriend') - 100 + getProperty('boyfriend.cameraPosition[1]') + getProperty('boyfriendCameraOffset[1]')


            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' or getProperty('boyfriend.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',BfX-BfOfs,BfY)
            elseif getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' or getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',BfX+BfOfs,BfY)
            elseif getProperty('boyfriend.animation.curAnim.name') == 'singUP' or getProperty('boyfriend.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',BfX,BfY-BfOfs)
            elseif getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' or getProperty('boyfriend.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',BfX,BfY+BfOfs)
            elseif getProperty('boyfriend.animation.curAnim.name') == 'idle' or getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',BfX,BfY)
            else
                if cameraMoving == true then
                    triggerEvent('Camera Follow Pos',BfX,BfY)
                    cameraMoving = false
                end
            end
        end
    --Zooming
    if mustHitSection then
      setProperty('defaultCamZoom', def + 0)
    else
      setProperty('defaultCamZoom', def + 0.1)
    end

    end
	
end