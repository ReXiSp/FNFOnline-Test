function onCreate()
	ShowSongName()
end

function ShowSongName()
	difficultyString = getProperty('storyDifficultyText');
	makeLuaText('SongName', songName .. ' - ' .. difficultyString  , 0, 0, 700);
	
	addLuaText("SongName")
end