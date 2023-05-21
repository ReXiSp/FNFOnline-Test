function onCreate()

--Stage

  makeLuaSprite('front', 'BG/stagefront', -1550, -840)
  setScrollFactor('front', 1, 1);

  makeAnimatedLuaSprite('sayuu', 'BG/sayuu', -1550, -840)
  addAnimationByPrefix('sayuu', 'idle', 'sayuu', 24, false)

  makeLuaSprite('screen', 'BG/screenframe', -1550, -840)
  setScrollFactor('screen', 1, 1);

  makeAnimatedLuaSprite('speaker', 'BG/speaker', -970, -200)
  addAnimationByPrefix('speaker', 'idle', 'speaker', 24, false)

  addLuaSprite('sayuu', false);
  addLuaSprite('front', false);
  addLuaSprite('screen', false);
  addLuaSprite('speaker', false);

--Characters

  makeAnimatedLuaSprite('moyashiro', 'BG/moyashiro', -940, -740)
  addAnimationByPrefix('moyashiro', 'idle', 'moyashiro', 24, false)

  makeAnimatedLuaSprite('shin', 'BG/shin', -1070, -320)
  addAnimationByPrefix('shin', 'idle', 'shinBG', 24, false)

  makeAnimatedLuaSprite('cyan', 'BG/cyan', -860, -260)
  addAnimationByPrefix('cyan', 'idle', 'cyan', 24, false)

  addLuaSprite('moyashiro', false)
  addLuaSprite('shin', false)
  addLuaSprite('cyan', false)



end

function onCreatePost()

end

--BG dancing

function bgDance()

  playAnim('moyashiro', 'idle', true)
  playAnim('shin', 'idle', true)
  playAnim('cyan', 'idle', true)
  playAnim('sayuu', 'idle', true)

end



function onBeatHit()

  if curBeat % 1 == 0 then
      bgDance()
      playAnim('speaker', 'idle', true)
  end

end

function onSongStart()
  bgDance()
end