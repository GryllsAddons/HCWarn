-- PvP quest info from https://forum.turtle-wow.org/viewtopic.php?f=37&t=4490

function HCWarn_quests(faction)
    if faction == "Alliance" then
        return {
            ["Avoiding Detection"] = {
                {
                    -- https://database.turtle-wow.org/?quest=40079
                    type = "pvp",
                    giver = "Watch Sergeant Arthur",
                    objective = "Kill 8 Stonard Scouts",
                    pvp = "Stonard Scouts",
                },
            },
            ["Beat Bartleby"] = {
                {
                    -- https://database.turtle-wow.org/?quest=1640
                    type = "pvp",
                    giver = "Bartleby",
                    objective = "Beat Bartleby",
                    pvp = "Bartleby",
                },
            },
            ["Filthy Paws"] = {
                {
                    -- https://database.turtle-wow.org/?quest=307
                    type = "warn",
                    giver = "Mountaineer Stormpike",
                    objective = "Go to the Silver Stream Mine",
                    info = "The Kobolds inside the mine move in packs and can run, making it easy to get overwhelmed. Tunnel Rat Geomancers will cast hard hitting Fire Blasts while Tunnel Rat Diggers will use Sunder Armor. Wait for the Miner's Gear to respawn near the entrance for safety.",
                },
            },
            ["Frostmane Hold"] = {
                {
                    -- https://database.turtle-wow.org/?quest=182
                    type = "warn",
                    giver = "Senir Whitebeard",
                    objective = "Explore Frostmane Hold",
                    info = "The Trolls inside the cave are densely packed, have ranged attacks and will run when low health. Watch out for Great Father Arctikus (rare) in the deepest part of the cave.",
                },
            },
            ["Protecting the Herd"] = {
                {
                    -- https://database.turtle-wow.org/?quest=314
                    type = "warn",
                    giver = "Rudra Amberstill",
                    objective = "slay Vagash",
                    info = "Vagash hits harder than similar level elites and uses Glacial Roar which will stun for 3 seconds",
                },
            }, 
            ["In Defense of the King's Lands"] = {
                {
                    -- Part 1
                    -- https://database.turtle-wow.org/?quest=224
                    type = "warn",
                    giver = "Mountaineer Cobbleflint",
                    objective = "kill 10 Stonesplinter Troggs",
                    info = "The Troggs are densely packed and will run when low health. Stonesplinter Scouts use ranged attacks.",
                },
            }, 
            ["In Defense of the King's Lands"] = {
                {
                    -- Part 2
                    -- https://database.turtle-wow.org/?quest=263
                    type = "warn",
                    giver = "Mountaineer Gravelgaw",
                    objective = "kill 10 Stonesplinter Skullthumpers",
                    info = "The Troggs to the south are densely packed and will run when low health. Consider killing the Troggs on the island to the north in the loch instead.",
                },
            },
            ["In Defense of the King's Lands"] = {
                {
                    -- Part 3
                    -- https://database.turtle-wow.org/?quest=237
                    type = "warn",
                    giver = "Mountaineer Wallbang",
                    objective = "kill 10 Stonesplinter Shaman",
                    info = "The Troggs to the south are densely packed and will run when low health. Consider killing the Troggs on the island to the north in the loch instead.",
                },
            }, 
            ["In Defense of the King's Lands"] = {
                {
                    -- Part 4
                    -- https://database.turtle-wow.org/?quest=217
                    type = "warn",
                    giver = "Captain Rugelfuss",
                    objective = "Kill the Trogg leader",
                    info = "The Troggs in the cave are densely packed and will run when low health. The 3 quest mobs are stacked together so you will be fighting all of them at the same time.",
                },
            },            
            ["Snatch and Grab"] = {
                {
                    -- https://database.turtle-wow.org/?quest=2206
                    type = "warn",
                    giver = "Master Mathias Shaw",
                    objective = "recover the Shipping Schedule",
                    info = "Pickpocket the dockmaster to get the quest item. Attacking the dockmaster will spawn 3 bodyguards. You can do the Dwarf version of this quest instead for extra safety.",
                },
            },
            ["Tharnariun's Hope"] = {
                {
                    -- https://database.turtle-wow.org/?quest=2139
                    type = "warn",
                    giver = "Tharnariun Treetender",
                    objective = "kill the Den Mother",
                    info = "The Den Mother is surrounded by 4 Thistle Cubs who are linked so be prepared to fight all 5 together. The Den Mother and Thistle Cubs can use ravage which will stun you for 2 seconds.",
                },
            },     
            ["The Attack!"] = {
                {
                    -- https://database.turtle-wow.org/?quest=434
                    type = "pvp",
                    giver = "Tyrion",
                    objective = "Remain in the garden",
                    pvp = "Lord Gregor Lescovar",
                },
            },
            ["The Blackwood Corrupted"] = {
                {
                    -- https://database.turtle-wow.org/?quest=4763
                    type = "warn",
                    giver = "Thundris Windweaver",
                    objective = "Fill the Empty Cleansing Bowl",
                    info = "You may want to clear the camp before summoning Xabraxxis (level 19) to have room to manoeuvre. You need to loot Xabraxxis' Demon Bag which appears on the ground to complete the quest.",
                },
            },
            ["The Forgotten Heirloom"] = {
                {
                    -- https://database.turtle-wow.org/?quest=4763
                    type = "warn",
                    giver = "Farmer Furlbrow",
                    objective = "retrieve his pocket watch",
                    info = "There are two mobs level 12 and 15 inside the house. You can avoid these mobs by looting Furlbrow's Wardrobe through the window on the west side of the house.",
                },
            },  
            ["The Missing Diplomat"] = {
                {
                    -- Part 8
                    -- https://database.turtle-wow.org/?quest=1447
                    type = "pvp",
                    giver = "Dashel Stonefist",
                    objective = "Defeat Dashel Stonefist",
                    pvp = "Dashel Stonefist",
                },
            },
            ["The Missing Diplomat"] = {
                {
                    -- Part 16
                    -- https://database.turtle-wow.org/?quest=1324
                    type = "pvp",
                    giver = "Private Hendel",
                    objective = "Defeat Private Hendel",
                    pvp = "Private Hendel",
                },
            },
            ["The Relics of Wakening"] = {
                {
                    -- https://database.turtle-wow.org/?quest=483
                    type = "warn",
                    giver = "Athridas Bearmantle",
                    objective = "Retrieve the Relics",
                    info = "The den is an underground maze with densely packed, quick respawning Gnarlpines who will run when low health. Gnarlpine Shamans can heal.",
                },
            },
            ["The Tower of Althalaxx"] = {
                {
                    -- https://database.turtle-wow.org/?quest=1143
                    type = "warn",
                    giver = "Balthule Shadowstrike",
                    objective = "Kill Athrikus Narassin",
                    info = "The mobs inside the tower are much higher level than outside. You will need to fight your way to the top of the tower to kill Athrikus Narassin. You will need to deal with Voidcallers who cast shadowbolts and their Voidwalker minions. Voidcallers will run when low health.",
                },
            },
            ["Those Blasted Troggs!"] = {
                {
                    -- https://database.turtle-wow.org/?quest=432
                    type = "warn",
                    giver = "Foreman Stonebrow",
                    objective = "Kill 6 Rockjaw Skullthumpers",
                    info = "The Troggs inside the cave are densely packed and will run when low health. Kill mobs outside the cave for safety.",
                },
            },
            ["The Public Servant"] = {
                {
                    -- https://database.turtle-wow.org/?quest=433
                    type = "warn",
                    giver = "Senator Mehr Stonehallow",
                    objective = "Kill 10 Rockjaw Bonesnappers",
                    info = "The Troggs inside the cave are densely packed and will run when low health. Kill mobs near the cave entrance for safety.",
                },
            },
            ["WANTED: Murkdeep!"] = {
                {
                    -- https://database.turtle-wow.org/?quest=4740
                    type = "warn",
                    giver = "WANTED: Murkdeep!",
                    objective = "Find and slay the murloc known as Murkdeep",
                    info = "This quest may glitch. You'll need to clear the Murloc camp then fight 3 Greymist Coastrunners then 2 Greymist Warriors then 1 Warrior and Murkdeep together. Murkdeep can net you for 10 seconds. Consider skipping this if you are hardcore.",
                },
            },
        }
    elseif faction == "Horde" then
        return {
            ["A Rogue's Deal"] = {
                {
                    -- https://database.turtle-wow.org/?quest=590
                    type = "pvp",
                    giver = "Calvin Montague",
                    objective = "Defeat Calvin Montague",
                    pvp = "Calvin Montague",
                },
            },
            ["Boulderslide Ravine"] = {
                {
                    -- https://database.turtle-wow.org/?quest=6421
                    type = "warn",
                    giver = "Mor'rogal",
                    objective = "Explore deep into the cave",
                    info = "The Kobolds inside the cave are densely packed. You'll need to fight your way to the back of the cave. Gogger Geomancers can cast Fireball and Rain of Fire and Gogger Rock Keepers can cast Earth Shock. There is lots of terrain to glitch out on.",
                },
            },
            ["Counterattack!"] = {
                {
                    -- https://database.turtle-wow.org/?quest=4021
                    type = "warn",
                    giver = "Regthar Deathgate",
                    objective = "Krom'zar's Banner",
                    info = "This quest may glitch and you'll suddenly have a large group of Centaurs attacking you. Skip this quest if you are hardcore.",
                },
            },
            ["Dark Storms"] = {
                {
                    -- https://database.turtle-wow.org/?quest=806
                    type = "warn",
                    giver = "Orgnil Soulscar",
                    objective = "Bring Fizzle's Claw to Orgnil",
                    info = "You will need to carefully clear the mobs surrounding Fizzle. Fizzle casts dangerous spells and is aided by an imp minion.",
                },
            },
            ["Earthen Arise"] = {
                {
                    -- https://database.turtle-wow.org/?quest=6481
                    type = "warn",
                    giver = "Mor'rogal",
                    objective = "Open the Resonite cask",
                    info = "You will need to fight your way to the back of the cave again and use the floating Resonite Cask to summon Goggeroc (20 Elite). You may need to wait for the cask to respawn. Goggeroc uses a knock back as well as a 2 second stun.",
                },
            },
            ["Test of Endurance"] = {
                {
                    -- https://database.turtle-wow.org/?quest=1150
                    type = "warn",
                    giver = "Dorn Plainstalker",
                    objective = "Bring Grenka's Claw to Dorn",
                    info = "You will need to clear to the end of the Harpy cave then fight 3 waves of mobs before the quest mob will appear.",
                },
            },
            ["The Family Crypt"] = {
                {
                    -- https://database.turtle-wow.org/?quest=408
                    type = "warn",
                    giver = "Magistrate Sevren",
                    objective = "Kill Captain Dargol",
                    info = "The crypt is a densely packed, tight space with a number of patrols who can link groups of mobs.",
                },
            },
            ["The Final Message to the Wildhammer"] = {
                {
                    -- https://database.turtle-wow.org/?quest=7843
                    type = "pvp",
                    giver = "Otho Moji'ko",
                    objective = "travel to Aerie Peak",
                    pvp = "Wildhammer dwarves",
                    info = "Using the quest item provided may cause you to become PvP flagged.",
                },
            },
            ["The Principal Source"] = {
                {
                    -- Horde Druid Quest
                    -- https://database.turtle-wow.org/?quest=6127
                    type = "warn",
                    giver = "Dendrite Starblaze",
                    objective = "top of the peak",
                    info = "You will need to fight your way to the top of Dreadmist Peak to collect the water sample. After you collect the sample, 3 Burning Blade Toxicologists will spawn so be ready for a fight or have an escape plan ready!",
                },
            },
            ["The Tear of the Moons"] = {
                {
                    -- https://database.turtle-wow.org/?quest=857
                    type = "warn",
                    giver = "Feegly the Exiled",
                    objective = "retrieve for him the Tear",
                    info = "You will need to fight your way to General Twinbraid's Strongbox at the lowest level of the Dwarven bunker. The bunker is densely packed with groups of mobs and patrols. You will need to deal with General Twinbraid (level 30).",
                },
            },
            ["The Weaver"] = {
                {
                    -- https://database.turtle-wow.org/?quest=480
                    type = "warn",
                    giver = "Shadow Priest Allister",
                    objective = "Kill the Dalaran archmage",
                    info = "You will need to fight your way to the Dalaran Archmage who is guarded by very densely packed mobs in a town hall. You will need to deal with Dalaran Conjurors and their Voidwalkers as well as Dalaran Warders who can summon Serpents.",
                },
            },
        }
    elseif faction == "both" then
        return {
            ["Deepmoss Spider Eggs"] = {
                {
                    -- https://database.turtle-wow.org/?quest=1069
                    type = "warn",
                    giver = "Mebok Mizzyrix",
                    objective = "Bring 15 Deepmoss Eggs",
                    info = "Once you loot an egg it will spawn small spiders, who can spawn bigger matriarchs. If you get two matriarchs from one egg you can be in real trouble very quickly. One strategy is to loot the eggs and run, but it's not fool proof. Do this quest when it's grey.",
                },
            },
            ["Gerenzo Wrenchwhistle"] = {
                {
                    -- https://database.turtle-wow.org/?quest=1096
                    type = "warn",
                    giver = "Ziz Fizziks",
                    objective = "Mechanical Arm to Ziz Fizziks",
                    info = "Gerenzo can spawn in different locations. Watch out for patrols while on the walkway. Gerenzo and Venture Co. Machine Smiths can summon Compact Harvest Reaper minions.",
                },
            },
            ["Meet at the Grave"] = {
                {
                    -- https://database.turtle-wow.org/?quest=3912
                    type = "warn",
                    giver = "Donova Snowden",
                    objective = "Go to the graveyard",
                    info = "You will die instantly if you drink the Videre Elixir! Do not drink this if you are hardcore!",
                },
            },
            ["Of Forgotten Memories"] = {
                {
                    -- https://database.turtle-wow.org/?quest=5781
                    type = "warn",
                    giver = "Tirion Fordring",
                    objective = "Travel to the Undercroft",
                    info = "Using the Loose Dirt Mound will spawn Mercutio Filthgorger along with 3 Crypt Robbers. Mercutio can gouge and sunder.",
                },
            },
            ["Pawn Captures Queen"] = {
                {
                    -- https://database.turtle-wow.org/?quest=4507
                    type = "warn",
                    giver = "Alchemist Pestlezugg",
                    objective = "Defeat the Gorishi Hive Queen",
                    info = "You will need to fight waves of Gorishi mobs that will almost certainly overwhelm you.",
                },
            },
            ["The Annals of Darrowshire"] = {
                {
                    -- https://database.turtle-wow.org/?quest=5154
                    type = "warn",
                    giver = "Chromie",
                    objective = "Bring the Annals of Darrowshire to Chromie",
                    info = "Looting the wrong book can spawn up to 3 Decrepit Guardians who cast a stacking -20 strength & stamina debuff. Familiarise yourself with the correct book to choose (it has a cleaner cover than the rest and has a slight brown stain in the center of the pages opposite the spine). Sometimes the correct book may not have spawned and all of the books will be fakes. Looting the contents of a fake book will respawn a book.",
                },
            },
        }
    end
end