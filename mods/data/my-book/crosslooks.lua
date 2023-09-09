local songInfo = {}
local bothSingSections = {}
local ANIMS = {"left", "right", "both", "both end"}
local isBoth = false

function onCreatePost()
    -- luaDebugMode = true
    songInfo = getPropertyFromClass("PlayState", "SONG")
    triggerEvent('Alt Idle Animation', 'gf', (mustHitSection and '' or '-alt'))

    local strumTime = 0
    local bp = songInfo.bpm
    for i, v in ipairs(songInfo.notes) do
        local endStrumTime = strumTime
        local curCrochet = 0
        local signal = "keep"
        -- local after = ""
        if v.changeBPM then
            bp = v.bpm
        end
        curCrochet = ((60 / bp) * 1000)
        endStrumTime = endStrumTime + (curCrochet * v.sectionBeats)
        for j = 0, getProperty("eventNotes.length")-1 do
            if getPropertyFromGroup("eventNotes", j, "strumTime") >= strumTime and getPropertyFromGroup("eventNotes", j, "strumTime") < endStrumTime and getPropertyFromGroup("eventNotes", j, "event") == "CrossLooks" then
                if getPropertyFromGroup("eventNotes", j, "value1") == "both" then
                    signal = "start"
                elseif getPropertyFromGroup("eventNotes", j, "value1") == "both end" then
                    signal = "end"
                    -- after = getPropertyFromGroup("eventNotes", j, "value2") 
                end
                setPropertyFromGroup("eventNotes", j, "event", "")
                break
            end
            -- debugPrint(getPropertyFromGroup("eventNotes", j, "event"))
        end
        -- debugPrint(strumTime)
        table.insert(bothSingSections, {signal, after})
        strumTime = endStrumTime
    end
end

local alreadyTriggered = false
local nextSectionStrumTime = -1
local nextSectionCamera = -1
local animDelay = 400
local v2 = ""
function onUpdatePost()
    if nextSectionStrumTime ~= -1 and not alreadyTriggered and nextSectionCamera > 0 then
        if getSongPosition() > nextSectionStrumTime - animDelay then
            triggerEvent("CrossLooks", ANIMS[nextSectionCamera], v2)
            -- debugPrint(ANIMS[nextSectionCamera])
            alreadyTriggered = true
        end
    end
end

function onSongStart()
    curSection = 0
    onSectionHit()
end

local sectionTime = 0
function onSectionHit()
    local sectionBeats = songInfo.notes[curSection + 1].sectionBeats
    local nextSectionBeats = songInfo.notes[curSection + 2].sectionBeats
    nextSectionStrumTime = sectionTime + crochet * nextSectionBeats
    nextSectionCamera = (isBoth and -1 or (songInfo.notes[curSection + 2].mustHitSection and 2 or 1))
    animDelay = 400
    v2 = ""
    if bothSingSections[curSection + 2][1] == "start" then
        nextSectionCamera = 3
        animDelay = 320
        isBoth = true
    elseif bothSingSections[curSection + 2][1] == "end" then
        nextSectionCamera = 4
        animDelay = 320
        -- v2 = bothSingSections[curSection + 2][2]
        v2 = (songInfo.notes[curSection + 2].mustHitSection and "right" or "left")
        isBoth = false
    end
    sectionTime = sectionTime + (crochet * sectionBeats)
    alreadyTriggered = false
end

local curLooking = 0
local bothing = false
function onEvent(n,v1,v2)
    if n == 'CrossLooks' then
        -- debugPrint(v1, " | ", v2, " | ", bothing)
        if not ((v1 == "left" and curLooking == 0) or (v1 == "right" and curLooking == 1)) then
            if v1 == 'left' then
                playAnim('gf', 'turnLeft', true)
                triggerEvent('Alt Idle Animation', 'gf', '-alt')
                curLooking = 0
                --debugPrint('                Left')
            end
    
            if v1 == 'right' then
                playAnim('gf', 'turnRight', true)
                triggerEvent('Alt Idle Animation', 'gf', '')
                curLooking = 1
                --debugPrint('                Right')
            end
    
            if v1 == 'both' then
    
                if not bothing then
                    if curLooking == 1 then
                        playAnim('gf', 'turnBothR', true)
                        --debugPrint('                Left','Both')
        
                    elseif curLooking == 0 then
                        playAnim('gf', 'turnBothL', true)
                        --debugPrint('                Right','Both')
        
                    end
                    bothing = true
        
                    triggerEvent('Alt Idle Animation', 'gf', '-both')
                end
            end
    
            if v1 == 'both end' then
                if bothing then
                    if v2 == 'left' then
                        playAnim('gf', 'bothEndL', true)
                        triggerEvent('Alt Idle Animation', 'gf', '-alt')
                        curLooking = 0
                        --debugPrint('                Left')
        
                    elseif v2 == 'right' then
                        playAnim('gf', 'bothEndR', true)
                        triggerEvent('Alt Idle Animation', 'gf', '')
                        curLooking = 1
                        --debugPrint('                Right')
                    end
    
                    bothing = false
                end
            end
    
            setProperty('gf.specialAnim', true)
        end 
    end
end