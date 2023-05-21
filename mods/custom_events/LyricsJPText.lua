--私はくそコーダーです

function onCreatePost()

	makeLuaText('lyric', '', 1250, 0, 480)
	setTextAlignment('lyric', 'Center')
    setTextFont('lyric', 'keifont.ttf')
	addLuaText('lyric')
	setTextSize('lyric', 36)
	setObjectCamera('lyric', 'other')
end

local count = 0
function onEvent(n,v1,v2)

  if n == 'LyricsJPText' then

	if v1 == '' then
	  setProperty('lyric.alpha', 1)
	    count = count + 1

	  if getPropertyFromClass('ClientPrefs', 'jpmode') then

	    if count == 1 then
	  	  setTextString('lyric', 'いや')
	    elseif count == 2 then
		  setTextString('lyric', 'いやマジで')
	    elseif count == 3 then
		  setTextString('lyric', 'いやマジで手順')
	    elseif count == 4 then
	  	  setTextString('lyric', 'いやマジで手順めんどくせー')
	    elseif count == 5 then
	  	  setTextString('lyric', 'いやマジで手順めんどくせーこれ')
	    elseif count == 6 then
	  	  setTextString('lyric', 'やばい、')
	    elseif count == 7 then
	  	  setTextString('lyric', 'やばい、マジ')
	    elseif count == 8 then
		  setTextString('lyric', 'やばい、マジやばい')
  	    elseif count == 9 then
		  setTextString('lyric', 'いや、')
	    elseif count == 10 then
		  setTextString('lyric', 'いや、頑張る')
	    elseif count == 11 then
		  setTextString('lyric', 'めっちゃ')
	    elseif count == 12 then
		  setTextString('lyric', 'めっちゃムズい')
	    elseif count == 13 then
		  setTextString('lyric', 'ヤバい、')
	    elseif count == 14 then
		  setTextString('lyric', 'ヤバい、かもしれない')
	    elseif count == 15 then
		  setTextString('lyric', 'Limu')
	    elseif count == 16 then
		  setTextString('lyric', 'Limuちゃ＾～ん')
	    elseif count == 17 then
		  setTextString('lyric', 'SO')
	    elseif count == 18 then
		   setTextString('lyric', 'SO CUTE！！！！！')
	    end

	  else
		if count == 1 then
	  	  setTextString('lyric', 'God,')
	    elseif count == 2 then
		  setTextString('lyric', 'God, seriously')
	    elseif count == 3 then
		  setTextString('lyric', 'God, seriously this procedure')
	    elseif count == 4 then
	  	  setTextString('lyric', 'God, seriously this procedure is')
	    elseif count == 5 then
	  	  setTextString('lyric', 'God, seriously this procedure is a tedious...')
	    elseif count == 6 then
	  	  setTextString('lyric', 'Oh no...')
	    elseif count == 7 then
	  	  setTextString('lyric', 'Oh no... this is')
	    elseif count == 8 then
		  setTextString('lyric', 'Oh no... this is serious.')
  	    elseif count == 9 then
		  setTextString('lyric', 'No,')
	    elseif count == 10 then
		  setTextString('lyric', "No, I'll do my best.")
	    elseif count == 11 then
		  setTextString('lyric', 'Too')
	    elseif count == 12 then
		  setTextString('lyric', 'Too difficult!')
	    elseif count == 13 then
		  setTextString('lyric', 'This')
	    elseif count == 14 then
		  setTextString('lyric', 'This could be bad.')
	    elseif count == 15 then
		  setTextString('lyric', 'Limu-')
	    elseif count == 16 then
		  setTextString('lyric', 'Limu-chaaan!')
	    elseif count == 17 then
		  setTextString('lyric', 'SO')
	    elseif count == 18 then
		   setTextString('lyric', 'SO CUTE!!!!!!!!!!')
	    end
	  end

	else
	  doTweenAlpha('bye', 'lyric', '0', '0.2', 'linear')
	  --setTextString('lyric', '')
	end

  end

end