function onCreate()
    if songName == 'chaotic-animals' then
        addLuaScript('data/Lua/3rdstrumline')
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

function onUpdate()
    if curStep >= 768 and curStep < 832 then
        if getProperty('gf.animation.curAnim.name') == 'singLEFT' then
            --debugPrint('GFsingLEFT')
            if gfyreversal == false then
            triggerEvent('Camera Follow Pos',defaultGirlfriendX-gfmove+gfdefaltx,defaultGirlfriendY+gfdefalty)
            else
            triggerEvent('Camera Follow Pos',defaultGirlfriendX+gfmove+gfdefaltx,defaultGirlfriendY+gfdefalty)
            end
        end
        if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
            --debugPrint('GFsingLEFT')
            if gfyreversal == false then
            triggerEvent('Camera Follow Pos',defaultGirlfriendX+gfdefaltx,defaultGirlfriendY+gfmove+gfdefalty)
            else
            triggerEvent('Camera Follow Pos',defaultGirlfriendX+gfdefaltx,defaultGirlfriendY-gfmove+gfdefalty)
            end
        end
        if getProperty('gf.animation.curAnim.name') == 'singUP' then
            --debugPrint('GFsingLEFT')
            if gfyreversal == false then
            triggerEvent('Camera Follow Pos',defaultGirlfriendX+gfdefaltx,defaultGirlfriendY-gfmove+gfdefalty)
            else
            triggerEvent('Camera Follow Pos',defaultGirlfriendX+gfdefaltx,defaultGirlfriendY+gfmove+gfdefalty)
            end
        end
        if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
            --debugPrint('GFsingLEFT')
            if gfyreversal == false then
            triggerEvent('Camera Follow Pos',defaultGirlfriendX+gfmove+gfdefaltx,defaultGirlfriendY+gfdefalty)
            else
            triggerEvent('Camera Follow Pos',defaultGirlfriendX-gfmove+gfdefaltx,defaultGirlfriendY+gfdefalty)
            end
        end

        if getProperty('gf.animation.curAnim.name') == 'idle' then
            --debugPrint('GFidle')
            triggerEvent('Camera Follow Pos',defaultGirlfriendX+gfdefaltx,defaultGirlfriendY+gfdefalty)
        end
    end
    if curStep >= 1088 and curStep < 1120 then
        if getProperty('gf.animation.curAnim.name') == 'singLEFT' then
            --debugPrint('GFsingLEFT')
            if gfyreversal == false then
            triggerEvent('Camera Follow Pos',defaultGirlfriendX-gfmove+gfdefaltx,defaultGirlfriendY+gfdefalty)
            else
            triggerEvent('Camera Follow Pos',defaultGirlfriendX+gfmove+gfdefaltx,defaultGirlfriendY+gfdefalty)
            end
        end
        if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
            --debugPrint('GFsingLEFT')
            if gfyreversal == false then
            triggerEvent('Camera Follow Pos',defaultGirlfriendX+gfdefaltx,defaultGirlfriendY+gfmove+gfdefalty)
            else
            triggerEvent('Camera Follow Pos',defaultGirlfriendX+gfdefaltx,defaultGirlfriendY-gfmove+gfdefalty)
            end
        end
        if getProperty('gf.animation.curAnim.name') == 'singUP' then
            --debugPrint('GFsingLEFT')
            if gfyreversal == false then
            triggerEvent('Camera Follow Pos',defaultGirlfriendX+gfdefaltx,defaultGirlfriendY-gfmove+gfdefalty)
            else
            triggerEvent('Camera Follow Pos',defaultGirlfriendX+gfdefaltx,defaultGirlfriendY+gfmove+gfdefalty)
            end
        end
        if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
            --debugPrint('GFsingLEFT')
            if gfyreversal == false then
            triggerEvent('Camera Follow Pos',defaultGirlfriendX+gfmove+gfdefaltx,defaultGirlfriendY+gfdefalty)
            else
            triggerEvent('Camera Follow Pos',defaultGirlfriendX-gfmove+gfdefaltx,defaultGirlfriendY+gfdefalty)
            end
        end

        if getProperty('gf.animation.curAnim.name') == 'idle' then
            --debugPrint('GFidle')
            triggerEvent('Camera Follow Pos',defaultGirlfriendX+gfdefaltx,defaultGirlfriendY+gfdefalty)
        end
    end

    if curStep >= 1276 and curStep < 1284 then
        triggerEvent('Camera Follow Pos',defaultGirlfriendX+gfdefaltx,defaultGirlfriendY+gfdefalty)
    end
end