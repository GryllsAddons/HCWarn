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
            ["Snatch and Grab"] = {
                {
                    -- https://database.turtle-wow.org/?quest=2206
                    type = "warn",
                    giver = "Master Mathias Shaw",
                    objective = "Find the Defias Dockmaster",
                    info = "Make sure to pickpocket the dockmaster and run as attacking him will spawn three bodyguards. You can do the Dwarf version of this quest instead for extra safety.",
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
                    info = "The den is an underground maze with densely packed, quick respawning mobs. Gnarlpine Shamans can heal and mobs will run when low health.",
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
            ["Dark Storms"] = {
                {
                    -- https://database.turtle-wow.org/?quest=806
                    type = "warn",
                    giver = "Orgnil Soulscar",
                    objective = "Bring Fizzle's Claw to Orgnil",
                    info = "You will need to carefully clear the mobs surrounding Fizzle. Fizzle casts dangerous spells and is aided by an imp minion.",
                },
            },
            ["Test of Endurance"] = {
                {
                    -- https://database.turtle-wow.org/?quest=1150
                    type = "warn",
                    giver = "Dorn Plainstalker",
                    objective = "Bring Grenka's Claw to Dorn",
                    info = "This quest involves clearing to the end of the harpy cave and fighting three waves of mobs before the quest mob appears.",
                },
            },
            ["The Family Crypt"] = {
                {
                    -- https://database.turtle-wow.org/?quest=408
                    type = "warn",
                    giver = "Magistrate Sevren",
                    objective = "Kill Captain Dargol",
                    info = "The crypt is a densely packed tight space with a number of patrols who can link groups of mobs.",
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
        }
    elseif faction == "both" then
        return {
            ["Meet at the Grave"] = {
                {
                    -- https://database.turtle-wow.org/?quest=3912
                    type = "warn",
                    giver = "Donova Snowden",
                    objective = "Go to the graveyard",
                    info = "You will die if you drink the Videre Elixir!",
                },
            },
            ["Of Forgotten Memories"] = {
                {
                    -- https://database.turtle-wow.org/?quest=5781
                    type = "warn",
                    giver = "Tirion Fordring",
                    objective = "Travel to the Undercroft",
                    info = "Using the Loose Dirt Mound will spawn a group of four dwarves.",
                },
            },
            ["Pawn Captures Queen"] = {
                {
                    -- https://database.turtle-wow.org/?quest=4507
                    type = "warn",
                    giver = "Alchemist Pestlezugg",
                    objective = "Defeat the Gorishi Hive Queen",
                    info = "This quest involves fighting waves of spawns that will almost certainly overwhelm you.",
                },
            },
            ["The Annals of Darrowshire"] = {
                {
                    -- https://database.turtle-wow.org/?quest=5154
                    type = "warn",
                    giver = "Chromie",
                    objective = "Bring the Annals of Darrowshire to Chromie",
                    info = "Choosing the wrong book will spawn dangerous mobs. Familiarise youself with the correct book to choose (it has a cleaner cover than the rest).",
                },
            },
        }
    end
end