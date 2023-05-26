function onCreatePost()
        runHaxeCode([[
            game.initLuaShader('blur');

            shader0 = game.createRuntimeShader('blur');

            game.camGame.setFilters([new ShaderFilter(shader0)]);
            ]])
        runHaxeCode([[
            game.initLuaShader('aberration');

            shader0 = game.createRuntimeShader('aberration');

            game.camGame.setFilters([new ShaderFilter(shader0)]);
            shader0.setFloat('aberration',0.02);
            shader0.setFloat('effectTime',0.1);
            ]])
end
