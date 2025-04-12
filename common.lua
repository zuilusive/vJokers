--Zui's twitch 
G.FUNCS.zui_twitch = function(e)
    love.system.openURL("https://twitch.tv/zuilusive")
end

--Desc text stuff
SMODS.current_mod.description_loc_vars = function()
    return { background_colour = G.C.CLEAR, text_colour = G.C.WHITE, scale = 1.2, shadow = true }
end

--Clickable Twitch link in desc
SMODS.current_mod.custom_ui = function(nodes)
    local title, description = unpack(nodes)
    local twitch_deepfind = SMODS.deepfind(description, "twitch.tv/zuilusive", true)[1]
    if twitch_deepfind then
        local twitch_link_table = twitch_deepfind.objtree[#twitch_deepfind.objtree-2]
        twitch_link_table.config.button = "zui_twitch"
        twitch_link_table.config.tooltip = {text = {localize('b_link')}}
    end
end

ZuiVJokers = SMODS.current_mod

--Counting the number of cards with a certain enhancement, mainly for adding certain jokers to the shop pool for now
function count_enhancement(enhancement)
    local counter = 0
    for _, v in pairs(G.playing_cards or {}) do
        if SMODS.has_enhancement(v, enhancement) then
            counter = counter + 1
        end
    end
    return counter
end
