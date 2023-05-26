
local isGiraffeSong = false
local giraffeSongs = {
    "total-exhaustion",
    "ranker",
    "lost-oneself",
    "smoke-test",
    "cyanwaver",
    "cosmos-sign",
    -- "giragus"
    "giantkilling",
    "giantkilling-old",
    "too-fest",
    "leaked-it-myself",
    "tutorial-remix"
}

function math.lerp(a, b, ratio)

    return a + ratio * (b - a)
    
end

function math.boundTo(value, min, max)
    return math.max(min, math.min(max, value))
end

function math.floorDecimal(value, decimals)
    if decimals < 1 then
        return math.floor(value)
    end

    local tempMult = 1
    for i = 1, decimals do
        tempMult = tempMult * 10
    end
    local newValue = math.floor(value * tempMult)
    return newValue / tempMult;
end

function table.contains(table, element)
    for _, value in pairs(table) do
      if value == element then
        return true
      end
    end
    return false
  end

function onCreatePost()
    isGiraffeSong = table.contains(giraffeSongs, songName)
    if isGiraffeSong then
        setTextSize("scoreTxt", 18)
        setProperty("scoreTxt.alpha", 0.9)
        -- setProperty("fscoreTxt.alpha", 0.9)
        setTextString("scoreTxt", "Score: "..score.." - Misses: "..misses.." - Accuracy: "..((ratingName ~= "?" and ratingName ~= "") and math.floorDecimal(getProperty("ratingPercent") * 100, 2).."% ["..ratingFC.."]" or ""))
        -- setTextString("fscoreTxt", "Score: "..score.." - Misses: "..misses.." - Accuracy: "..((ratingName ~= "?" and ratingName ~= "") and math.floorDecimal(getProperty("ratingPercent") * 100, 2).."% ["..ratingFC.."]" or ""))
    end
end

function onUpdatePost(elapsed)
    if isGiraffeSong then
        if not getPropertyFromClass("ClientPrefs", "osuMode") then
            local mult = math.lerp(1, getProperty("iconP1.scale.x"), math.boundTo(1 - (elapsed * 9 * playbackRate), 0, 1))
            scaleObject("iconP1", mult, 1)
            -- updateHitbox("iconP1")
            
            local mult = math.lerp(1, getProperty("iconP2.scale.x"), math.boundTo(1 - (elapsed * 9 * playbackRate), 0, 1))
            scaleObject("iconP2", mult, 1)
            -- updateHitbox("iconP2")
            
            -- setTextString("fscoreTxt", "Score: "..score.." - Misses: "..misses.." - Accuracy: "..((ratingName ~= "?" and ratingName ~= "") and math.floorDecimal(getProperty("ratingPercent") * 100, 2).."% ["..ratingFC.."]" or ""))
        end 
        setTextString("scoreTxt", "Score: "..score.." - Misses: "..misses.." - Accuracy: "..((ratingName ~= "?" and ratingName ~= "") and math.floorDecimal(getProperty("ratingPercent") * 100, 2).."% ["..ratingFC.."]" or ""))
    else

        local mult = math.lerp(1, getProperty("iconP1.scale.x"), math.boundTo(1 - (elapsed * 9 * playbackRate), 0, 1))
        scaleObject("iconP1", mult, mult)
        -- updateHitbox("iconP1")
    
        local mult = math.lerp(1, getProperty("iconP2.scale.x"), math.boundTo(1 - (elapsed * 9 * playbackRate), 0, 1))
        scaleObject("iconP2", mult, mult)
        -- updateHitbox("iconP2")

    end
end