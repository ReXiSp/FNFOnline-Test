function onEndSong()
  if isStoryMode and not allowEnd then
    startVideo('week2endmovie')
    allowEnd = true;
    return Function_Stop;
  end
  return Function_Continue;
end