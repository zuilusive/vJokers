-- rarity for Hololive jokers
SMODS.Rarity {
    key = 'hololive',
    loc_txt = {
         name = 'Hololive'
    },
    badge_colour = HEX('00B8F5'),
    default_weight = 0.08,
    pools = { ["Joker"] = true },
}
-- rarity for Vshojo jokers
--SMODS.Rarity {
 --   key = 'vshojo',
  --  loc_txt = {
  --      name = 'VShojo'
  --  },
  --  badge_colour = HEX('F50F75'),
  --  default_weight = 0.06,
  --  pools = { ["Joker"] = true },
--}
--rarity for Phase Connect jokers
--SMODS.Rarity {
--    key = 'phasec',
--    loc_txt = {
 --       name = 'Phase Connect'
 --   },
 --   badge_colour = HEX('000000'),
 --   default_weight = 0.05,
 --   pools = { ["Joker"] = true },
--}
--rarity for Indie jokers
--SMODS.Rarity {
--    key = 'indie',
 --   loc_txt = {
 --       name = 'Indie'
 --   },
  --  badge_colour = HEX('8168A1'),
  --  default_weight = 0.08,
  --  pools = { ["Joker"] = true },
--}
-- prefix is zvjk, key is hololive
SMODS.Joker {
    key = 'sakuramiko',
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = {extra = { repetitions = 2 } },
    rarity = 'zvjk_hololive',
    atlas = 'ZuiVJokers',
    pos = { x = 1, y = 0 },
    cost = 5,
    calculate = function(self, card, context)
        --Retrigger all played 5s 2 additional times
        if context.cardarea == G.play and context.repetition and not context.repetition_only then
            if context.other_card:get_id() == 5 then
                return {
                    message = 'Nye!',
                    repetitions = card.ability.extra.repetitions,
                    card = card,
                }
            end
        end
    end
}

SMODS.Joker{
    key = "kosekibijou",
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    -- retrigger -- 
    config = {extra = { repetitions = 1 } },
    rarity = 'zvjk_hololive',
    atlas = 'ZuiVJokers',
    pos = { x = 2, y = 0 },
    cost = 6,
    calculate = function(self, card, context)
        -- Retrigger all played cards with Diamonds suit
        if context.cardarea == G.play and context.repetition and not context.reptition_only then
            if SMODS.has_enhancement(context.other_card, 'm_stone') then
                return {
                    message = ':D',
                    repetitions = card.ability.extra.repetitions,
                    card = card,
                }
            end
        end
    end
}

SMODS.Joker{
    key = 'kaelakovalskia',
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    -- x1.69 Mult -- 
    config = {extra = { x_mult = 1.69 } },
    rarity = 'zvjk_hololive',
    atlas = 'ZuiVJokers',
    pos = { x = 3, y = 0 },
    cost = 6,
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.x_mult } }
	end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if SMODS.has_enhancement(context.other_card, 'm_stone') then
                return{
                    message = 'GSH!',
                    x_mult = card.ability.extra.x_mult,
                    card = card,
                }
            end
        end
    end
}

SMODS.Joker{
    key = 'airaniiofifteen',
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    -- +15 Mult in hand -- 
    config = {extra = { mult = 15 } },
    rarity = 'zvjk_hololive',
    atlas = 'ZuiVJokers',
    pos = { x = 4, y = 0 },
    cost = 5,
    in_pool = function(self, args)
        return count_enhancement('m_wild') > 0
    end,
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult } }
	end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            if SMODS.has_enhancement(context.other_card, 'm_wild') and not context.other_card.debuff then
                return{
                    mult = card.ability.extra.mult,
                    card = card,
                }
            end
        end
    end
}

SMODS.Joker{
    key = 'usadapekora',
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    -- x3 Chips -- 
    config = {extra = { x_chips = 3 } },
    rarity = 'zvjk_hololive',
    atlas = 'ZuiVJokers',
    pos = { x = 5, y = 0 },
    cost = 7,
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.x_chips, localize('Three of a Kind', 'poker hands') } }
	end,
    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands['Three of a Kind']) then
            local seven = 0
            for i=1, #context.scoring_hand do
                if context.scoring_hand[i]:get_id() == 7 then
                    seven = seven + 1
                end
            end
            if seven >= 3 then
                return{
                    message = 'Peko!',
                    x_chips = card.ability.extra.x_chips,
                    card = card,
                    colour = G.C.CHIPS
                }
            end
        end
    end
}

