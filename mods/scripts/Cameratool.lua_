------------------------------------------------------------
--  CameraTool                                            --
--  Scriptby Tetochan                                     --
--  v2.00                                                 --
--  Click here for the script creator's Twitter account.  -- 
--                                                        --
--  https://twitter.com/tetonatyan                        --
--                                                        --
------------------------------------------------------------


--[[		

-------Function Usage---------

...move -- Sets the size of the camera movement

..defaltx and defalty -- Change the camera offset

..dancespe -- spooky and gf 'danceLeft' 'danceRight' The size of the camera movement during

..dancemove -- Whether to move the camera when using 'danceLeft' 'danceRight' instead of 'idle'

..dancereversal -- Whether or not to reverse where the camera moves when dancemove is activated.

..xreversal -- Used for characters such as monstar, whose direction is reversed with respect to the arrow.

..yreversal --  Used for characters whose direction is reversed with respect to the arrow.
------------------------------



--------Character offset template---------------------

	if boyfriendName == 'Character name on bf side' then
		bfmove = 40;
		bfdefaltx = 150;
		bfdefalty = 430;
		bfdancespe = 10;
		bfdancemove = false;
		bfdancereversal = false;
		bfxreversal = false;
		bfyreversal = false;
	end
	if dadName == 'Character name on dad side' then
		dadmove = 40;
		daddefaltx = 420;
		daddefalty = 420;
		daddancespe = 10;
		daddancemove = false;
		daddancereversal = false;
		dadxreversal = false;
		dadyreversal = false;
	end
	if getProperty('gf.curCharacter') == 'Character name on gf side' then
		gfmove = 40;
		gfdefaltx = 370;
		gfdefalty = 320;
		gfdancespe = 10;
		gfdancemove = false;
		gfdancereversal = false;
		gfxreversal = false;
		gfyreversal = false;
	end

------------------------------------------------------


]]



