local loglist = {
        {tag="RankerJ",ofs={x=0,y=0}},
        {tag="RankerE",ofs={x=0,y=0}},
        {tag="Total Exhaustion J",ofs={x=0,y=0}},
        {tag="Total Exhaustion E",ofs={x=0,y=0}},
        {tag="Lost Oneself J-S",ofs={x=0,y=0}},
        {tag="Lost Oneself J-E",ofs={x=0,y=0}},
        {tag="Lost Oneself E-E",ofs={x=0,y=0}},
        {tag="SmokeTest J",ofs={x=0,y=0}},
        {tag="SmokeTest E",ofs={x=0,y=0}},
        {tag="CyanWaver J",ofs={x=0,y=0}},
        {tag="CyanWaver E",ofs={x=0,y=0}},
        {tag="Cosmos Sign J-S",ofs={x=0,y=0}},
        {tag="Cosmos Sign E-S",ofs={x=0,y=0}},
        {tag="Cosmos Sign J-E",ofs={x=0,y=0}},
        {tag="Cosmos Sign E-E",ofs={x=0,y=0}},
}
local tagname = "dialogtester";
local ofset = {x=300,y=200,width=0,height=100}
local mode = {alpha=true,alphavalue=0.5};
local curselect = 1;
local tween = {scroll="circOut",scrolltime=0.3,linear="linear"}
local dialogueflag = true;
local selectmode = false;
function onCreatePost()
	addLuaScript("Dialog-lua/Main")
end

function onStartCountdown()
    return Function_Stop;
end

function onCreate()
    setuplist(loglist)
end

function setuplist(tempa)
	for i = 1, #tempa do
        
		local tempf = tempa[i]
		local Tempdatas = curselect-i
        if curselect == i then
			makeLuaText(tagname .. tempf.tag .. 'list' .. i, tempf.tag , 0, tempf.ofs.x+ofset.x, tempf.ofs.y+ofset.y)
		else
            makeLuaText(tagname .. tempf.tag .. 'list' .. i, tempf.tag , 0, tempf.ofs.x+ofset.x+ofset.width*Tempdatas, tempf.ofs.y+ofset.y-ofset.height*Tempdatas)
			--makeLuaText(tempf.tag .. 'list' .. i, tempf.songtitle,  screenWidth, ofset.tex+math.abs(spaces.x*Tempdatas), ofset.tey-spaces.y*Tempdatas)
		end
        setTextFont(tagname .. tempf.tag .. 'list'..i, "vcr.ttf")
        setTextColor(tagname .. tempf.tag .. 'list'..i, 'ffffff')
        setTextSize(tagname .. tempf.tag .. 'list'..i, 40)
        setObjectCamera(tagname .. tempf.tag .. 'list' .. i, 'camHUD')
	    addLuaText(tagname .. tempf.tag .. 'list' .. i)
        setProperty(tagname .. tempf.tag .. 'list'..i..'.antialiasing', true)
        --setProperty(tempf.tag .. 'list' .. i .. '.alpha', 1)
		if mode.alpha then
			if curselect == i then
				setProperty(tagname .. tempf.tag.."list"..i..'.alpha', 1)
			else
				setProperty(tagname .. tempf.tag.."list"..i..'.alpha', mode.alphavalue)
			end
		end
	end
end

function movelist(tempa)
	for i = 1, #tempa do
		local tempf = tempa[i]
		local Tempdatas = curselect-i
		--debugPrint(i)
		if curselect == i then
			doTweenX(tempf.tag.."listtx"..i, tagname .. tempf.tag .. 'list' .. i, tempf.ofs.x+ofset.x, tween.scrolltime, tween.scroll)
            doTweenY(tempf.tag.."listty"..i, tagname .. tempf.tag .. 'list' .. i, tempf.ofs.y+ofset.y, tween.scrolltime, tween.scroll)
		else
			doTweenX(tempf.tag.."listtx"..i, tagname .. tempf.tag .. 'list' .. i, tempf.ofs.x+ofset.x+ofset.width*Tempdatas, tween.scrolltime, tween.scroll)
            doTweenY(tempf.tag.."listty"..i, tagname .. tempf.tag .. 'list' .. i, tempf.ofs.y+ofset.y-ofset.height*Tempdatas, tween.scrolltime, tween.scroll)
		end
		if mode.alpha then
			if curselect == i then
				doTweenAlpha(tempf.tag.."listta"..i, tagname .. tempf.tag .. 'list' .. i, 1, tween.scrolltime/2, tween.scroll)
			else
				doTweenAlpha(tempf.tag.."listta"..i, tagname .. tempf.tag .. 'list' .. i, mode.alphavalue, tween.scrolltime/2, tween.scroll)
			end
		end
	end
end

function onUpdate()
    --debugPrint(getPropertyFromClass('flixel.FlxG', 'sound.music.time'))
    if dialogueflag then
        if keyJustPressed('up') then
            curselect = curselect-1;
            selectmode = true

        end
        if keyJustPressed('down') then
            curselect = curselect+1;
           selectmode = true
        end
        if keyJustPressed('back') then
        end
        if selectmode == true then
            if curselect > #loglist then
                curselect = 1
            end
    
            if curselect < 1 then
                curselect = #loglist
            end
    
            --debugPrint('select' .. SelectTarget)
            --debugPrint("lol"..curselect)
            movelist(loglist)
            selectmode = false
        end
        if keyJustPressed('accept') then
            runTimer('startDialogue', 0.8);
            dialogueflag = false;
		end
    end
end

function onEvent(n, v1, v2)
	if n == "skipJPDialogue" then
        debugPrint('Dialogue error')
		runTimer('completed dialogue', 0.8);
        dialogueflag = true;
	end
	if n == "EndJPDialogue" then
		--debugPrint(v1)
        debugPrint(v1..' Completed')
        runTimer('completed dialogue', 0.8);
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == "completed dialogue" then
        dialogueflag = true;
    end
    if tag == 'startDialogue' then 
        triggerEvent('StartJPDialogue',loglist[curselect].tag)
    end
end