function onCreatePost()
    luaDebugMode = true
    addHaxeLibrary("PlayState")
    addHaxeLibrary("Lua", "llua")
    addHaxeLibrary("LuaL", "llua")
    addHaxeLibrary("State", "llua")
    addHaxeLibrary("Convert", "llua")
    addHaxeLibrary('Lua_helper', 'llua')
    addHaxeLibrary("StrumNote")
    addHaxeLibrary("Reflect")
    addHaxeLibrary("Type.ValueType")
    addHaxeLibrary("Type")
    addHaxeLibrary("Std")
    addHaxeLibrary("StringTools")
    addHaxeLibrary("FlxTypedGroup")
    runHaxeCode([[
        var g:PlayState = FlxG.state;
        game = g;

        //strumNoteTextures = ["NOTE_assets", "NOTE_assets", "NOTE_assets", "NOTE_assets", "NOTE_assets", "NOTE_assets", "NOTE_assets", "NOTE_assets"];

        function getInstance()
        {
            return game.isDead ? GameOverSubstate.instance : game;
        }
        
        for (flua in game.luaArray)
        {

            //HAHAHAHAHA LMAO

            Lua_helper.add_callback(flua.lua, "doTweenX", function(tag:String, vars:String, value:Dynamic, duration:Float, ?ease:String = "linear") {
                var penisExam:Dynamic = flua.tweenShit(tag, vars);
                if(penisExam != null) {
                    game.modchartTweens.set(tag, FlxTween.tween(penisExam, {x: value}, duration, {ease: flua.getFlxEaseByString(ease),
                        onComplete: function(twn:FlxTween) {
                            game.callOnLuas('onTweenCompleted', [tag]);
                            game.modchartTweens.remove(tag);
                        }
                    }));
                } else {
                    luaTrace('doTweenX: Couldnt find object: ' + vars, false, false, FlxColor.RED);
                }
            });

            Lua_helper.add_callback(flua.lua, "doTweenY", function(tag:String, vars:String, value:Dynamic, duration:Float, ?ease:String = "linear") {
                var penisExam:Dynamic = flua.tweenShit(tag, vars);
                if(penisExam != null) {
                    game.modchartTweens.set(tag, FlxTween.tween(penisExam, {y: value}, duration, {ease: flua.getFlxEaseByString(ease),
                        onComplete: function(twn:FlxTween) {
                            game.callOnLuas('onTweenCompleted', [tag]);
                            game.modchartTweens.remove(tag);
                        }
                    }));
                } else {
                    luaTrace('doTweenY: Couldnt find object: ' + vars, false, false, FlxColor.RED);
                }
            });

            Lua_helper.add_callback(flua.lua, "doTweenAlpha", function(tag:String, vars:String, value:Dynamic, duration:Float, ?ease:String = "linear") {
                var penisExam:Dynamic = flua.tweenShit(tag, vars);
                if(penisExam != null) {
                    game.modchartTweens.set(tag, FlxTween.tween(penisExam, {alpha: value}, duration, {ease: flua.getFlxEaseByString(ease),
                        onComplete: function(twn:FlxTween) {
                            game.callOnLuas('onTweenCompleted', [tag]);
                            game.modchartTweens.remove(tag);
                        }
                    }));
                } else {
                    luaTrace('doTweenAlpha: Couldnt find object: ' + vars, false, false, FlxColor.RED);
                }
            });

            Lua_helper.add_callback(flua.lua, "doTweenAngle", function(tag:String, vars:String, value:Dynamic, duration:Float, ?ease:String = "linear") {
                var penisExam:Dynamic = flua.tweenShit(tag, vars);
                if(penisExam != null) {
                    game.modchartTweens.set(tag, FlxTween.tween(penisExam, {angle: value}, duration, {ease: flua.getFlxEaseByString(ease),
                        onComplete: function(twn:FlxTween) {
                            game.callOnLuas('onTweenCompleted', [tag]);
                            game.modchartTweens.remove(tag);
                        }
                    }));
                } else {
                    luaTrace('doTweenAngle: Couldnt find object: ' + vars, false, false, FlxColor.RED);
                }
            });

            Lua_helper.add_callback(flua.lua, "doTweenZoom", function(tag:String, vars:String, value:Dynamic, duration:Float, ?ease:String = "linear") {
                var penisExam:Dynamic = flua.tweenShit(tag, vars);
                if(penisExam != null) {
                    game.modchartTweens.set(tag, FlxTween.tween(penisExam, {zoom: value}, duration, {ease: flua.getFlxEaseByString(ease),
                        onComplete: function(twn:FlxTween) {
                            game.callOnLuas('onTweenCompleted', [tag]);
                            game.modchartTweens.remove(tag);
                        }
                    }));
                } else {
                    luaTrace('doTweenZoom: Couldnt find object: ' + vars, false, false, FlxColor.RED);
                }
            });

            Lua_helper.add_callback(flua.lua, "noteTweenX", function(tag:String, note:Int, value:Dynamic, duration:Float, ?ease:String = "linear") {
                flua.cancelTween(tag);
                if(note < 0) note = 0;
                var testicle:StrumNote = game.strumLineNotes.members[note % game.strumLineNotes.length];
    
                if(testicle != null) {
                    game.modchartTweens.set(tag, FlxTween.tween(testicle, {x: value}, duration, {ease: flua.getFlxEaseByString(ease),
                        onComplete: function(twn:FlxTween) {
                            game.callOnLuas('onTweenCompleted', [tag]);
                            game.modchartTweens.remove(tag);
                        }
                    }));
                }
            });

            Lua_helper.add_callback(flua.lua, "noteTweenY", function(tag:String, note:Int, value:Dynamic, duration:Float, ?ease:String = "linear") {
                flua.cancelTween(tag);
                if(note < 0) note = 0;
                var testicle:StrumNote = game.strumLineNotes.members[note % game.strumLineNotes.length];
    
                if(testicle != null) {
                    game.modchartTweens.set(tag, FlxTween.tween(testicle, {y: value}, duration, {ease: flua.getFlxEaseByString(ease),
                        onComplete: function(twn:FlxTween) {
                            game.callOnLuas('onTweenCompleted', [tag]);
                            game.modchartTweens.remove(tag);
                        }
                    }));
                }
            });

            Lua_helper.add_callback(flua.lua, "noteTweenAlpha", function(tag:String, note:Int, value:Dynamic, duration:Float, ?ease:String = "linear") {
                flua.cancelTween(tag);
                if(note < 0) note = 0;
                var testicle:StrumNote = game.strumLineNotes.members[note % game.strumLineNotes.length];
    
                if(testicle != null) {
                    game.modchartTweens.set(tag, FlxTween.tween(testicle, {alpha: value}, duration, {ease: flua.getFlxEaseByString(ease),
                        onComplete: function(twn:FlxTween) {
                            game.callOnLuas('onTweenCompleted', [tag]);
                            game.modchartTweens.remove(tag);
                        }
                    }));
                }
            });
            
            Lua_helper.add_callback(flua.lua, "noteTweenAngle", function(tag:String, note:Int, value:Dynamic, duration:Float, ?ease:String = "linear") {
                flua.cancelTween(tag);
                if(note < 0) note = 0;
                var testicle:StrumNote = game.strumLineNotes.members[note % game.strumLineNotes.length];
    
                if(testicle != null) {
                    game.modchartTweens.set(tag, FlxTween.tween(testicle, {angle: value}, duration, {ease: flua.getFlxEaseByString(ease),
                        onComplete: function(twn:FlxTween) {
                            game.callOnLuas('onTweenCompleted', [tag]);
                            game.modchartTweens.remove(tag);
                        }
                    }));
                }
            });
            
            Lua_helper.add_callback(flua.lua, "noteTweenDirection", function(tag:String, note:Int, value:Dynamic, duration:Float, ?ease:String = "linear") {
                flua.cancelTween(tag);
                if(note < 0) note = 0;
                var testicle:StrumNote = game.strumLineNotes.members[note % game.strumLineNotes.length];
    
                if(testicle != null) {
                    game.modchartTweens.set(tag, FlxTween.tween(testicle, {direction: value}, duration, {ease: flua.getFlxEaseByString(ease),
                        onComplete: function(twn:FlxTween) {
                            game.callOnLuas('onTweenCompleted', [tag]);
                            game.modchartTweens.remove(tag);
                        }
                    }));
                }
            });

            Lua_helper.remove_callback(flua.lua, "setPropertyFromGroup");
            Lua_helper.add_callback(flua.lua, "setPropertyFromGroup", function(obj:String, index:Int, variable:Dynamic, value:Dynamic) {
                var shitMyPants = obj.split('.');
                var realObject:Dynamic = Reflect.getProperty(getInstance(), obj);
                if(shitMyPants.length>1)
                    realObject = FunkinLua.getPropertyLoopThingWhatever(shitMyPants, true, false);


                if(Std.isOfType(realObject, FlxTypedGroup) || obj == "notes" || obj == "strumLineNotes" || obj == "playerStrums" || obj == "opponentStrums" || obj == "boyfriendGroup" || obj == "dadGroup" || obj == "gfGroup") {
                    flua.setGroupStuff(realObject.members[index], variable, value);
                    return;
                }
    
                var leArray:Dynamic = realObject[index];
                if(leArray != null) {
                    flua.setGroupStuff(leArray, variable, value);
                }
            });

            trace("NOW " + flua.scriptName + " HAVE MODCHART FUNCTIONS FUNNY");
        }
    ]])
end

function onSongStart()
    -- noteTweenY("oakdao", 0, 600, 5, "expoOut")
end