SMODS.Joker{
    key = 'vestiazeta',
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    -- +7 Mult when played -- 
    config = {extra = { mult = 7 } },
    rarity = 'zvjk_hololive',
    atlas = 'ZuiVJokers',
    pos = { x = 6, y = 0 },
    cost = 5,
    in_pool = function(self, args)
        return count_enhancement('m_wild') > 0
    end,
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult } }
	end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if SMODS.has_enhancement(context.other_card, 'm_wild') then
                return{
                    mult = card.ability.extra.mult,
                    card = card,
                }
            end
        end
    end
}

SMODS.Joker{
    key = 'kobokanaeru',
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    -- $2 per scored bonus -- 
    config = {extra = { money_mod = 2 } },
    rarity = 'zvjk_hololive',
    atlas = 'ZuiVJokers',
    pos = { x = 7, y = 0 },
    cost = 5,
    in_pool = function(self, args)
        return count_enhancement('m_bonus') > 0
    end,
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.money_mod } }
	end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if SMODS.has_enhancement(context.other_card, 'm_bonus') then
                return{
                    dollars = card.ability.extra.money_mod,
                    card = card,
                }
            end
        end
    end
}

SMODS.Joker{
    key = 'nanashimumei',
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    -- Gain 0.2X Mult per face card scored -- 
    config = {extra = { xmult = 1, xmult_mod = 0.2 } },
    rarity = 'zvjk_hololive',
    atlas = 'ZuiVJokers',
    pos = { x = 8, y = 0 },
    cost = 7,
    in_pool = true,
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult, card.ability.extra.xmult_mod } }
	end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            --Upgrading by 0.2X mult for each scored face card
            if context.other_card:is_face() then
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod
                return{
                    message = 'Oh hi!',
                    card = card,
                }
            end
        end
        
        if context.destroying_card and not context.blueprint then
            if context.destroying_card:is_face() then
                return {remove = true}
            end
        end
    
        if context.joker_main and card.ability.extra.xmult > 1 then
        --Returning the Xmult
            return{
                Xmult_mod = card.ability.extra.xmult,
                message = localize{ type = 'variable', key = 'a_xmult', vars = {card.ability.extra.xmult}},
            }
        end
    end
}

SMODS.Joker{
    key = 'ourokronii',
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
-- Gain 2 Hands, Gain 1 Ante
    config = {extra = { antes = 1, extra_hands = 2 } },
    rarity = 'zvjk_hololive',
    atlas = 'ZuiVJokers',
    pos = { x = 9, y = 0 },
    cost = 7,
    in_pool = true,
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.antes, card.ability.extra.extra_hands } }
	end,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.extra_hands
       ease_hands_played(2)
       ease_ante(1)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.extra_hands
        ease_hands_played(-2)
        ease_ante(-1)
    end
}

SMODS.Joker{
    key = 'shishirobotan',
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    -- Create Ramen when Blind is selected -- 
    rarity = 'zvjk_hololive',
    atlas = 'ZuiVJokers',
    pos = { x = 0, y = 1 },
    cost = 7,
    in_pool = true,
    --config = { extra = { odds = 4 } },
    --loc_vars = function(self, info_queue, card)
	--	info_queue[#info_queue+1] = G.P_CENTERS.e_negative
    --    return { vars = {(G.GAME.probabilities.normal or 1), card.ability.extra.odds}}
	--end,
    calculate = function(self, card, context)
        local whoami = context.blueprint_card or card
        if context.setting_blind and not whoami.getting_sliced and #G.jokers.cards < G.jokers.config.card_limit then
     --       if pseudorandom('shishirobotan') < G.GAME.probabilities.normal / card.ability.extra.odds then
     --       G.GAME.joker_buffer = G.GAME.joker_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = function()
                    local card = SMODS.add_card({ key = 'j_ramen', area = G.jokers })
                    card:add_to_deck()
                    return true
                end
            }))
        end
    end
    --end
}

SMODS.Joker{
    key = 'ookamimio',
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    -- Tarot -- 
    rarity = 'zvjk_hololive',
    atlas = 'ZuiVJokers',
    pos = { x = 1, y = 1 },
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local spadesuit = 0
            for i=1, #context.scoring_hand do
                if context.scoring_hand[i]:is_suit('Spades') then
                    spadesuit = spadesuit + 1
                end
            end
            if spadesuit >= 3 then
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local card = create_card( 'Tarot', G.consumeables, nil, nil, nil, nil, nil, 'mion' )
                            card:add_to_deck()
                            G.consumeables:emplace(card)
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
            end
        end
    end
end
}

