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

  if n == 'LyricsGK' then

	if v1 == '' then
	  setProperty('lyric.alpha', 1)
	    count = count + 1

	  if getPropertyFromClass('ClientPrefs', 'jpmode') then

	    if count == 1 then
	  	  setTextString('lyric', 'では')
	    elseif count == 2 then
		  setTextString('lyric', 'では次の配信で')
		elseif count == 3 then
		  setTextString('lyric', 'では次の配信でお会いしましょう！')
		elseif count == 4 then
		  setTextString('lyric', 'では次の配信でお会いしましょう！ばいばーい！')
	    end

	  else
	    if count == 1 then
	  	  setTextString('lyric', 'See you again')
	    elseif count == 2 then
		  setTextString('lyric', 'See you again in the')
		elseif count == 3 then
		  setTextString('lyric', 'See you again in the next stream!')
		elseif count == 4 then
		  setTextString('lyric', 'See you again in the next stream! Bye-bye!')
	    end
	  end

	else
	  doTweenAlpha('bye', 'lyric', '0', '0.2', 'linear')
	  --setTextString('lyric', '')
	end

  end

end