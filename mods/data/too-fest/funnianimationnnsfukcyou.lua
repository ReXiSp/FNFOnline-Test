local scale = 1
local bounce = 0.3

local TimeTemp = 0;
local timess = 0;
local timeall = 0;

function onCreatePost()
  setProperty('boyfriend.origin.y', 320)
  setProperty('boyfriend.y', getProperty('boyfriend.y') -0)
  --scale = getProperty('boyfriend.scale')
end

function goodNoteHit(id, dir, type, isSus)

  if botPlay and not isSus then
    spedReset()
  end

  if dir == 0 then
    cancel()
    
    setProperty('boyfriend.angle', -20)
    setProperty('boyfriend.scale.y', scale)
    doTweenAngle('left','boyfriend', -10, 0.2, 'cubeIn')

  elseif dir == 1 then
    cancel()
    
    setProperty('boyfriend.scale.y', scale -bounce)
    setProperty('boyfriend.scale.x', scale +bounce)
    setProperty('boyfriend.angle', 0)
    doTweenX('downx','boyfriend.scale', scale, 0.2, 'cubeIn')
    doTweenY('down','boyfriend.scale', scale, 0.2, 'cubeIn')

  elseif dir == 2 then
    cancel()
    
    setProperty('boyfriend.scale.y', scale +bounce)
    setProperty('boyfriend.scale.x', scale -bounce)
    setProperty('boyfriend.angle', 0)
    doTweenX('upx','boyfriend.scale', scale, 0.2, 'cubeIn')
    doTweenY('up','boyfriend.scale', scale, 0.2, 'cubeIn')

  elseif dir == 3 then
    cancel()
   
    setProperty('boyfriend.angle', 20)
    setProperty('boyfriend.scale.y', scale)
    doTweenAngle('right','boyfriend', 10, 0.2, 'cubeIn')

  end
end

function cancel()
  cancelTween('left')
  cancelTween('down')
  cancelTween('downx')
  cancelTween('up')
  cancelTween('upx')
  cancelTween('right')
end

local sped = 5
local spedoppo = 5
local BfX = 0
local BfY = 0
local DadX = 0
local DadY = 0

function onUpdatePost()
  setProperty("camFollow.x",(BfX+DadX)/2)
  setProperty("camFollow.y",(BfY+DadY)/2)
end