SMODS.Joker{
    key = 'ceresfauna',
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true, 
    config = {extra = { win = 12, loss = -3, xmult = 3, winchance = 6, multchance = 3, losechance = 2 } },
    rarity = 'zvjk_hololive',
    atlas = 'ZuiVJokers',
    pos = { x = 2, y = 1 },
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return{vars = {G.GAME and G.GAME.probabilities.normal or 1,
        card.ability.extra.win, card.ability.extra.loss, card.ability.extra.xmult,
        card.ability.extra.winchance, card.ability.extra.multchance, card.ability.extra.losechance}}
	end,

    calculate = function(self, card, context)
        if context.joker_main then
            if pseudorandom('scratch1'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.multchance then
                return{
                Xmult_mod = card.ability.extra.xmult,
                message = localize{ type = 'variable', key = 'a_xmult', vars = {card.ability.extra.xmult}}
                }
            end
        end
        if context.after then
            if pseudorandom('scratch2'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.winchance then
                return{
                dollars = card.ability.extra.win
                }
            end
            end
        if context.after then
            if pseudorandom('scratch3'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.losechance then
                return{
                dollars = card.ability.extra.loss
                }
            end
            end
        end
}

SMODS.Joker{
    key = 'akaihaato',
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    -- Gain +8 Mult if scoring hand has more than 3 Hearts cards -- 
    config = {extra = { mult = 0, mult_mod = 8 } },
    rarity = 'zvjk_hololive',
    atlas = 'ZuiVJokers',
    pos = { x = 5, y = 1 },
    cost = 6,
    in_pool = true,
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult, card.ability.extra.mult_mod } }
	end,
    calculate = function(self, card, context)
        if context.joker_main then
            local heartsuit = 0
            for i=1, #context.scoring_hand do
                if context.scoring_hand[i]:is_suit('Hearts') then
                    heartsuit = heartsuit + 1
                end
            end
        if heartsuit >= 3 then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
                return{
                    message = 'HAACHAMA?',
                    mult = card.ability.extra.mult,
                    card = card,
                }
            end
        end
    
        if context.joker_main and card.ability.extra.mult > 0 then
        --Returning the mult
            return{
                mult = card.ability.extra.mult,
                message = 'HAACHAMA?',
            }
        end
    end
}
--Later stuff
--Tsukumo Sana 
--Gives ^1.5 Mult if at least 9 unique planet cards have been used this run?

SMODS.Joker{
    key = 'moonahoshinova',
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    -- Tarot -- 
    rarity = 'zvjk_hololive',
    atlas = 'ZuiVJokers',
    pos = { x = 3, y = 1 },
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local clubsuit = 0
            for i=1, #context.scoring_hand do
                if context.scoring_hand[i]:is_suit('Clubs') then
                    clubsuit = clubsuit + 1
                end
            end
            if clubsuit >= 3 then
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local card = create_card( 'Tarot', G.consumeables, nil, nil, nil, nil, nil, 'moona' )
                            card:add_to_deck()
                            G.consumeables:emplace(card)
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
            end
        end
    end
end
}

SMODS.Joker{
    key = 'hakosbaelz',
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    -- 1 in 10 chance to spawn Soul -- 
    config = {extra = { soulchance = 10 } },
    rarity = 'zvjk_hololive',
    atlas = 'ZuiVJokers',
    pos = { x = 4, y = 1 },
    cost = 7,
    in_pool = true,
    loc_vars = function(self, info_queue, card)
		return { vars = { G.GAME and G.GAME.probabilities.normal or 1,
        card.ability.extra.soulchance } }
	end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if context.other_card:get_id() == 11 then
                if pseudorandom('jdon'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.soulchance then
                    if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    local card = create_card( 'Spectral', G.consumeables, nil, nil, nil, nil, 'c_soul', 'mysoul' )
                                    card:add_to_deck()
                                    G.consumeables:emplace(card)
                                    G.GAME.consumeable_buffer = 0
                                    return true
                                end
                            }))
                    end
                end
            end
        end
        
        if context.destroying_card and not context.blueprint then
            if pseudorandom('jdon'..G.SEED) < G.GAME.probabilities.normal / card.ability.extra.soulchance then
            if context.destroying_card:get_id() == 11 then
                return {remove = true}
            end
        end
        end
    end
}
