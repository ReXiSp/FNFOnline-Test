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

local DialogueStartDatas = {
    ["RNKJ"] = {
        {tag="SelectMusic",song='Week1_Dialogue',volume=0.5},

        {tag="addSpriteAnimation",stag='Speech',graphic="speech_bubble",x=50,y=360,cent=true},
        {tag="addAnimation",stag="Speech",name="normal",pref="speech bubble normal",frame=24,loop=true},
        {tag="addAnimation",stag="Speech",name="middle",pref="speech bubble middle",frame=24,loop=true},
        {tag="addAnimation",stag="Speech",name="ahh",pref="AHH speech bubble",frame=24,loop=true},
        {tag="addAnimation",stag="Speech",name="ahh-middle",pref="AHH Speech Bubble middle",frame=24,loop=true},
        {tag="PlayAnimation",stag="Speech",name="normal"},
        {tag="setProperty",stag="Speech.flipX",value=true},

        {tag="addSpriteAnimation",stag='giraffe-dialogue',graphic="dialogue/giraffe-dialogue",x=-500,y=-100,cent=false},
        {tag="addAnimation",stag="giraffe-dialogue",name="talk",pref="talk",frame=24,loop=false},
        {tag="addAnimation",stag="giraffe-dialogue",name="normal",pref="normal",frame=24,loop=false},
        {tag="addAnimation",stag="giraffe-dialogue",name="what",pref="what",frame=24,loop=false},
        {tag="addAnimation",stag="giraffe-dialogue",name="wo",pref="wo",frame=24,loop=false},
        {tag="addAnimation",stag="giraffe-dialogue",name="yeah",pref="yeah",frame=24,loop=false},
        {tag="PlayAnimation",stag="giraffe-dialogue",name="normal"},
        {tag="setProperty",stag="giraffe-dialogue.scale.x",value=0.8},
        {tag="setProperty",stag="giraffe-dialogue.scale.y",value=0.8},

        {tag="addSpriteAnimation",stag='bf-dialogue',graphic="dialogue/BF-Dialogue",x=1280,y=0,cent=false},
        {tag="addAnimation",stag="bf-dialogue",name="normal",pref="normal",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="smug",pref="smug",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="tired1",pref="tired1",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="tired2",pref="tired2",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="hey",pref="hey",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="noo",pref="noo",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="what",pref="what",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="yeah",pref="yeah",frame=24,loop=false},
        {tag="PlayAnimation",stag="bf-dialogue",name="normal"},
        {tag="setProperty",stag="bf-dialogue.scale.x",value=0.8},
        {tag="setProperty",stag="bf-dialogue.scale.y",value=0.8},


        {tag="addSprite",stag='BF-dialogue-YB',graphic="dialogue/BF/BF-YABASUGI",x=1280,y=130,cent=false,alpha=1},
        {tag="setProperty",stag="BF-dialogue-YB.scale.x",value=0.8},
        {tag="setProperty",stag="BF-dialogue-YB.scale.y",value=0.8},

        {tag="addSprite",stag='GF-dialogue-1',graphic="dialogue/GF/GF_1",x=50,y=420,cent=false,alpha=1},
        {tag="addSprite",stag='GF-dialogue-5',graphic="dialogue/GF/GF_5",x=50,y=420,cent=false,alpha=1},
        {tag="addSprite",stag='GF-dialogue-6',graphic="dialogue/GF/GF_6",x=200,y=320,cent=false,alpha=1},
        --{tag="addSprite",stag='GF-dialogue-7',graphic="dialogue/GF/GF_7",x=50,y=420,cent=false,alpha=1},

        {tag="setProperty",stag="GF-dialogue-1.scale.x",value=0.4},
        {tag="setProperty",stag="GF-dialogue-1.scale.y",value=0.4},
        

        {tag="setProperty",stag="GF-dialogue-5.scale.x",value=0.4},
        {tag="setProperty",stag="GF-dialogue-5.scale.y",value=0.4},

        {tag="setProperty",stag="GF-dialogue-6.scale.x",value=0.4},
        {tag="setProperty",stag="GF-dialogue-6.scale.y",value=0.4},

        {tag="MakeText",stag="dialogueText",width=0,x=150,y=500,font="bokutachi.otf",size=40},
    },
    ["RNKE"] = {
        {tag="SelectMusic",song='Week1_Dialogue',volume=0.5},

        {tag="addSpriteAnimation",stag='Speech',graphic="speech_bubble",x=50,y=360,cent=true},
        {tag="addAnimation",stag="Speech",name="normal",pref="speech bubble normal",frame=24,loop=true},
        {tag="addAnimation",stag="Speech",name="middle",pref="speech bubble middle",frame=24,loop=true},
        {tag="addAnimation",stag="Speech",name="ahh",pref="AHH speech bubble",frame=24,loop=true},
        {tag="addAnimation",stag="Speech",name="ahh-middle",pref="AHH Speech Bubble middle",frame=24,loop=true},
        {tag="PlayAnimation",stag="Speech",name="normal"},
        {tag="setProperty",stag="Speech.flipX",value=true},

        {tag="addSpriteAnimation",stag='giraffe-dialogue',graphic="dialogue/giraffe-dialogue",x=-500,y=-100,cent=false},
        {tag="addAnimation",stag="giraffe-dialogue",name="talk",pref="talk",frame=24,loop=false},
        {tag="addAnimation",stag="giraffe-dialogue",name="normal",pref="normal",frame=24,loop=false},
        {tag="addAnimation",stag="giraffe-dialogue",name="what",pref="what",frame=24,loop=false},
        {tag="addAnimation",stag="giraffe-dialogue",name="wo",pref="wo",frame=24,loop=false},
        {tag="addAnimation",stag="giraffe-dialogue",name="yeah",pref="yeah",frame=24,loop=false},
        {tag="PlayAnimation",stag="giraffe-dialogue",name="normal"},
        {tag="setProperty",stag="giraffe-dialogue.scale.x",value=0.8},
        {tag="setProperty",stag="giraffe-dialogue.scale.y",value=0.8},

        {tag="addSpriteAnimation",stag='bf-dialogue',graphic="dialogue/BF-Dialogue",x=1280,y=0,cent=false},
        {tag="addAnimation",stag="bf-dialogue",name="normal",pref="normal",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="smug",pref="smug",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="tired1",pref="tired1",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="tired2",pref="tired2",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="hey",pref="hey",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="noo",pref="noo",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="what",pref="what",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="yeah",pref="yeah",frame=24,loop=false},
        {tag="PlayAnimation",stag="bf-dialogue",name="normal"},
        {tag="setProperty",stag="bf-dialogue.scale.x",value=0.8},
        {tag="setProperty",stag="bf-dialogue.scale.y",value=0.8},


        {tag="addSprite",stag='BF-dialogue-YB',graphic="dialogue/BF/BF-YABASUGI",x=1280,y=130,cent=false,alpha=1},
        {tag="setProperty",stag="BF-dialogue-YB.scale.x",value=0.8},
        {tag="setProperty",stag="BF-dialogue-YB.scale.y",value=0.8},

        {tag="addSprite",stag='GF-dialogue-1',graphic="dialogue/GF/GF_1",x=50,y=420,cent=false,alpha=1},
        {tag="addSprite",stag='GF-dialogue-5',graphic="dialogue/GF/GF_5",x=50,y=420,cent=false,alpha=1},
        {tag="addSprite",stag='GF-dialogue-6',graphic="dialogue/GF/GF_6",x=200,y=320,cent=false,alpha=1},
        --{tag="addSprite",stag='GF-dialogue-7',graphic="dialogue/GF/GF_7",x=50,y=420,cent=false,alpha=1},

        {tag="setProperty",stag="GF-dialogue-1.scale.x",value=0.4},
        {tag="setProperty",stag="GF-dialogue-1.scale.y",value=0.4},
        

        {tag="setProperty",stag="GF-dialogue-5.scale.x",value=0.4},
        {tag="setProperty",stag="GF-dialogue-5.scale.y",value=0.4},

        {tag="setProperty",stag="GF-dialogue-6.scale.x",value=0.4},
        {tag="setProperty",stag="GF-dialogue-6.scale.y",value=0.4},

        {tag="MakeText",stag="dialogueText",width=0,x=150,y=500,font="fnf-font.ttf",size=40},
    },
    ["TTEJ"] = {
        {tag="SelectMusic",song='Week1_Dialogue',volume=0.5},

        {tag="addSpriteAnimation",stag='Speech',graphic="speech_bubble",x=50,y=360,cent=true},
        {tag="addAnimation",stag="Speech",name="normal",pref="speech bubble normal",frame=24,loop=true},
        {tag="addAnimation",stag="Speech",name="middle",pref="speech bubble middle",frame=24,loop=true},
        {tag="addAnimation",stag="Speech",name="ahh",pref="AHH speech bubble",frame=24,loop=true},
        {tag="addAnimation",stag="Speech",name="ahh-middle",pref="AHH Speech Bubble middle",frame=24,loop=true},
        {tag="PlayAnimation",stag="Speech",name="normal"},
        {tag="setProperty",stag="Speech.flipX",value=true},

        {tag="addSpriteAnimation",stag='giraffe-dialogue',graphic="dialogue/giraffe-dialogue",x=-500,y=-100,cent=false},
        {tag="addAnimation",stag="giraffe-dialogue",name="talk",pref="talk",frame=24,loop=false},
        {tag="addAnimation",stag="giraffe-dialogue",name="normal",pref="normal",frame=24,loop=false},
        {tag="addAnimation",stag="giraffe-dialogue",name="what",pref="what",frame=24,loop=false},
        {tag="addAnimation",stag="giraffe-dialogue",name="wo",pref="wo",frame=24,loop=false},
        {tag="addAnimation",stag="giraffe-dialogue",name="yeah",pref="yeah",frame=24,loop=false},
        {tag="PlayAnimation",stag="giraffe-dialogue",name="normal"},
        {tag="setProperty",stag="giraffe-dialogue.scale.x",value=0.8},
        {tag="setProperty",stag="giraffe-dialogue.scale.y",value=0.8},

        {tag="addSpriteAnimation",stag='bf-dialogue',graphic="dialogue/BF-Dialogue",x=1280,y=0,cent=false},
        {tag="addAnimation",stag="bf-dialogue",name="normal",pref="normal",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="smug",pref="smug",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="tired1",pref="tired1",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="tired2",pref="tired2",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="hey",pref="hey",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="noo",pref="noo",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="what",pref="what",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="yeah",pref="yeah",frame=24,loop=false},
        {tag="PlayAnimation",stag="bf-dialogue",name="normal"},
        {tag="setProperty",stag="bf-dialogue.scale.x",value=0.8},
        {tag="setProperty",stag="bf-dialogue.scale.y",value=0.8},

        {tag="addSprite",stag='GF-dialogue-1',graphic="dialogue/GF/GF_1",x=50,y=420,cent=false,alpha=1},
        {tag="addSprite",stag='GF-dialogue-3',graphic="dialogue/GF/GF_3",x=50,y=420,cent=false,alpha=1},
        {tag="addSprite",stag='GF-dialogue-5',graphic="dialogue/GF/GF_5",x=50,y=420,cent=false,alpha=1},
        {tag="addSprite",stag='GF-dialogue-6',graphic="dialogue/GF/GF_6",x=200,y=320,cent=false,alpha=1},
        --{tag="addSprite",stag='GF-dialogue-7',graphic="dialogue/GF/GF_7",x=50,y=420,cent=false,alpha=1},

        {tag="setProperty",stag="GF-dialogue-1.scale.x",value=0.4},
        {tag="setProperty",stag="GF-dialogue-1.scale.y",value=0.4},

        
        {tag="setProperty",stag="GF-dialogue-3.scale.x",value=0.4},
        {tag="setProperty",stag="GF-dialogue-3.scale.y",value=0.4},

        {tag="setProperty",stag="GF-dialogue-5.scale.x",value=0.4},
        {tag="setProperty",stag="GF-dialogue-5.scale.y",value=0.4},

        {tag="setProperty",stag="GF-dialogue-6.scale.x",value=0.4},
        {tag="setProperty",stag="GF-dialogue-6.scale.y",value=0.4},

        {tag="MakeText",stag="dialogueText",width=0,x=150,y=500,font="bokutachi.otf",size=40},
    },
    ["TTEE"] = {
        {tag="SelectMusic",song='Week1_Dialogue',volume=0.5},

        {tag="addSpriteAnimation",stag='Speech',graphic="speech_bubble",x=50,y=360,cent=true},
        {tag="addAnimation",stag="Speech",name="normal",pref="speech bubble normal",frame=24,loop=true},
        {tag="addAnimation",stag="Speech",name="middle",pref="speech bubble middle",frame=24,loop=true},
        {tag="addAnimation",stag="Speech",name="ahh",pref="AHH speech bubble",frame=24,loop=true},
        {tag="addAnimation",stag="Speech",name="ahh-middle",pref="AHH Speech Bubble middle",frame=24,loop=true},
        {tag="PlayAnimation",stag="Speech",name="normal"},
        {tag="setProperty",stag="Speech.flipX",value=true},

        {tag="addSpriteAnimation",stag='giraffe-dialogue',graphic="dialogue/giraffe-dialogue",x=-500,y=-100,cent=false},
        {tag="addAnimation",stag="giraffe-dialogue",name="talk",pref="talk",frame=24,loop=false},
        {tag="addAnimation",stag="giraffe-dialogue",name="normal",pref="normal",frame=24,loop=false},
        {tag="addAnimation",stag="giraffe-dialogue",name="what",pref="what",frame=24,loop=false},
        {tag="addAnimation",stag="giraffe-dialogue",name="wo",pref="wo",frame=24,loop=false},
        {tag="addAnimation",stag="giraffe-dialogue",name="yeah",pref="yeah",frame=24,loop=false},
        {tag="PlayAnimation",stag="giraffe-dialogue",name="normal"},
        {tag="setProperty",stag="giraffe-dialogue.scale.x",value=0.8},
        {tag="setProperty",stag="giraffe-dialogue.scale.y",value=0.8},

        {tag="addSpriteAnimation",stag='bf-dialogue',graphic="dialogue/BF-Dialogue",x=1280,y=0,cent=false},
        {tag="addAnimation",stag="bf-dialogue",name="normal",pref="normal",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="smug",pref="smug",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="tired1",pref="tired1",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="tired2",pref="tired2",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="hey",pref="hey",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="noo",pref="noo",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="what",pref="what",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="yeah",pref="yeah",frame=24,loop=false},
        {tag="PlayAnimation",stag="bf-dialogue",name="normal"},
        {tag="setProperty",stag="bf-dialogue.scale.x",value=0.8},
        {tag="setProperty",stag="bf-dialogue.scale.y",value=0.8},

        {tag="addSprite",stag='GF-dialogue-1',graphic="dialogue/GF/GF_1",x=50,y=420,cent=false,alpha=1},
        {tag="addSprite",stag='GF-dialogue-3',graphic="dialogue/GF/GF_3",x=50,y=420,cent=false,alpha=1},
        {tag="addSprite",stag='GF-dialogue-5',graphic="dialogue/GF/GF_5",x=50,y=420,cent=false,alpha=1},
        {tag="addSprite",stag='GF-dialogue-6',graphic="dialogue/GF/GF_6",x=200,y=320,cent=false,alpha=1},
        --{tag="addSprite",stag='GF-dialogue-7',graphic="dialogue/GF/GF_7",x=50,y=420,cent=false,alpha=1},

        {tag="setProperty",stag="GF-dialogue-1.scale.x",value=0.4},
        {tag="setProperty",stag="GF-dialogue-1.scale.y",value=0.4},

        
        {tag="setProperty",stag="GF-dialogue-3.scale.x",value=0.4},
        {tag="setProperty",stag="GF-dialogue-3.scale.y",value=0.4},

        {tag="setProperty",stag="GF-dialogue-5.scale.x",value=0.4},
        {tag="setProperty",stag="GF-dialogue-5.scale.y",value=0.4},

        {tag="setProperty",stag="GF-dialogue-6.scale.x",value=0.4},
        {tag="setProperty",stag="GF-dialogue-6.scale.y",value=0.4},

        {tag="MakeText",stag="dialogueText",width=0,x=150,y=500,font="fnf-font.ttf",size=40},
    },
    ["LOJS"] = {
        {tag="MakeText",stag="dialogueText",width=1280,x=0,y=600,font="bokutachi.otf",size=40},
        {tag="TextSet",stag="dialogueText",mode="color",value="FFFFFF"},
        {tag="TextSet",stag="dialogueText",mode="border",value=2,value2="000000"},
        {tag="TextSet",stag="dialogueText",mode="alignment",value="center"},
        {tag="addSprite",stag='GF-dialogue-3',graphic="dialogue/GF/GF_3",x=0,y=420,cent=false,alpha=1},
        {tag="addSprite",stag='GF-dialogue-5',graphic="dialogue/GF/GF_5",x=50,y=420,cent=false,alpha=1},
        {tag="setProperty",stag="GF-dialogue-3.scale.x",value=0.4},
        {tag="setProperty",stag="GF-dialogue-3.scale.y",value=0.4},

        {tag="addSprite",stag='Moya-dialogue-akire',graphic="dialogue/Moyashiro/moya_mottoakire",x=1400,y=0,cent=false,alpha=1},
        {tag="setProperty",stag="Moya-dialogue-akire.flipX",value=true},

        {tag="addSprite",stag='Moya-dialogue-akre',graphic="dialogue/Moyashiro/moya_akire",x=1400,y=0,cent=false,alpha=1},
        {tag="setProperty",stag="Moya-dialogue-akre.flipX",value=true},

        {tag="addSprite",stag='Moya-dialogue-normal',graphic="dialogue/Moyashiro/moya_normal",x=1400,y=0,cent=false,alpha=1},
        {tag="setProperty",stag="Moya-dialogue-normal.flipX",value=true},
        --{tag="setProperty",stag="Moya-dialogue-akire.scale.y",value=0.4},

        {tag="addSprite",stag='Gira-dialogue-Devil',graphic="dialogue/Giraffe-Devil",x=-800,y=0,cent=true,alpha=1},

        {tag="addSprite",stag='GF-dialogue-6',graphic="dialogue/GF/GF_6",x=200,y=320,cent=false,alpha=1},
        {tag="setProperty",stag="GF-dialogue-6.scale.x",value=0.4},
        {tag="setProperty",stag="GF-dialogue-6.scale.y",value=0.4},

        {tag="setProperty",stag="GF-dialogue-5.scale.x",value=0.4},
        {tag="setProperty",stag="GF-dialogue-5.scale.y",value=0.4},
    },
    ["LOES"] = {
        {tag="MakeText",stag="dialogueText",width=1280,x=0,y=600,font="fnf-font.ttf",size=40},
        {tag="TextSet",stag="dialogueText",mode="color",value="FFFFFF"},
        {tag="TextSet",stag="dialogueText",mode="border",value=2,value2="000000"},
        {tag="TextSet",stag="dialogueText",mode="alignment",value="center"},
        {tag="addSprite",stag='GF-dialogue-3',graphic="dialogue/GF/GF_3",x=0,y=420,cent=false,alpha=1},
        {tag="addSprite",stag='GF-dialogue-5',graphic="dialogue/GF/GF_5",x=50,y=420,cent=false,alpha=1},
        {tag="setProperty",stag="GF-dialogue-3.scale.x",value=0.4},
        {tag="setProperty",stag="GF-dialogue-3.scale.y",value=0.4},

        {tag="addSprite",stag='Moya-dialogue-akire',graphic="dialogue/Moyashiro/moya_mottoakire",x=1400,y=0,cent=false,alpha=1},
        {tag="setProperty",stag="Moya-dialogue-akire.flipX",value=true},

        {tag="addSprite",stag='Moya-dialogue-akre',graphic="dialogue/Moyashiro/moya_akire",x=1400,y=0,cent=false,alpha=1},
        {tag="setProperty",stag="Moya-dialogue-akre.flipX",value=true},

        {tag="addSprite",stag='Moya-dialogue-normal',graphic="dialogue/Moyashiro/moya_normal",x=1400,y=0,cent=false,alpha=1},
        {tag="setProperty",stag="Moya-dialogue-normal.flipX",value=true},
        --{tag="setProperty",stag="Moya-dialogue-akire.scale.y",value=0.4},

        {tag="addSprite",stag='Gira-dialogue-Devil',graphic="dialogue/Giraffe-Devil",x=-800,y=0,cent=true,alpha=1},

        {tag="addSprite",stag='GF-dialogue-6',graphic="dialogue/GF/GF_6",x=200,y=320,cent=false,alpha=1},
        {tag="setProperty",stag="GF-dialogue-6.scale.x",value=0.4},
        {tag="setProperty",stag="GF-dialogue-6.scale.y",value=0.4},

        {tag="setProperty",stag="GF-dialogue-5.scale.x",value=0.4},
        {tag="setProperty",stag="GF-dialogue-5.scale.y",value=0.4},
    },
    ["LOJE"] = {
        {tag="setProperty",stag='BlackFlash.visible',value=false},
        {tag="MakeText",stag="dialogueText",width=1280,x=0,y=600,font="bokutachi.otf",size=40},
        {tag="TextSet",stag="dialogueText",mode="color",value="FFFFFF"},
        {tag="TextSet",stag="dialogueText",mode="border",value=2,value2="000000"},
        {tag="TextSet",stag="dialogueText",mode="alignment",value="center"},
    },
    ["LOEE"] = {
        {tag="setProperty",stag='BlackFlash.visible',value=false},
        {tag="MakeText",stag="dialogueText",width=1280,x=0,y=600,font="fnf-font.ttf",size=40},
        --{tag="MakeText",stag="dialogueText",width=1280,x=0,y=600,font="vcr.ttf",size=40},
        {tag="TextSet",stag="dialogueText",mode="color",value="FFFFFF"},
        {tag="TextSet",stag="dialogueText",mode="border",value=2,value2="000000"},
        {tag="TextSet",stag="dialogueText",mode="alignment",value="center"},
    },
    ["SMTJ"] = {
        {tag="SelectMusic",song='Week2_Dialogue',volume=0.5},

        {tag="addSpriteAnimation",stag='Speech',graphic="speech_bubble",x=50,y=360,cent=true},
        {tag="addAnimation",stag="Speech",name="normal",pref="speech bubble normal",frame=24,loop=true},
        {tag="addAnimation",stag="Speech",name="middle",pref="speech bubble middle",frame=24,loop=true},
        {tag="addAnimation",stag="Speech",name="ahh",pref="AHH speech bubble",frame=24,loop=true},
        {tag="addAnimation",stag="Speech",name="ahh-middle",pref="AHH Speech Bubble middle",frame=24,loop=true},
        {tag="PlayAnimation",stag="Speech",name="normal"},
        {tag="setProperty",stag="Speech.flipX",value=true},

        {tag="addSprite",stag='GF-dialogue-1',graphic="dialogue/GF/GF_1",x=50,y=420,cent=false,alpha=1},
        {tag="setProperty",stag="GF-dialogue-1.scale.x",value=0.4},
        {tag="setProperty",stag="GF-dialogue-1.scale.y",value=0.4},

        {tag="addSprite",stag='GF-dialogue-4',graphic="dialogue/GF/GF_4",x=50,y=420,cent=false,alpha=1},
        {tag="setProperty",stag="GF-dialogue-4.scale.x",value=0.4},
        {tag="setProperty",stag="GF-dialogue-4.scale.y",value=0.4},

        {tag="addSprite",stag='GF-dialogue-norm',graphic="dialogue/GF/GF_norm",x=50,y=420,cent=false,alpha=1},
        {tag="setProperty",stag="GF-dialogue-norm.scale.x",value=0.4},
        {tag="setProperty",stag="GF-dialogue-norm.scale.y",value=0.4},

        {tag="addSprite",stag='Moya-dialogue-normal',graphic="dialogue/Moyashiro/moya_normal",x=-560,y=0,cent=false,alpha=1},
        {tag="addSprite",stag='Moya-dialogue-smile',graphic="dialogue/Moyashiro/moya_smile",x=-560,y=0,cent=false,alpha=1},
        {tag="addSprite",stag='Moya-dialogue-akirewarai',graphic="dialogue/Moyashiro/moya_akirewarai",x=-560,y=0,cent=false,alpha=1},

        {tag="addSpriteAnimation",stag='bf-dialogue',graphic="dialogue/BF-Dialogue",x=1280,y=0,cent=false},
        {tag="addAnimation",stag="bf-dialogue",name="normal",pref="normal",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="smug",pref="smug",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="tired1",pref="tired1",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="tired2",pref="tired2",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="hey",pref="hey",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="noo",pref="noo",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="what",pref="what",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="yeah",pref="yeah",frame=24,loop=false},
        {tag="PlayAnimation",stag="bf-dialogue",name="normal"},
        {tag="setProperty",stag="bf-dialogue.scale.x",value=0.8},
        {tag="setProperty",stag="bf-dialogue.scale.y",value=0.8},

        {tag="MakeText",stag="dialogueText",width=0,x=150,y=500,font="bokutachi.otf",size=40},
    },
    ["SMTE"] = {
        {tag="SelectMusic",song='Week2_Dialogue',volume=0.5},

        {tag="addSpriteAnimation",stag='Speech',graphic="speech_bubble",x=50,y=360,cent=true},
        {tag="addAnimation",stag="Speech",name="normal",pref="speech bubble normal",frame=24,loop=true},
        {tag="addAnimation",stag="Speech",name="middle",pref="speech bubble middle",frame=24,loop=true},
        {tag="addAnimation",stag="Speech",name="ahh",pref="AHH speech bubble",frame=24,loop=true},
        {tag="addAnimation",stag="Speech",name="ahh-middle",pref="AHH Speech Bubble middle",frame=24,loop=true},
        {tag="PlayAnimation",stag="Speech",name="normal"},
        {tag="setProperty",stag="Speech.flipX",value=true},

        {tag="addSprite",stag='GF-dialogue-1',graphic="dialogue/GF/GF_1",x=50,y=420,cent=false,alpha=1},
        {tag="setProperty",stag="GF-dialogue-1.scale.x",value=0.4},
        {tag="setProperty",stag="GF-dialogue-1.scale.y",value=0.4},

        {tag="addSprite",stag='GF-dialogue-4',graphic="dialogue/GF/GF_4",x=50,y=420,cent=false,alpha=1},
        {tag="setProperty",stag="GF-dialogue-4.scale.x",value=0.4},
        {tag="setProperty",stag="GF-dialogue-4.scale.y",value=0.4},

        {tag="addSprite",stag='GF-dialogue-norm',graphic="dialogue/GF/GF_norm",x=50,y=420,cent=false,alpha=1},
        {tag="setProperty",stag="GF-dialogue-norm.scale.x",value=0.4},
        {tag="setProperty",stag="GF-dialogue-norm.scale.y",value=0.4},

        {tag="addSprite",stag='Moya-dialogue-normal',graphic="dialogue/Moyashiro/moya_normal",x=-560,y=0,cent=false,alpha=1},
        {tag="addSprite",stag='Moya-dialogue-smile',graphic="dialogue/Moyashiro/moya_smile",x=-560,y=0,cent=false,alpha=1},
        {tag="addSprite",stag='Moya-dialogue-akirewarai',graphic="dialogue/Moyashiro/moya_akirewarai",x=-560,y=0,cent=false,alpha=1},

        {tag="addSpriteAnimation",stag='bf-dialogue',graphic="dialogue/BF-Dialogue",x=1280,y=0,cent=false},
        {tag="addAnimation",stag="bf-dialogue",name="normal",pref="normal",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="smug",pref="smug",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="tired1",pref="tired1",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="tired2",pref="tired2",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="hey",pref="hey",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="noo",pref="noo",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="what",pref="what",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="yeah",pref="yeah",frame=24,loop=false},
        {tag="PlayAnimation",stag="bf-dialogue",name="normal"},
        {tag="setProperty",stag="bf-dialogue.scale.x",value=0.8},
        {tag="setProperty",stag="bf-dialogue.scale.y",value=0.8},

        {tag="MakeText",stag="dialogueText",width=0,x=150,y=500,font="fnf-font.ttf",size=40},
    },
    ["CYWJ"] = {
        {tag="SelectMusic",song='Week2_Dialogue',volume=0.5},

        {tag="addSpriteAnimation",stag='Speech',graphic="speech_bubble",x=50,y=360,cent=true},
        {tag="addAnimation",stag="Speech",name="normal",pref="speech bubble normal",frame=24,loop=true},
        {tag="addAnimation",stag="Speech",name="middle",pref="speech bubble middle",frame=24,loop=true},
        {tag="addAnimation",stag="Speech",name="ahh",pref="AHH speech bubble",frame=24,loop=true},
        {tag="addAnimation",stag="Speech",name="ahh-middle",pref="AHH Speech Bubble middle",frame=24,loop=true},
        {tag="PlayAnimation",stag="Speech",name="normal"},
        {tag="setProperty",stag="Speech.flipX",value=true},

        {tag="addSprite",stag='Moya-dialogue-smile',graphic="dialogue/Moyashiro/moya_smile",x=-560,y=0,cent=false,alpha=1},
        {tag="addSprite",stag='Moya-dialogue-akre',graphic="dialogue/Moyashiro/moya_akire",x=-560,y=0,cent=false,alpha=1},
        
        {tag="addSprite",stag='Moya-dialogue-normal',graphic="dialogue/Moyashiro/moya_normal",x=1400,y=0,cent=false,alpha=1},
        {tag="setProperty",stag="Moya-dialogue-normal.flipX",value=true},

        {tag="addSprite",stag='Cyan-dialogue-normal',graphic="dialogue/Cyancat/Cyan",x=1280,y=-250,cent=false,alpha=1},
        {tag="setProperty",stag="Cyan-dialogue-normal.scale.x",value=0.5},
        {tag="setProperty",stag="Cyan-dialogue-normal.scale.y",value=0.5},
        {tag="setProperty",stag="Cyan-dialogue-normal.flipX",value=true},
        {tag="addSprite",stag='Cyan-dialogue-doya',graphic="dialogue/Cyancat/Cyan-doya",x=-730,y=-250,cent=false,alpha=1},
        {tag="setProperty",stag="Cyan-dialogue-doya.scale.x",value=0.5},
        {tag="setProperty",stag="Cyan-dialogue-doya.scale.y",value=0.5},
        {tag="addSprite",stag='Cyan-dialogue-ha',graphic="dialogue/Cyancat/Cyan-ha",x=-730,y=-250,cent=false,alpha=1},
        {tag="setProperty",stag="Cyan-dialogue-ha.scale.x",value=0.5},
        {tag="setProperty",stag="Cyan-dialogue-ha.scale.y",value=0.5},

        {tag="addSpriteAnimation",stag='bf-dialogue',graphic="dialogue/BF-Dialogue",x=1280,y=0,cent=false},
        {tag="addAnimation",stag="bf-dialogue",name="normal",pref="normal",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="smug",pref="smug",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="tired1",pref="tired1",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="tired2",pref="tired2",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="hey",pref="hey",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="noo",pref="noo",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="what",pref="what",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="yeah",pref="yeah",frame=24,loop=false},
        {tag="PlayAnimation",stag="bf-dialogue",name="normal"},
        {tag="setProperty",stag="bf-dialogue.scale.x",value=0.8},
        {tag="setProperty",stag="bf-dialogue.scale.y",value=0.8},

        {tag="MakeText",stag="dialogueText",width=0,x=150,y=500,font="bokutachi.otf",size=40},
    },
    ["CYWE"] = {
        {tag="SelectMusic",song='Week2_Dialogue',volume=0.5},

        {tag="addSpriteAnimation",stag='Speech',graphic="speech_bubble",x=50,y=360,cent=true},
        {tag="addAnimation",stag="Speech",name="normal",pref="speech bubble normal",frame=24,loop=true},
        {tag="addAnimation",stag="Speech",name="middle",pref="speech bubble middle",frame=24,loop=true},
        {tag="addAnimation",stag="Speech",name="ahh",pref="AHH speech bubble",frame=24,loop=true},
        {tag="addAnimation",stag="Speech",name="ahh-middle",pref="AHH Speech Bubble middle",frame=24,loop=true},
        {tag="PlayAnimation",stag="Speech",name="normal"},
        {tag="setProperty",stag="Speech.flipX",value=true},

        {tag="addSprite",stag='Moya-dialogue-smile',graphic="dialogue/Moyashiro/moya_smile",x=-560,y=0,cent=false,alpha=1},
        {tag="addSprite",stag='Moya-dialogue-akre',graphic="dialogue/Moyashiro/moya_akire",x=-560,y=0,cent=false,alpha=1},
        
        {tag="addSprite",stag='Moya-dialogue-normal',graphic="dialogue/Moyashiro/moya_normal",x=1400,y=0,cent=false,alpha=1},
        {tag="setProperty",stag="Moya-dialogue-normal.flipX",value=true},

        {tag="addSprite",stag='Cyan-dialogue-normal',graphic="dialogue/Cyancat/Cyan",x=1280,y=-250,cent=false,alpha=1},
        {tag="setProperty",stag="Cyan-dialogue-normal.scale.x",value=0.5},
        {tag="setProperty",stag="Cyan-dialogue-normal.scale.y",value=0.5},
        {tag="setProperty",stag="Cyan-dialogue-normal.flipX",value=true},
        {tag="addSprite",stag='Cyan-dialogue-doya',graphic="dialogue/Cyancat/Cyan-doya",x=-730,y=-250,cent=false,alpha=1},
        {tag="setProperty",stag="Cyan-dialogue-doya.scale.x",value=0.5},
        {tag="setProperty",stag="Cyan-dialogue-doya.scale.y",value=0.5},
        {tag="addSprite",stag='Cyan-dialogue-ha',graphic="dialogue/Cyancat/Cyan-ha",x=-730,y=-250,cent=false,alpha=1},
        {tag="setProperty",stag="Cyan-dialogue-ha.scale.x",value=0.5},
        {tag="setProperty",stag="Cyan-dialogue-ha.scale.y",value=0.5},

        {tag="addSpriteAnimation",stag='bf-dialogue',graphic="dialogue/BF-Dialogue",x=1280,y=0,cent=false},
        {tag="addAnimation",stag="bf-dialogue",name="normal",pref="normal",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="smug",pref="smug",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="tired1",pref="tired1",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="tired2",pref="tired2",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="hey",pref="hey",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="noo",pref="noo",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="what",pref="what",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="yeah",pref="yeah",frame=24,loop=false},
        {tag="PlayAnimation",stag="bf-dialogue",name="normal"},
        {tag="setProperty",stag="bf-dialogue.scale.x",value=0.8},
        {tag="setProperty",stag="bf-dialogue.scale.y",value=0.8},

        {tag="MakeText",stag="dialogueText",width=0,x=150,y=500,font="fnf-font.ttf",size=40},
    },
    ["CSJS"] = {
        {tag="SelectMusic",song='Week2_Dialogue',volume=0.5},

        {tag="addSpriteAnimation",stag='Speech',graphic="speech_bubble",x=50,y=360,cent=true},
        {tag="addAnimation",stag="Speech",name="normal",pref="speech bubble normal",frame=24,loop=true},
        {tag="addAnimation",stag="Speech",name="middle",pref="speech bubble middle",frame=24,loop=true},
        {tag="addAnimation",stag="Speech",name="ahh",pref="AHH speech bubble",frame=24,loop=true},
        {tag="addAnimation",stag="Speech",name="ahh-middle",pref="AHH Speech Bubble middle",frame=24,loop=true},
        {tag="PlayAnimation",stag="Speech",name="normal"},
        {tag="setProperty",stag="Speech.flipX",value=true},

        {tag="addSpriteAnimation",stag='bf-dialogue',graphic="dialogue/BF-Dialogue",x=1280,y=0,cent=false},
        {tag="addAnimation",stag="bf-dialogue",name="normal",pref="normal",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="smug",pref="smug",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="tired1",pref="tired1",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="tired2",pref="tired2",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="hey",pref="hey",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="noo",pref="noo",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="what",pref="what",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="yeah",pref="yeah",frame=24,loop=false},
        {tag="PlayAnimation",stag="bf-dialogue",name="normal"},
        {tag="setProperty",stag="bf-dialogue.scale.x",value=0.8},
        {tag="setProperty",stag="bf-dialogue.scale.y",value=0.8},

        {tag="addSprite",stag='GF-dialogue-1',graphic="dialogue/GF/GF_1",x=50,y=420,cent=false,alpha=1},
        {tag="setProperty",stag="GF-dialogue-1.scale.x",value=0.4},
        {tag="setProperty",stag="GF-dialogue-1.scale.y",value=0.4},


        {tag="addSprite",stag='Sin-dialogue-aaaaa',graphic="dialogue/Sin/sin_aaaaa",x=300,y=550,cent=false,alpha=1},
        {tag="setProperty",stag="Sin-dialogue-aaaaa.scale.x",value=0.5},
        {tag="setProperty",stag="Sin-dialogue-aaaaa.scale.y",value=0.5},

        {tag="addSprite",stag='Sin-dialogue-what',graphic="dialogue/Sin/sin_what",x=-730,y=-250,cent=false,alpha=1},
        {tag="setProperty",stag="Sin-dialogue-what.scale.x",value=0.5},
        {tag="setProperty",stag="Sin-dialogue-what.scale.y",value=0.5},

        {tag="addSprite",stag='Sin-dialogue-haha',graphic="dialogue/Sin/sin_haha",x=-730,y=-250,cent=false,alpha=1},
        {tag="setProperty",stag="Sin-dialogue-haha.scale.x",value=0.5},
        {tag="setProperty",stag="Sin-dialogue-haha.scale.y",value=0.5},

        {tag="addSprite",stag='Sin-dialogue-normal',graphic="dialogue/Sin/sin_normal",x=-730,y=-250,cent=false,alpha=1},
        {tag="setProperty",stag="Sin-dialogue-normal.scale.x",value=0.5},
        {tag="setProperty",stag="Sin-dialogue-normal.scale.y",value=0.5},

        {tag="addSprite",stag='Cyan-dialogue-odoroki',graphic="dialogue/Cyancat/Cyan-odoroki",x=-730,y=-250,cent=false,alpha=1},
        {tag="setProperty",stag="Cyan-dialogue-odoroki.scale.x",value=0.5},
        {tag="setProperty",stag="Cyan-dialogue-odoroki.scale.y",value=0.5},

        {tag="addSprite",stag='Cyan-dialogue-what',graphic="dialogue/Cyancat/Cyan-what",x=-730,y=-250,cent=false,alpha=1},
        {tag="setProperty",stag="Cyan-dialogue-what.scale.x",value=0.5},
        {tag="setProperty",stag="Cyan-dialogue-what.scale.y",value=0.5},

        --pico-x[800],y[100]
        {tag="addSprite",stag='Pico-dialogue-anger',graphic="dialogue/Pico/pico-anger",x=1280,y=100,cent=false,alpha=1},
        {tag="addSprite",stag='Pico-dialogue-doya',graphic="dialogue/Pico/pico-doya",x=1280,y=100,cent=false,alpha=1},
        {tag="addSprite",stag='Pico-dialogue-threat',graphic="dialogue/Pico/pico-threat",x=1280,y=100,cent=false,alpha=1},


        {tag="MakeText",stag="dialogueText",width=0,x=150,y=500,font="bokutachi.otf",size=40},
    },
    ["CSES"] = {
        {tag="SelectMusic",song='Week2_Dialogue',volume=0.5},

        {tag="addSpriteAnimation",stag='Speech',graphic="speech_bubble",x=50,y=360,cent=true},
        {tag="addAnimation",stag="Speech",name="normal",pref="speech bubble normal",frame=24,loop=true},
        {tag="addAnimation",stag="Speech",name="middle",pref="speech bubble middle",frame=24,loop=true},
        {tag="addAnimation",stag="Speech",name="ahh",pref="AHH speech bubble",frame=24,loop=true},
        {tag="addAnimation",stag="Speech",name="ahh-middle",pref="AHH Speech Bubble middle",frame=24,loop=true},
        {tag="PlayAnimation",stag="Speech",name="normal"},
        {tag="setProperty",stag="Speech.flipX",value=true},

        {tag="addSpriteAnimation",stag='bf-dialogue',graphic="dialogue/BF-Dialogue",x=1280,y=0,cent=false},
        {tag="addAnimation",stag="bf-dialogue",name="normal",pref="normal",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="smug",pref="smug",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="tired1",pref="tired1",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="tired2",pref="tired2",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="hey",pref="hey",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="noo",pref="noo",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="what",pref="what",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="yeah",pref="yeah",frame=24,loop=false},
        {tag="PlayAnimation",stag="bf-dialogue",name="normal"},
        {tag="setProperty",stag="bf-dialogue.scale.x",value=0.8},
        {tag="setProperty",stag="bf-dialogue.scale.y",value=0.8},

        {tag="addSprite",stag='GF-dialogue-1',graphic="dialogue/GF/GF_1",x=50,y=420,cent=false,alpha=1},
        {tag="setProperty",stag="GF-dialogue-1.scale.x",value=0.4},
        {tag="setProperty",stag="GF-dialogue-1.scale.y",value=0.4},


        {tag="addSprite",stag='Sin-dialogue-aaaaa',graphic="dialogue/Sin/sin_aaaaa",x=300,y=550,cent=false,alpha=1},
        {tag="setProperty",stag="Sin-dialogue-aaaaa.scale.x",value=0.5},
        {tag="setProperty",stag="Sin-dialogue-aaaaa.scale.y",value=0.5},

        {tag="addSprite",stag='Sin-dialogue-what',graphic="dialogue/Sin/sin_what",x=-730,y=-250,cent=false,alpha=1},
        {tag="setProperty",stag="Sin-dialogue-what.scale.x",value=0.5},
        {tag="setProperty",stag="Sin-dialogue-what.scale.y",value=0.5},

        {tag="addSprite",stag='Sin-dialogue-haha',graphic="dialogue/Sin/sin_haha",x=-730,y=-250,cent=false,alpha=1},
        {tag="setProperty",stag="Sin-dialogue-haha.scale.x",value=0.5},
        {tag="setProperty",stag="Sin-dialogue-haha.scale.y",value=0.5},

        {tag="addSprite",stag='Sin-dialogue-normal',graphic="dialogue/Sin/sin_normal",x=-730,y=-250,cent=false,alpha=1},
        {tag="setProperty",stag="Sin-dialogue-normal.scale.x",value=0.5},
        {tag="setProperty",stag="Sin-dialogue-normal.scale.y",value=0.5},

        {tag="addSprite",stag='Cyan-dialogue-odoroki',graphic="dialogue/Cyancat/Cyan-odoroki",x=-730,y=-250,cent=false,alpha=1},
        {tag="setProperty",stag="Cyan-dialogue-odoroki.scale.x",value=0.5},
        {tag="setProperty",stag="Cyan-dialogue-odoroki.scale.y",value=0.5},

        {tag="addSprite",stag='Cyan-dialogue-what',graphic="dialogue/Cyancat/Cyan-what",x=-730,y=-250,cent=false,alpha=1},
        {tag="setProperty",stag="Cyan-dialogue-what.scale.x",value=0.5},
        {tag="setProperty",stag="Cyan-dialogue-what.scale.y",value=0.5},

        --pico-x[800],y[100]
        {tag="addSprite",stag='Pico-dialogue-anger',graphic="dialogue/Pico/pico-anger",x=1280,y=100,cent=false,alpha=1},
        {tag="addSprite",stag='Pico-dialogue-doya',graphic="dialogue/Pico/pico-doya",x=1280,y=100,cent=false,alpha=1},
        {tag="addSprite",stag='Pico-dialogue-threat',graphic="dialogue/Pico/pico-threat",x=1280,y=100,cent=false,alpha=1},


        {tag="MakeText",stag="dialogueText",width=0,x=150,y=500,font="fnf-font.ttf",size=40},
    },
    ["CSJE"] = {
        --{tag="SelectMusic",song='Week2_Dialogue',volume=0.5},

        {tag="MakeText",stag="dialogueScrappedText",width=0,x=0,y=675,font="vcr.ttf",size=20},
        {tag="TextSet",stag="dialogueScrappedText",mode="color",value="FFFFFF"},
        {tag="TextSet",stag="dialogueScrappedText",mode="border",value=2,value2="000000"},
        {tag="TextStringNormal",stag="dialogueScrappedText",Text="THIS DIALOGUE HAS BEEN SCRAPPED LOL"},
        {tag="SetCamera",stag="dialogueScrappedText",cam="camOther"},

        {tag="addSpriteAnimation",stag='Speech',graphic="speech_bubble",x=50,y=360,cent=true},
        {tag="addAnimation",stag="Speech",name="normal",pref="speech bubble normal",frame=24,loop=true},
        {tag="addAnimation",stag="Speech",name="middle",pref="speech bubble middle",frame=24,loop=true},
        {tag="addAnimation",stag="Speech",name="ahh",pref="AHH speech bubble",frame=24,loop=true},
        {tag="addAnimation",stag="Speech",name="ahh-middle",pref="AHH Speech Bubble middle",frame=24,loop=true},
        {tag="PlayAnimation",stag="Speech",name="normal"},
        {tag="setProperty",stag="Speech.flipX",value=true},

        {tag="addSpriteAnimation",stag='giraffe-dialogue',graphic="dialogue/giraffe-dialogue",x=-500,y=-100,cent=false},
        {tag="addAnimation",stag="giraffe-dialogue",name="talk",pref="talk",frame=24,loop=false},
        {tag="addAnimation",stag="giraffe-dialogue",name="normal",pref="normal",frame=24,loop=false},
        {tag="addAnimation",stag="giraffe-dialogue",name="what",pref="what",frame=24,loop=false},
        {tag="addAnimation",stag="giraffe-dialogue",name="wo",pref="wo",frame=24,loop=false},
        {tag="addAnimation",stag="giraffe-dialogue",name="yeah",pref="yeah",frame=24,loop=false},
        {tag="PlayAnimation",stag="giraffe-dialogue",name="normal"},
        {tag="setProperty",stag="giraffe-dialogue.scale.x",value=0.8},
        {tag="setProperty",stag="giraffe-dialogue.scale.y",value=0.8},

        {tag="addSpriteAnimation",stag='bf-dialogue',graphic="dialogue/BF-Dialogue",x=1280,y=0,cent=false},
        {tag="addAnimation",stag="bf-dialogue",name="normal",pref="normal",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="smug",pref="smug",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="tired1",pref="tired1",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="tired2",pref="tired2",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="hey",pref="hey",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="noo",pref="noo",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="what",pref="what",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="yeah",pref="yeah",frame=24,loop=false},
        {tag="PlayAnimation",stag="bf-dialogue",name="normal"},
        {tag="setProperty",stag="bf-dialogue.scale.x",value=0.8},
        {tag="setProperty",stag="bf-dialogue.scale.y",value=0.8},

        {tag="addSprite",stag='GF-dialogue-1',graphic="dialogue/GF/GF_norm",x=50,y=420,cent=false,alpha=1},
        {tag="setProperty",stag="GF-dialogue-1.scale.x",value=0.4},
        {tag="setProperty",stag="GF-dialogue-1.scale.y",value=0.4},

        {tag="addSprite",stag='Sin-dialogue-normal',graphic="dialogue/Sin/sin_normal",x=-730,y=-250,cent=false,alpha=1},
        {tag="setProperty",stag="Sin-dialogue-normal.scale.x",value=0.5},
        {tag="setProperty",stag="Sin-dialogue-normal.scale.y",value=0.5},

        {tag="addSprite",stag='Moya-dialogue-akire',graphic="dialogue/Moyashiro/moya_akire",x=1400,y=0,cent=false,alpha=1},
        {tag="setProperty",stag="Moya-dialogue-akire.flipX",value=true},

        {tag="addSprite",stag='Moya-dialogue-akirewarai',graphic="dialogue/Moyashiro/moya_akirewarai",x=1400,y=0,cent=false,alpha=1},
        {tag="setProperty",stag="Moya-dialogue-akirewarai.flipX",value=true},

        {tag="addSprite",stag='Moya-dialogue-mottoakire',graphic="dialogue/Moyashiro/moya_mottoakire",x=-560,y=0,cent=false,alpha=1},
        --{tag="addSprite",stag='Moya-dialogue-akirewarai',graphic="dialogue/Moyashiro/moya_normal",x=-560,y=0,cent=false,alpha=1},

        {tag="addSprite",stag='Pico-dialogue-anger',graphic="dialogue/Pico/pico-anger",x=1280,y=100,cent=false,alpha=1},
        {tag="addSprite",stag='Pico-dialogue-threat',graphic="dialogue/Pico/pico-threat",x=1280,y=100,cent=false,alpha=1},
        {tag="addSprite",stag='Pico-dialogue-anger',graphic="dialogue/Pico/pico-ha",x=1280,y=100,cent=false,alpha=1},

        {tag="MakeText",stag="dialogueText",width=0,x=150,y=500,font="bokutachi.otf",size=40},
    },
    ["CSEE"] = {
        --{tag="SelectMusic",song='Week2_Dialogue',volume=0.5},

        {tag="MakeText",stag="dialogueScrappedText",width=0,x=0,y=675,font="vcr.ttf",size=20},
        {tag="TextSet",stag="dialogueScrappedText",mode="color",value="FFFFFF"},
        {tag="TextSet",stag="dialogueScrappedText",mode="border",value=2,value2="000000"},
        {tag="TextStringNormal",stag="dialogueScrappedText",Text="THIS DIALOGUE HAS BEEN SCRAPPED LOL"},
        {tag="SetCamera",stag="dialogueScrappedText",cam="camOther"},

        {tag="addSpriteAnimation",stag='Speech',graphic="speech_bubble",x=50,y=360,cent=true},
        {tag="addAnimation",stag="Speech",name="normal",pref="speech bubble normal",frame=24,loop=true},
        {tag="addAnimation",stag="Speech",name="middle",pref="speech bubble middle",frame=24,loop=true},
        {tag="addAnimation",stag="Speech",name="ahh",pref="AHH speech bubble",frame=24,loop=true},
        {tag="addAnimation",stag="Speech",name="ahh-middle",pref="AHH Speech Bubble middle",frame=24,loop=true},
        {tag="PlayAnimation",stag="Speech",name="normal"},
        {tag="setProperty",stag="Speech.flipX",value=true},

        {tag="addSpriteAnimation",stag='giraffe-dialogue',graphic="dialogue/giraffe-dialogue",x=-500,y=-100,cent=false},
        {tag="addAnimation",stag="giraffe-dialogue",name="talk",pref="talk",frame=24,loop=false},
        {tag="addAnimation",stag="giraffe-dialogue",name="normal",pref="normal",frame=24,loop=false},
        {tag="addAnimation",stag="giraffe-dialogue",name="what",pref="what",frame=24,loop=false},
        {tag="addAnimation",stag="giraffe-dialogue",name="wo",pref="wo",frame=24,loop=false},
        {tag="addAnimation",stag="giraffe-dialogue",name="yeah",pref="yeah",frame=24,loop=false},
        {tag="PlayAnimation",stag="giraffe-dialogue",name="normal"},
        {tag="setProperty",stag="giraffe-dialogue.scale.x",value=0.8},
        {tag="setProperty",stag="giraffe-dialogue.scale.y",value=0.8},

        {tag="addSpriteAnimation",stag='bf-dialogue',graphic="dialogue/BF-Dialogue",x=1280,y=0,cent=false},
        {tag="addAnimation",stag="bf-dialogue",name="normal",pref="normal",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="smug",pref="smug",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="tired1",pref="tired1",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="tired2",pref="tired2",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="hey",pref="hey",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="noo",pref="noo",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="what",pref="what",frame=24,loop=false},
        {tag="addAnimation",stag="bf-dialogue",name="yeah",pref="yeah",frame=24,loop=false},
        {tag="PlayAnimation",stag="bf-dialogue",name="normal"},
        {tag="setProperty",stag="bf-dialogue.scale.x",value=0.8},
        {tag="setProperty",stag="bf-dialogue.scale.y",value=0.8},

        {tag="addSprite",stag='GF-dialogue-1',graphic="dialogue/GF/GF_norm",x=50,y=420,cent=false,alpha=1},
        {tag="setProperty",stag="GF-dialogue-1.scale.x",value=0.4},
        {tag="setProperty",stag="GF-dialogue-1.scale.y",value=0.4},

        {tag="addSprite",stag='Sin-dialogue-normal',graphic="dialogue/Sin/sin_normal",x=-730,y=-250,cent=false,alpha=1},
        {tag="setProperty",stag="Sin-dialogue-normal.scale.x",value=0.5},
        {tag="setProperty",stag="Sin-dialogue-normal.scale.y",value=0.5},

        {tag="addSprite",stag='Moya-dialogue-akire',graphic="dialogue/Moyashiro/moya_akire",x=1400,y=0,cent=false,alpha=1},
        {tag="setProperty",stag="Moya-dialogue-akire.flipX",value=true},

        {tag="addSprite",stag='Moya-dialogue-akirewarai',graphic="dialogue/Moyashiro/moya_akirewarai",x=1400,y=0,cent=false,alpha=1},
        {tag="setProperty",stag="Moya-dialogue-akirewarai.flipX",value=true},

        {tag="addSprite",stag='Moya-dialogue-mottoakire',graphic="dialogue/Moyashiro/moya_mottoakire",x=-560,y=0,cent=false,alpha=1},
        --{tag="addSprite",stag='Moya-dialogue-akirewarai',graphic="dialogue/Moyashiro/moya_normal",x=-560,y=0,cent=false,alpha=1},

        {tag="addSprite",stag='Pico-dialogue-anger',graphic="dialogue/Pico/pico-anger",x=1280,y=100,cent=false,alpha=1},
        {tag="addSprite",stag='Pico-dialogue-threat',graphic="dialogue/Pico/pico-threat",x=1280,y=100,cent=false,alpha=1},
        {tag="addSprite",stag='Pico-dialogue-anger',graphic="dialogue/Pico/pico-ha",x=1280,y=100,cent=false,alpha=1},

        {tag="MakeText",stag="dialogueText",width=0,x=150,y=500,font="fnf-font.ttf",size=40},
    },
}

