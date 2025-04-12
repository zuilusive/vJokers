SMODS.Atlas {
    key = "modicon",
    path = "zvjkicon.png",
    px = 34,
    py = 34,
}

SMODS.Atlas {
    key = "ZuiVJokers",
    path = "ZuiVJokers.png",
    px = 71,
    py = 95,
}

-- load common functions
assert(SMODS.load_file("common.lua"))()
-- nested folders stuff (from Neato Jokers NeatoJokers.lua)
local lovely_toml_info = NFS.getInfo(SMODS.current_mod.path .. "lovely.toml")
local lovely_dir_items = NFS.getInfo(SMODS.current_mod.path .. "lovely") and NFS.getDirectoryItems(SMODS.current_mod.path .. "lovely")
local should_have_lovely = lovely_toml_info or (lovely_dir_items and #lovely_dir_items > 0)
if should_have_lovely then
    assert(SMODS.current_mod.lovely, "Oops, no lovely patches found!\nDid you check if the mod folder opens to more files instead of another folder?\n\n\n")
end
--loading jokers, futureproofing for when I add more vtubers
local subdir = "jokers"
local jokers = NFS.getDirectoryItems(SMODS.current_mod.path .. subdir)
for _, filename in pairs(jokers) do
    assert(SMODS.load_file(subdir .. "/" .. filename))()
end