--Offset editor per character------------------

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'Character camera set' or tag == 'Character camera set Create' or tag == 'Character camera set bf' or tag == 'Character camera set dad' or tag == 'Character camera set gf' then
		if tag == 'Character camera set Create' then
			--debugPrint('set template')
			--debugPrint (getProperty('girlfriend.curCharacter'))
			--This is the offset when there was none.
			--bf
			bfmove = 40;
			bfdefaltx = 50;
			bfdefalty = 430;
			bfdancespe = 10;
			bfdancemove = false;
			bfdancereversal = false;
			bfxreversal = false;
			bfyreversal = false;
			--opponent
			dadmove = 40;
			daddefaltx = 420;
			daddefalty = 420;
			daddancespe = 10;
			daddancemove = false;
			daddancereversal = false;
			dadxreversal = false;
			dadyreversal = false;
			--gf
			gfmove = 40;
			gfdefaltx = 370;
			gfdefalty = 320;
			gfdancespe = 10;
			gfdancemove = false;
			gfdancereversal = false;
			gfxreversal = false;
			gfyreversal = false;
		end

		if tag == 'Character camera set bf' then
			--bf
			bfmove = 40;
			bfdefaltx = 150;
			bfdefalty = 430;
			bfdancespe = 10;
			bfdancemove = false;
			bfdancereversal = false;
			bfxreversal = false;
			bfyreversal = false;
		end

		if tag == 'Character camera set dad' then
			--opponent
			dadmove = 40;
			daddefaltx = 420;
			daddefalty = 420;
			daddancespe = 10;
			daddancemove = false;
			daddancereversal = false;
			dadxreversal = false;
			dadyreversal = false;
		end

		if tag == 'Character camera set gf' then
			--gf
			gfmove = 40;
			gfdefaltx = 370;
			gfdefalty = 320;
			gfdancespe = 10;
			gfdancemove = false;
			gfdancereversal = false;
			gfxreversal = false;
			gfyreversal = false;
		end

		--bf cameralist-----------------------------------------------------

		if boyfriendName == 'bf' and songName == 'Tutorial' then
			bfmove = 33;
			bfdefaltx = 100;
			bfdefalty = 450;
			bfdancespe = 10;
			bfdancemove = false;
			bfdancereversal = false;
			bfxreversal = false;
			bfyreversal = false;
		else
			if boyfriendName == 'bf' then
				bfmove = 33;
				bfdefaltx = -50;
				bfdefalty = 450;
				bfdancespe = 10;
				bfdancemove = false;
				bfdancereversal = false;
				bfxreversal = false;
				bfyreversal = false;
			end
		end
		if boyfriendName == 'bf-car' then
			bfmove = 40;
			bfdefaltx = 50;
			bfdefalty = 430;
			bfdancespe = 10;
			bfdancemove = false;
			bfdancereversal = false;
			bfxreversal = false;
			bfyreversal = false;
		end
		if boyfriendName == 'bf-christmas' then
			bfmove = 40;
			bfdefaltx = 150;
			bfdefalty = 330;
			bfdancespe = 10;
			bfdancemove = false;
			bfdancereversal = false;
			bfxreversal = false;
			bfyreversal = false;
		end
		if boyfriendName == 'bf-pixel' then
			bfmove = 40;
			bfdefaltx = -80;
			bfdefalty = 280;
			bfdancespe = 10;
			bfdancemove = false;
			bfdancereversal = false;
			bfxreversal = false;
			bfyreversal = false;
		end
		if boyfriendName == 'playablemeltical' or boyfriendName == 'playablemelticalw' then
			bfmove = 40;
			bfdefaltx = -50;
			bfdefalty = 350;
			bfdancespe = 10;
			bfdancemove = false;
			bfdancereversal = false;
			bfxreversal = false;
			bfyreversal = false;
		end
		if boyfriendName == 'nanase' then
			bfmove = 33;
			bfdefaltx = -50;
			bfdefalty = 350;
			bfdancespe = 10;
			bfdancemove = false;
			bfdancereversal = false;
			bfxreversal = false;
			bfyreversal = false;
		end
		if boyfriendName == 'playablesilfa' then
			bfmove = 33;
			bfdefaltx = -50;
			bfdefalty = 350;
			bfdancespe = 10;
			bfdancemove = false;
			bfdancereversal = false;
			bfxreversal = false;
			bfyreversal = false;
		end

		--dad cameralist-----------------------------------------------------

		if dadName == 'gf' then
			dadmove = 40;
			daddefaltx = 750;
			daddefalty = 280;
			daddancespe = 10;
			daddancemove = false;
			daddancereversal = false;
			dadxreversal = false;
			dadyreversal = false;
		end

		if dadName == 'dad' then
			dadmove = 40;
			daddefaltx = 450;
			daddefalty = 320;
			daddancespe = 10;
			daddancemove = false;
			daddancereversal = false;
			dadxreversal = false;
			dadyreversal = false;
		end

		if dadName == 'spooky' then
			dadmove = 40;
			daddefaltx = 420;
			daddefalty = 420;
			daddancespe = 5;
			daddancemove = true;
			daddancereversal = false;
			dadxreversal = false;
			dadyreversal = false;
		end

		if dadName == 'monster' then
			dadmove = 40;
			daddefaltx = 420;
			daddefalty = 320;
			daddancespe = 10;
			daddancemove = false;
			daddancereversal = false;
			dadxreversal = true;
			dadyreversal = false;
		end

		if dadName == 'pico' then
			dadmove = 40;
			daddefaltx = 550;
			daddefalty = 420;
			daddancespe = 10;
			daddancemove = false;
			daddancereversal = false;
			dadxreversal = false;
			dadyreversal = false;
		end

		if dadName == 'mom' then
			dadmove = 40;
			daddefaltx = 420;
			daddefalty = 320;
			daddancespe = 10;
			daddancemove = false;
			daddancereversal = false;
			dadxreversal = false;
			dadyreversal = false;
		end

		if dadName == 'mom-car' then
			dadmove = 40;
			daddefaltx = 420;
			daddefalty = 320;
			daddancespe = 10;
			daddancemove = false;
			daddancereversal = false;
			dadxreversal = false;
			dadyreversal = false;
		end
		
		if dadName == 'parents-christmas' then
			dadmove = 40;
			daddefaltx = 380;
			daddefalty = 320;
			daddancespe = 10;
			daddancemove = false;
			daddancereversal = false;
			dadxreversal = false;
			dadyreversal = false;
		end

		if dadName == 'monster-christmas' then
			dadmove = 40;
			daddefaltx = 420;
			daddefalty = 320;
			daddancespe = 10;
			daddancemove = false;
			daddancereversal = false;
			dadxreversal = true;
			dadyreversal = false;
		end

		if dadName == 'senpai' then
			dadmove = 40;
			daddefaltx = 420;
			daddefalty = 420;
			daddancespe = 10;
			daddancemove = false;
			daddancereversal = false;
			dadxreversal = false;
			dadyreversal = false;
		end

		if dadName == 'senpai-angry' then
			dadmove = 40;
			daddefaltx = 420;
			daddefalty = 420;
			daddancespe = 10;
			daddancemove = false;
			daddancereversal = false;
			dadxreversal = false;
			dadyreversal = false;
		end

		if dadName == 'spirit' then
			dadmove = 40;
			daddefaltx = 420;
			daddefalty = 420;
			daddancespe = 10;
			daddancemove = false;
			daddancereversal = false;
			dadxreversal = false;
			dadyreversal = false;
		end

		if dadName == 'meltical' then
			dadmove = 33;
			daddefaltx = 600;
			daddefalty = 400;
			daddancespe = 10;
			daddancemove = false;
			daddancereversal = false;
			dadxreversal = false;
			dadyreversal = false;
		end

		if dadName == 'aroma' then
			dadmove = 33;
			daddefaltx = 600;
			daddefalty = 300;
			daddancespe = 10;
			daddancemove = false;
			daddancereversal = false;
			dadxreversal = false;
			dadyreversal = false;
		end

		if dadName == 'aromelsingle' or dadName == 'aromeldouble' then
			dadmove = 33;
			daddefaltx = 600;
			daddefalty = 350;
			daddancespe = 10;
			daddancemove = false;
			daddancereversal = false;
			dadxreversal = false;
			dadyreversal = false;
		end

		if dadName == 'silfa' then
			dadmove = 33;
			daddefaltx = 700;
			daddefalty = 450;
			daddancespe = 10;
			daddancemove = false;
			daddancereversal = false;
			dadxreversal = false;
			dadyreversal = false;
		end

		if dadName == 'Shian' then
			dadmove = 33;
			daddefaltx = 700;
			daddefalty = 400;
			daddancespe = 10;
			daddancemove = false;
			daddancereversal = false;
			dadxreversal = false;
			dadyreversal = false;
		end

		if dadName == 'beta' then
			dadmove = 33;
			daddefaltx = 700;
			daddefalty = 400;
			daddancespe = 10;
			daddancemove = false;
			daddancereversal = false;
			dadxreversal = false;
			dadyreversal = false;
		end

		if dadName == 'plus' then
			dadmove = 33;
			daddefaltx = 500;
			daddefalty = 350;
			daddancespe = 10;
			daddancemove = false;
			daddancereversal = false;
			dadxreversal = false;
			dadyreversal = false;
		end

		if dadName == 'photo' then
			dadmove = 33;
			daddefaltx = 500;
			daddefalty = 350;
			daddancespe = 10;
			daddancemove = false;
			daddancereversal = false;
			dadxreversal = false;
			dadyreversal = false;
		end

		if dadName == 'jpsingle' or dadName == 'jpdouble' or dadName == 'jpsinglebonus' or dadName == 'jpdoublebonus' then
			dadmove = 33;
			daddefaltx = 400;
			daddefalty = 350;
			daddancespe = 10;
			daddancemove = false;
			daddancereversal = false;
			dadxreversal = false;
			dadyreversal = false;
		end

		if dadName == 'cskyle' or dadName == 'cskyleb' then
			dadmove = 33;
			daddefaltx = 600;
			daddefalty = 250;
			daddancespe = 10;
			daddancemove = false;
			daddancereversal = false;
			dadxreversal = false;
			dadyreversal = false;
		end

		if dadName == 'Shianbonus' then
			dadmove = 33;
			daddefaltx = 700;
			daddefalty = 400;
			daddancespe = 10;
			daddancemove = false;
			daddancereversal = false;
			dadxreversal = false;
			dadyreversal = false;
		end

		--gf cameralist-----------------------------------------------------

		if getProperty('gf.curCharacter') == 'gf' then
			gfmove = 40;
			gfdefaltx = 370;
			gfdefalty = 320;
			gfdancespe = 10;
			gfdancemove = false;
			gfdancereversal = false;
			gfxreversal = false;
			gfyreversal = false;
		end
		if getProperty('gf.curCharacter') == 'gf-car' then
			gfmove = 40;
			gfdefaltx = 370;
			gfdefalty = 320;
			gfdancespe = 10;
			gfdancemove = false;
			gfdancereversal = false;
			gfxreversal = false;
			gfyreversal = false;
		end
		if getProperty('gf.curCharacter') == 'gf-christmas' then
			gfmove = 40;
			gfdefaltx = 440;
			gfdefalty = 320;
			gfdancespe = 10;
			gfdancemove = false;
			gfdancereversal = false;
			gfxreversal = false;
			gfyreversal = false;
		end
		if getProperty('gf.curCharacter') == 'gf-pixel' then
			gfmove = 40;
			gfdefaltx = 90;
			gfdefalty = 100;
			gfdancespe = 10;
			gfdancemove = false;
			gfdancereversal = false;
			gfxreversal = false;
			gfyreversal = false;
		end

		if getProperty('gf.curCharacter') == 'gfbeta' then
			gfmove = 40;
			gfdefaltx = 330;
			gfdefalty = 180;
			gfdancespe = 10;
			gfdancemove = false;
			gfdancereversal = false;
			gfxreversal = false;
			gfyreversal = false;
		end

	end