local DialogueDatas = {
    ["RNKJ"] = {
        {
            {tag="TextString",stag="dialogueText",Text="コンサート会場",interval=0.06},
            {tag="setProperty",stag="Speech.flipX",value=true}
        },
        {
            {tag="playSound",sound="foo",volume=0.6},
            {tag="TextString",stag="dialogueText",Text="(歓声が上がる)",interval=0.06},
            {tag="setProperty",stag="Speech.flipX",value=true}
        },
        {
            {tag="TextString",stag="dialogueText",Text="素晴らしい!! 君達がこのコンサートを \n大いに盛り上げてくれたことを誇りに思うよ!!",interval=0.06,animtag="giraffe-dialogue",animpose="yeah"},
            {tag="Tween",mode="X",stag="giraffe-dialogue",value=-100,duration=0.5,Tween="circOut"},
            {tag="setProperty",stag="Speech.flipX",value=true}
        },
        {
            {tag="TextString",stag="dialogueText",Text="Beep….(疲労している)",interval=0.06,animtag="bf-dialogue",animpose="normal"},
            {tag="Tween",mode="X",stag="giraffe-dialogue",value=-550,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="bf-dialogue",value=700,duration=0.5,Tween="circOut"},
            {tag="setProperty",stag="Speech.flipX",value=false}
        },
        {
            {tag="TextString",stag="dialogueText",Text="まぁみんなが喜んでくれたなら嬉しいわ。",interval=0.06},
            {tag="Tween",mode="Y",stag="GF-dialogue-1",value=-400,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="bf-dialogue",value=1280,duration=0.5,Tween="circOut"},
            {tag="PlayAnimation",stag="Speech",name="middle"},
            {tag="setProperty",stag="Speech.flipX",value=false}
        },
        {
            {tag="TextString",stag="dialogueText",Text="みんなーー！！まだ彼の歌声を聞きたいかー！？",interval=0.06,animtag="giraffe-dialogue",animpose="yeah"},
            {tag="Tween",mode="X",stag="giraffe-dialogue",value=-100,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="Y",stag="GF-dialogue-1",value=420,duration=0.5,Tween="circOut"},
            {tag="PlayAnimation",stag="Speech",name="ahh"},
            {tag="setProperty",stag="Speech.y",value=300},
            {tag="setProperty",stag="Speech.flipX",value=false}
        },
        {
            {tag="playSound",sound="foo",volume=0.6},
            {tag="TextString",stag="dialogueText",Text="観客　うおーーーー！！",interval=0.06},
            {tag="Tween",mode="X",stag="giraffe-dialogue",value=-550,duration=0.5,Tween="circOut"},
            {tag="PlayAnimation",stag="Speech",name="ahh-middle"},
            {tag="setProperty",stag="Speech.y",value=330},
            {tag="setProperty",stag="Speech.flipX",value=false}
        },
        {
            {tag="TextString",stag="dialogueText",Text="ちょっと、もうこれ以上無理よ！\n50曲も歌った後なんだもの！",interval=0.06},
            {tag="Tween",mode="Y",stag="GF-dialogue-5",value=-400,duration=0.5,Tween="circOut"},
            {tag="PlayAnimation",stag="Speech",name="ahh-middle"},
            {tag="setProperty",stag="Speech.y",value=330},
            {tag="setProperty",stag="Speech.flipX",value=false}
        },
        {
            {tag="TextString",stag="dialogueText",Text="Beep…!",interval=0.06},
            {tag="Tween",mode="Y",stag="GF-dialogue-5",value=420,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="BF-dialogue-YB",value=800,duration=0.5,Tween="circOut"},
            {tag="PlayAnimation",stag="Speech",name="normal"},
            {tag="setProperty",stag="Speech.y",value=360},
            {tag="setProperty",stag="Speech.flipX",value=false}
        },
        {
            {tag="TextString",stag="dialogueText",Text="そうこなくっちゃな！",interval=0.06,animtag="giraffe-dialogue",animpose="talk"},
            {tag="Tween",mode="X",stag="giraffe-dialogue",value=-100,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="BF-dialogue-YB",value=1280,duration=0.5,Tween="circOut"},
            {tag="setProperty",stag="Speech.flipX",value=true}
        },
        {
            {tag="TextString",stag="dialogueText",Text="うーん、しょうがないわね…でも一曲だけよ！",interval=0.06},
            {tag="Tween",mode="Y",stag="GF-dialogue-6",value=-300,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="giraffe-dialogue",value=-500,duration=0.5,Tween="circOut"},
            {tag="PlayAnimation",stag="Speech",name="middle"},
            {tag="setProperty",stag="Speech.flipX",value=false}
        },
    },
    ["RNKE"] = {
        {
            {tag="TextString",stag="dialogueText",Text="concert hall",interval=0.06,textinterval=1},
            {tag="setProperty",stag="Speech.flipX",value=true}
        },
        {
            {tag="playSound",sound="foo",volume=0.6},
            {tag="TextString",stag="dialogueText",Text="(cheers erupt)",interval=0.06,textinterval=1},
            {tag="setProperty",stag="Speech.flipX",value=true}
        },
        {
            {tag="TextString",stag="dialogueText",Text="Wonderful! I'm proud of you guys for making \nmy concert so exciting!",interval=0.06,animtag="giraffe-dialogue",animpose="yeah",textinterval=1},
            {tag="Tween",mode="X",stag="giraffe-dialogue",value=-100,duration=0.5,Tween="circOut"},
            {tag="setProperty",stag="Speech.flipX",value=true}
        },
        {
            {tag="TextString",stag="dialogueText",Text="Beep....",interval=0.06,animtag="bf-dialogue",animpose="normal",textinterval=1},
            {tag="Tween",mode="X",stag="giraffe-dialogue",value=-550,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="bf-dialogue",value=700,duration=0.5,Tween="circOut"},
            {tag="setProperty",stag="Speech.flipX",value=false}
        },
        {
            {tag="TextString",stag="dialogueText",Text="Well, Glad you guys enjoyed it.",interval=0.06,textinterval=1},
            {tag="Tween",mode="Y",stag="GF-dialogue-1",value=-400,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="bf-dialogue",value=1280,duration=0.5,Tween="circOut"},
            {tag="PlayAnimation",stag="Speech",name="middle"},
            {tag="setProperty",stag="Speech.flipX",value=false}
        },
        {
            {tag="TextString",stag="dialogueText",Text="Guys!!! Do you still wanna hear him sing?!",interval=0.06,animtag="giraffe-dialogue",animpose="yeah",textinterval=1},
            {tag="Tween",mode="X",stag="giraffe-dialogue",value=-100,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="Y",stag="GF-dialogue-1",value=420,duration=0.5,Tween="circOut"},
            {tag="PlayAnimation",stag="Speech",name="ahh"},
            {tag="setProperty",stag="Speech.y",value=300},
            {tag="setProperty",stag="Speech.flipX",value=false}
        },
        {
            {tag="playSound",sound="foo",volume=0.6},
            {tag="TextString",stag="dialogueText",Text="Fooooooooooooooooooooooooooooooooo!!!!!!!!!!!!!!!!!!",interval=0.06,textinterval=1},
            {tag="Tween",mode="X",stag="giraffe-dialogue",value=-550,duration=0.5,Tween="circOut"},
            {tag="PlayAnimation",stag="Speech",name="ahh-middle"},
            {tag="setProperty",stag="Speech.y",value=330},
            {tag="setProperty",stag="Speech.flipX",value=false}
        },
        {
            {tag="TextString",stag="dialogueText",Text="Hey! That's enough! He sang 50 songs, right?!",interval=0.06,textinterval=1},
            {tag="Tween",mode="Y",stag="GF-dialogue-5",value=-400,duration=0.5,Tween="circOut"},
            {tag="PlayAnimation",stag="Speech",name="ahh-middle"},
            {tag="setProperty",stag="Speech.y",value=330},
            {tag="setProperty",stag="Speech.flipX",value=false}
        },
        {
            {tag="TextString",stag="dialogueText",Text="Beep...!",interval=0.06,textinterval=1},
            {tag="Tween",mode="Y",stag="GF-dialogue-5",value=420,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="BF-dialogue-YB",value=800,duration=0.5,Tween="circOut"},
            {tag="PlayAnimation",stag="Speech",name="normal"},
            {tag="setProperty",stag="Speech.y",value=360},
            {tag="setProperty",stag="Speech.flipX",value=false}
        },
        {
            {tag="TextString",stag="dialogueText",Text="Now you' re talking!",interval=0.06,animtag="giraffe-dialogue",animpose="talk",textinterval=1},
            {tag="Tween",mode="X",stag="giraffe-dialogue",value=-100,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="BF-dialogue-YB",value=1280,duration=0.5,Tween="circOut"},
            {tag="setProperty",stag="Speech.flipX",value=true}
        },
        {
            {tag="TextString",stag="dialogueText",Text="What? Well, if he says so...\nBut only one song!",interval=0.06,textinterval=1},
            {tag="Tween",mode="Y",stag="GF-dialogue-6",value=-300,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="giraffe-dialogue",value=-500,duration=0.5,Tween="circOut"},
            {tag="PlayAnimation",stag="Speech",name="middle"},
            {tag="setProperty",stag="Speech.flipX",value=false}
        },
    },
    ["TTEJ"] = {
        {
            {tag="TextString",stag="dialogueText",Text="Beep…(疲労困憊)",interval=0.06,animtag="bf-dialogue",animpose="tired1"},
            {tag="Tween",mode="X",stag="bf-dialogue",value=700,duration=0.5,Tween="circOut"},
            {tag="setProperty",stag="Speech.flipX",value=false}
        },
        {
            {tag="TextString",stag="dialogueText",Text="みんなｰ!!僕と彼のラップバトルみたいかー！？",interval=0.06,animtag="giraffe-dialogue",animpose="yeah"},
            {tag="Tween",mode="X",stag="bf-dialogue",value=1280,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="giraffe-dialogue",value=-100,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="Y",stag="GF-dialogue-1",value=420,duration=0.5,Tween="circOut"},
            {tag="PlayAnimation",stag="Speech",name="ahh"},
            {tag="setProperty",stag="Speech.y",value=300},
            {tag="setProperty",stag="Speech.flipX",value=false}
        },
        {
            {tag="playSound",sound="foo",volume=0.6},
            {tag="TextString",stag="dialogueText",Text="観客　うおーーーー！！",interval=0.06},
            {tag="Tween",mode="X",stag="giraffe-dialogue",value=-550,duration=0.5,Tween="circOut"},
            {tag="PlayAnimation",stag="Speech",name="ahh-middle"},
            {tag="setProperty",stag="Speech.y",value=330},
            {tag="setProperty",stag="Speech.flipX",value=false}
        },
        {
            {tag="TextString",stag="dialogueText",Text="ちょっと！いい加減にしてよ！",interval=0.06},
            {tag="Tween",mode="Y",stag="GF-dialogue-3",value=-400,duration=0.5,Tween="circOut"},
            {tag="PlayAnimation",stag="Speech",name="ahh-middle"},
            {tag="setProperty",stag="Speech.y",value=330},
            {tag="setProperty",stag="Speech.flipX",value=false}
        },
        {
            {tag="TextString",stag="dialogueText",Text="この日のために作ってきた傑作もあるんだ！\nじゃあ張り切っていくぞ！！",interval=0.06,animtag="giraffe-dialogue",animpose="yeah"},
            {tag="Tween",mode="X",stag="giraffe-dialogue",value=-100,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="Y",stag="GF-dialogue-3",value=420,duration=0.5,Tween="circOut"},
            {tag="PlayAnimation",stag="Speech",name="ahh"},
            {tag="setProperty",stag="Speech.y",value=300},
            {tag="setProperty",stag="Speech.flipX",value=false}
        },
        {
            {tag="TextString",stag="dialogueText",Text="Beep…",interval=0.06,animtag="bf-dialogue",animpose="tired1"},
            {tag="Tween",mode="X",stag="giraffe-dialogue",value=-550,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="bf-dialogue",value=700,duration=0.5,Tween="circOut"},
            {tag="PlayAnimation",stag="Speech",name="normal"},
            {tag="setProperty",stag="Speech.y",value=360},
            {tag="setProperty",stag="Speech.flipX",value=false}
        },
    }, 
    ["TTEE"] = {
        {
            {tag="TextString",stag="dialogueText",Text="Beep.....",interval=0.06,animtag="bf-dialogue",animpose="tired1",textinterval=1},
            {tag="Tween",mode="X",stag="bf-dialogue",value=700,duration=0.5,Tween="circOut"},
            {tag="setProperty",stag="Speech.flipX",value=false}
        },
        {
            {tag="TextString",stag="dialogueText",Text="Guys! Want to watch me and his rap battle?!",interval=0.06,animtag="giraffe-dialogue",animpose="yeah",textinterval=1},
            {tag="Tween",mode="X",stag="bf-dialogue",value=1280,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="giraffe-dialogue",value=-100,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="Y",stag="GF-dialogue-1",value=420,duration=0.5,Tween="circOut"},
            {tag="PlayAnimation",stag="Speech",name="ahh"},
            {tag="setProperty",stag="Speech.y",value=300},
            {tag="setProperty",stag="Speech.flipX",value=false}
        },
        {
            {tag="playSound",sound="foo",volume=0.6},
            {tag="TextString",stag="dialogueText",Text="Fooooooooooooooooooooooooooo!",interval=0.06,textinterval=1},
            {tag="Tween",mode="X",stag="giraffe-dialogue",value=-550,duration=0.5,Tween="circOut"},
            {tag="PlayAnimation",stag="Speech",name="ahh-middle"},
            {tag="setProperty",stag="Speech.y",value=330},
            {tag="setProperty",stag="Speech.flipX",value=false}
        },
        {
            {tag="TextString",stag="dialogueText",Text="Hey!! It’s OVER!",interval=0.06,textinterval=1},
            {tag="Tween",mode="Y",stag="GF-dialogue-3",value=-400,duration=0.5,Tween="circOut"},
            {tag="PlayAnimation",stag="Speech",name="ahh-middle"},
            {tag="setProperty",stag="Speech.y",value=330},
            {tag="setProperty",stag="Speech.flipX",value=false}
        },
        {
            {tag="TextString",stag="dialogueText",Text="Let me show you guys listen my masterpieces I've \nmade for today! C'mon! Let's go fxxkin' crazy!!",interval=0.06,animtag="giraffe-dialogue",animpose="yeah",textinterval=1},
            {tag="Tween",mode="X",stag="giraffe-dialogue",value=-100,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="Y",stag="GF-dialogue-3",value=420,duration=0.5,Tween="circOut"},
            {tag="PlayAnimation",stag="Speech",name="ahh"},
            {tag="setProperty",stag="Speech.y",value=300},
            {tag="setProperty",stag="Speech.flipX",value=false}
        },
        {
            {tag="TextString",stag="dialogueText",Text="Beep.....",interval=0.06,animtag="bf-dialogue",animpose="tired1",textinterval=1},
            {tag="Tween",mode="X",stag="giraffe-dialogue",value=-550,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="bf-dialogue",value=700,duration=0.5,Tween="circOut"},
            {tag="PlayAnimation",stag="Speech",name="normal"},
            {tag="setProperty",stag="Speech.y",value=360},
            {tag="setProperty",stag="Speech.flipX",value=false}
        },
    },
    ["LOJS"] = {
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostS/01(300dpi)fade",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="みんな僕の企画をめちゃくちゃにして…",interval=0.05,textinterval=3},
            {tag="TextSet",stag="dialogueText",mode="color",value="219959"},
        },
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostS/01(300dpi)fade",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="お前ら絶対に許さんぞ！！",interval=0.05,textinterval=3},
        },
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostS/02(300dpi)fade",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="",interval=0.05,textinterval=3},
        },
        {
            {tag="triggerEvent",name="Screen Shake",value1="0.5,0.05",value2="0.5,0.05"},
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostS/03(300dpi)fade",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="",interval=0.05,textinterval=3},
        },
        {
            {tag="setProperty",stag="dialogueText.visible",value=false},
            {tag="setProperty",stag="cutimage.visible",value=false},

            {tag="addSpriteAnimation",stag='Speech',graphic="speech_bubble",x=50,y=360,cent=true},
            {tag="addAnimation",stag="Speech",name="normal",pref="speech bubble normal",frame=24,loop=true},
            {tag="addAnimation",stag="Speech",name="middle",pref="speech bubble middle",frame=24,loop=true},
            {tag="addAnimation",stag="Speech",name="ahh",pref="AHH speech bubble",frame=24,loop=true},
            {tag="addAnimation",stag="Speech",name="ahh-middle",pref="AHH Speech Bubble middle",frame=24,loop=true},
            {tag="PlayAnimation",stag="Speech",name="normal"},
            {tag="setProperty",stag="Speech.flipX",value=false},

            {tag="MakeText",stag="dialogueText2",width=0,x=150,y=500,font="bokutachi.otf",size=40},
            {tag="TextString",stag="dialogueText2",Text="…！皆逃げて！",interval=0.05,textinterval=3},
            {tag="Tween",mode="Y",stag="GF-dialogue-5",value=-400,duration=0.5,Tween="circOut"},
            {tag="PlayAnimation",stag="Speech",name="ahh-middle"},
            {tag="setProperty",stag="Speech.y",value=330},
            {tag="setProperty",stag="Speech.x",value=20},
        },
        {
            {tag="TextString",stag="dialogueText2",Text="お前を許さない！ﾕﾙｻﾅｲ！ｳｫｱｱｱｱｱ！！！！！",interval=0.05,textinterval=3},
            {tag="Tween",mode="Y",stag="GF-dialogue-5",value=420,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="Gira-dialogue-Devil",value=-100,duration=0.5,Tween="circOut"},
            {tag="PlayAnimation",stag="Speech",name="ahh"},
            {tag="setProperty",stag="Speech.y",value=300},
        },
        {
            {tag="TextString",stag="dialogueText2",Text="まずい、ジラフが理性を失って暴走してる…",interval=0.05,textinterval=3},
            {tag="Tween",mode="X",stag="Moya-dialogue-akire",value=800,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="Gira-dialogue-Devil",value=-800,duration=0.5,Tween="circOut"},
            {tag="PlayAnimation",stag="Speech",name="normal"},
            {tag="setProperty",stag="Speech.y",value=360},
            {tag="setProperty",stag="Speech.x",value=50},
            {tag="setProperty",stag="Speech.flipX",value=false},
        },
        {
            {tag="TextString",stag="dialogueText2",Text="…",interval=0.05,textinterval=3},
            {tag="setProperty",stag="Moya-dialogue-akire.visible",value=false},
            {tag="setProperty",stag="Moya-dialogue-akre.visible",value=true},
            {tag="setProperty",stag="Moya-dialogue-akre.x",value=800},
        },
        --{
            --{tag="TextString",stag="dialogueText2",Text="",interval=0.05,textinterval=3},
        --},
        {
            {tag="TextString",stag="dialogueText2",Text="嬢ちゃん、しばらく時間稼ぎ頼めるか？",interval=0.05,textinterval=3},
            {tag="setProperty",stag="Moya-dialogue-akre.visible",value=false},
            {tag="setProperty",stag="Moya-dialogue-normal.visible",value=true},
            {tag="setProperty",stag="Moya-dialogue-normal.x",value=800},
        },
        {
            {tag="TextString",stag="dialogueText2",Text="チビ助は俺が面倒を見よう",interval=0.05,textinterval=3},
        },
        {
            {tag="TextString",stag="dialogueText2",Text="あっ…うん、分かったわ…！",interval=0.05,textinterval=3},
            {tag="Tween",mode="X",stag="Moya-dialogue-normal",value=1400,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="Y",stag="GF-dialogue-6",value=-300,duration=0.5,Tween="circOut"},
            {tag="PlayAnimation",stag="Speech",name="middle"},
            {tag="setProperty",stag="Speech.flipX",value=false},
        },

        {
            {tag="TextString",stag="dialogueText2",Text="全員僕の社員にしてやる！死ぬまで僕のために働け！",interval=0.05,textinterval=3},
            {tag="Tween",mode="Y",stag="GF-dialogue-6",value=300,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="Gira-dialogue-Devil",value=-100,duration=0.5,Tween="circOut"},
            {tag="PlayAnimation",stag="Speech",name="ahh"},
            {tag="setProperty",stag="Speech.y",value=300},
            {tag="setProperty",stag="Speech.x",value=20},
        },
        {
            {tag="TextString",stag="dialogueText2",Text="いい加減にしなさい！",interval=0.05,textinterval=3},
            {tag="Tween",mode="X",stag="Gira-dialogue-Devil",value=-800,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="Y",stag="GF-dialogue-3",value=-400,duration=0.5,Tween="circOut"},
            {tag="PlayAnimation",stag="Speech",name="ahh-middle"},
            {tag="setProperty",stag="Speech.y",value=330},
        },
        {
            {tag="TextString",stag="dialogueText2",Text="邪魔をするなｧｧｧｱ！",interval=0.05,textinterval=3},
            {tag="Tween",mode="X",stag="Gira-dialogue-Devil",value=-100,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="Y",stag="GF-dialogue-3",value=420,duration=0.5,Tween="circOut"},
            {tag="setProperty",stag="Speech.y",value=300},
            {tag="PlayAnimation",stag="Speech",name="ahh"},
        },
    },
    ["LOES"] = {
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostS/01(300dpi)fade",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="They all messed up my company's project...",interval=0.05,textinterval=1},
            {tag="TextSet",stag="dialogueText",mode="color",value="219959"},
        },
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostS/01(300dpi)fade",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="I will never forgive you all!!",interval=0.05,textinterval=1},
        },
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostS/02(300dpi)fade",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="",interval=0.05,textinterval=3},
        },
        {
            {tag="triggerEvent",name="Screen Shake",value1="0.5,0.05",value2="0.5,0.05"},
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostS/03(300dpi)fade",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="",interval=0.05,textinterval=3},
        },
        {
            {tag="setProperty",stag="dialogueText.visible",value=false},
            {tag="setProperty",stag="cutimage.visible",value=false},

            {tag="addSpriteAnimation",stag='Speech',graphic="speech_bubble",x=50,y=360,cent=true},
            {tag="addAnimation",stag="Speech",name="normal",pref="speech bubble normal",frame=24,loop=true},
            {tag="addAnimation",stag="Speech",name="middle",pref="speech bubble middle",frame=24,loop=true},
            {tag="addAnimation",stag="Speech",name="ahh",pref="AHH speech bubble",frame=24,loop=true},
            {tag="addAnimation",stag="Speech",name="ahh-middle",pref="AHH Speech Bubble middle",frame=24,loop=true},
            {tag="PlayAnimation",stag="Speech",name="normal"},
            {tag="setProperty",stag="Speech.flipX",value=false},

            {tag="MakeText",stag="dialogueText2",width=0,x=150,y=500,font="fnf-font.ttf",size=40},
            {tag="TextString",stag="dialogueText2",Text="...!!please run away!!",interval=0.05,textinterval=1},
            {tag="Tween",mode="Y",stag="GF-dialogue-5",value=-400,duration=0.5,Tween="circOut"},
            {tag="PlayAnimation",stag="Speech",name="ahh-middle"},
            {tag="setProperty",stag="Speech.y",value=330},
            {tag="setProperty",stag="Speech.x",value=20},
        },
        {
            {tag="TextString",stag="dialogueText2",Text="I will never forgive you! NEVER!!\n grrrrrrrrrrrr!!!!!",interval=0.05,textinterval=1},
            {tag="Tween",mode="Y",stag="GF-dialogue-5",value=420,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="Gira-dialogue-Devil",value=-100,duration=0.5,Tween="circOut"},
            {tag="PlayAnimation",stag="Speech",name="ahh"},
            {tag="setProperty",stag="Speech.y",value=300},
        },
        {
            {tag="TextString",stag="dialogueText2",Text="Oh. He is angry and out of control......",interval=0.05,textinterval=1},
            {tag="Tween",mode="X",stag="Moya-dialogue-akire",value=800,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="Gira-dialogue-Devil",value=-800,duration=0.5,Tween="circOut"},
            {tag="PlayAnimation",stag="Speech",name="normal"},
            {tag="setProperty",stag="Speech.y",value=360},
            {tag="setProperty",stag="Speech.x",value=50},
            {tag="setProperty",stag="Speech.flipX",value=false},
        },
        {
            {tag="TextString",stag="dialogueText2",Text="…",interval=0.05,textinterval=1},
            {tag="setProperty",stag="Moya-dialogue-akire.visible",value=false},
            {tag="setProperty",stag="Moya-dialogue-akre.visible",value=true},
            {tag="setProperty",stag="Moya-dialogue-akre.x",value=800},
        },
        --{
            --{tag="TextString",stag="dialogueText2",Text="",interval=0.05,textinterval=3},
        --},
        {
            {tag="TextString",stag="dialogueText2",Text="Hey, lady. Can you keep the president around \nfor a while?",interval=0.05,textinterval=1},
            {tag="setProperty",stag="Moya-dialogue-akre.visible",value=false},
            {tag="setProperty",stag="Moya-dialogue-normal.visible",value=true},
            {tag="setProperty",stag="Moya-dialogue-normal.x",value=800},
        },
        {
            {tag="TextString",stag="dialogueText2",Text="I will take care of this kid.",interval=0.05,textinterval=1},
        },
        {
            {tag="TextString",stag="dialogueText2",Text="Ah... Okay!!",interval=0.05,textinterval=1},
            {tag="Tween",mode="X",stag="Moya-dialogue-normal",value=1400,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="Y",stag="GF-dialogue-6",value=-300,duration=0.5,Tween="circOut"},
            {tag="PlayAnimation",stag="Speech",name="middle"},
            {tag="setProperty",stag="Speech.flipX",value=false},
        },

        {
            {tag="TextString",stag="dialogueText2",Text="I'm gonna get 'em and make 'em our \nemployees!I’M GOING TO MAKE YOU WORK\n FOR ME UNTIL YOU DIE!!",interval=0.05,textinterval=1},
            {tag="Tween",mode="Y",stag="GF-dialogue-6",value=300,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="Gira-dialogue-Devil",value=-100,duration=0.5,Tween="circOut"},
            {tag="PlayAnimation",stag="Speech",name="ahh"},
            {tag="setProperty",stag="Speech.y",value=300},
            {tag="setProperty",stag="Speech.x",value=20},
        },
        {
            {tag="TextString",stag="dialogueText2",Text="Don't do this!!",interval=0.05,textinterval=1},
            {tag="Tween",mode="X",stag="Gira-dialogue-Devil",value=-800,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="Y",stag="GF-dialogue-3",value=-400,duration=0.5,Tween="circOut"},
            {tag="PlayAnimation",stag="Speech",name="ahh-middle"},
            {tag="setProperty",stag="Speech.y",value=330},
        },
        {
            {tag="TextString",stag="dialogueText2",Text="Get out of my waaaaay!",interval=0.05,textinterval=1},
            {tag="Tween",mode="X",stag="Gira-dialogue-Devil",value=-100,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="Y",stag="GF-dialogue-3",value=420,duration=0.5,Tween="circOut"},
            {tag="setProperty",stag="Speech.y",value=300},
            {tag="PlayAnimation",stag="Speech",name="ahh"},
        },
    },
    ["LOJE"] = {
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/01",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="ちっくしょーーーーーっ！！",interval=0.05,textinterval=3},
            {tag="TextSet",stag="dialogueText",mode="color",value="219959"},
        },
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/01",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="あんたのわがままもここまでよ。厄介ファンめ！",interval=0.05,textinterval=3},
            {tag="TextSet",stag="dialogueText",mode="color",value="B82E50"},
        },
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/02",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="・・・もういい。もうたくさんだ・・・",interval=0.08,textinterval=3},
            {tag="TextSet",stag="dialogueText",mode="color",value="219959"},
        },
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/03",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="なんもかんも全部、全部！燃やし尽くしてやるッ！！",interval=0.04,textinterval=3},
        },
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/04",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="な…!!まだこれ以上やる気！？",interval=0.05,textinterval=3},
            {tag="TextSet",stag="dialogueText",mode="color",value="B82E50"},
        },
        {
            {tag="Autotimer",timer=0.8},
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/05",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="俺に逆らうやつなんて全i",interval=0.05,textinterval=3},
            {tag="TextSet",stag="dialogueText",mode="color",value="219959"},
        },
        {
            {tag="playSound",sound="punch",volume=1},
            {tag="triggerEvent",name="Screen Shake",value1="0.5,0.05",value2="0.5,0.05"},
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/06",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="",interval=0.05,textinterval=3},
        },
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/07",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="まったく！社員さんにすぐ来てくれと言われて呼ばれてみれば..",interval=0.06,textinterval=3},
            {tag="TextSet",stag="dialogueText",mode="color",value="2DCC78"},
        },
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/08",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="…え、どちら様…？",interval=0.06,textinterval=3},
            {tag="TextSet",stag="dialogueText",mode="color",value="B82E50"},
        },
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/09",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="ごめんなさい！！うちの息子がご迷惑をかけてしまったようで… \nケガしてないですか！？",interval=0.06,textinterval=3},
            {tag="TextSet",stag="dialogueText",mode="color",value="2DCC78"},
        },
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/09",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="あー…もしかして母親？",interval=0.06,textinterval=3},
            {tag="TextSet",stag="dialogueText",mode="color",value="B82E50"},
        },
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/09",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="はい、大丈夫ですけど。",interval=0.06,textinterval=3},
        },
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/10",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="良かった…この子は私がきちんとしかっておきますね。",interval=0.06,textinterval=3},
            {tag="TextSet",stag="dialogueText",mode="color",value="2DCC78"},
        },
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/11",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="それでは社員様方、ご迷惑をお掛けしました～！",interval=0.06,textinterval=3},
        },
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/12",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="be...beep...",interval=0.08,textinterval=1},
            {tag="TextSet",stag="dialogueText",mode="color",value="31B0D1"},
        },
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/13",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="BF！…コンサートは終わったわよ。帰りましょ？",interval=0.06,textinterval=3},
            {tag="TextSet",stag="dialogueText",mode="color",value="B82E50"},
        },
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/14",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="beep bep!",interval=0.06,textinterval=1},
            {tag="TextSet",stag="dialogueText",mode="color",value="31B0D1"},
        },
        
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/15",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="",interval=0.05,textinterval=1},
        },
        
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/15",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="...",interval=0.08,textinterval=1},
            {tag="TextSet",stag="dialogueText",mode="color",value="219959"},
        },
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/16",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="くそ…社員共め…これで終わったと思うなよ…",interval=0.06,textinterval=3},
        },
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/17",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="絶対に許さねぇ…報復は必ず…",interval=0.06,textinterval=3},
        },
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/17",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="ジラフ～？",interval=0.08,textinterval=3},
            {tag="TextSet",stag="dialogueText",mode="color",value="2DCC78"},
        },
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/18",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="…まだ懲りてないみたいね～",interval=0.06,textinterval=3},
            {tag="TextSet",stag="dialogueText",mode="color",value="2DCC78"},
        },
        {
            {tag="playSound",sound="punch",volume=1},
            {tag="triggerEvent",name="Screen Shake",value1="0.3,0.05",value2="0.3,0.05"},
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/19",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="ごめんなさいお母さん許しｔあ゛あ゛あ゛あ゛あ゛あ゛あ゛あ゛あ!!!",interval=0.04,textinterval=3},
            {tag="TextSet",stag="dialogueText",mode="color",value="219959"},
        },
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/19",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="…母は悪魔よりも強し、ね。まさしく。",interval=0.06,textinterval=3},
            {tag="TextSet",stag="dialogueText",mode="color",value="B82E50"},
        },
    },
    ["LOEE"] = {
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/01",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="Ahhhh, damn it!",interval=0.05,textinterval=1},
            {tag="TextSet",stag="dialogueText",mode="color",value="219959"},
        },
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/01",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="You’re such an annoying fan!\nThis selfishness of yours needs to stop!",interval=0.05,textinterval=1},
            {tag="TextSet",stag="dialogueText",mode="color",value="B82E50"},
        },
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/02",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="...Enough. Enough is enough...",interval=0.08,textinterval=1},
            {tag="TextSet",stag="dialogueText",mode="color",value="219959"},
        },
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/03",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="Everyone and everything! I'll burn it all down!!",interval=0.04,textinterval=1},
        },
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/04",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="What?! You still want to keep going!?",interval=0.05,textinterval=1},
            {tag="TextSet",stag="dialogueText",mode="color",value="B82E50"},
        },
        {
            {tag="Autotimer",timer=2.5},
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/05",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="Anyone who goes up against me... is going t-",interval=0.05,textinterval=1},
            {tag="TextSet",stag="dialogueText",mode="color",value="219959"},
        },
        {
            {tag="playSound",sound="punch",volume=1},
            {tag="triggerEvent",name="Screen Shake",value1="0.5,0.05",value2="0.5,0.05"},
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/06",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="",interval=0.05,textinterval=3},
        },
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/07",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="I swear... If an employee asks you to come right away,\nyou’re supposed to answer the call...",interval=0.06,textinterval=1},
            {tag="TextSet",stag="dialogueText",mode="color",value="2DCC78"},
        },
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/08",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="...Uhh, ma’am...?",interval=0.06,textinterval=1},
            {tag="TextSet",stag="dialogueText",mode="color",value="B82E50"},
        },
        {
            {tag="setProperty",stag="dialogueText.y",value=560},
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/09",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="Oh, I'm so sorry about him!\nIt seems my son has caused a lot of trouble for you two...\nAre you all right?",interval=0.06,textinterval=1},
            {tag="TextSet",stag="dialogueText",mode="color",value="2DCC78"},
        },
        {
            {tag="setProperty",stag="dialogueText.y",value=600},
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/09",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="Oh, You’re his mother?",interval=0.06,textinterval=1},
            {tag="TextSet",stag="dialogueText",mode="color",value="B82E50"},
        },
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/09",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="Yea, I’m fine.",interval=0.06,textinterval=1},
        },
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/10",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="Good... I’ll make sure to take better care of him so that he’ll learn his lesson.",interval=0.06,textinterval=1},
            {tag="TextSet",stag="dialogueText",mode="color",value="2DCC78"},
        },
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/11",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="Sorry again for the inconvenience...",interval=0.06,textinterval=1},
        },
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/12",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="Be... Beep...",interval=0.08,textinterval=1},
            {tag="TextSet",stag="dialogueText",mode="color",value="31B0D1"},
        },
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/13",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="BF!... The concert is over now. Want to head home and leave?",interval=0.06,textinterval=1},
            {tag="TextSet",stag="dialogueText",mode="color",value="B82E50"},
        },
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/14",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="beep bep!",interval=0.06,textinterval=1},
            {tag="TextSet",stag="dialogueText",mode="color",value="31B0D1"},
        },
        
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/15",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="",interval=0.05,textinterval=1},
        },
        
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/15",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="...",interval=0.08,textinterval=1},
            {tag="TextSet",stag="dialogueText",mode="color",value="219959"},
        },
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/16",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="...You two... Don't think this is the end...",interval=0.06,textinterval=1},
        },
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/17",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="I’ll never forgive you two... My retribution is bound to...",interval=0.06,textinterval=1},
        },
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/17",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="Giraffe...?",interval=0.08,textinterval=1},
            {tag="TextSet",stag="dialogueText",mode="color",value="2DCC78"},
        },
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/18",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="...It seems that you haven’t your lesson yet, have you son?",interval=0.06,textinterval=1},
            {tag="TextSet",stag="dialogueText",mode="color",value="2DCC78"},
        },
        {
            {tag="playSound",sound="punch",volume=1},
            {tag="triggerEvent",name="Screen Shake",value1="0.3,0.05",value2="0.3,0.05"},
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/19",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="AHHHHH! I'M SORRY MOM!!!!!!!!!",interval=0.04,textinterval=1},
            {tag="TextSet",stag="dialogueText",mode="color",value="219959"},
        },
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/19",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="...My mother may literally be a demon,",interval=0.06,textinterval=1},
            {tag="TextSet",stag="dialogueText",mode="color",value="B82E50"},
        },
        {
            {tag="addSprite",stag="cutimage",x=0,y=0,graphic="dialogue/cut/lostE/19",cent=false,alpha=1},
            {tag="TextString",stag="dialogueText",Text="But she is terrifying in her own right...",interval=0.06,textinterval=1},
            {tag="TextSet",stag="dialogueText",mode="color",value="B82E50"},
        },
    },
    ["SMTJ"] = {
        {
            {tag="Tween",mode="X",stag="Moya-dialogue-smile",value=0,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="おう、こっちだぜ御二方",interval=0.05,textinterval=3},
            {tag="setProperty",stag="Speech.visible",value=true},
            {tag="PlayAnimation",stag="Speech",name="normal"},
            {tag="setProperty",stag="Speech.flipX",value=true},
        },
        {
            {tag="Tween",mode="X",stag="Moya-dialogue-smile",value=-560,duration=0.5,Tween="circOut"},
            {tag="PlayAnimation",stag="bf-dialogue",name="hey"},
            {tag="Tween",mode="X",stag="bf-dialogue",value=700,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="beep!",interval=0.05,textinterval=1},
            {tag="setProperty",stag="Speech.flipX",value=false},
        },
        {
            {tag="Tween",mode="Y",stag="GF-dialogue-norm",value=-400,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="bf-dialogue",value=1280,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="この前は助けてくれてありがとうね",interval=0.05,textinterval=3},
            {tag="setProperty",stag="Speech.flipX",value=false},
            {tag="PlayAnimation",stag="Speech",name="middle"},
        },
        {
            {tag="Tween",mode="X",stag="Moya-dialogue-akirewarai",value=0,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="Y",stag="GF-dialogue-norm",value=420,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="なに、奴の傍若無人ぷりは社員の内でも有名さ、慣れてる",interval=0.05,textinterval=3},
            {tag="setProperty",stag="Speech.flipX",value=true},
            {tag="PlayAnimation",stag="Speech",name="normal"},
        },
        {
            {tag="setProperty",stag="Moya-dialogue-akirewarai.x",value=-560},
            {tag="setProperty",stag="Moya-dialogue-akirewarai.visible",value=false},
            {tag="setProperty",stag="Moya-dialogue-normal.x",value=0},
            {tag="TextString",stag="dialogueText",Text="つっても1週間前のアレは度が過ぎてたがな",interval=0.05,textinterval=3},
            {tag="setProperty",stag="Speech.flipX",value=true},
        },
        {
            {tag="TextString",stag="dialogueText",Text="ところで、俺を呼んだ理由はなんだ？",interval=0.05,textinterval=3},
        },
        {
            {tag="PlayAnimation",stag="bf-dialogue",name="yeah"},
            {tag="Tween",mode="X",stag="bf-dialogue",value=700,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="Moya-dialogue-normal",value=-560,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="Beep!",interval=0.05,textinterval=1},
            {tag="setProperty",stag="Speech.flipX",value=false},
        },
        {
            {tag="Tween",mode="X",stag="bf-dialogue",value=1280,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="Moya-dialogue-smile",value=0,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="はは、懲りないな",interval=0.05,textinterval=3},
            {tag="setProperty",stag="Speech.flipX",value=true},
        },
        {
            {tag="Tween",mode="X",stag="bf-dialogue",value=1280,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="Moya-dialogue-smile",value=0,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="ここは煙いから気ぃ付けろよ",interval=0.05,textinterval=3},
            {tag="setProperty",stag="Speech.flipX",value=true},
        },
    },
    ["SMTE"] = {
        {
            {tag="Tween",mode="X",stag="Moya-dialogue-smile",value=0,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="Hey, over here you two",interval=0.05,textinterval=1},
            {tag="setProperty",stag="Speech.visible",value=true},
            {tag="PlayAnimation",stag="Speech",name="normal"},
            {tag="setProperty",stag="Speech.flipX",value=true},
        },
        {
            {tag="Tween",mode="X",stag="Moya-dialogue-smile",value=-560,duration=0.5,Tween="circOut"},
            {tag="PlayAnimation",stag="bf-dialogue",name="hey"},
            {tag="Tween",mode="X",stag="bf-dialogue",value=700,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="Beep!",interval=0.05,textinterval=1},
            {tag="setProperty",stag="Speech.flipX",value=false},
        },
        {
            {tag="Tween",mode="Y",stag="GF-dialogue-norm",value=-400,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="bf-dialogue",value=1280,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="Thanks for helping us back there.",interval=0.05,textinterval=1},
            {tag="setProperty",stag="Speech.flipX",value=false},
            {tag="PlayAnimation",stag="Speech",name="middle"},
        },
        {
            {tag="Tween",mode="X",stag="Moya-dialogue-akirewarai",value=0,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="Y",stag="GF-dialogue-norm",value=420,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="Well, me and my friends know his arrogance \nvery well, so we’re all used to it.",interval=0.05,textinterval=1},
            {tag="setProperty",stag="Speech.flipX",value=true},
            {tag="PlayAnimation",stag="Speech",name="normal"},
        },
        {
            {tag="setProperty",stag="Moya-dialogue-akirewarai.x",value=-560},
            {tag="setProperty",stag="Moya-dialogue-akirewarai.visible",value=false},
            {tag="setProperty",stag="Moya-dialogue-normal.x",value=0},
            {tag="TextString",stag="dialogueText",Text="...God, he was being too much last week.",interval=0.05,textinterval=1},
            {tag="setProperty",stag="Speech.flipX",value=true},
        },
        {
            {tag="TextString",stag="dialogueText",Text="By the way, why did you call me?",interval=0.05,textinterval=1},
        },
        {
            {tag="PlayAnimation",stag="bf-dialogue",name="yeah"},
            {tag="Tween",mode="X",stag="bf-dialogue",value=700,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="Moya-dialogue-normal",value=-560,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="Beep!",interval=0.05,textinterval=1},
            {tag="setProperty",stag="Speech.flipX",value=false},
        },
        {
            {tag="Tween",mode="X",stag="bf-dialogue",value=1280,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="Moya-dialogue-smile",value=0,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="Haha, never learned your lesson, huh?",interval=0.05,textinterval=1},
            {tag="setProperty",stag="Speech.flipX",value=true},
        },
        {
            {tag="Tween",mode="X",stag="bf-dialogue",value=1280,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="Moya-dialogue-smile",value=0,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="It’s smokey here, so be careful.",interval=0.05,textinterval=1},
            {tag="setProperty",stag="Speech.flipX",value=true},
        },
    },
    ["CYWJ"] = {
        {
            {tag="Tween",mode="X",stag="Moya-dialogue-smile",value=0,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="いいラップバトルだったな、流石だぜ",interval=0.05,textinterval=3},
            {tag="setProperty",stag="Speech.flipX",value=true},
            {tag="PlayAnimation",stag="Speech",name="normal"},
        },
        {
            {tag="PlayAnimation",stag="bf-dialogue",name="hey"},
            {tag="Tween",mode="X",stag="bf-dialogue",value=700,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="Moya-dialogue-smile",value=-560,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="Beep!",interval=0.05,textinterval=1},
            {tag="setProperty",stag="Speech.flipX",value=false},
        },
        {
            {tag="setProperty",stag="bf-dialogue.visible",value=false},
            {tag="Tween",mode="X",stag="bf-dialogue",value=1280,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="Cyan-dialogue-normal",value=700,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="ここにいたんだ、ジラフが君に話があるって探してたよ",interval=0.05,textinterval=3},
            {tag="setProperty",stag="Speech.flipX",value=false},
        },
        {
            {tag="Tween",mode="X",stag="Moya-dialogue-akre",value=0,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="Cyan-dialogue-normal",value=1280,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="あ？マジで？ちょっくら行ってくるわ",interval=0.05,textinterval=3},
            {tag="setProperty",stag="Speech.flipX",value=true},
        },
        {
            {tag="Tween",mode="X",stag="Moya-dialogue-akre",value=-560,duration=0.5,Tween="circOut"},
            {tag="setProperty",stag="Cyan-dialogue-normal.x",value=-730},
            {tag="setProperty",stag="Cyan-dialogue-normal.flipX",value=false},
            {tag="Tween",mode="X",stag="Cyan-dialogue-normal",value=-150,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="君、ラップ上手かったね",interval=0.05,textinterval=3},
            {tag="setProperty",stag="Speech.flipX",value=true},
        },
        {
            {tag="TextString",stag="dialogueText",Text="俺、実はあいつの同僚でね。 \n良ければ俺とも一曲歌わない？",interval=0.05,textinterval=3},
        },
        {
            {tag="setProperty",stag="bf-dialogue.visible",value=true},
            {tag="PlayAnimation",stag="bf-dialogue",name="hey"},
            {tag="Tween",mode="X",stag="bf-dialogue",value=700,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="Cyan-dialogue-normal",value=-730,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="yeah!",interval=0.05,textinterval=1},
            {tag="setProperty",stag="Speech.flipX",value=false},
        },
        {
            {tag="Tween",mode="X",stag="bf-dialogue",value=1280,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="Cyan-dialogue-doya",value=-150,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="よっしゃ、良いバトルにしよう！",interval=0.05,textinterval=3},
            {tag="setProperty",stag="Speech.flipX",value=true},
        },
        {
            {tag="Tween",mode="X",stag="Cyan-dialogue-doya",value=-730,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="Moya-dialogue-normal",value=800,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="シアキャ、負けたら嬢ちゃんとチビ助の昼飯代おごりな",interval=0.05,textinterval=3},
            {tag="setProperty",stag="Speech.flipX",value=false},
        },
        {
            {tag="Tween",mode="X",stag="Moya-dialogue-normal",value=1400,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="Cyan-dialogue-ha",value=-150,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="は？",interval=0.05,textinterval=3},
            {tag="setProperty",stag="Speech.flipX",value=true},
        },
    },
    ["CYWE"] = {
        {
            {tag="Tween",mode="X",stag="Moya-dialogue-smile",value=0,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="Good rap battle I felt there.",interval=0.05,textinterval=1},
            {tag="setProperty",stag="Speech.flipX",value=true},
            {tag="PlayAnimation",stag="Speech",name="normal"},
        },
        {
            {tag="PlayAnimation",stag="bf-dialogue",name="hey"},
            {tag="Tween",mode="X",stag="bf-dialogue",value=700,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="Moya-dialogue-smile",value=-560,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="Beep!",interval=0.05,textinterval=1},
            {tag="setProperty",stag="Speech.flipX",value=false},
        },
        {
            {tag="setProperty",stag="bf-dialogue.visible",value=false},
            {tag="Tween",mode="X",stag="bf-dialogue",value=1280,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="Cyan-dialogue-normal",value=700,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="Hey Moyashiro, I came by to say Giraffe wanted\nto see you.",interval=0.05,textinterval=1},
            {tag="setProperty",stag="Speech.flipX",value=false},
        },
        {
            {tag="Tween",mode="X",stag="Moya-dialogue-akre",value=0,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="Cyan-dialogue-normal",value=1280,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="Huh? ...Seriously?",interval=0.05,textinterval=1},
            {tag="setProperty",stag="Speech.flipX",value=true},
        },
        {
            {tag="Tween",mode="X",stag="Moya-dialogue-akre",value=-560,duration=0.5,Tween="circOut"},
            {tag="setProperty",stag="Cyan-dialogue-normal.x",value=-730},
            {tag="setProperty",stag="Cyan-dialogue-normal.flipX",value=false},
            {tag="Tween",mode="X",stag="Cyan-dialogue-normal",value=-150,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="You were rapping pretty good there.",interval=0.05,textinterval=1},
            {tag="setProperty",stag="Speech.flipX",value=true},
        },
        {
            {tag="TextString",stag="dialogueText",Text="I’m actually Moyashiro’s colleague.\nSince you and I here, you want to sing with me?",interval=0.05,textinterval=1},
        },
        {
            {tag="setProperty",stag="bf-dialogue.visible",value=true},
            {tag="PlayAnimation",stag="bf-dialogue",name="hey"},
            {tag="Tween",mode="X",stag="bf-dialogue",value=700,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="Cyan-dialogue-normal",value=-730,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="Yeah!!",interval=0.05,textinterval=1},
            {tag="setProperty",stag="Speech.flipX",value=false},
        },
        {
            {tag="Tween",mode="X",stag="bf-dialogue",value=1280,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="Cyan-dialogue-doya",value=-150,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="Alright, let's have a good battle!",interval=0.05,textinterval=1},
            {tag="setProperty",stag="Speech.flipX",value=true},
        },
        {
            {tag="Tween",mode="X",stag="Cyan-dialogue-doya",value=-730,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="Moya-dialogue-normal",value=800,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="Cyancat, if you lose this,\nwe’ll be having lunch on your tab!",interval=0.05,textinterval=1},
            {tag="setProperty",stag="Speech.flipX",value=false},
        },
        {
            {tag="Tween",mode="X",stag="Moya-dialogue-normal",value=1400,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="Cyan-dialogue-ha",value=-150,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="Huh?",interval=0.05,textinterval=1},
            {tag="setProperty",stag="Speech.flipX",value=true},
        },
    },
    ["CSJS"] = {
        {
            {tag="Tween",mode="Y",stag="Sin-dialogue-aaaaa",value=-250,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="ねえ君！KOUはどこ！？あの子と友達なんでしょ！！？",interval=0.03,textinterval=3},
            {tag="setProperty",stag="Speech.flipX",value=true},
            {tag="PlayAnimation",stag="Speech",name="ahh-middle"},
            {tag="setProperty",stag="Speech.y",value=330},
            {tag="setProperty",stag="Speech.x",value=20},
        },
        {
            {tag="PlayAnimation",stag="bf-dialogue",name="what"},
            {tag="Tween",mode="X",stag="bf-dialogue",value=700,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="Y",stag="Sin-dialogue-aaaaa",value=550,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="Bobeba!!?",interval=0.03,textinterval=1},
            {tag="PlayAnimation",stag="Speech",name="ahh"},
            {tag="setProperty",stag="Speech.y",value=300},
            {tag="setProperty",stag="Speech.flipX",value=true},
        },
        {
            {tag="Tween",mode="X",stag="Cyan-dialogue-odoroki",value=-150,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="bf-dialogue",value=1280,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="どわぁあ！？Sin！？",interval=0.05,textinterval=3},
            {tag="setProperty",stag="Speech.flipX",value=false},
        },
        {
            {tag="Tween",mode="X",stag="Cyan-dialogue-odoroki",value=-730,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="Y",stag="Sin-dialogue-aaaaa",value=-250,duration=0.5,Tween="circOut"},
            {tag="TextSet",stag="dialogueText",mode="size",value=30},
            {tag="setProperty",stag="dialogueText.x",value=100},
            {tag="setProperty",stag="dialogueText.y",value=475},
            {tag="TextString",stag="dialogueText",Text="今日は一年に一度あるロボットやアンドロイドの一斉メンテナンスの日なんだ！ \nきっとあの子も今その整備に向かってるに違いない！ \n君がKOUとラップバトルをした仲だってのは調査済みなんだ！ \n君なら今、KOUがどうなってるか絶対知ってるじゃん教えてよ！！ \nもしそのメンテナンスで彼になにか問題が見つかってしまっているのなら…！！",interval=0.03,textinterval=3},
            {tag="PlayAnimation",stag="Speech",name="ahh-middle"},
            {tag="setProperty",stag="Speech.y",value=330},
        },
        {
            {tag="Tween",mode="X",stag="Cyan-dialogue-what",value=-150,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="Y",stag="Sin-dialogue-aaaaa",value=550,duration=0.5,Tween="circOut"},
            {tag="TextSet",stag="dialogueText",mode="size",value=40},
            {tag="setProperty",stag="dialogueText.x",value=150},
            {tag="setProperty",stag="dialogueText.y",value=500},
            {tag="TextString",stag="dialogueText",Text="おっちっつっけっての！！！",interval=0.03,textinterval=3},
            {tag="PlayAnimation",stag="Speech",name="ahh"},
            {tag="setProperty",stag="Speech.y",value=300},
            {tag="setProperty",stag="Speech.flipX",value=false},
        },
        {
            {tag="Tween",mode="Y",stag="Sin-dialogue-aaaaa",value=-250,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="Cyan-dialogue-what",value=-730,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text=[[ｷﾞｬｱｧｱ！！！ｳｱ゛ｱ゛ｱｯﾊｱｱ゛ｱ゛ｱ゛ｱ゛！！]],interval=0.05,textinterval=3},
            {tag="PlayAnimation",stag="Speech",name="ahh-middle"},
            {tag="setProperty",stag="Speech.y",value=330},
            {tag="setProperty",stag="Speech.flipX",value=false},
        },
        {
            {tag="Tween",mode="X",stag="Cyan-dialogue-what",value=-150,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="Y",stag="Sin-dialogue-aaaaa",value=550,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="ごめん、彼も同僚の一人でね。 \nKOUについて語ると化け物になるんだ",interval=0.05,textinterval=3},
            {tag="PlayAnimation",stag="Speech",name="normal"},
            {tag="setProperty",stag="Speech.y",value=360},
            {tag="setProperty",stag="Speech.x",value=50},
            {tag="setProperty",stag="Speech.flipX",value=true},
        },
        {
            {tag="Tween",mode="X",stag="Cyan-dialogue-what",value=-730,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="Y",stag="GF-dialogue-1",value=-400,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="因みに今KOUは貴方が思ってるほど \n問題になることは起こってないから安心して",interval=0.05,textinterval=3},
            {tag="PlayAnimation",stag="Speech",name="middle"},
            {tag="setProperty",stag="Speech.flipX",value=false},
        },
        {
            {tag="Tween",mode="X",stag="Sin-dialogue-what",value=-150,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="Y",stag="GF-dialogue-1",value=420,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="え、あ、そうなの？!",interval=0.05,textinterval=3},
            {tag="PlayAnimation",stag="Speech",name="normal"},
            {tag="setProperty",stag="Speech.flipX",value=true},
        },
        {
            {tag="Autotimer",timer=1},
            {tag="setProperty",stag="Sin-dialogue-what.visible",value=false},
            {tag="setProperty",stag="Sin-dialogue-haha.visible",value=true},
            {tag="setProperty",stag="Sin-dialogue-haha.x",value=-150},
            {tag="TextString",stag="dialogueText",Text="あはは…それはお騒がせしちゃってごめ",interval=0.05,textinterval=3},
        },
        {
            {tag="SoundFade",fade="Out",duration=0.2,toValue=0},
            {tag="playSound",sound="hankshoot",volume=1},
            {tag="triggerEvent",name="Screen Shake",value1="0.5,0.05",value2="0.5,0.05"},
            {tag="setProperty",stag="Sin-dialogue-haha.visible",value=false},
            {tag="setProperty",stag="Sin-dialogue-what.visible",value=true},
            {tag="setProperty",stag="Sin-dialogue-what.x",value=-150},
            {tag="Tween",mode="Alpha",stag="CutBlack",value=0,duration=0.3,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="",interval=0.05,textinterval=3},
            --{tag="setProperty",stag="Speech.visible",value=false},            
        },
        {
            {tag="Tween",mode="X",stag="Pico-dialogue-doya",value=800,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="Sin-dialogue-what",value=-730,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="見つけたぞ、お前がSinだな",interval=0.05,textinterval=3},
            --{tag="setProperty",stag="Speech.visible",value=true}, 
            {tag="setProperty",stag="Speech.flipX",value=false},
        },
        {
            {tag="setProperty",stag="Speech.y",value=300},
            {tag="setProperty",stag="Speech.x",value=20},
            {tag="PlayAnimation",stag="Speech",name="ahh"},
            {tag="Tween",mode="X",stag="Pico-dialogue-doya",value=1280,duration=0.5,Tween="circOut"},
            {tag="setProperty",stag="Pico-dialogue-doya.visible",value=false},
            {tag="setProperty",stag="Pico-dialogue-threat.x",value=800},
            {tag="setProperty",stag="Speech.flipX",value=true},
            {tag="TextString",stag="dialogueText",Text="やっと見つけたぞ！Sin！",interval=0.05,textinterval=3},
        },
        {
            {tag="TextString",stag="dialogueText",Text="依頼主の命令だ！会社に戻れ！さもないと殺す！",interval=0.05,textinterval=3},
        },
        {
            {tag="setProperty",stag="Speech.y",value=360},
            {tag="setProperty",stag="Speech.x",value=50},
            {tag="PlayAnimation",stag="Speech",name="normal"},
            {tag="Tween",mode="X",stag="Pico-dialogue-threat",value=1280,duration=0.5,Tween="circOut"},
            {tag="setProperty",stag="Cyan-dialogue-what.x",value=300},
            {tag="setProperty",stag="Cyan-dialogue-what.y",value=550},
            {tag="Tween",mode="Y",stag="Cyan-dialogue-what",value=-250,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="え、何あの人怖っ。どういうこと？",interval=0.05,textinterval=3},
            {tag="setProperty",stag="Speech.flipX",value=false},
            {tag="PlayAnimation",stag="Speech",name="middle"},
        },
        {
            {tag="Tween",mode="Y",stag="Cyan-dialogue-what",value=550,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="Sin-dialogue-normal",value=-150,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="実は…この前の一件からジラフが怖くなって \n退職届を出したんだ…",interval=0.05,textinterval=3},
            {tag="setProperty",stag="Speech.flipX",value=true},
            {tag="PlayAnimation",stag="Speech",name="normal"},
        },
        {
            {tag="TextString",stag="dialogueText",Text="でもあいつは許してくれなかったから無断で辞めてきた",interval=0.05,textinterval=3},
        },
        {
            {tag="Autotimer",timer=1},
            {tag="TextString",stag="dialogueText",Text="はあ…まさか殺し屋に依頼するとは思わ…",interval=0.05,textinterval=3},
        },
        {
            {tag="PlayAnimation",stag="dad",name="shoot"},
            {tag="PlayAnimation",stag="boyfriend",name="shoot"},
            --{tag="triggerEvent",name="Play Animation",value1="dad",value2="shoot"},
            {tag="Tween",mode="Alpha",stag="camHUD",value=0,duration=0.2,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="",interval=0.05,textinterval=3},
            {tag="playSound",sound="hankshoot",volume=1},
            {tag="triggerEvent",name="Screen Shake",value1="0.2,0.005",value2="0.2,0.005"},
            {tag="Tween",mode="X",stag="Sin-dialogue-normal",value=-730,duration=0.5,Tween="circOut"},
        },
        {
            {tag="setProperty",stag="Pico-dialogue-doya.visible",value=true},
            {tag="Tween",mode="X",stag="Pico-dialogue-doya",value=800,duration=0.5,Tween="circOut"},
            {tag="PlayAnimation",stag="dad",name="idle"},
            {tag="PlayAnimation",stag="boyfriend",name="idle"},
            {tag="Tween",mode="Alpha",stag="camHUD",value=1,duration=0.2,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="なんだ、やるじゃねえか",interval=0.05,textinterval=3},
            {tag="setProperty",stag="Speech.flipX",value=false},
        },
    },
    ["CSES"] = {
        {
            {tag="Tween",mode="Y",stag="Sin-dialogue-aaaaa",value=-250,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="Heyyy you guys! Where’s Kou!?\nYou’re friends with him right?!",interval=0.03,textinterval=1},
            {tag="setProperty",stag="Speech.flipX",value=true},
            {tag="PlayAnimation",stag="Speech",name="ahh-middle"},
            {tag="setProperty",stag="Speech.y",value=330},
            {tag="setProperty",stag="Speech.x",value=20},
        },
        {
            {tag="PlayAnimation",stag="bf-dialogue",name="what"},
            {tag="Tween",mode="X",stag="bf-dialogue",value=700,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="Y",stag="Sin-dialogue-aaaaa",value=550,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="Bo be ba!!?",interval=0.03,textinterval=1},
            {tag="PlayAnimation",stag="Speech",name="ahh"},
            {tag="setProperty",stag="Speech.y",value=300},
            {tag="setProperty",stag="Speech.flipX",value=true},
        },
        {
            {tag="Tween",mode="X",stag="Cyan-dialogue-odoroki",value=-150,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="bf-dialogue",value=1280,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="Dwaah! Sin!?",interval=0.05,textinterval=1},
            {tag="setProperty",stag="Speech.flipX",value=false},
        },
        {
            {tag="Tween",mode="X",stag="Cyan-dialogue-odoroki",value=-730,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="Y",stag="Sin-dialogue-aaaaa",value=-250,duration=0.5,Tween="circOut"},
            {tag="TextSet",stag="dialogueText",mode="size",value=30},
            {tag="setProperty",stag="dialogueText.x",value=100},
            {tag="setProperty",stag="dialogueText.y",value=480},
            {tag="TextString",stag="dialogueText",Text="Today is Robot Maintenance Day! I'm sure she's going get that\ndone soon! BF, please tell me you rap battled with Kou?\nTell me where he is! I swear if something goes wrong\nwith him during his maintenance...! ",interval=0.03,textinterval=1},
            {tag="PlayAnimation",stag="Speech",name="ahh-middle"},
            {tag="setProperty",stag="Speech.y",value=330},
        },
        {
            {tag="Tween",mode="X",stag="Cyan-dialogue-what",value=-150,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="Y",stag="Sin-dialogue-aaaaa",value=550,duration=0.5,Tween="circOut"},
            {tag="TextSet",stag="dialogueText",mode="size",value=40},
            {tag="setProperty",stag="dialogueText.x",value=150},
            {tag="setProperty",stag="dialogueText.y",value=500},
            {tag="TextString",stag="dialogueText",Text="Wh-Whoa! Take it easy, Sin!",interval=0.03,textinterval=1},
            {tag="PlayAnimation",stag="Speech",name="ahh"},
            {tag="setProperty",stag="Speech.y",value=300},
            {tag="setProperty",stag="Speech.flipX",value=false},
        },
        {
            {tag="Tween",mode="Y",stag="Sin-dialogue-aaaaa",value=-250,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="Cyan-dialogue-what",value=-730,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text=[[GYAAAAA! UWAAAAAHHH!!!]],interval=0.05,textinterval=1},
            {tag="PlayAnimation",stag="Speech",name="ahh-middle"},
            {tag="setProperty",stag="Speech.y",value=330},
            {tag="setProperty",stag="Speech.flipX",value=false},
        },
        {
            {tag="Tween",mode="X",stag="Cyan-dialogue-what",value=-150,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="Y",stag="Sin-dialogue-aaaaa",value=550,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="Sorry about Sin, he’s another one of my colleagues.\nWhen it comes to Kou, Sin’s like a monster and\ngoes nonstop talking about him.",interval=0.05,textinterval=1},
            {tag="PlayAnimation",stag="Speech",name="normal"},
            {tag="setProperty",stag="Speech.y",value=360},
            {tag="setProperty",stag="Speech.x",value=50},
            {tag="setProperty",stag="Speech.flipX",value=true},
        },
        {
            {tag="Tween",mode="X",stag="Cyan-dialogue-what",value=-730,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="Y",stag="GF-dialogue-1",value=-400,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="Kou doesn’t have any issues with maintenance or\nany problem like it last I know.\nRest assured he’ll be fine.",interval=0.05,textinterval=1},
            {tag="PlayAnimation",stag="Speech",name="middle"},
            {tag="setProperty",stag="Speech.flipX",value=false},
        },
        {
            {tag="Tween",mode="X",stag="Sin-dialogue-what",value=-150,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="Y",stag="GF-dialogue-1",value=420,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="Oh, r-really?",interval=0.05,textinterval=1},
            {tag="PlayAnimation",stag="Speech",name="normal"},
            {tag="setProperty",stag="Speech.flipX",value=true},
        },
        {
            {tag="Autotimer",timer=1},
            {tag="setProperty",stag="Sin-dialogue-what.visible",value=false},
            {tag="setProperty",stag="Sin-dialogue-haha.visible",value=true},
            {tag="setProperty",stag="Sin-dialogue-haha.x",value=-150},
            {tag="TextString",stag="dialogueText",Text="Ahhh… Sorry",interval=0.05,textinterval=1},
        },
        {
            {tag="SoundFade",fade="Out",duration=0.2,toValue=0},
            {tag="playSound",sound="hankshoot",volume=1},
            {tag="triggerEvent",name="Screen Shake",value1="0.5,0.05",value2="0.5,0.05"},
            {tag="setProperty",stag="Sin-dialogue-haha.visible",value=false},
            {tag="setProperty",stag="Sin-dialogue-what.visible",value=true},
            {tag="setProperty",stag="Sin-dialogue-what.x",value=-150},
            {tag="Tween",mode="Alpha",stag="CutBlack",value=0,duration=0.3,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="",interval=0.05,textinterval=1},
            --{tag="setProperty",stag="Speech.visible",value=false},            
        },
        {
            {tag="Tween",mode="X",stag="Pico-dialogue-doya",value=800,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="Sin-dialogue-what",value=-730,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="Found it, I'm pretty sure you're sin!",interval=0.05,textinterval=1},
            --{tag="setProperty",stag="Speech.visible",value=true}, 
            {tag="setProperty",stag="Speech.flipX",value=false},
        },
        {
            {tag="setProperty",stag="Speech.y",value=300},
            {tag="setProperty",stag="Speech.x",value=20},
            {tag="PlayAnimation",stag="Speech",name="ahh"},
            {tag="Tween",mode="X",stag="Pico-dialogue-doya",value=1280,duration=0.5,Tween="circOut"},
            {tag="setProperty",stag="Pico-dialogue-doya.visible",value=false},
            {tag="setProperty",stag="Pico-dialogue-threat.x",value=800},
            {tag="setProperty",stag="Speech.flipX",value=true},
            {tag="TextString",stag="dialogueText",Text="I will have you return to the company under\nthe order of the client! Or I will kill you!",interval=0.05,textinterval=1},
        },
        {
            {tag="setProperty",stag="Speech.y",value=360},
            {tag="setProperty",stag="Speech.x",value=50},
            {tag="PlayAnimation",stag="Speech",name="normal"},
            {tag="Tween",mode="X",stag="Pico-dialogue-threat",value=1280,duration=0.5,Tween="circOut"},
            {tag="setProperty",stag="Cyan-dialogue-what.x",value=300},
            {tag="setProperty",stag="Cyan-dialogue-what.y",value=550},
            {tag="Tween",mode="Y",stag="Cyan-dialogue-what",value=-250,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="Oh, that man is scary. So, what happened?",interval=0.05,textinterval=1},
            {tag="setProperty",stag="Speech.flipX",value=false},
            {tag="PlayAnimation",stag="Speech",name="middle"},
        },
        {
            {tag="Tween",mode="Y",stag="Cyan-dialogue-what",value=550,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="Sin-dialogue-normal",value=-150,duration=0.5,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="Actually... After the last one, I was so scared of\ngiraffes that I submitted my resignation...",interval=0.05,textinterval=1},
            {tag="setProperty",stag="Speech.flipX",value=true},
            {tag="PlayAnimation",stag="Speech",name="normal"},
        },
        {
            {tag="TextString",stag="dialogueText",Text="But that guy wouldn't let me, so I quit on my own.",interval=0.05,textinterval=1},
        },
        {
            {tag="Autotimer",timer=2.5},
            {tag="TextString",stag="dialogueText",Text="Huh... I never thought I would hire a hit ma...",interval=0.05,textinterval=1},
        },
        {
            {tag="PlayAnimation",stag="dad",name="shoot"},
            {tag="PlayAnimation",stag="boyfriend",name="shoot"},
            --{tag="triggerEvent",name="Play Animation",value1="dad",value2="shoot"},
            {tag="Tween",mode="Alpha",stag="camHUD",value=0,duration=0.2,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="",interval=0.05,textinterval=1},
            {tag="playSound",sound="hankshoot",volume=1},
            {tag="triggerEvent",name="Screen Shake",value1="0.2,0.005",value2="0.2,0.005"},
            {tag="Tween",mode="X",stag="Sin-dialogue-normal",value=-730,duration=0.5,Tween="circOut"},
        },
        {
            {tag="setProperty",stag="Pico-dialogue-doya.visible",value=true},
            {tag="Tween",mode="X",stag="Pico-dialogue-doya",value=800,duration=0.5,Tween="circOut"},
            {tag="PlayAnimation",stag="dad",name="idle"},
            {tag="PlayAnimation",stag="boyfriend",name="idle"},
            {tag="Tween",mode="Alpha",stag="camHUD",value=1,duration=0.2,Tween="circOut"},
            {tag="TextString",stag="dialogueText",Text="Heh, you're good!",interval=0.05,textinterval=1},
            {tag="setProperty",stag="Speech.flipX",value=false},
        },
    },
    ["CSJE"] = {
        {
            {tag="setProperty",stag="Speech.flipX",value=true},
            {tag="TextString",stag="dialogueText",Text="まて！ここまでだ！",interval=0.07,textinterval=3},
        },
        {
            {tag="setProperty",stag="Speech.flipX",value=false},
            {tag="TextString",stag="dialogueText",Text="なんだお前…！！",interval=0.05,textinterval=3},
        },
        {
            {tag="setProperty",stag="Speech.flipX",value=true},
            {tag="TextString",stag="dialogueText",Text="お前、 \nあの依頼人から報酬が手に入ると本気で思ってるのか？",interval=0.05,textinterval=3},
        },
        {
            {tag="setProperty",stag="Speech.flipX",value=false},
            {tag="TextString",stag="dialogueText",Text="…は？どういうことだ",interval=0.05,textinterval=3},
        },

        {
            {tag="Tween",mode="X",stag="Moya-dialogue-akire",value=800,duration=0.5,Tween="circOut"},
            {tag="setProperty",stag="Speech.flipX",value=false},
            {tag="TextString",stag="dialogueText",Text="Sinが会社から逃げたってマジで？",interval=0.05,textinterval=3},
        },
        {
            {tag="Tween",mode="X",stag="Moya-dialogue-akire",value=1400,duration=0.5,Tween="circOut"},
            {tag="setProperty",stag="Speech.y",value=300},
            {tag="setProperty",stag="Speech.x",value=20},
            {tag="PlayAnimation",stag="Speech",name="ahh"},
            {tag="PlayAnimation",stag="giraffe-dialogue",name="what"},
            {tag="setProperty",stag="Speech.flipX",value=false},
            {tag="Tween",mode="X",stag="giraffe-dialogue",value=-100,duration=0.5,Tween="circOut"},
            {tag="TextSet",stag="dialogueText",mode="size",value=35},
            {tag="TextString",stag="dialogueText",Text="ﾀﾞｯﾃﾞ！！！！！！勝手に逃げたのが悪いんだ！！ \n無理やりにでも連れ帰らせてやる！ \n最悪死んでもサイボーグにしてぶっ壊れるまでこき使ってやる！！",interval=0.03,textinterval=3},
        },
        {
            {tag="Tween",mode="X",stag="Moya-dialogue-akirewarai",value=800,duration=0.5,Tween="circOut"},
            {tag="setProperty",stag="Speech.y",value=360},
            {tag="setProperty",stag="Speech.x",value=50},
            {tag="PlayAnimation",stag="Speech",name="normal"},
            {tag="setProperty",stag="Speech.flipX",value=false},
            {tag="Tween",mode="X",stag="giraffe-dialogue",value=-550,duration=0.5,Tween="circOut"},
            {tag="TextSet",stag="dialogueText",mode="size",value=40},
            {tag="TextString",stag="dialogueText",Text="…依頼金もバカにならないだろ。 \n言っとくが経費になんてならんからな",interval=0.05,textinterval=3},
        },
        {
            {tag="Tween",mode="X",stag="Moya-dialogue-akirewarai",value=1400,duration=0.5,Tween="circOut"},
            {tag="setProperty",stag="Speech.y",value=300},
            {tag="setProperty",stag="Speech.x",value=20},
            {tag="PlayAnimation",stag="giraffe-dialogue",name="wo"},
            {tag="PlayAnimation",stag="Speech",name="ahh"},
            {tag="Tween",mode="X",stag="giraffe-dialogue",value=-100,duration=0.5,Tween="circOut"},
            {tag="setProperty",stag="Speech.flipX",value=false},
            {tag="TextString",stag="dialogueText",Text="元々払うわけねえよ！頭金がクソ高かったんだ！！！！",interval=0.03,textinterval=3},
        },
        {
            {tag="Tween",mode="X",stag="Moya-dialogue-akire",value=800,duration=0.5,Tween="circOut"},
            {tag="setProperty",stag="Speech.y",value=360},
            {tag="setProperty",stag="Speech.x",value=50},
            {tag="PlayAnimation",stag="Speech",name="normal"},
            {tag="Tween",mode="X",stag="giraffe-dialogue",value=-550,duration=0.5,Tween="circOut"},
            {tag="setProperty",stag="Speech.flipX",value=false},
            {tag="TextString",stag="dialogueText",Text="は？",interval=0.05,textinterval=3},
        },
        {
            {tag="Tween",mode="X",stag="Moya-dialogue-akirewarai",value=-560,duration=0.5,Tween="circOut"},
            {tag="setProperty",stag="Moya-dialogue-akirewarai.flipX",value=false},
            {tag="setProperty",stag="Moya-dialogue-akirewarai.visible",value=false},

            {tag="Tween",mode="X",stag="Moya-dialogue-akire",value=1400,duration=0.5,Tween="circOut"},
            {tag="setProperty",stag="Speech.y",value=300},
            {tag="setProperty",stag="Speech.x",value=20},
            {tag="PlayAnimation",stag="Speech",name="ahh"},
            {tag="setProperty",stag="Speech.flipX",value=true},
            {tag="TextString",stag="dialogueText",Text="あいつうｳｳｳｳｳｳｳｳｳｳｳ!!!!!!!!!!!!",interval=0.02,textinterval=3},
        },
        {
            {tag="TextString",stag="dialogueText",Text="お前！今あいつはどこだ！教えろ！",interval=0.02,textinterval=3},
        },
        {
            {tag="setProperty",stag="Speech.y",value=360},
            {tag="setProperty",stag="Speech.x",value=50},
            {tag="PlayAnimation",stag="Speech",name="normal"},
            {tag="setProperty",stag="Speech.flipX",value=true},
            {tag="TextString",stag="dialogueText",Text="悪い、気ままに社外をほっつき歩くような奴だから \n俺にももうわからん",interval=0.05,textinterval=3},
        },
        {
            {tag="setProperty",stag="Speech.y",value=300},
            {tag="setProperty",stag="Speech.x",value=20},
            {tag="PlayAnimation",stag="Speech",name="ahh"},
            {tag="setProperty",stag="Speech.flipX",value=true},
            {tag="TextString",stag="dialogueText",Text="クソッ！依頼は取り消しだ！",interval=0.03,textinterval=3},
        },

        {
            {tag="setProperty",stag="Speech.y",value=360},
            {tag="setProperty",stag="Speech.x",value=50},
            {tag="PlayAnimation",stag="Speech",name="normal"},
            {tag="setProperty",stag="Speech.flipX",value=false},
            {tag="TextString",stag="dialogueText",Text="録音して言質とっておくなんて流石、抜け目ないね",interval=0.05,textinterval=3},
        },
        {
            {tag="setProperty",stag="Moya-dialogue-akirewarai.visible",value=true},
            {tag="Tween",mode="X",stag="Moya-dialogue-akirewarai",value=0,duration=0.5,Tween="circOut"},
            {tag="setProperty",stag="Speech.flipX",value=true},
            {tag="TextString",stag="dialogueText",Text="いや、今までも録音はしてたんだ。 \nアイツの不祥事を物的証拠で集めとけば、 \n訴訟起こした時勝ちやすいだろ",interval=0.05,textinterval=3},
        },
        {
            {tag="PlayAnimation",stag="bf-dialogue",name="normal"},
            {tag="Tween",mode="X",stag="bf-dialogue",value=700,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="Moya-dialogue-akirewarai",value=-560,duration=0.5,Tween="circOut"},
            {tag="setProperty",stag="Speech.flipX",value=false},
            {tag="TextString",stag="dialogueText",Text="bee...",interval=0.05,textinterval=1},
        },
        {
            {tag="Tween",mode="Y",stag="GF-dialogue-1",value=-400,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="bf-dialogue",value=1280,duration=0.5,Tween="circOut"},
            {tag="setProperty",stag="Speech.flipX",value=false},
            {tag="PlayAnimation",stag="Speech",name="middle"},
            {tag="TextString",stag="dialogueText",Text="人望ないわね、あのファンボーイ",interval=0.05,textinterval=3},
        },
    },
    ["CSEE"] = {
        {
            {tag="setProperty",stag="Speech.flipX",value=true},
            {tag="TextString",stag="dialogueText",Text="まて！ここまでだ！",interval=0.07,textinterval=3},
        },
        {
            {tag="setProperty",stag="Speech.flipX",value=false},
            {tag="TextString",stag="dialogueText",Text="なんだお前…！！",interval=0.05,textinterval=3},
        },
        {
            {tag="setProperty",stag="Speech.flipX",value=true},
            {tag="TextString",stag="dialogueText",Text="お前、 \nあの依頼人から報酬が手に入ると本気で思ってるのか？",interval=0.05,textinterval=3},
        },
        {
            {tag="setProperty",stag="Speech.flipX",value=false},
            {tag="TextString",stag="dialogueText",Text="…は？どういうことだ",interval=0.05,textinterval=3},
        },

        {
            {tag="Tween",mode="X",stag="Moya-dialogue-akire",value=800,duration=0.5,Tween="circOut"},
            {tag="setProperty",stag="Speech.flipX",value=false},
            {tag="TextString",stag="dialogueText",Text="Sinが会社から逃げたってマジで？",interval=0.05,textinterval=3},
        },
        {
            {tag="Tween",mode="X",stag="Moya-dialogue-akire",value=1400,duration=0.5,Tween="circOut"},
            {tag="setProperty",stag="Speech.y",value=300},
            {tag="setProperty",stag="Speech.x",value=20},
            {tag="PlayAnimation",stag="Speech",name="ahh"},
            {tag="PlayAnimation",stag="giraffe-dialogue",name="what"},
            {tag="setProperty",stag="Speech.flipX",value=false},
            {tag="Tween",mode="X",stag="giraffe-dialogue",value=-100,duration=0.5,Tween="circOut"},
            {tag="TextSet",stag="dialogueText",mode="size",value=35},
            {tag="TextString",stag="dialogueText",Text="ﾀﾞｯﾃﾞ！！！！！！勝手に逃げたのが悪いんだ！！ \n無理やりにでも連れ帰らせてやる！ \n最悪死んでもサイボーグにしてぶっ壊れるまでこき使ってやる！！",interval=0.03,textinterval=3},
        },
        {
            {tag="Tween",mode="X",stag="Moya-dialogue-akirewarai",value=800,duration=0.5,Tween="circOut"},
            {tag="setProperty",stag="Speech.y",value=360},
            {tag="setProperty",stag="Speech.x",value=50},
            {tag="PlayAnimation",stag="Speech",name="normal"},
            {tag="setProperty",stag="Speech.flipX",value=false},
            {tag="Tween",mode="X",stag="giraffe-dialogue",value=-550,duration=0.5,Tween="circOut"},
            {tag="TextSet",stag="dialogueText",mode="size",value=40},
            {tag="TextString",stag="dialogueText",Text="…依頼金もバカにならないだろ。 \n言っとくが経費になんてならんからな",interval=0.05,textinterval=3},
        },
        {
            {tag="Tween",mode="X",stag="Moya-dialogue-akirewarai",value=1400,duration=0.5,Tween="circOut"},
            {tag="setProperty",stag="Speech.y",value=300},
            {tag="setProperty",stag="Speech.x",value=20},
            {tag="PlayAnimation",stag="giraffe-dialogue",name="wo"},
            {tag="PlayAnimation",stag="Speech",name="ahh"},
            {tag="Tween",mode="X",stag="giraffe-dialogue",value=-100,duration=0.5,Tween="circOut"},
            {tag="setProperty",stag="Speech.flipX",value=false},
            {tag="TextString",stag="dialogueText",Text="元々払うわけねえよ！頭金がクソ高かったんだ！！！！",interval=0.03,textinterval=3},
        },
        {
            {tag="Tween",mode="X",stag="Moya-dialogue-akire",value=800,duration=0.5,Tween="circOut"},
            {tag="setProperty",stag="Speech.y",value=360},
            {tag="setProperty",stag="Speech.x",value=50},
            {tag="PlayAnimation",stag="Speech",name="normal"},
            {tag="Tween",mode="X",stag="giraffe-dialogue",value=-550,duration=0.5,Tween="circOut"},
            {tag="setProperty",stag="Speech.flipX",value=false},
            {tag="TextString",stag="dialogueText",Text="は？",interval=0.05,textinterval=3},
        },
        {
            {tag="Tween",mode="X",stag="Moya-dialogue-akirewarai",value=-560,duration=0.5,Tween="circOut"},
            {tag="setProperty",stag="Moya-dialogue-akirewarai.flipX",value=false},
            {tag="setProperty",stag="Moya-dialogue-akirewarai.visible",value=false},

            {tag="Tween",mode="X",stag="Moya-dialogue-akire",value=1400,duration=0.5,Tween="circOut"},
            {tag="setProperty",stag="Speech.y",value=300},
            {tag="setProperty",stag="Speech.x",value=20},
            {tag="PlayAnimation",stag="Speech",name="ahh"},
            {tag="setProperty",stag="Speech.flipX",value=true},
            {tag="TextString",stag="dialogueText",Text="あいつうｳｳｳｳｳｳｳｳｳｳｳ!!!!!!!!!!!!",interval=0.02,textinterval=3},
        },
        {
            {tag="TextString",stag="dialogueText",Text="お前！今あいつはどこだ！教えろ！",interval=0.02,textinterval=3},
        },
        {
            {tag="setProperty",stag="Speech.y",value=360},
            {tag="setProperty",stag="Speech.x",value=50},
            {tag="PlayAnimation",stag="Speech",name="normal"},
            {tag="setProperty",stag="Speech.flipX",value=true},
            {tag="TextString",stag="dialogueText",Text="悪い、気ままに社外をほっつき歩くような奴だから \n俺にももうわからん",interval=0.05,textinterval=3},
        },
        {
            {tag="setProperty",stag="Speech.y",value=300},
            {tag="setProperty",stag="Speech.x",value=20},
            {tag="PlayAnimation",stag="Speech",name="ahh"},
            {tag="setProperty",stag="Speech.flipX",value=true},
            {tag="TextString",stag="dialogueText",Text="クソッ！依頼は取り消しだ！",interval=0.03,textinterval=3},
        },

        {
            {tag="setProperty",stag="Speech.y",value=360},
            {tag="setProperty",stag="Speech.x",value=50},
            {tag="PlayAnimation",stag="Speech",name="normal"},
            {tag="setProperty",stag="Speech.flipX",value=false},
            {tag="TextString",stag="dialogueText",Text="録音して言質とっておくなんて流石、抜け目ないね",interval=0.05,textinterval=3},
        },
        {
            {tag="setProperty",stag="Moya-dialogue-akirewarai.visible",value=true},
            {tag="Tween",mode="X",stag="Moya-dialogue-akirewarai",value=0,duration=0.5,Tween="circOut"},
            {tag="setProperty",stag="Speech.flipX",value=true},
            {tag="TextString",stag="dialogueText",Text="いや、今までも録音はしてたんだ。 \nアイツの不祥事を物的証拠で集めとけば、 \n訴訟起こした時勝ちやすいだろ",interval=0.05,textinterval=3},
        },
        {
            {tag="PlayAnimation",stag="bf-dialogue",name="normal"},
            {tag="Tween",mode="X",stag="bf-dialogue",value=700,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="Moya-dialogue-akirewarai",value=-560,duration=0.5,Tween="circOut"},
            {tag="setProperty",stag="Speech.flipX",value=false},
            {tag="TextString",stag="dialogueText",Text="bee...",interval=0.05,textinterval=1},
        },
        {
            {tag="Tween",mode="Y",stag="GF-dialogue-1",value=-400,duration=0.5,Tween="circOut"},
            {tag="Tween",mode="X",stag="bf-dialogue",value=1280,duration=0.5,Tween="circOut"},
            {tag="setProperty",stag="Speech.flipX",value=false},
            {tag="PlayAnimation",stag="Speech",name="middle"},
            {tag="TextString",stag="dialogueText",Text="人望ないわね、あのファンボーイ",interval=0.05,textinterval=3},
        },
    },
}

