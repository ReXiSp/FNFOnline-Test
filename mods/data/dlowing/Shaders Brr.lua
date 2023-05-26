function onCreatePost()
        runHaxeCode([[
            game.initLuaShader('blur');

            shader0 = game.createRuntimeShader('blur');

            game.camGame.setFilters([new ShaderFilter(shader0)]);
            ]])
end
