function onCreate()

  makeLuaText('judge', '', screenWidth, -10, 0)
  setTextSize('judge', 20)
  screenCenter('judge', 'Y')
  setProperty("judge", 200)
  setTextAlignment('judge', 'left')
  setObjectCamera('judge', 'other')

  addLuaText('judge')

end

function onUpdate()

  setTextString('judge', 'Sick: ' .. getProperty('sicks') .. '\nGood: ' .. getProperty('goods') .. '\nBad : ' .. getProperty('bads') .. '\nShit: ' .. getProperty('shits') .. '\nMiss: ' .. getProperty('songMisses') .. '')

end