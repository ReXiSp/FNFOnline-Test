
-----------------------------------------------------------
--Camera Movement Script by NicolasMyt--
-----------------------------------------------------------

local enableSystem = true

local DadX = 0
local DadY = 0

local BfX = 0
local BfY = 0

local GfX = 0
local GfY = 0

local BfOfs = 10
local GfOfs = 10
local DadOfs = 10

local ZoomOfsX = 0
local ZoomOfsY = 0

local ZoomOppX = 0
local ZoomOppY = 0

local curCameraState = nil
local cameraMoving = false

local def = 1.0

--[[If you want to know the credits:
i got a ideia of the script by Washo789, 
the script is made by BF Myt.]]--

function onCreatePost()
  def = getProperty('defaultCamZoom')
  setProperty('cameraSpeed', 1.5)
  setProperty('camZooming', true)
end

function onUpdate()
    if enableSystem == true then
        if mustHitSection == false then

                    DadX = getMidpointX('dad') + 150 + getProperty('dad.cameraPosition[0]') + getProperty('opponentCameraOffset[0]')
                    DadY = getMidpointY('dad') - 100 + getProperty('dad.cameraPosition[1]') + getProperty('opponentCameraOffset[1]')

                    if getProperty('dad.animation.curAnim.name') == 'singLEFT' or getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                        triggerEvent('Camera Follow Pos',DadX-DadOfs+ZoomOppX,DadY+ZoomOppY)
                        cameraMoving = true
                    elseif getProperty('dad.animation.curAnim.name') == 'singRIGHT' or getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                        triggerEvent('Camera Follow Pos',DadX+(DadOfs/2)+ZoomOppX,DadY+ZoomOppY)
                        cameraMoving = true
                    elseif getProperty('dad.animation.curAnim.name') == 'singUP' or getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                        triggerEvent('Camera Follow Pos',DadX+ZoomOppX,DadY-DadOfs+ZoomOppY)
                        cameraMoving = true
                    elseif getProperty('dad.animation.curAnim.name') == 'singDOWN' or getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                        triggerEvent('Camera Follow Pos',DadX+ZoomOppX,DadY+DadOfs+ZoomOppY)
                        cameraMoving = true
                    elseif getProperty('dad.animation.curAnim.name') == 'idle' or getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                        triggerEvent('Camera Follow Pos',DadX+ZoomOppX,DadY+ZoomOppY)
                        
                    elseif getProperty('dad.animation.curAnim.name') == 'shoot' then
                        triggerEvent('Camera Follow Pos',DadX+ZoomOppX,DadY+ZoomOppY)
                        cameraMoving = true
                    else
                        if cameraMoving == true then
                            triggerEvent('Camera Follow Pos',DadX+ZoomOppX,DadY+ZoomOppY)
                            cameraMoving = false
                        end
                    end
        else

                BfX = getMidpointX('boyfriend') - 100 - getProperty('boyfriend.cameraPosition[0]') + getProperty('boyfriendCameraOffset[0]')
                BfY = getMidpointY('boyfriend') - 100 + getProperty('boyfriend.cameraPosition[1]') + getProperty('boyfriendCameraOffset[1]')


            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' or getProperty('boyfriend.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',BfX-BfOfs+ZoomOfsX,BfY+ZoomOfsY)
            elseif getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' or getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',BfX+BfOfs+ZoomOfsX,BfY+ZoomOfsY)
            elseif getProperty('boyfriend.animation.curAnim.name') == 'singUP' or getProperty('boyfriend.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',BfX+ZoomOfsX,BfY-BfOfs+ZoomOfsY)
            elseif getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' or getProperty('boyfriend.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',BfX+ZoomOfsX,BfY+BfOfs+ZoomOfsY)
            elseif getProperty('boyfriend.animation.curAnim.name') == 'shoot' then
                triggerEvent('Camera Follow Pos',BfX+ZoomOfsX,BfY+ZoomOfsY)
            elseif getProperty('boyfriend.animation.curAnim.name') == 'idle' or getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',BfX+ZoomOfsX,BfY+ZoomOfsY)

            else
                if cameraMoving == true then
                    triggerEvent('Camera Follow Pos',BfX+ZoomOfs,BfY)
                    cameraMoving = false
                end
            end
        end

--Zooming

  if mustHitSection then
    setProperty('defaultCamZoom', def + 0)
  else
    setProperty('defaultCamZoom', def + 0.2)
  end
  if gfSection then
    setProperty('defaultCamZoom', def + 0.25)
  end

    end
	
end

function onEvent(n,v1,v2)

  if n == 'enableCamMove' then

    if v1 == '0' then
      enableSystem = false

    elseif v1 == '1' then
      enableSystem = true
    end

  end

  if n == 'Set Property' and v1 == 'defaultCamZoom' then
    def = v2
  end

end

function onBeatHit()

    if curBeat == 56 then
        ZoomOfsX = 20
        ZoomOfsY = 0
    end
    if curBeat == 60 then
        ZoomOfsX = 100
        ZoomOfsY = -30
    end
    if curBeat == 64 then
        ZoomOfsX = 0
        ZoomOfsY = 0
    end
    if curBeat == 188 then
        ZoomOppX = 0
        ZoomOppY = -100
    end
    if curBeat == 256 then
        ZoomOppX = 0
        ZoomOppY = 0
    end
    if curBeat == 316 then
        ZoomOfsX = 100
        ZoomOfsY = -30
    end
    if curBeat == 320 then
        ZoomOfsX = 0
        ZoomOfsY = 0
    end
        
end