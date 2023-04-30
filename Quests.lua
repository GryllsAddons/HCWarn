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
            ["Meet at the Grave"] = {
                {
                    -- https://database.turtle-wow.org/?quest=3912
                    type = "warn",
                    giver = "Donova Snowden",
                    objective = "graveyard outside Gadgetzan",
                    info = "You will die if you use the Videre Elixir!",
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
            ["Meet at the Grave"] = {
                {
                    -- https://database.turtle-wow.org/?quest=3912
                    type = "warn",
                    giver = "Donova Snowden",
                    objective = "graveyard outside Gadgetzan",
                    info = "You will die if you use the Videre Elixir!",
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
    end
end