--[[
    Usage and Description

local DialogueDataLists = {
    {tagName="tag name for external input",fileName="tag name for internal use",skipmode="skip mode on/off" }

    sample
    {tagName="Senpai English",fileName="SNPE",skipmode=true}
}
Put the name of the tag to be executed in the event in tagName.
In fileName, enter the tag to be used in this lua.
If skipmode is turned on, the system will run for skipping.

--Sample lua file to be included in the song file

local allowCountdown = false
local Dialogmode = "EN";
local Dialoguelist = {"EN", "JP"};
function onCreatePost()
	Dialogmode = getPropertyFromClass('ClientPrefs', 'DialogueLanguage')
	nonedia = true;
	for i = 1 , #Dialoguelist do
		if Dialogmode == Dialoguelist[i] then
			nonedia = false;
		end
	end
	if nonedia then
		Dialogmode = "EN"
	end end
	addLuaScript("Dialog-lua/Main")
end
function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then
    setProperty('inCutscene', true);
    runTimer('startDialogue', 0.8);
    allowCountdown = true;
    return Function_Stop;
end
return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'startDialogue' then -- Timer completed, play dialogue
		if Dialogmode == "JP" then
			triggerEvent('StartDialogue','Senpai Japanese')
		else
			triggerEvent('StartDialogue', 'Senpai English');
		end
	end
end

function onEvent(n, v1, v2)
	if n == "skipDialogue" then
		debugPrint('error!')
		allowCountdown = true
        startCountdown()
	end(n == "endDialogue" then debugPrint('error!'))
	if n == "EndDialogue" then
		--debugPrint(v1)
		if v1 == "Senpai Japanese" or v1 == "Senpai English" then
			allowCountdown = true
        	startCountdown()
		end
	end
end

-----------------------

The order of execution is
DialogueStartDatas > DialogueDatas > DialogueEndDatas.
local DialogueStartDatas = {
    ["SNPE"] = {
            {tag to be executed},
            {tag to be executed},
            {tag to be executed},
            {tag to be executed},
    },
    ["Sample"] = {
        {tag="addSpriteAnimation",stag='Speech',graphic="speech_bubble",x=50,y=360,cent=true},
        {tag="addAnimation",stag="Speech",name="normal",pref="speech bubble normal",frame=24,loop=true},
        {tag="addAnimation",stag="Speech",name="middle",pref="speech bubble middle",frame=24,loop=true},
        {tag="addAnimation",stag="Speech",name="ahh",pref="AHH speech bubble",frame=24,loop=true},
        {tag="addAnimation",stag="Speech",name="ahh-middle",pref="AHH Speech Bubble middle",frame=24,loop=true},
        {tag="PlayAnimation",stag="Speech",name="normal"},
        {tag="setProperty",stag="Speech.flipX",value=true},
        {tag="MakeText",stag="dialogueText",width=0,x=150,y=500,font="vcr.ttf",size=40},
    }
}
local DialogueDatas = {
    ["SNPE"] = {
        {
            {tag to be executed},
            {tag to be executed},
            {tag to be executed},
            {tag to be executed},
        },
        {
            {tag to be executed},
            {tag to be executed},
            {tag to be executed},
            {tag to be executed},
        },
        {
            {tag to be executed},
            {tag to be executed},
            {tag to be executed},
        },
    },
    ["Sample"] = {
        {
            {tag="TextString",stag="dialogueText",Text="Speak Test 1",interval=0.05,textinterval=1},
        },
        {
            {tag="TextString",stag="dialogueText",Text="Speak Test 2",interval=0.05,textinterval=1},
        },
        {
            {tag="TextString",stag="dialogueText",Text="Speak Test 3",interval=0.05,textinterval=1},
        },
    },
}

local DialogueEndDatas = {
    ["SNPE"] = {
        {tag to be executed},
        {tag to be executed},
        {tag to be executed},
    },
    ["Sample"] = {
        {tag="RemoveSprite",stag="Speech"}
        {tag="RemoveText",stag='dialogueSkipText'},
    },
}

local DialogueSkipDatas = {
    ["SNPE"] = {
        {tag to be executed},
        {tag to be executed},
        {tag to be executed},
    },
    ["Sample"] = {
        {debugPrint="Dialogue Skipped"},
    },
}
--This SkipDatas works when skipped-- --TagList


--Tag List ----------------------------------------

{tag="MakeText",stag="name of tag you want to create",width=width of text,x=position,y=position,font="font file",size=size}
MakeText Creates a text tag.

{tag="TextTrace",stag="what you want to change",target="target to read text" }
This can be used to make TextTrace vsImpostorv4 work like a dialog, putting what you want to change in the stag and reading the text from the target.

{tag="TextString",stag="what you want to change",Text="text",interval=interval,textinterval=text interval,sound="sound file",animtag="tag to animate",animpose="pose name "}
TextString Basic dialog system. With this, characters are output one at a time.
        stag Enter the tag you want to change.
        Text Enter the text you want to output.
    --This is optional, so it will work without it.
        interval The speed of the text (default is 0.04).
        textinterval Interval at which the text is read (default is 3). 3 is recommended when using Japanese, but 1 is recommended when using only half-width characters)
        sound Sound for the speech.
        animtag Moves the character when speaking.
        Use it at the same time as animtag on animpose, and change it based on the animation added by addAnimation.
    --end-- {tag="Text

{tag="TextStringNormal",stag="what you want to change",Text="text"}
TextStringNormal Change the text character.
        stag Enter the tag you want to change
        Text Enter the text you want to output

{tag="RemoveText",stag="name of tag you want to remove"}
RemoveText Remove text.

{tag="addSprite",stag="name of tag you want to create",graphic="image file you want to use",cent=whether it should be at the top or not,alpha=transparency}
addSprite Add a sprite.


{tag="RemoveSprite",stag="name of tag to be removed"}
RemoveSprite Remove a sprite.

{tag="addSpriteAnimation",stag="name of tag you want to create",graphic="sprite file you want to use",x=position,y=position,cent=whether to start or not}
addSpriteAnimation Creates a sprite that can be animated.


{tag="addAnimation",stag="what you want to change",name="Pose name to set",pref="Pose name in xml",frame=frame,loop=loop}
        stag Insert the tag you want to change
        name Pose name
        pref Change based on the pose name existing in xml
        frame Speed of the animation
        loop Whether to loop the animation or not

{tag="PlayAnimation",stag="What you want to change",name="Pose name to set"}
PlayAnimation Executes the animation.
        stag Insert the tag you want to change
        name Pose name

{tag="setProperty",stag="what you want to change",value=value to be changed}
setProperty Use like a normal setProperty.

{tag="SetCamera",stag="What you want to change",cam="Camera position to change"}
SetCamera Change the camera.

{tag="Autotimer",timer=time},
Autotimer The operation will be disabled while this is running. The dialog will advance automatically when the set amount of time has elapsed.

{tag="Tween",mode="Type to execute",stag="What you want to change",value=Value to tween, duration=Speed to change, Tween="Tween type"},
Performs a tween tween.
        X Y Angle Alpha Zoom Color can be used for mode.

{tag="TextSet",stag="What to change",mode="Mode to change",value="Value to change",value2 "Second value to change"},
TextSet Changes the appearance of text.
        For mode, font color size alignment border can be used.
        Only border uses value2.

{tag="SelectMusic",song="Song to play",volume=Song volume}
SelectMusic Play the song.

{tag="SoundFade",stag="what you want to change,fade="fade mode",duration="speed to change",fromValue=value before change,toValue=value after change}
SoundFade Changes the volume of the audio.
        fade In Out is available.
        fromValue The value before the change, used for In only. toValue The value after the change, used for Out only.
        Value after the change.

{tag="playSound",sound="Sound to play",volume=Volume of sound}
playSound Play audio.

--options--
{debugPrint="data to be output"}
DebugPrint can be added to output text.

--日本語説明書--

    使い方と説明

local DialogueDataLists = {
    {tagName="外部から入力するタグ名",fileName="内部で使用するタグ名",skipmode=スキップモードのオンオフ}

    sample
    {tagName="Senpai English",fileName="SNPE",skipmode=true}
}
tagNameにイベントで実行するタグ名を入れます。
fileNameにはこのlua内で使用するタグを入力します。
skipmodeをオンにするとスキップ用のシステムが実行されます。

--曲ファイルに入れるluaファイルサンプル--

local allowCountdown = false
local Dialogmode = "EN";
local Dialoguelist = {"EN","JP"};
function onCreatePost()
	Dialogmode = getPropertyFromClass('ClientPrefs', 'DialogueLanguage')
	nonedia = true;
	for i = 1 , #Dialoguelist do
		if Dialogmode == Dialoguelist[i] then
			nonedia = false;
		end
	end
	if nonedia then
		Dialogmode = "EN"
	end
	addLuaScript("Dialog-lua/Main")
end
function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then
    setProperty('inCutscene', true);
    runTimer('startDialogue', 0.8);
    allowCountdown = true;
    return Function_Stop;
end
return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'startDialogue' then -- Timer completed, play dialogue
		if Dialogmode == "JP" then
			triggerEvent('StartDialogue','Senpai Japanese')
		else
			triggerEvent('StartDialogue', 'Senpai English');
		end
	end
end

function onEvent(n, v1, v2)
	if n == "skipDialogue" then
		debugPrint('error!')
		allowCountdown = true
        startCountdown()
	end
	if n == "EndDialogue" then
		--debugPrint(v1)
		if v1 == "Senpai Japanese" or v1 == "Senpai English" then
			allowCountdown = true
        	startCountdown()
		end
	end
end

-----------------------

実行する順番は
DialogueStartDatas > DialogueDatas > DialogueEndDatas になります。
local DialogueStartDatas = {
    ["SNPE"] = {
            {実行したいタグ},
            {実行したいタグ},
            {実行したいタグ},
            {実行したいタグ},
    },
    ["Sample"] = {
        {tag="addSpriteAnimation",stag='Speech',graphic="speech_bubble",x=50,y=360,cent=true},
        {tag="addAnimation",stag="Speech",name="normal",pref="speech bubble normal",frame=24,loop=true},
        {tag="addAnimation",stag="Speech",name="middle",pref="speech bubble middle",frame=24,loop=true},
        {tag="addAnimation",stag="Speech",name="ahh",pref="AHH speech bubble",frame=24,loop=true},
        {tag="addAnimation",stag="Speech",name="ahh-middle",pref="AHH Speech Bubble middle",frame=24,loop=true},
        {tag="PlayAnimation",stag="Speech",name="normal"},
        {tag="setProperty",stag="Speech.flipX",value=true},
        {tag="MakeText",stag="dialogueText",width=0,x=150,y=500,font="vcr.ttf",size=40},
    }
}
local DialogueDatas = {
    ["SNPE"] = {
        {
            {実行したいタグ},
            {実行したいタグ},
            {実行したいタグ},
            {実行したいタグ},
        },
        {
            {実行したいタグ},
            {実行したいタグ},
            {実行したいタグ},
            {実行したいタグ},
        },
        {
            {実行したいタグ},
            {実行したいタグ},
            {実行したいタグ},
        },
    },
    ["Sample"] = {
        {
            {tag="TextString",stag="dialogueText",Text="Speak Test 1",interval=0.05,textinterval=1},
        },
        {
            {tag="TextString",stag="dialogueText",Text="Speak Test 2",interval=0.05,textinterval=1},
        },
        {
            {tag="TextString",stag="dialogueText",Text="Speak Test 3",interval=0.05,textinterval=1},
        },
    },
}

local DialogueEndDatas = {
    ["SNPE"] = {
        {実行したいタグ},
        {実行したいタグ},
        {実行したいタグ},
    },
    ["Sample"] = {
        {tag="RemoveSprite",stag="Speech"}
        {tag="RemoveText",stag='dialogueSkipText'},
    },
}

local DialogueSkipDatas = {
    ["SNPE"] = {
        {実行したいタグ},
        {実行したいタグ},
        {実行したいタグ},
    },
    ["Sample"] = {
        {debugPrint="Dialogue Skipped"},
    },
}
--このSkipDatasはスキップをしたときに動作します--


--タグ一覧----------------------------------------

{tag="MakeText",stag="作りたいタグ名",width=テキストの幅,x=位置,y=位置,font="フォントファイル",size=大きさ}
MakeText    テキストタグを作成します。

{tag="TextTrace",stag="変更したいもの",target="テキストを読み取るターゲット"}
TextTrace vsImpostorv4のダイアログ風に動かしたいときに使える。stagに変更したいものを入れ、targetからテキストを読みとります。

{tag="TextString",stag="変更したいもの",Text="テキスト",interval=間隔,textinterval=テキスト間隔,sound="音声ファイル",animtag="アニメーションさせたいタグ",animpose="ポーズ名"}
TextString 基本的なダイアログのシステム。　これを使うと文字がひとつづつ出力されます。
        stag        変更したいタグを入れる
        Text        出力したいテキストを入力する
    --ここからはオプションなので付けなくても動作します--
        interval    文字の速さ(デフォルトは0.04)
        textinterval    テキスト意を読み取る間隔(デフォルトは3 日本語を使う場合は3がおススメですが、半角のみの場合は1がおススメ)
        sound       喋る際の音声
        animtag     喋る際にキャラクターを動かします。
        animpose    上のanimtagと同時に使います。addAnimationで追加したアニメーションを元に変更しましょう。
    --end--

{tag="TextStringNormal",stag="変更したいもの",Text="テキスト"}
TextStringNormal    テキストの文字を変更します。
        stag        変更したいタグを入れる
        Text        出力したいテキストを入力する

{tag="RemoveText",stag="削除したいタグ名"}
RemoveText  テキストを削除します。

{tag="addSprite",stag="作りたいタグ名",graphic="使いたい画像ファイル",cent=先頭にするかどうか,alpha=透明度}
addSprite   スプライトを追加します。

{tag="RemoveSprite",stag="削除したいタグ名"}
RemoveSprite  スプライトを削除します。


{tag="addSpriteAnimation",stag="作りたいタグ名",graphic="使いたいスプライトファイル",x=位置,y=位置,cent=先頭にするかどうか}
addSpriteAnimation  アニメーション可能なスプライトを作成します。


{tag="addAnimation",stag="変更したいもの",name="設定するポーズ名",pref="xml内のポーズ名",frame=フレーム,loop=ループ}
        stag        変更したいタグを入れる
        name        ポーズ名
        pref        xml内に存在するポーズ名をもとに変更します
        frame       アニメーションの速度
        loop        アニメーションをループするかどうか

{tag="PlayAnimation",stag="変更したいもの",name="設定するポーズ名"}
PlayAnimation   アニメーションを実行します。
        stag        変更したいタグを入れる
        name        ポーズ名

{tag="setProperty",stag="変更したいもの",value=変更する値}
setProperty 通常のsetPropertyのように使用します。

{tag="SetCamera",stag="変更したいもの",cam="変更するカメラ位置"}
SetCamera   カメラを変更します。

{tag="Autotimer",timer=時間},
Autotimer   これが実行されてる間は操作ができなくなります。設定した時間が経過したときに自動でダイアログが進みます。

{tag="Tween",mode="実行したい種類",stag="変更したいもの",value=Tweenする値,duration=変更する速度,Tween="Tweenタイプ"},
Tween   Tweenを実行します。
        modeには X Y Angle Alpha Zoom Color が使用できます。

{tag="TextSet",stag="変更したいもの",mode="変更するモード",value="変更する値",value2"変更する値2つ目"},
TextSet テキストの見た目を変更します。
        modeには font color size alignment border が使用できます。
        borderのみ、value2を使用します。

{tag="SelectMusic",song="再生したい曲",volume=曲の音量}
SelectMusic 曲を再生します。

{tag="SoundFade",stag=変更したいもの,fade="フェードのモード",duration=変更する速度,fromValue=変更前の値,toValue=変更後の値}
SoundFade   音声の大きさを変更します。
        fade        In Out が利用できます。
        fromValue   変更前の値。Inのみで使用します。
        toValue     変更後の値。

{tag="playSound",sound="再生したい音声",volume=音声の音量}
playSound   音声を再生します。

--オプション--
{debugPrint="出力したいデータ"}
debugPrintをつけるとテキストを出力することができます。
]]

local DialogueShortCuts = {
    ["MyBook"] = {
        {
            {tag="addSpriteAnimation",stag='aoken-dialogue',graphic="dialogue/aoken_pony_dialogue",x=-700,y=100,cent=false},
            {tag="addAnimation",stag="aoken-dialogue",name="asetalk",pref="asetalk",frame=24,loop=false},
            {tag="addAnimation",stag="aoken-dialogue",name="talk",pref="talk",frame=24,loop=false},
            {tag="setProperty",stag="aoken-dialogue.scale.x",value=0.8},
            {tag="setProperty",stag="aoken-dialogue.scale.y",value=0.8},

            {tag="addSpriteAnimation",stag='asago-dialogue',graphic="dialogue/asago_pony_dialogue",x=1280,y=100,cent=false},
            {tag="addAnimation",stag="asago-dialogue",name="talk",pref="talk",frame=24,loop=false},
            {tag="setProperty",stag="asago-dialogue.scale.x",value=0.8},
            {tag="setProperty",stag="asago-dialogue.scale.y",value=0.8},

            {tag="addSpriteAnimation",stag='cross-dialogue',graphic="dialogue/cross_pony_dialogue",x=300,y=720,cent=false},
            {tag="addAnimation",stag="cross-dialogue",name="talk",pref="talk",frame=24,loop=false},
            {tag="setProperty",stag="cross-dialogue.scale.x",value=0.8},
            {tag="setProperty",stag="cross-dialogue.scale.y",value=0.8},

            --{tag="MakeText",stag="dialogueText",width=0,x=150,y=500,font="misaki_gothic.ttf",size=40},
            {tag="MakeText",stag="dialogueText",width=0,x=150,y=500,font="minecraftia.ttf",size=40},
            {tag="TextSet",stag="dialogueText",mode="color",value="FFFFFF"},
            {tag="TextSet",stag="dialogueText",mode="border",value=3,value2="000000"},

        },
        {
            --{tag="Tween",mode="Alpha",stag="camGame",value=0.4,duration=0.2,Tween="linear"},
            {tag="Tween",mode="Alpha",stag="screenBlack",value=0.4,duration=0.5,Tween="linear"},

            {tag="Tween",mode="X",stag="aoken-dialogue",value=-100,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="Alpha",stag="dialogueBB",value=0.7,duration=0.5,Tween="circOut"},
            {tag="TextSet",stag="dialogueText",mode="color",value="4745FF"},
            {tag="TextString",stag="dialogueText",Text="HEY GIVE ME BACK MY BOOK!!!!",interval=0.05,sound="aoken",textinterval=1,animtag="aoken-dialogue",animpose="asetalk"},
            --{tag="TextString",stag="dialogueText",Text="おい早く返せよ本！！！",interval=0.05,sound="aoken"},
        },
        {
            {tag="Tween",mode="X",stag="aoken-dialogue",value=-700,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="asago-dialogue",value=700,duration=0.5,Tween="circOut"},
            {tag="TextSet",stag="dialogueText",mode="color",value="F6D75F"},
            {tag="TextString",stag="dialogueText",Text="no",interval=0.05,sound="asrghn",textinterval=1,animtag="asago-dialogue",animpose="talk"},
        },
        {
            {tag="Tween",mode="X",stag="asago-dialogue",value=1280,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="Y",stag="cross-dialogue",value=100,duration=0.5,Tween="circOut"},
            {tag="TextSet",stag="dialogueText",mode="color",value="855BA2"},
            {tag="TextString",stag="dialogueText",Text="what are you guys doing lol",interval=0.05,sound="cross",textinterval=1,animtag="cross-dialogue",animpose="talk"},
        },
        {
            {tag="Tween",mode="Alpha",stag="dialogueBB",value=0,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="Y",stag="cross-dialogue",value=520,duration=0.5,Tween="circOut"},

            --{tag="Tween",mode="Alpha",stag="camGame",value=1,duration=0.2,Tween="linear"},
            {tag="Tween",mode="Alpha",stag="screenBlack",value=0,duration=0.5,Tween="linear"},

            {tag="Tween",mode="Alpha",stag="dialogueText",value=0,duration=0.5,Tween="linear"},
        },
    },
}

local DialogueStartDatas = {}

local DialogueDatas = {}

local DialogueEndDatas = {}

local DialogueSkipDatas = {
    ["Sample"] = {
        {debugPrint="Dialogue Skipped"},
    },
};

local DialogueDataLists = {
    {tagName = "Sample Data",fileName="Sample",skipmode=true},
}

--UI Settings-----------------------------------------

local DialogueSkipSys = {
        {tag="MakeText",stag="dialogueSkipText",width=0,x=0,y=695,font="vcr.ttf",size=20},
        {tag="TextSet",stag="dialogueSkipText",mode="color",value="FFFFFF"},
        {tag="TextSet",stag="dialogueSkipText",mode="border",value=2,value2="000000"},
        {tag="TextStringNormal",stag="dialogueSkipText",Text="Press ESC to skip the dialogue."},
        {tag="SetCamera",stag="dialogueSkipText",cam="camOther"},
}

local DialogueSkipENDSys = {
    {tag="RemoveText",stag='dialogueSkipText'},
}

--END-------------------------------------------------


local tempDname = '';
local setDSname = 'error';
local tempDD = {};
local tempDSD = {};
local tempDED = {};
local acceptmode = false;
local DialogueMode = false;
local skipmode = true;
local tempselect = 1;
local dialogueTexttemp = {};
local dialogueSoundmode = false;
local dialogueSoundtemp = "dialogue";
local dialogueintervaltemp = 0.04;
local dialogueAnimmode = false;
local dialogueAnimname = "";
local dialogueAnimpose = "";
local dialoguetextinterval = 3;
local dialoguetextintervaldef = 3;
local DialogueTimer = {mode=false,func=nil,timerCompleted=false};
local dialoguelettermode = true;
local notextsound = {" ","!",[[\]],".",",","?","　","、","。","！","？","\n "," \n","…"}
local mobilemode = false;
local mobiletouch = false;

function onCreate()
    if buildTarget == 'android' then
        mobilemode = true;
    else
        mobilemode = false;
    end
    --debugPrint("hey")
    makeGraphic('screenBlack', 2000, 1000, '000000')
end

function onEvent(n, v1, v2)
    --debugPrint(n..v1)
    --debugPrint(#DialogueDataLists)
    if n == 'StartJPDialogue' then
        tempDname = v1;
        --debugPrint(v1)
        for i = 1, #DialogueDataLists do
            --debugPrint(i)
            if tempDname == DialogueDataLists[i].tagName then
                setDSname = DialogueDataLists[i].fileName;
                --debugPrint('Yeah | ' .. setDSname)
                dialogueSoundmode = true;
                tempDD = DialogueDatas[setDSname];
                tempDSD = DialogueStartDatas[setDSname];
                tempDED = DialogueEndDatas[setDSname];
                tempDSED = DialogueSkipDatas[setDSname];
                skipmode = DialogueDataLists[i].skipmode;
                if skipmode then
                    StartSKD()
                end
                StartJPD(setDSname)
                acceptmode = true;
                if not DialogueTimer.mode then
                    DialogueJPD(tempselect)
                end
                --DialogueMode = true;
            end
        end
        if not acceptmode then
            triggerEvent("skipJPDialogue")
        end
    elseif n == 'ShortCutDialogue' then
        dialogueSoundmode = true
        ShortCutD(v1,v2)
    end
end

function ShortCutD(val1,val2)
    --debugPrint("testing")
    for i = 1, #DialogueShortCuts[val1][val2+1] do
        triggerDialogueProg(DialogueShortCuts[val1][val2+1][i],"short")
    end
end

function StartSKD()
    for i = 1, #DialogueSkipSys do
        triggerDialogueProg(DialogueSkipSys[i],"start")
    end
end

function EndSKD()
    for i = 1, #DialogueSkipENDSys do
        triggerDialogueProg(DialogueSkipENDSys[i],"skipendg")
    end
end

function DialogueJPD(tempi)
    for i = 1, #tempDD[tempi] do
        triggerDialogueProg(tempDD[tempi][i],"normal")
    end
    DialogueMode = true;
end

function SkipJPD(tempse)
    if tempDSED == nil then
        --debugPrint('nildata')
    else
        for i = 1, #tempDSED do
            triggerDialogueProg(tempDSED[i],"skipend")
        end
    end
end

function onUpdatePost()
    --debugPrint(buildTarget)
    --debugPrint(DialogueTimer.mode)
    if mobilemode then
        if mouseClicked("left") then
            mobiletouch = true;
        else
            mobiletouch = false;
        end
    else
        mobiletouch = false;
    end
    if DialogueMode then
        if keyJustPressed('accept') or mobiletouch or DialogueTimer.timerCompleted then
            if DialogueTimer.mode then
                if DialogueTimer.timerCompleted then
                    DialogueTimer.mode = false;
                    DialogueTimer.timerCompleted = false;
                    tempselect = tempselect+1;
                    --playSound('dialogueClose', 1);
                    if tempselect > #tempDD then
                        EndJPD(setDSname)
                    else
                        DialogueJPD(tempselect)
                    end
                end
            else
                if keyJustPressed('accept') or mobiletouch then
                    if dialoguelettermode then
                        cancelTimer('add dialogue letter')
                        playSound('dialogueClose', 1);
                        setTextString(dialogueTexttemp.tag, dialogueTexttemp.text..'\n');
                        dialoguelettermode = false;
                    else
                        DialogueTimer.mode = false;
                        DialogueTimer.timerCompleted = false;
                        tempselect = tempselect+1;
                        playSound('dialogueClose', 1);
                        if tempselect > #tempDD then
                            EndJPD(setDSname)
                        else
                            DialogueJPD(tempselect)
                        end
                    end
                end
            end
        elseif(getPropertyFromClass("flixel.FlxG","keys.justPressed.ESCAPE")) then
            if skipmode then
                --debugPrint("Escape")
                SkipJPD(setDSname)
                EndJPD(setDSname)
            else
                --debugPrint("Skip Mode is False.")
            end
        end
    end
end



function EndJPD(tempse)
    if skipmode then
        EndSKD()
    end
    dialogueSoundmode = false
    setProperty('healthBarBG.visible', true)
    setProperty('healthBar.visible', true)
    setProperty('iconP1.visible', true)
    setProperty('iconP2.visible', true)
    setProperty('iconP1.alpha', 1)
    setProperty('iconP2.alpha', 1)
    setProperty('scoreTxt.visible', true)
    for i = 1, #tempDED do
        triggerDialogueProg(tempDED[i],"end")
    end
    if not DialogueTimer.mode then
        triggerEvent("EndJPDialogue",tempDname)
        local tempDD = {};
        local tempDSD = {};
        local tempDED = {};
        local tempDname = '';
        tempselect = 1;
        DialogueMode = false;
    end
end

function StartJPD(gtag)
    --debugPrint(gtag)
    setProperty('healthBarBG.visible', false)
    setProperty('healthBar.visible', false)
    setProperty('iconP1.visible', false)
    setProperty('iconP2.visible', false)
    setProperty('iconP1.alpha', 0)
    setProperty('iconP2.alpha', 0)
    setProperty('scoreTxt.visible', false)
    --debugPrint(#tempDSD)
    for i = 1, #tempDSD do
        triggerDialogueProg(tempDSD[i],"start")
    end
end



function triggerDialogueProg(temptag,modeName)
    if temptag.tag == "SelectMusic" then
        playMusic(temptag.song, temptag.volume, true)
    end
    if temptag.tag == "addSprite" then
        makeLuaSprite(temptag.stag, temptag.graphic, temptag.x, temptag.y);
        addLuaSprite(temptag.stag, temptag.cent)
        setObjectCamera(temptag.stag, 'camHUD')
        setProperty(temptag.stag..'.alpha',temptag.alpha)
    end
    if temptag.tag == "RemoveSprite" then
        removeLuaSprite(temptag.stag, true)
    end
    if temptag.tag == "RemoveText" then
        removeLuaText(temptag.stag, true)
    end
    if temptag.tag == "MakeText" then
        makeLuaText(temptag.stag, '', temptag.width, temptag.x, temptag.y)
        setTextFont(temptag.stag, temptag.font)
        setTextColor(temptag.stag, '000000')
        setTextSize(temptag.stag, temptag.size)
        setTextAlignment(temptag.stag, 'left')
        --setTextBorder(temptag.stag, 0.1, '000000')
        setTextBorder(temptag.stag, 0.1, '0x00000000')
        addLuaText(temptag.stag)
        setObjectCamera(temptag.stag, 'camHUD')
        setProperty(temptag.stag..'.antialiasing',true)
    end

    if temptag.tag == "TextSet" then
        if temptag.mode == "font" then
            setTextFont(temptag.stag, temptag.value)
        end
        if temptag.mode == "color" then
            setTextColor(temptag.stag, temptag.value)
        end
        if temptag.mode == "size" then
            setTextSize(temptag.stag, temptag.value)
        end
        if temptag.mode == "alignment" then
            setTextAlignment(temptag.stag, temptag.value)
        end
        if temptag.mode == "border" then
            setTextBorder(temptag.stag, temptag.value, temptag.value2)
        end
    end

    if temptag.tag == "TextString" then
        setTextString(dialogueTexttemp.tag, '')
        --debugPrint(temptag.sound)
        if temptag.sound == nil then
            dialogueSoundtemp = "dialogue";
        else
            dialogueSoundtemp = temptag.sound
        end
        if temptag.interval == nil then
            dialogueintervaltemp = 0.04;
        else
            dialogueintervaltemp = temptag.interval
        end
        dialogueTexttemp = {tag=temptag.stag,text=temptag.Text};
        if temptag.textinterval ~= nil then
            dialoguetextinterval = temptag.textinterval;
        else
            dialoguetextinterval = dialoguetextintervaldef;
        end
        runTimer('add dialogue letter', dialogueintervaltemp, string.len(dialogueTexttemp.text)/dialoguetextinterval);
        dialoguelettermode = true;
        if temptag.animtag == nil then
            dialogueAnimmode = false;
            dialogueAnimname = "";
            dialogueAnimpose = "";
        else
            dialogueAnimmode = true;
            dialogueAnimname = temptag.animtag;
            dialogueAnimpose = temptag.animpose;
            objectPlayAnimation(dialogueAnimname, dialogueAnimpose,false)
        end
        --setTextString(temptag.stag,temptag.Text)
        if string.len(dialogueTexttemp.text) <= 0 then
            dialoguelettermode = false;
            setTextString(dialogueTexttemp.tag, '')
            cancelTimer('add dialogue letter')
        end
    end
    if temptag.tag == "TextStringNormal" then
        setTextString(temptag.stag, temptag.Text)
    end
    if temptag.tag == "TextTrace" then
        setProperty(temptag.stag..'.text',getProperty(temptag.target..'.text'))
    end
    if temptag.tag == "playSound" then
        playSound(temptag.sound, temptag.volume)
    end
    if temptag.tag == "SoundFade" then
        if temptag.fade == "In" then
            soundFadeIn(temptag.stag, temptag.duration, temptag.fromValue, temptag.toValue)
        elseif temptag.fade == "Out" then
            soundFadeOut(temptag.stag, temptag.duration, temptag.toValue)
        end
    end
    if temptag.tag == "addSpriteAnimation" then
        makeAnimatedLuaSprite(temptag.stag, temptag.graphic, temptag.x, temptag.y)
        addLuaSprite(temptag.stag, temptag.cent)
        setObjectCamera(temptag.stag, 'camHUD')
    end
    if temptag.tag == "addAnimation" then
        addAnimationByPrefix(temptag.stag, temptag.name, temptag.pref, temptag.frame, temptag.loop)
    end
    if temptag.tag == "PlayAnimation" then
        --objectPlayAnimation(temptag.stag, temptag.name,true)
        playAnim(temptag.stag, temptag.name, true);
    end
    if temptag.tag == "setProperty" then
        setProperty(temptag.stag,temptag.value)
    end
    if temptag.tag == "SetCamera" then
        setObjectCamera(temptag.stag, temptag.cam)
    end
    if temptag.tag == "Autotimer" then
        if modeName == "start" or modeName == "normal" or modeName == "end" then
            runTimer('dialogue skd', temptag.timer, 1);
            DialogueTimer.mode = true;
            DialogueTimer.func = modeName;
        end
    end
    if temptag.debugPrint ~= nil then
        debugPrint(temptag.debugPrint)
    end
    if temptag.tag == "Tween" then
        if temptag.mode == "X" then
            doTweenX(temptag.stag..temptag.mode, temptag.stag, temptag.value, temptag.duration, temptag.Tween)
        end
        if temptag.mode == "Y" then
            doTweenY(temptag.stag..temptag.mode, temptag.stag, temptag.value, temptag.duration, temptag.Tween)
        end
        if temptag.mode == "Angle" then
            doTweenAngle(temptag.stag..temptag.mode, temptag.stag, temptag.value, temptag.duration, temptag.Tween)
        end
        if temptag.mode == "Alpha" then
            doTweenAlpha(temptag.stag..temptag.mode, temptag.stag, temptag.value, temptag.duration, temptag.Tween)
        end
        if temptag.mode == "Zoom" then
            doTweenZoom(temptag.stag..temptag.mode, temptag.stag, temptag.value, temptag.duration, temptag.Tween)
        end
        if temptag.mode == "Color" then
            doTweenColor(temptag.stag..temptag.mode, temptag.stag, temptag.value, temptag.duration, temptag.Tween)
        end
    end
    if temptag.tag == "triggerEvent" then
        triggerEvent(temptag.name,temptag.value1,temptag.value2)
    end
end



function onTimerCompleted(tag, loops, loopsLeft)
    if tag == "dialogue skd" then
        --debugPrint("yea"..DialogueTimer.func)
        if DialogueTimer.func == "start" then
            DialogueTimer.mode = false;
            DialogueTimer.timerCompleted = false;

            DialogueJPD(tempselect)
        elseif DialogueTimer.func == "normal" then
            DialogueTimer.timerCompleted = true;
        elseif DialogueTimer.func == "end" then
            DialogueTimer.mode = false;
            DialogueTimer.timerCompleted = false;
            triggerEvent("EndJPDialogue",tempDname)
            local tempDD = {};
            local tempDSD = {};
            local tempDED = {};
            local tempDname = '';
            tempselect = 1;
            DialogueMode = false;
        end
    end
    if tag == 'add dialogue letter' then
    local stringtemp = string.sub(dialogueTexttemp.text, ((loops - loopsLeft)*dialoguetextinterval)-(dialoguetextinterval-1), (loops - loopsLeft)*dialoguetextinterval)
    --debugPrint(stringtemp)
    setTextString(dialogueTexttemp.tag, string.sub(dialogueTexttemp.text, 0, (loops - loopsLeft)*dialoguetextinterval)..'\n\n');
    if dialogueAnimmode then
        objectPlayAnimation(dialogueAnimname, dialogueAnimpose,false)
    end
    if dialogueSoundmode then
        soundfrag = true;
        for i = 1,#notextsound do
            if notextsound[i] == stringtemp then
                --debugPrint("yoooooo")
                soundfrag = false;
            end
        end
        if soundfrag then
            playSound(dialogueSoundtemp, 1);
        end
    end

        if loopsLeft == 0 then
            setTextString(dialogueTexttemp.tag, dialogueTexttemp.text..'\n');
            dialoguelettermode = false;
            --debugPrint('Text finished!')
            --setProperty('handSelect.visible', true);
        end
    end
end

--dialogue system v1.5 Shartize