local DialogueEndDatas = {
    ["RNKJ"] = {
        {tag="Tween",mode="X",stag="bf-dialogue",value=1280,duration=1,Tween="circOut"},
        {tag="Tween",mode="X",stag="giraffe-dialogue",value=-700,duration=1,Tween="circOut"},
        {tag="Tween",mode="Alpha",stag="bf-dialogue",value=0,duration=1,Tween="circOut"},
        {tag="Tween",mode="Alpha",stag="giraffe-dialogue",value=-0,duration=1,Tween="circOut"},
        {tag="Tween",mode="Alpha",stag="Speech",value=0,duration=1,Tween="circOut"},
        
        {tag="Tween",mode="Y",stag="GF-dialogue-6",value=200,duration=1,Tween="circOut"},
        {tag="Tween",mode="Alpha",stag="GF-dialogue-6",value=0,duration=1,Tween="circOut"},
        
        {tag="RemoveSprite",stag="bf-dialogue-YB"},

        {tag="RemoveSprite",stag="GF-dialogue-1"},
        {tag="RemoveSprite",stag="GF-dialogue-5"},
        {tag="RemoveText",stag='dialogueText'},
        {tag="SoundFade",fade="Out",duration=0.5,toValue=0},
    },
    ["RNKE"] = {
        {tag="Tween",mode="X",stag="bf-dialogue",value=1280,duration=1,Tween="circOut"},
        {tag="Tween",mode="X",stag="giraffe-dialogue",value=-700,duration=1,Tween="circOut"},
        {tag="Tween",mode="Alpha",stag="bf-dialogue",value=0,duration=1,Tween="circOut"},
        {tag="Tween",mode="Alpha",stag="giraffe-dialogue",value=-0,duration=1,Tween="circOut"},
        {tag="Tween",mode="Alpha",stag="Speech",value=0,duration=1,Tween="circOut"},
        
        {tag="Tween",mode="Y",stag="GF-dialogue-6",value=200,duration=1,Tween="circOut"},
        {tag="Tween",mode="Alpha",stag="GF-dialogue-6",value=0,duration=1,Tween="circOut"},
        
        {tag="RemoveSprite",stag="bf-dialogue-YB"},
        
        {tag="RemoveSprite",stag="GF-dialogue-1"},
        {tag="RemoveSprite",stag="GF-dialogue-5"},
        
        {tag="RemoveText",stag='dialogueText'},
        {tag="SoundFade",fade="Out",duration=0.5,toValue=0},
    },
    ["TTEJ"] = {
        {tag="Tween",mode="X",stag="bf-dialogue",value=1280,duration=1,Tween="circOut"},
        {tag="Tween",mode="X",stag="giraffe-dialogue",value=-700,duration=1,Tween="circOut"},
        {tag="Tween",mode="Alpha",stag="bf-dialogue",value=0,duration=1,Tween="circOut"},
        {tag="Tween",mode="Alpha",stag="giraffe-dialogue",value=-0,duration=1,Tween="circOut"},
        {tag="Tween",mode="Alpha",stag="Speech",value=0,duration=1,Tween="circOut"},
        
        --{tag="Tween",mode="Y",stag="GF-dialogue-6",value=200,duration=1,Tween="circOut"},
        --{tag="Tween",mode="Alpha",stag="GF-dialogue-6",value=0,duration=1,Tween="circOut"},

        {tag="RemoveSprite",stag="GF-dialogue-1"},
        {tag="RemoveSprite",stag="GF-dialogue-3"},
        {tag="RemoveSprite",stag="GF-dialogue-5"},
        {tag="RemoveSprite",stag="GF-dialogue-6"},
        
        {tag="RemoveText",stag='dialogueText'},
        {tag="SoundFade",fade="Out",duration=0.5,toValue=0},
    },
    ["TTEE"] = {
        {tag="Tween",mode="X",stag="bf-dialogue",value=1280,duration=1,Tween="circOut"},
        {tag="Tween",mode="X",stag="giraffe-dialogue",value=-700,duration=1,Tween="circOut"},
        {tag="Tween",mode="Alpha",stag="bf-dialogue",value=0,duration=1,Tween="circOut"},
        {tag="Tween",mode="Alpha",stag="giraffe-dialogue",value=-0,duration=1,Tween="circOut"},
        {tag="Tween",mode="Alpha",stag="Speech",value=0,duration=1,Tween="circOut"},
        
        --{tag="Tween",mode="Y",stag="GF-dialogue-6",value=200,duration=1,Tween="circOut"},
        --{tag="Tween",mode="Alpha",stag="GF-dialogue-6",value=0,duration=1,Tween="circOut"},

        {tag="RemoveSprite",stag="GF-dialogue-1"},
        {tag="RemoveSprite",stag="GF-dialogue-3"},
        {tag="RemoveSprite",stag="GF-dialogue-5"},
        {tag="RemoveSprite",stag="GF-dialogue-6"},
        
        {tag="RemoveText",stag='dialogueText'},
        {tag="SoundFade",fade="Out",duration=0.5,toValue=0},
    },
    ["LOJS"] = {
        {tag="Autotimer",timer=0.2},
        {tag="RemoveText",stag='dialogueText'},
        {tag="RemoveText",stag='dialogueText2'},
        {tag="SoundFade",fade="Out",duration=0.5,toValue=0},
        {tag="RemoveSprite",stag="cutimage"},
        --{tag="RemoveSprite",stag="Speech"},
        {tag="Tween",mode="Alpha",stag="Speech",value=0,duration=1,Tween="circOut"},
        {tag="RemoveSprite",stag="Moya-dialogue-normal"},
        {tag="RemoveSprite",stag="Moya-dialogue-akire"},
        {tag="RemoveSprite",stag="Moya-dialogue-akre"},
        {tag="RemoveSprite",stag="GF-dialogue-3"},
        {tag="RemoveSprite",stag="GF-dialogue-5"},
        {tag="RemoveSprite",stag="GF-dialogue-6"},
        {tag="Tween",mode="X",stag="Gira-dialogue-Devil",value=-800,duration=0.5,Tween="circOut"},
    },
    ["LOJE"] = {
        --{tag="triggerEvent",name="BlackOut",value1="false",value2=""},
        {tag="RemoveText",stag='dialogueText'},
        {tag="SoundFade",fade="Out",duration=0.5,toValue=0},
        {tag="RemoveSprite",stag="cutimage"},
    },
    ["LOES"] = {
        {tag="Autotimer",timer=0.2},
        {tag="RemoveText",stag='dialogueText'},
        {tag="RemoveText",stag='dialogueText2'},
        {tag="SoundFade",fade="Out",duration=0.5,toValue=0},
        {tag="RemoveSprite",stag="cutimage"},
        --{tag="RemoveSprite",stag="Speech"},
        {tag="Tween",mode="Alpha",stag="Speech",value=0,duration=1,Tween="circOut"},
        {tag="RemoveSprite",stag="Moya-dialogue-normal"},
        {tag="RemoveSprite",stag="Moya-dialogue-akire"},
        {tag="RemoveSprite",stag="Moya-dialogue-akre"},
        {tag="RemoveSprite",stag="GF-dialogue-3"},
        {tag="RemoveSprite",stag="GF-dialogue-5"},
        {tag="RemoveSprite",stag="GF-dialogue-6"},
        {tag="Tween",mode="X",stag="Gira-dialogue-Devil",value=-800,duration=0.5,Tween="circOut"},
    },
    ["LOEE"] = {
        --{tag="triggerEvent",name="BlackOut",value1="false",value2=""},
        {tag="RemoveText",stag='dialogueText'},
        {tag="SoundFade",fade="Out",duration=0.5,toValue=0},
        {tag="RemoveSprite",stag="cutimage"},
    },
    ["SMTJ"] = {
        {tag="Tween",mode="Alpha",stag="Speech",value=0,duration=1,Tween="circOut"},

        {tag="RemoveText",stag='dialogueText'},
        {tag="SoundFade",fade="Out",duration=0.5,toValue=0},

        {tag="RemoveSprite",stag="bf-dialogue"},
        {tag="RemoveSprite",stag="Moya-dialogue-normal"},
        {tag="RemoveSprite",stag="Moya-dialogue-akirewarai"},
        {tag="RemoveSprite",stag="GF-dialogue-1"},
        {tag="RemoveSprite",stag="GF-dialogue-4"},
        {tag="RemoveSprite",stag="GF-dialogue-norm"},
        {tag="Tween",mode="X",stag="Moya-dialogue-smile",value=-560,duration=0.5,Tween="circOut"},
        {tag="Tween",mode="Alpha",stag="Moya-dialogue-smile",value=0,duration=0.5,Tween="circOut"},
    },
    ["SMTE"] = {
        {tag="Tween",mode="Alpha",stag="Speech",value=0,duration=1,Tween="circOut"},

        {tag="RemoveText",stag='dialogueText'},
        {tag="SoundFade",fade="Out",duration=0.5,toValue=0},

        {tag="RemoveSprite",stag="bf-dialogue"},
        {tag="RemoveSprite",stag="Moya-dialogue-normal"},
        {tag="RemoveSprite",stag="Moya-dialogue-akirewarai"},
        {tag="RemoveSprite",stag="GF-dialogue-1"},
        {tag="RemoveSprite",stag="GF-dialogue-4"},
        {tag="RemoveSprite",stag="GF-dialogue-norm"},
        {tag="Tween",mode="X",stag="Moya-dialogue-smile",value=-560,duration=0.5,Tween="circOut"},
        {tag="Tween",mode="Alpha",stag="Moya-dialogue-smile",value=0,duration=0.5,Tween="circOut"},
    },
    ["CYWJ"] = {
        {tag="Tween",mode="Alpha",stag="Speech",value=0,duration=1,Tween="circOut"},

        {tag="RemoveText",stag='dialogueText'},
        {tag="SoundFade",fade="Out",duration=0.5,toValue=0},

        {tag="RemoveSprite",stag="Moya-dialogue-smile"},
        {tag="RemoveSprite",stag="bf-dialogue"},
        {tag="RemoveSprite",stag="Moya-dialogue-akre"},
        {tag="RemoveSprite",stag="Moya-dialogue-normal"},
        {tag="RemoveSprite",stag="Cyan-dialogue-normal"},
        {tag="RemoveSprite",stag="Cyan-dialogue-doya"},

        {tag="Tween",mode="X",stag="Cyan-dialogue-ha",value=-730,duration=0.5,Tween="circOut"},
        {tag="Tween",mode="Alpha",stag="Cyan-dialogue-ha",value=0,duration=0.5,Tween="circOut"},
    },
    ["CYWE"] = {
        {tag="Tween",mode="Alpha",stag="Speech",value=0,duration=1,Tween="circOut"},

        {tag="RemoveText",stag='dialogueText'},
        {tag="SoundFade",fade="Out",duration=0.5,toValue=0},

        {tag="RemoveSprite",stag="Moya-dialogue-smile"},
        {tag="RemoveSprite",stag="bf-dialogue"},
        {tag="RemoveSprite",stag="Moya-dialogue-akre"},
        {tag="RemoveSprite",stag="Moya-dialogue-normal"},
        {tag="RemoveSprite",stag="Cyan-dialogue-normal"},
        {tag="RemoveSprite",stag="Cyan-dialogue-doya"},

        {tag="Tween",mode="X",stag="Cyan-dialogue-ha",value=-730,duration=0.5,Tween="circOut"},
        {tag="Tween",mode="Alpha",stag="Cyan-dialogue-ha",value=0,duration=0.5,Tween="circOut"},
    },
    ["CSJS"] = {
        {tag="Tween",mode="Alpha",stag="Speech",value=0,duration=1,Tween="circOut"},

        {tag="RemoveSprite",stag="bf-dialogue"},
        {tag="RemoveSprite",stag="Sin-dialogue-aaaaa"},
        {tag="RemoveSprite",stag="Sin-dialogue-what"},
        {tag="RemoveSprite",stag="Sin-dialogue-normal"},
        {tag="RemoveSprite",stag="GF-dialogue-1"},
        {tag="RemoveSprite",stag="Sin-dialogue-haha"},
        --{tag="RemoveSprite",stag="Sin-dialogue-normal"},
        {tag="RemoveSprite",stag="Cyan-dialogue-odoroki"},
        {tag="RemoveSprite",stag="Cyan-dialogue-what"},
        {tag="RemoveSprite",stag="CutBlack"},

        {tag="Tween",mode="Alpha",stag="camHUD",value=1,duration=0.2,Tween="circOut"},
        {tag="RemoveText",stag='dialogueText'},
        {tag="SoundFade",fade="Out",duration=0.5,toValue=0},
        {tag="Tween",mode="X",stag="Pico-dialogue-doya",value=1280,duration=0.5,Tween="circOut"},
        {tag="Tween",mode="Alpha",stag="Pico-dialogue-doya",value=0,duration=0.5,Tween="circOut"},
    },
    ["CSES"] = {
        {tag="Tween",mode="Alpha",stag="Speech",value=0,duration=1,Tween="circOut"},

        {tag="RemoveSprite",stag="bf-dialogue"},
        {tag="RemoveSprite",stag="Sin-dialogue-aaaaa"},
        {tag="RemoveSprite",stag="Sin-dialogue-what"},
        {tag="RemoveSprite",stag="Sin-dialogue-normal"},
        {tag="RemoveSprite",stag="GF-dialogue-1"},
        {tag="RemoveSprite",stag="Sin-dialogue-haha"},
        --{tag="RemoveSprite",stag="Sin-dialogue-normal"},
        {tag="RemoveSprite",stag="Cyan-dialogue-odoroki"},
        {tag="RemoveSprite",stag="Cyan-dialogue-what"},
        {tag="RemoveSprite",stag="CutBlack"},

        {tag="Tween",mode="Alpha",stag="camHUD",value=1,duration=0.2,Tween="circOut"},
        {tag="RemoveText",stag='dialogueText'},
        {tag="SoundFade",fade="Out",duration=0.5,toValue=0},
        {tag="Tween",mode="X",stag="Pico-dialogue-doya",value=1280,duration=0.5,Tween="circOut"},
        {tag="Tween",mode="Alpha",stag="Pico-dialogue-doya",value=0,duration=0.5,Tween="circOut"},
    },
    ["CSJE"] = {
        {tag="Tween",mode="Alpha",stag="Speech",value=0,duration=1,Tween="circOut"},

        {tag="Tween",mode="Y",stag="GF-dialogue-1",value=420,duration=0.5,Tween="circOut"},
        {tag="Tween",mode="Alpha",stag="GF-dialogue-1",value=0,duration=0.5,Tween="circOut"},
        {tag="RemoveText",stag='dialogueText'},
        {tag="SoundFade",fade="Out",duration=0.5,toValue=0},
        {tag="RemoveText",stag="dialogueScrappedText"},
    },
    ["CSEE"] = {
        {tag="Tween",mode="Alpha",stag="Speech",value=0,duration=1,Tween="circOut"},

        {tag="Tween",mode="Y",stag="GF-dialogue-1",value=420,duration=0.5,Tween="circOut"},
        {tag="Tween",mode="Alpha",stag="GF-dialogue-1",value=0,duration=0.5,Tween="circOut"},
        {tag="RemoveText",stag='dialogueText'},
        {tag="SoundFade",fade="Out",duration=0.5,toValue=0},
        {tag="RemoveText",stag="dialogueScrappedText"},
    },
}

