function onCreate()
--Pause Songs
if songName == 'Monsters' then
setPropertyFromClass('ClientPrefs', 'pauseMusic','blackPause')
else
setPropertyFromClass('ClientPrefs', 'pauseMusic','breakfast')
end
end