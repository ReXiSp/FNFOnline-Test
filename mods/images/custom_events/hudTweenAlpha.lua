function onEvent(n,v1,v2)
    if n == 'hudTweenAlpha' then
        --doTweenAlpha('hudbye', 'camHUD', v1, v2, 'sineInOut')
        doTweenAlpha('bye1', 'healthBarBG', v1, v2, 'sineInOut')
        doTweenAlpha('bye2', 'healthBar', v1, v2, 'sineInOut')
        doTweenAlpha('bye3', 'iconP1', v1, v2, 'sineInOut')
        doTweenAlpha('bye4', 'iconP2', v1, v2, 'sineInOut')
        noteTweenAlpha('strumsbye1', 4, v1, v2, 'sineInOut')
        noteTweenAlpha('strumsbye2', 5, v1, v2, 'sineInOut')
        noteTweenAlpha('strumsbye3', 6, v1, v2, 'sineInOut')
        noteTweenAlpha('strumsbye4', 7, v1, v2, 'sineInOut')
    end
end