function onUpdate()
  TimeTemp = os.clock();
  timess = TimeTemp-timeall;
  timeall = TimeTemp;
  --debugPrint('X'..(BfX+DadX)/2)
  --debugPrint('Y'..(BfY+DadY)/2)
  --debugPrint(timess*95)
  --pressed
  if keyPressed('left') then
    playAnim('boyfriend', 'singLEFT', true)
    setProperty('boyfriend.specialAnim', true)
  end
  if keyPressed('down') then
    playAnim('boyfriend', 'singDOWN', true)
    setProperty('boyfriend.specialAnim', true)
  end
  if keyPressed('up') then
    playAnim('boyfriend', 'singUP', true)
    setProperty('boyfriend.specialAnim', true)
  end
  if keyPressed('right') then
    playAnim('boyfriend', 'singRIGHT', true)
    setProperty('boyfriend.specialAnim', true)
  end

  if keyReleased('left') then
    backToIdle()
  end
  if keyReleased('down') then
    backToIdle()
  end
  if keyReleased('up') then
    backToIdle()
  end
  if keyReleased('right') then
    backToIdle()
  end
  
  if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
    setProperty('boyfriend.scale.y', scale)
    setProperty('boyfriend.scale.x', scale)
    setProperty('boyfriend.angle', 0)
  end

  --BF移動
  if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
    setProperty('boyfriend.x', getProperty('boyfriend.x') -sped)
    spedUp()

  elseif getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
    setProperty('boyfriend.y', getProperty('boyfriend.y') +sped)
    spedUp()

  elseif getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
    setProperty('boyfriend.y', getProperty('boyfriend.y') -sped)
    spedUp()

  elseif getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
    setProperty('boyfriend.x', getProperty('boyfriend.x') +sped)
    spedUp()
  end

  if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
    setProperty('dad.x', getProperty('dad.x') -spedoppo)
    spedUpoppo()

  elseif getProperty('dad.animation.curAnim.name') == 'singDOWN' then
    setProperty('dad.y', getProperty('dad.y') +spedoppo)
    spedUpoppo()

  elseif getProperty('dad.animation.curAnim.name') == 'singUP' then
    setProperty('dad.y', getProperty('dad.y') -spedoppo)
    spedUpoppo()

  elseif getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
    setProperty('dad.x', getProperty('dad.x') +spedoppo)
    spedUpoppo()
  else
    spedResetoppo()
  end

  --格ゲー的自動振り向き
  if getProperty('boyfriend.x') <= getProperty('dadGroup.x') then
    setProperty('boyfriend.flipX', true)
  else
    setProperty('boyfriend.flipX', false)
  end

  --画面外へ行くことは許さない
  if getProperty('boyfriend.y') < -80 then
    setProperty('boyfriend.y', 900)
    stopSound('db')
    playSound('dbwarp', 1, 'db')
  elseif getProperty('boyfriend.y') > 900 then
    setProperty('boyfriend.y', -80)
    stopSound('db')
    playSound('dbwarp', 1, 'db')
  end
  if getProperty('boyfriend.x') < -80 then
    setProperty('boyfriend.x', 1600)
    stopSound('db')
    playSound('dbwarp', 1, 'db')
  elseif getProperty('boyfriend.x') > 1600 then
    setProperty('boyfriend.x', -80)
    stopSound('db')
    playSound('dbwarp', 1, 'db')
  end

  if getProperty('dad.y') < -80 then
    setProperty('dad.y', 900)
    stopSound('dba')
    playSound('dbwarp', 1, 'dba')
  elseif getProperty('dad.y') > 900 then
    setProperty('dad.y', -80)
    stopSound('dba')
    playSound('dbwarp', 1, 'dba')
  end
  if getProperty('dad.x') < -80 then
    setProperty('dad.x', 1600)
    stopSound('dba')
    playSound('dbwarp', 1, 'dba')
  elseif getProperty('dad.x') > 1600 then
    setProperty('dad.x', -80)
    stopSound('dba')
    playSound('dbwarp', 1, 'dba')
  end


  BfX = getMidpointX('boyfriend') - 100 - getProperty('boyfriend.cameraPosition[0]') + getProperty('boyfriendCameraOffset[0]')
  BfY = getMidpointY('boyfriend') - 100 + getProperty('boyfriend.cameraPosition[1]') + getProperty('boyfriendCameraOffset[1]')
  DadX = getMidpointX('dad') + 150 + getProperty('dad.cameraPosition[0]') + getProperty('opponentCameraOffset[0]')
  DadY = getMidpointY('dad') - 100 + getProperty('dad.cameraPosition[1]') + getProperty('opponentCameraOffset[1]')
  midCameraX = (DadX+BfX)/2
  midCameraY = (DadY+BfY)/2

  if mustHitSection then
    --triggerEvent('Camera Follow Pos', midCameraX, midCameraY)
  else
    --triggerEvent('Camera Follow Pos', DadX, DadY)
  end
    

end

function spedUp()
  --sped = sped +1
  sped = sped +(timess*30)
end
function spedReset()
  sped = 5
end

function spedUpoppo()
  --sped = sped +1
  spedoppo = spedoppo +(timess*60)
end
function spedResetoppo()
  spedoppo = 5
end


function backToIdle()
  spedReset()
  playAnim('boyfriend', 'idle', true)
  --setProperty('boyfriend.specialAnim', false)
end

opponentdirection = 0;

function opponentNoteHit(id, direction, noteType, isSustainNote)
  --runTimer("OpponentNotepress"..direction, 0.5, 1)
  if opponentdirection ~= direction then
    spedResetoppo()
    opponentdirection = direction;
  end
end