local DialogueSkipDatas = {
    ["Sample"] = {
        {debugPrint="Dialogue Skipped"},
    },
};

local DialogueDataLists = {
    {tagName = "RankerJ",fileName="RNKJ",skipmode=true},
    {tagName = "RankerE",fileName="RNKE",skipmode=true},
    {tagName = "Total Exhaustion J",fileName="TTEJ",skipmode=true},
    {tagName = "Total Exhaustion E",fileName="TTEE",skipmode=true},
    {tagName = "Lost Oneself J-S",fileName="LOJS",skipmode=true},
    {tagName = "Lost Oneself E-S",fileName="LOES",skipmode=true},
    {tagName = "Lost Oneself J-E",fileName="LOJE",skipmode=true},
    {tagName = "Lost Oneself E-E",fileName="LOEE",skipmode=true},
    {tagName = "SmokeTest J",fileName="SMTJ",skipmode=true},
    {tagName = "SmokeTest E",fileName="SMTE",skipmode=true},
    {tagName = "CyanWaver J",fileName="CYWJ",skipmode=true},
    {tagName = "CyanWaver E",fileName="CYWE",skipmode=true},
    {tagName = "Cosmos Sign J-S",fileName="CSJS",skipmode=true},
    {tagName = "Cosmos Sign E-S",fileName="CSES",skipmode=true},
    {tagName = "Cosmos Sign J-E",fileName="CSJE",skipmode=true},
    {tagName = "Cosmos Sign E-E",fileName="CSEE",skipmode=true},
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