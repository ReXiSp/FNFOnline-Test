
local isGiraffeSong = false
local giraffeSongs = {
    "total-exhausion",
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
        setProperty("scoreTxt.alpha", 0.9)
        setProperty("fscoreTxt.alpha", 0.9)
        setTextString("scoreTxt", "Score: "..score.." - Misses: "..misses.." - Accuracy: "..((ratingName ~= "?" and ratingName ~= "") and math.floorDecimal(getProperty("ratingPercent") * 100, 2).."% ["..ratingFC.."]" or ""))
        setTextString("fscoreTxt", "Score: "..score.." - Misses: "..misses.." - Accuracy: "..((ratingName ~= "?" and ratingName ~= "") and math.floorDecimal(getProperty("ratingPercent") * 100, 2).."% ["..ratingFC.."]" or ""))
    end
end

function onUpdatePost(elapsed)
    if isGiraffeSong then
        scaleObject("iconP1", 1, 1)
        scaleObject("iconP2", 1, 1)
        setTextString("scoreTxt", "Score: "..score.." - Misses: "..misses.." - Accuracy: "..((ratingName ~= "?" and ratingName ~= "") and math.floorDecimal(getProperty("ratingPercent") * 100, 2).."% ["..ratingFC.."]" or ""))
        setTextString("fscoreTxt", "Score: "..score.." - Misses: "..misses.." - Accuracy: "..((ratingName ~= "?" and ratingName ~= "") and math.floorDecimal(getProperty("ratingPercent") * 100, 2).."% ["..ratingFC.."]" or ""))
    end
end