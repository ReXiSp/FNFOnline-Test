function onCreate()
  if songName ~= "bitch" then
    close()
    return
  end
end

function onCreatePost()

    setProperty('timeBar.x', 100)
    setProperty('timeTxt.x', 50)
    setTextBorder('timeTxt', 1, '000000')

    setTextAlignment('timeTxt', 'left')
    setTextSize('timeTxt', 13)
    setProperty('timeBar.color', getColorFromHex('44d844'))
    setProperty('timeTxt.x', getProperty('timeBar.x') +10)
    setProperty('timeTxt.y', getProperty('timeBar.y') -3)
end

function onUpdatePost()
    if ratingFC == 'SFC' then ratingFC = '[SFC]'
    elseif ratingFC == 'GFC' then ratingFC = '[GFC]'
    elseif ratingFC == 'FC' then ratingFC = '[FC]'
    elseif ratingFC == 'SDCB' then ratingFC = ''
    elseif ratingFC == 'Clear' then ratingFC = ''
    end
    setTextColor("fscoreTxt", rgbToHex(getProperty("dad.healthColorArray[0]"), getProperty("dad.healthColorArray[1]"), getProperty("dad.healthColorArray[2]")))
    if hits == 0 then
      setProperty('scoreTxt.text', 'Score: 0 | Combo Breaks: 0 | Accuracy: ?')
    else 
      setProperty('scoreTxt.text', 'Score: ' .. score .. ' | Combo Breaks: ' .. misses .. ' | Accuracy: ' ..round(rating * 100, 2).. '% ' ..ratingFC.. '')
    end

    --[[
    setProperty('ratingsData[0].ratingMod', 1)
    setProperty('ratingsData[1].ratingMod', 0.7)
    setProperty('ratingsData[2].ratingMod', 0.4)
    setProperty('ratingsData[3].ratingMod', 0)
      ]]
      setTextString('timeTxt', '' .. string.upper(songName) .. '')
end
  
  -- for rating percentage, don't bother with this one
function round(x, n) --https://stackoverflow.com/questions/18313171/lua-rounding-numbers-and-then-truncate
    n = math.pow(10, n or 0)
    x = x * n
    if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
    return x / n
 end

 function rgbToHex(r,g,b)
  -- EXPLANATION:
  -- The integer form of RGB is 0xRRGGBB
  -- Hex for red is 0xRR0000
  -- Multiply red value by 0x10000(65536) to get 0xRR0000
  -- Hex for green is 0x00GG00
  -- Multiply green value by 0x100(256) to get 0x00GG00
  -- Blue value does not need multiplication.

  -- Final step is to add them together
  -- (r * 0x10000) + (g * 0x100) + b =
  -- 0xRR0000 +
  -- 0x00GG00 +
  -- 0x0000BB =
  -- 0xRRGGBB
  local rgb = (r * 0x10000) + (g * 0x100) + b
  return string.format("%x", rgb)
end