end














function onUpdate(elapsed)

	--bf control


	if mustHitSection == true then
		if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
			--debugPrint('BFsingLEFT')
			if bfxreversal == false then
			triggerEvent('Camera Follow Pos',defaultBoyfriendX-bfmove+bfdefaltx,defaultBoyfriendY+bfdefalty)
			else
			triggerEvent('Camera Follow Pos',defaultBoyfriendX+bfmove+bfdefaltx,defaultBoyfriendY+bfdefalty)
			end
		end
		if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
			--debugPrint('BFsingDOWN')
			if bfyreversal == false then
			triggerEvent('Camera Follow Pos',defaultBoyfriendX+bfdefaltx,defaultBoyfriendY+bfmove+bfdefalty)
			else
			triggerEvent('Camera Follow Pos',defaultBoyfriendX+bfdefaltx,defaultBoyfriendY-bfmove+bfdefalty)
			end
		end
		if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
			--debugPrint('BFsingUP')
			if bfyreversal == false then
			triggerEvent('Camera Follow Pos',defaultBoyfriendX+bfdefaltx,defaultBoyfriendY-bfmove+bfdefalty)
			else
			triggerEvent('Camera Follow Pos',defaultBoyfriendX+bfdefaltx,defaultBoyfriendY+bfmove+bfdefalty)
			end
		end
		if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
			--debugPrint('BFsingRIGHT')
			if bfxreversal == false then
			triggerEvent('Camera Follow Pos',defaultBoyfriendX+bfmove+bfdefaltx,defaultBoyfriendY+bfdefalty)
			else
			triggerEvent('Camera Follow Pos',defaultBoyfriendX-bfmove+bfdefaltx,defaultBoyfriendY+bfdefalty)
			end
		end
		if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
			--debugPrint('BFidle')
			triggerEvent('Camera Follow Pos',defaultBoyfriendX+bfdefaltx,defaultBoyfriendY+bfdefalty)
		end
		if getProperty('boyfriend.animation.curAnim.name') == 'DanceRight' then
			--debugPrint('dadDanceRight')
			if bfdancemove == false then
			triggerEvent('Camera Follow Pos',defaultBoyfriendX+bfdefaltx,defaultBoyfriendY+bfdefalty)
			else
				if bfdancereversal == false then
				triggerEvent('Camera Follow Pos',defaultBoyfriendX+bfdancespe+bfdefaltx,defaultBoyfriendY+bfdefalty)
				else
				triggerEvent('Camera Follow Pos',defaultBoyfriendX-bfdancespe+bfdefaltx,defaultBoyfriendY+bfdefalty)
				end
			end
		end
		if getProperty('boyfriend.animation.curAnim.name') == 'DanceLeft' then
			--debugPrint('dadDanceLeft')
			if bfdancemove == false then
			triggerEvent('Camera Follow Pos',defaultBoyfriendX+bfdefaltx,defaultBoyfriendY+bfdefalty)
			else
				if bfdancereversal == false then
				triggerEvent('Camera Follow Pos',defaultBoyfriendX-bfdancespe+bfdefaltx,defaultBoyfriendY+bfdefalty)
				else
				triggerEvent('Camera Follow Pos',defaultBoyfriendX+bfdancespe+bfdefaltx,defaultBoyfriendY+bfdefalty)
				end
			end
		end
		if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT-alt' then
			--debugPrint('BFsingLEFT')
			if bfxreversal == false then
			triggerEvent('Camera Follow Pos',defaultBoyfriendX-bfmove+bfdefaltx,defaultBoyfriendY+bfdefalty)
			else
			triggerEvent('Camera Follow Pos',defaultBoyfriendX+bfmove+bfdefaltx,defaultBoyfriendY+bfdefalty)
			end
		end
		if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN-alt' then
			--debugPrint('BFsingDOWN')
			if bfyreversal == false then
			triggerEvent('Camera Follow Pos',defaultBoyfriendX+bfdefaltx,defaultBoyfriendY+bfmove+bfdefalty)
			else
			triggerEvent('Camera Follow Pos',defaultBoyfriendX+bfdefaltx,defaultBoyfriendY-bfmove+bfdefalty)
			end
		end
		if getProperty('boyfriend.animation.curAnim.name') == 'singUP-alt' then
			--debugPrint('BFsingUP')
			if bfyreversal == false then
			triggerEvent('Camera Follow Pos',defaultBoyfriendX+bfdefaltx,defaultBoyfriendY-bfmove+bfdefalty)
			else
			triggerEvent('Camera Follow Pos',defaultBoyfriendX+bfdefaltx,defaultBoyfriendY+bfmove+bfdefalty)
			end
		end
		if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT-alt' then
			--debugPrint('BFsingRIGHT')
			if bfxreversal == false then
			triggerEvent('Camera Follow Pos',defaultBoyfriendX+bfmove+bfdefaltx,defaultBoyfriendY+bfdefalty)
			else
			triggerEvent('Camera Follow Pos',defaultBoyfriendX-bfmove+bfdefaltx,defaultBoyfriendY+bfdefalty)
			end
		end
	end

	--dad control


	if mustHitSection == false then
		if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
			--debugPrint('dadsingLEFT')
			if dadxreversal == false then
			triggerEvent('Camera Follow Pos',defaultOpponentX-dadmove+daddefaltx,defaultOpponentY+daddefalty)
			else
			triggerEvent('Camera Follow Pos',defaultOpponentX+dadmove+daddefaltx,defaultOpponentY+daddefalty)
			end
		end
		if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
			--debugPrint('dadsingDOWN')
			if dadyreversal == false then
			triggerEvent('Camera Follow Pos',defaultOpponentX+daddefaltx,defaultOpponentY+dadmove+daddefalty)
			else
			triggerEvent('Camera Follow Pos',defaultOpponentX+daddefaltx,defaultOpponentY-dadmove+daddefalty)
			end
		end
		if getProperty('dad.animation.curAnim.name') == 'singUP' then
			--debugPrint('dadsingUP')
			if dadyreversal == false then
			triggerEvent('Camera Follow Pos',defaultOpponentX+daddefaltx,defaultOpponentY-dadmove+daddefalty)
			else
			triggerEvent('Camera Follow Pos',defaultOpponentX+daddefaltx,defaultOpponentY+dadmove+daddefalty)
			end
		end
		if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
			--debugPrint('dadsingRIGHT')
			if dadxreversal == false then
			triggerEvent('Camera Follow Pos',defaultOpponentX+dadmove+daddefaltx,defaultOpponentY+daddefalty)
			else
			triggerEvent('Camera Follow Pos',defaultOpponentX-dadmove+daddefaltx,defaultOpponentY+daddefalty)
			end
		end


		if getProperty('dad.animation.curAnim.name') == 'idle' then
			--debugPrint('dadidle')
			triggerEvent('Camera Follow Pos',defaultOpponentX+daddefaltx,defaultOpponentY+daddefalty)
		end

		if getProperty('dad.animation.curAnim.name') == 'danceRight' then
			if daddancemove == false then
			triggerEvent('Camera Follow Pos',defaultOpponentX+daddefaltx,defaultOpponentY+daddefalty)
			else
				if daddancereversal == false then
				triggerEvent('Camera Follow Pos',defaultOpponentX+daddancespe+daddefaltx,defaultOpponentY+daddefalty)
				else
				triggerEvent('Camera Follow Pos',defaultOpponentX-daddancespe+daddefaltx,defaultOpponentY+daddefalty)
				end
			end
		end
		if getProperty('dad.animation.curAnim.name') == 'danceLeft' then
			if daddancemove == false then
			triggerEvent('Camera Follow Pos',defaultOpponentX+daddefaltx,defaultOpponentY+daddefalty)
			else
				if daddancereversal == false then
				triggerEvent('Camera Follow Pos',defaultOpponentX-daddancespe+daddefaltx,defaultOpponentY+daddefalty)
				else
				triggerEvent('Camera Follow Pos',defaultOpponentX+daddancespe+daddefaltx,defaultOpponentY+daddefalty)
				end
			end
		end

		if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
			--debugPrint('dadsingLEFT-alt')
			if dadxreversal == false then
			triggerEvent('Camera Follow Pos',defaultOpponentX-dadmove+daddefaltx,defaultOpponentY+daddefalty)
			else
			triggerEvent('Camera Follow Pos',defaultOpponentX+dadmove+daddefaltx,defaultOpponentY+daddefalty)
			end
		end
		if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
			--debugPrint('dadsingDOWN-alt')
			if dadyreversal == false then
			triggerEvent('Camera Follow Pos',defaultOpponentX+daddefaltx,defaultOpponentY+dadmove+daddefalty)
			else
			triggerEvent('Camera Follow Pos',defaultOpponentX+daddefaltx,defaultOpponentY-dadmove+daddefalty)
			end
		end
		if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
			--debugPrint('dadsingUP-alt')
			if dadyreversal == false then
			triggerEvent('Camera Follow Pos',defaultOpponentX+daddefaltx,defaultOpponentY-dadmove+daddefalty)
			else
			triggerEvent('Camera Follow Pos',defaultOpponentX+daddefaltx,defaultOpponentY+dadmove+daddefalty)
			end
		end
		if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
			--debugPrint('dadsingRIGHT-alt')
			if dadxreversal == false then
			triggerEvent('Camera Follow Pos',defaultOpponentX+dadmove+daddefaltx,defaultOpponentY+daddefalty)
			else
			triggerEvent('Camera Follow Pos',defaultOpponentX-dadmove+daddefaltx,defaultOpponentY+daddefalty)
			end
		end
	end

	--gf control



	if mustHitSection == false then
		if gfSection == true then
			if getProperty('gf.animation.curAnim.name') == 'singLEFT' then
				--debugPrint('GFsingLEFT')
				if dadyreversal == false then
				triggerEvent('Camera Follow Pos',defaultGirlfriendX-gfmove+gfdefaltx,defaultGirlfriendY+gfdefalty)
				else
				triggerEvent('Camera Follow Pos',defaultGirlfriendX+gfmove+gfdefaltx,defaultGirlfriendY+gfdefalty)
				end
			end
			if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
				--debugPrint('GFsingLEFT')
				if dadyreversal == false then
				triggerEvent('Camera Follow Pos',defaultGirlfriendX+gfdefaltx,defaultGirlfriendY+gfmove+gfdefalty)
				else
				triggerEvent('Camera Follow Pos',defaultGirlfriendX+gfdefaltx,defaultGirlfriendY-gfmove+gfdefalty)
				end
			end
			if getProperty('gf.animation.curAnim.name') == 'singUP' then
				--debugPrint('GFsingLEFT')
				if dadyreversal == false then
				triggerEvent('Camera Follow Pos',defaultGirlfriendX+gfdefaltx,defaultGirlfriendY-gfmove+gfdefalty)
				else
				triggerEvent('Camera Follow Pos',defaultGirlfriendX+gfdefaltx,defaultGirlfriendY+gfmove+gfdefalty)
				end
			end
			if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
				--debugPrint('GFsingLEFT')
				if dadyreversal == false then
				triggerEvent('Camera Follow Pos',defaultGirlfriendX+gfmove+gfdefaltx,defaultGirlfriendY+gfdefalty)
				else
				triggerEvent('Camera Follow Pos',defaultGirlfriendX-gfmove+gfdefaltx,defaultGirlfriendY+gfdefalty)
				end
			end

			if getProperty('gf.animation.curAnim.name') == 'idle' then
				--debugPrint('GFidle')
				triggerEvent('Camera Follow Pos',defaultGirlfriendX+gfdefaltx,defaultGirlfriendY+gfdefalty)
			end

			if getProperty('gf.animation.curAnim.name') == 'danceRight' then
				--debugPrint('GFDanceRight')
			if gfdancemove == false then
				triggerEvent('Camera Follow Pos',defaultGirlfriendX+gfdefaltx,defaultGirlfriendY+gfdefalty)
				else
					if gfdancereversal == false then
					triggerEvent('Camera Follow Pos',defaultGirlfriendX+gfdancespe+gfdefaltx,defaultGirlfriendY+gfdefalty)
					else
					triggerEvent('Camera Follow Pos',defaultGirlfriendX-gfdancespe+gfdefaltx,defaultGirlfriendY+gfdefalty)
					end
				end
			end

			if getProperty('gf.animation.curAnim.name') == 'danceLeft' then
				--debugPrint('GFDanceLeft')
			if gfdancemove == false then
				triggerEvent('Camera Follow Pos',defaultGirlfriendX+gfdefaltx,defaultGirlfriendY+gfdefalty)
				else
					if gfdancereversal == false then
					triggerEvent('Camera Follow Pos',defaultGirlfriendX-gfdancespe+gfdefaltx,defaultGirlfriendY+gfdefalty)
					else
					triggerEvent('Camera Follow Pos',defaultGirlfriendX+gfdancespe+gfdefaltx,defaultGirlfriendY+gfdefalty)
					end
				end
			end
		end
	end
end


function onEvent(n, v1, v2)
	if n == 'Change Character' then
		if v1 == 'bf' or '0' then
		runTimer('Character camera set bf', 0, 1)
		elseif v1 == 'dad' or '1' then
		runTimer('Character camera set dad', 0, 1)
		elseif v1 == 'gf' or '2' then
		runTimer('Character camera set gf', 0, 1)
		else
		runTimer('Character camera set', 0, 1)
		end
	end
end
function onCreate()
	runTimer('Character camera set Create', 0, 1)
end