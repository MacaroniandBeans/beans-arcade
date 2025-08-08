
local costPerCoin = 10 -- 10 money = 1 coin

exports.ox_target:addBoxZone({
    coords = vec3(-1654.6409, -1063.5359, 12.1604), -- Updated coordinates
    size = vec3(1.0, 1.0, 1.0),
    rotation = 0,
    debug = false,
    options = {
        {
            name = 'money_to_coin',
            label = 'Exchange Money for Coins',
            icon = 'fas fa-coins',
            distance = 2.0,
            onSelect = function()
                print('[exchange] Target selected')

                local input = lib.inputDialog('Exchange Money', {
                    {
                        type = 'number',
                        label = 'How many coins do you want?',
                        name = 'amount',
                        min = 1,
                        default = 1
                    }
                })

                print('[exchange] Raw input:', json.encode(input))

                if not input then
                    print('[exchange] Dialog was canceled or closed')
                    return
                end

                if not input[1] then
                    print('[exchange] No amount entered')
                    return
                end

                local amount = tonumber(input[1])
                print('[exchange] Parsed amount:', amount)

                if not amount or amount <= 0 then
                    print('[exchange] Invalid or non-positive amount')
                    return
                end

                lib.callback('exchange:moneyToCoins', false, function(result)
                    print('[exchange] Callback returned:', json.encode(result))

                    if result.success then
                        lib.notify({
                            title = 'Exchange',
                            description = 'You received ' .. result.coins .. ' coin(s)!',
                            type = 'success'
                        })
                    else
                        lib.notify({
                            title = 'Exchange Failed',
                            description = result.reason or 'Something went wrong.',
                            type = 'error'
                        })
                    end
                end, amount, costPerCoin)
            end
        }
    }
})

    



local function wordsGame()
    return exports.lunar_minigames:words(30, 30)
end

local function keysGame()
    return exports.lunar_minigames:keys(24, 10)
end

local function sortGame()
    return exports.lunar_minigames:sort(5, 25, 25)
end

local function lockpickGame()
    return exports.lunar_minigames:lockpick(10, 60)
end

local function pinCrackerGame()
    return exports.lunar_minigames:pinCracker(4, 45)
end

local function terminalGame()
    return exports.lunar_minigames:terminal(4, 3, 10, 20)
end

local function memoryCardGame()
    return exports['ran-minigames']:MemoryCard(120)
end

local function mineSweepGame()
    return exports['ran-minigames']:MineSweep(18000, 12, 3, "right")
end

local function inspiredThermiteGame()
    return exports['bd-minigames']:Thermite(15, 7, 7, 30)
end


---------------------------------------------- WORDS
exports.ox_target:addBoxZone({
    coords = vec3(-1650.3381, -1066.3097, 12.1604), 
    size = vec3(1.0, 1.0, 1.0),
    rotation = 0,
    debug = false,
    options = {
        {
            name = 'arcade_minigame',
            label = 'Play Word Challenge',
            icon = 'fas fa-keyboard',
            distance = 2.0,
            onSelect = function()
                lib.callback('arcade:useToken', false, function(removed)
                    if not removed then
                        lib.notify({
                            title = 'Arcade Machine',
                            description = 'You need an Arcade Token to play!',
                            type = 'error'
                        })
                        return
                    end
                local success = wordsGame()
                if not success then
                    lib.notify({
                        title = 'Arcade Machine',
                        description = 'Failed to start the game!',
                        type = 'error'
                    })
                end
            end)
            end
        }
    }
})

-----------------------------inspired thermite

exports.ox_target:addBoxZone({
    coords = vec3(-1660.3049, -1067.5648, 12.1604), 
    size = vec3(1.0, 1.0, 1.0),
    rotation = 0,
    debug = false,
    options = {
        {
            name = 'arcade_inspiredthermite',
            label = 'Play inspired Thermite',
            icon = 'fas fa-keyboard',
            distance = 2.0,
            onSelect = function()
                lib.callback('arcade:useToken', false, function(removed)
                    if not removed then
                        lib.notify({
                            title = 'Arcade Machine',
                            description = 'You need an Arcade Token to play!',
                            type = 'error'
                        })
                        return
                    end
                local success = inspiredThermiteGame()
                if not success then
                    lib.notify({
                        title = 'Arcade Machine',
                        description = 'Failed to start the game!',
                        type = 'error'
                    })
                end
            end)
            end
        }
    }
})

------------------------------------------------------------------------------KEYS
exports.ox_target:addBoxZone({
    coords = vec3(-1651.3770, -1067.6202, 12.1604), 
    size = vec3(1.0, 1.0, 1.0),
    rotation = 0,
    debug = false,
    options = {
        {
            name = 'arcade_minigame2',
            label = 'Play Keys Challenge',
            icon = 'fas fa-keyboard',
            distance = 2.0,
            onSelect = function()
                lib.callback('arcade:useToken', false, function(removed)
                    if not removed then
                        lib.notify({
                            title = 'Arcade Machine',
                            description = 'You need an Arcade Token to play!',
                            type = 'error'
                        })
                        return
                    end
                local success = keysGame()
                if not success then
                    lib.notify({
                        title = 'Arcade Machine',
                        description = 'Failed to start the game!',
                        type = 'error'
                    })
                end
            end)
            end
        }
    }
})
---------------------------------------------------------------------------------------SORT
exports.ox_target:addBoxZone({
    coords = vec3(-1648.4347, -1076.4387, 12.1604), 
    size = vec3(1.0, 1.0, 1.0),
    rotation = 0,
    debug = false,
    options = {
        {
            name = 'arcade_sort',
            label = 'Play Sort Challenge',
            icon = 'fas fa-keyboard',
            distance = 2.0,
            onSelect = function()
                lib.callback('arcade:useToken', false, function(removed)
                    if not removed then
                        lib.notify({
                            title = 'Arcade Machine',
                            description = 'You need an Arcade Token to play!',
                            type = 'error'
                        })
                        return
                    end
                local success = sortGame()
                if not success then
                    lib.notify({
                        title = 'Arcade Machine',
                        description = 'Failed to start the game!',
                        type = 'error'
                    })
                end
            end)
            end
        }
    }
})
-----------------------------------------------------------------------LOCKPICK
exports.ox_target:addBoxZone({
    coords = vec3(-1652.4409, -1068.8558, 12.1604), 
    size = vec3(1.0, 1.0, 1.0),
    rotation = 0,
    debug = false,
    options = {
        {
            name = 'arcade_minigame3',
            label = 'Play Lockpick Challenge',
            icon = 'fas fa-keyboard',
            distance = 2.0,
            onSelect = function()
                lib.callback('arcade:useToken', false, function(removed)
                    if not removed then
                        lib.notify({
                            title = 'Arcade Machine',
                            description = 'You need an Arcade Token to play!',
                            type = 'error'
                        })
                        return
                    end
                local success = lockpickGame()
                if not success then
                    lib.notify({
                        title = 'Arcade Machine',
                        description = 'Failed to start the game!',
                        type = 'error'
                    })
                end
            end)
            end
        }
    }
})
------------------------------------------------------ PIN CRACKER
exports.ox_target:addBoxZone({
    coords = vec3(-1654.7198, -1067.8129, 12.1604), 
    size = vec3(1.0, 1.0, 1.0),
    rotation = 0,
    debug = false,
    options = {
        {
            name = 'arcade_minigame3',
            label = 'Play Pin Cracker',
            icon = 'fas fa-keyboard',
            distance = 2.0,
            onSelect = function()
                lib.callback('arcade:useToken', false, function(removed)
                    if not removed then
                        lib.notify({
                            title = 'Arcade Machine',
                            description = 'You need an Arcade Token to play!',
                            type = 'error'
                        })
                        return
                    end
                local success = pinCrackerGame()
                if not success then
                    lib.notify({
                        title = 'Arcade Machine',
                        description = 'Failed to start the game!',
                        type = 'error'
                    })
                end
                end)
            end
        }
    }
})
---------------------------------------------------------terminalGame
exports.ox_target:addBoxZone({
    coords = vec3(-1657.3912, -1068.7631, 12.1604), 
    size = vec3(1.0, 1.0, 1.0),
    rotation = 0,
    debug = false,
    options = {
        {
            name = 'arcade_terminal',
            label = 'Play Terminal Challenge',
            icon = 'fas fa-keyboard',
            distance = 2.0,
            onSelect = function()
                lib.callback('arcade:useToken', false, function(removed)
                    if not removed then
                        lib.notify({
                            title = 'Arcade Machine',
                            description = 'You need an Arcade Token to play!',
                            type = 'error'
                        })
                        return
                    end
                    local success = terminalGame()
                    if not success then
                        lib.notify({
                            title = 'Arcade Machine',
                            description = 'Failed to start the game!',
                            type = 'error'
                        })
                    end
                end)
            end
        }
    }
})


---------------------------anagram

exports.ox_target:addBoxZone({
    coords = vec3(-1657.6898, -1066.5527, 12.1604),
        size = vec3(1.0, 1.0, 1.0),
        rotation = 0,
        debug = false,
        options = {
            {
                name = 'arcade_anagram',
                label = 'Play Word Twist',
                icon = 'fas fa-spell-check',
                distance = 2.0,
                onSelect = function()
                    lib.callback('arcade:useToken', false, function(removed)
                        if not removed then
                            lib.notify({
                                title = 'Arcade Machine',
                                description = 'You need an Arcade Token to play!',
                                type = 'error'
                            })
                            return
                        end
                        exports['boii_minigames']:anagram({
                            style = 'default',
                            loading_time = 5000,
                            difficulty = 10,
                            guesses = 5,
                            timer = 30000
                        }, function(success)
                            if success then
                                lib.notify({
                                    title = 'Arcade Machine',
                                    description = 'You cracked the anagram!',
                                    type = 'success'
                                })
                                -- You can add reward logic here
                            else
                                lib.notify({
                                    title = 'Arcade Machine',
                                    description = 'You failed the anagram!',
                                    type = 'error'
                                })
                            end
                        end)
                    end)
                end
            }
        }
    })
-----------------------------------------button mash
    exports.ox_target:addBoxZone({
        coords = vec3(-1660.3049, -1067.5648, 12.1604),
            size = vec3(1.0, 1.0, 1.0),
            rotation = 0,
            debug = false,
            options = {
                {
                    name = 'arcade_buttonmash',
                    label = 'Play Button Mash',
                    icon = 'fas fa-spell-check',
                    distance = 2.0,
                    onSelect = function()
                        lib.callback('arcade:useToken', false, function(removed)
                            if not removed then
                                lib.notify({
                                    title = 'Arcade Machine',
                                    description = 'You need an Arcade Token to play!',
                                    type = 'error'
                                })
                                return
                            end
                            exports['boii_minigames']:button_mash({
                                style = 'default', -- Style template
                                difficulty = 10
                            }, function(success)
                                if success then
                                    lib.notify({
                                        title = 'Arcade Machine',
                                        description = 'You Won!',
                                        type = 'success'
                                    })
                                    -- You can add reward logic here
                                else
                                    lib.notify({
                                        title = 'Arcade Machine',
                                        description = 'You failed the anagram!',
                                        type = 'error'
                                    })
                                end
                            end)
                        end)
                    end
                }
            }
        })

-------------------------------------------chip hack
        exports.ox_target:addBoxZone({
            coords = vec3(-1660.0778, -1069.3788, 12.1604),
                size = vec3(1.0, 1.0, 1.0),
                rotation = 0,
                debug = false,
                options = {
                    {
                        name = 'arcade_chiphack',
                        label = 'Play Chip Hack',
                        icon = 'fas fa-spell-check',
                        distance = 2.0,
                        onSelect = function()
                            lib.callback('arcade:useToken', false, function(removed)
                                if not removed then
                                    lib.notify({
                                        title = 'Arcade Machine',
                                        description = 'You need an Arcade Token to play!',
                                        type = 'error'
                                    })
                                    return
                                end
                                exports['boii_minigames']:chip_hack({
                                    style = 'default', -- Style template
                                    loading_time = 8000, -- Total time to complete loading sequence in (ms)
                                    chips = 4, -- Amount of chips required to find
                                    timer = 20000 -- Total allowed game time in (ms)
                                }, function(success)
                                    if success then
                                        lib.notify({
                                            title = 'Arcade Machine',
                                            description = 'You cracked Won!',
                                            type = 'success'
                                        })
                                        -- You can add reward logic here
                                    else
                                        lib.notify({
                                            title = 'Arcade Machine',
                                            description = 'You failed the game!',
                                            type = 'error'
                                        })
                                    end
                                end)
                            end)
                        end
                    }
                }
            })
        -----------------------------------------hangman
exports.ox_target:addBoxZone({
    coords = vec3(-1659.6896, -1070.1119, 12.1604),
        size = vec3(1.0, 1.0, 1.0),
        rotation = 0,
        debug = false,
        options = {
            {
                name = 'arcade_hangman',
                label = 'Play Hangman',
                icon = 'fas fa-spell-check',
                distance = 2.0,
                onSelect = function()
                    lib.callback('arcade:useToken', false, function(removed)
                        if not removed then
                            lib.notify({
                                title = 'Arcade Machine',
                                description = 'You need an Arcade Token to play!',
                                type = 'error'
                            })
                            return
                        end
                        exports['boii_minigames']:hangman({
                            style = 'default', -- Style template
                            loading_time = 5000, -- Total time to complete loading sequence in (ms)
                            difficulty = 4, -- Game difficulty refer to `const hangman_word_lists` in `html/scripts/hangman/hangman.js`
                            guesses = 5, -- Amount of guesses until fail
                            timer = 30000 -- Time allowed for guessing in (ms)
                        }, function(success)
                            if success then
                                lib.notify({
                                    title = 'Arcade Machine',
                                    description = 'You Won!',
                                    type = 'success'
                                })
                                -- You can add reward logic here
                            else
                                lib.notify({
                                    title = 'Arcade Machine',
                                    description = 'You failed!',
                                    type = 'error'
                                })
                            end
                        end)
                    end)
                end
            }
        }
})

-----------------------------------key drop

exports.ox_target:addBoxZone({
    coords = vec3(-1654.2378, -1074.0732, 12.1604),
        size = vec3(1.0, 1.0, 1.0),
        rotation = 0,
        debug = false,
        options = {
            {
                name = 'arcade_keydrop',
                label = 'Play Key Drop',
                icon = 'fas fa-spell-check',
                distance = 2.0,
                onSelect = function()
                    lib.callback('arcade:useToken', false, function(removed)
                        if not removed then
                            lib.notify({
                                title = 'Arcade Machine',
                                description = 'You need an Arcade Token to play!',
                                type = 'error'
                            })
                            return
                        end
                        exports['boii_minigames']:key_drop({
                            style = 'default', -- Style template
                            score_limit = 5, -- Amount of keys needed for success
                            miss_limit = 5, -- Amount of keys allowed to miss before fail
                            fall_delay = 1000, -- Time taken for keys to fall from top to bottom in (ms)
                            new_letter_delay = 2000 -- Time taken to drop a new key in (ms)
                        }, function(success)
                            if success then
                                lib.notify({
                                    title = 'Arcade Machine',
                                    description = 'You Won!',
                                    type = 'success'
                                })
                                -- You can add reward logic here
                            else
                                lib.notify({
                                    title = 'Arcade Machine',
                                    description = 'You failed!',
                                    type = 'error'
                                })
                            end
                        end)
                    end)
                end
            }
        }
})

----------------------------------pin code
exports.ox_target:addBoxZone({
    coords = vec3(-1652.8956, -1075.1892, 12.1604),
        size = vec3(1.0, 1.0, 1.0),
        rotation = 0,
        debug = false,
        options = {
            {
                name = 'arcade_pincode',
                label = 'Play Pin Code',
                icon = 'fas fa-spell-check',
                distance = 2.0,
                onSelect = function()
                    lib.callback('arcade:useToken', false, function(removed)
                        if not removed then
                            lib.notify({
                                title = 'Arcade Machine',
                                description = 'You need an Arcade Token to play!',
                                type = 'error'
                            })
                            return
                        end
                        exports['boii_minigames']:pincode({
                            style = 'default', -- Style template
                            difficulty = 4, -- Difficuly; increasing the value increases the amount of numbers in the pincode; level 1 = 4 number, level 2 = 5 numbers and so on // The ui will comfortably fit 10 numbers (level 6) this should be more than enough
                            guesses = 5 -- Amount of guesses allowed before fail
                        }, function(success)
                            if success then
                                lib.notify({
                                    title = 'Arcade Machine',
                                    description = 'You Won!',
                                    type = 'success'
                                })
                                -- You can add reward logic here
                            else
                                lib.notify({
                                    title = 'Arcade Machine',
                                    description = 'You failed!',
                                    type = 'error'
                                })
                            end
                        end)
                    end)
                end
            }
        }
})

------------------------------------------safe cvracker

exports.ox_target:addBoxZone({
    coords = vec3(-1650.2405, -1078.5994, 12.1604),
        size = vec3(1.0, 1.0, 1.0),
        rotation = 0,
        debug = false,
        options = {
            {
                name = 'arcade_safecracker',
                label = 'Play Safe Cracker',
                icon = 'fas fa-spell-check',
                distance = 2.0,
                onSelect = function()
                    lib.callback('arcade:useToken', false, function(removed)
                        if not removed then
                            lib.notify({
                                title = 'Arcade Machine',
                                description = 'You need an Arcade Token to play!',
                                type = 'error'
                            })
                            return
                        end
                        exports['boii_minigames']:safe_crack({
                            style = 'default', -- Style template
                            difficulty = 5
                        }, function(success)
                            if success then
                                lib.notify({
                                    title = 'Arcade Machine',
                                    description = 'You Won!',
                                    type = 'success'
                                })
                                -- You can add reward logic here
                            else
                                lib.notify({
                                    title = 'Arcade Machine',
                                    description = 'You failed!',
                                    type = 'error'
                                })
                            end
                        end)
                    end)
                end
            }
        }
})

------------------------------------------skill bar

--[[ exports.ox_target:addBoxZone({
    coords = vec3(-1648.4347, -1076.4387, 12.1604),
        size = vec3(1.0, 1.0, 1.0),
        rotation = 0,
        debug = false,
        options = {
            {
                name = 'arcade_skillbar',
                label = 'Play Skill Bar',
                icon = 'fas fa-spell-check',
                distance = 2.0,
                onSelect = function()
                    lib.callback('arcade:useToken', false, function(removed)
                        if not removed then
                            lib.notify({
                                title = 'Arcade Machine',
                                description = 'You need an Arcade Token to play!',
                                type = 'error'
                            })
                            return
                        end
                        exports['boii_minigames']:skill_bar({
                            style = 'default', -- Style template
                            icon = 'fa-solid fa-paw', -- Any font-awesome icon; will use template icon if none is provided
                            orientation = 2, -- Orientation of the bar; 1 = horizontal centre, 2 = vertical right.
                            area_size = 20, -- Size of the target area in %
                            perfect_area_size = 5, -- Size of the perfect area in %
                            speed = 0.5, -- Speed the target area moves
                            moving_icon = true, -- Toggle icon movement; true = icon will move randomly, false = icon will stay in a static position
                            icon_speed = 3, -- Speed to move the icon if icon movement enabled; this value is / 100 in the javascript side true value is 0.03
                        }, function(success)
                            if success then
                                lib.notify({
                                    title = 'Arcade Machine',
                                    description = 'You cracked the anagram!',
                                    type = 'success'
                                })
                                -- You can add reward logic here
                            else
                                lib.notify({
                                    title = 'Arcade Machine',
                                    description = 'You failed the anagram!',
                                    type = 'error'
                                })
                            end
                        end)
                    end)
                end
            }
        }
}) ]]

------------------------------------------skill circle

exports.ox_target:addBoxZone({
    coords = vec3(-1649.4902, -1074.7910, 12.1604), 
    size = vec3(1.0, 1.0, 1.0),
    rotation = 0,
    debug = false,
    options = {
        {
            name = 'arcade_skillcircle',
            label = 'Play Precision Challenge',
            icon = 'fas fa-bullseye',
            distance = 2.0,
            onSelect = function(data)
                lib.callback('arcade:useToken', false, function(removed)
                    if not removed then
                        lib.notify({
                            title = 'Arcade Machine',
                            description = 'You need an Arcade Token to play!',
                            type = 'error'
                        })
                        return
                    end
                    exports['boii_minigames']:skill_circle({
                        style = 'default',
                        icon = 'fa-solid fa-paw',
                        area_size = 4,
                        speed = 0.02
                    }, function(success)
                        if success == 'perfect' then
                            lib.notify({
                                title = 'Arcade Machine',
                                description = 'Perfect timing! You nailed it!',
                                type = 'success'
                            })
                        elseif success == 'success' then
                            lib.notify({
                                title = 'Arcade Machine',
                                description = 'Nice job! You passed the challenge.',
                                type = 'inform'
                            })
                        elseif success == 'failed' then
                            lib.notify({
                                title = 'Arcade Machine',
                                description = 'You missed! Better luck next time.',
                                type = 'error'
                            })
                        end
                    end)
                end)
            end
        }
    }
})

----------------------------------------------Wire Cut

exports.ox_target:addBoxZone({
    coords = vec3(-1650.9668, -1073.6066, 12.1604),
        size = vec3(1.0, 1.0, 1.0),
        rotation = 0,
        debug = false,
        options = {
            {
                name = 'arcade_wirecut',
                label = 'Play Wire Cutter',
                icon = 'fas fa-spell-check',
                distance = 2.0,
                onSelect = function()
                    lib.callback('arcade:useToken', false, function(removed)
                        if not removed then
                            lib.notify({
                                title = 'Arcade Machine',
                                description = 'You need an Arcade Token to play!',
                                type = 'error'
                            })
                            return
                        end
                        exports['boii_minigames']:wire_cut({
                            style = 'default', -- Style template
                            timer = 60000 -- Time allowed to complete game in (ms)                            icon_speed = 3, -- Speed to move the icon if icon movement enabled; this value is / 100 in the javascript side true value is 0.03
                        }, function(success)
                            if success then
                                lib.notify({
                                    title = 'Arcade Machine',
                                    description = 'You Won!',
                                    type = 'success'
                                })
                                -- You can add reward logic here
                            else
                                lib.notify({
                                    title = 'Arcade Machine',
                                    description = 'You failed!',
                                    type = 'error'
                                })
                            end
                        end)
                    end)
                end
            }
        }
})

------------------------------------fingerprint

exports.ox_target:addBoxZone({
    coords = vec3(-1649.3422, -1077.5067, 12.1604),
    size = vec3(1.0, 1.0, 1.0),
    rotation = 0,
    debug = false,
    options = {
        {
            name = 'arcade_fingerprint',
            label = 'Play Fingerprint Challenge',
            icon = 'fas fa-fingerprint',
            distance = 2.0,
            onSelect = function(data)
                lib.callback('arcade:useToken', false, function(removed)
                    if not removed then
                        lib.notify({
                            title = 'Arcade Machine',
                            description = 'You need an Arcade Token to play!',
                            type = 'error'
                        })
                        return
                    end
                    local levels = 3
                    local lifes = 4
                    local time = 2 -- minutes

                    TriggerEvent("utk_fingerprint:Start", levels, lifes, time, function(outcome, reason)
                        if outcome == true then
                            lib.notify({
                                title = 'Arcade Machine',
                                description = 'You cracked the fingerprint puzzle!',
                                type = 'success'
                            })
                            -- Reward logic here if needed
                        elseif outcome == false then
                            lib.notify({
                                title = 'Arcade Machine',
                                description = 'You failed the challenge: ' .. (reason or 'Unknown reason'),
                                type = 'error'
                            })
                        end
                    end)
                end)
            end
        }
    }
})

---------------------------------------- VOLT LAB


exports.ox_target:addBoxZone({
    coords = vec3(-1655.2281, -1068.6097, 12.1604), -- Replace with your arcade location
    size = vec3(1.0, 1.0, 1.0),
    rotation = 0,
    debug = false,
    options = {
        {
            name = 'arcade_voltlab',
            label = 'Play Volt Lab',
            icon = 'fas fa-microchip',
            distance = 2.0,
            onSelect = function(data)
                lib.callback('arcade:useToken', false, function(removed)
                    if not removed then
                        lib.notify({
                            title = 'Arcade Machine',
                            description = 'You need an Arcade Token to play!',
                            type = 'error'
                        })
                        return
                    end
                    local time = 30
                    if exports['ps-buffs'] and exports['ps-buffs']:HasBuff("quickhacking") then
                        time = 60
                    end

                    -- Start the volt lab hack
                    TriggerEvent('ultra-voltlab', time, function(result, reason)
                        if result == 1 then
                            lib.notify({
                                title = 'Arcade Machine',
                                description = 'Hack successful!',
                                type = 'success'
                            })
                        elseif result == 0 then
                            lib.notify({
                                title = 'Arcade Machine',
                                description = 'Hack failed: ' .. (reason or 'Unknown'),
                                type = 'error'
                            })
                        elseif result == 2 then
                            lib.notify({
                                title = 'Arcade Machine',
                                description = 'Time ran out!',
                                type = 'error'
                            })
                        elseif result == -1 then
                            lib.notify({
                                title = 'Arcade Machine',
                                description = 'An error occurred: ' .. (reason or 'Invalid input'),
                                type = 'error'
                            })
                        end
                    end)
                end)
            end
        }
    }
})


---------------------------------bd minigames memory card

exports.ox_target:addBoxZone({
    coords = vec3(-1650.9135, -1067.0225, 12.1604), 
    size = vec3(1.0, 1.0, 1.0),
    rotation = 0,
    debug = false,
    options = {
        {
            name = 'arcade_memory',
            label = 'Play Memory Challenge',
            icon = 'fas fa-keyboard',
            distance = 2.0,
            onSelect = function(data)
                lib.callback('arcade:useToken', false, function(removed)
                    if not removed then
                        lib.notify({
                            title = 'Arcade Machine',
                            description = 'You need an Arcade Token to play!',
                            type = 'error'
                        })
                        return
                    end
                local success = memoryCardGame()
                if not success then
                    lib.notify({
                        title = 'Arcade Machine',
                        description = 'Failed to start the game!',
                        type = 'error'
                    })
                end
                end)
            end
        }
    }
})

------------------------------minesweep

exports.ox_target:addBoxZone({
    coords = vec3(-1652.2925, -1075.7056, 12.1604), 
    size = vec3(1.0, 1.0, 1.0),
    rotation = 0,
    debug = false,
    options = {
        {
            name = 'arcade_minesweep',
            label = 'Play Mine Sweep',
            icon = 'fas fa-keyboard',
            distance = 2.0,
            onSelect = function(data)
                lib.callback('arcade:useToken', false, function(removed)
                    if not removed then
                        lib.notify({
                            title = 'Arcade Machine',
                            description = 'You need an Arcade Token to play!',
                            type = 'error'
                        })
                        return
                    end
                local success = mineSweepGame()
                if not success then
                    lib.notify({
                        title = 'Arcade Machine',
                        description = 'Failed to start the game!',
                        type = 'error'
                    })
                end
                end)
            end
        }
    }
})

-----------------------------------------open terminal

exports.ox_target:addBoxZone({
    coords = vec3(-1653.5846, -1074.6345, 12.1604), 
    size = vec3(1.0, 1.0, 1.0),
    rotation = 0,
    debug = false,
    options = {
        {
            name = 'arcade_terminal',
            label = 'Play Terminal',
            icon = 'fas fa-keyboard',
            distance = 2.0,
            onSelect = function(data)
                lib.callback('arcade:useToken', false, function(removed)
                    if not removed then
                        lib.notify({
                            title = 'Arcade Machine',
                            description = 'You need an Arcade Token to play!',
                            type = 'error'
                        })
                        return
                    end
                local success = mineSweepGame()
                if not success then
                    lib.notify({
                        title = 'Arcade Machine',
                        description = 'Failed to start the game!',
                        type = 'error'
                    })
                end
                end)
            end
        }
    }
})

-----------------------------------MAZE

exports.ox_target:addBoxZone({
    coords = vec3(-1650.1698, -1074.1693, 12.1604),
    size = vec3(1.0, 1.0, 1.0),
    rotation = 0,
    debug = false,
    options = {
        {
            name = 'arcade_maze',
            label = 'Play Maze Challenge',
            icon = 'fas fa-puzzle-piece',
            distance = 2.0,
            onSelect = function()
                lib.callback('arcade:useToken', false, function(removed)
                    if not removed then
                        lib.notify({
                            title = 'Arcade Machine',
                            description = 'You need an Arcade Token to play!',
                            type = 'error'
                        })
                        return
                    end
                    local result = promise.new()

                    exports['ps-ui']:Maze(function(success)
                        result:resolve(success)
                    end, 20)

                    local success = Citizen.Await(result)
                    if success then
                        lib.notify({
                            title = 'Arcade Machine',
                            description = 'You completed the maze!',
                            type = 'success'
                        })
                    else
                        lib.notify({
                            title = 'Arcade Machine',
                            description = 'You failed the maze challenge!',
                            type = 'error'
                        })
                    end
                end)
            end
        }
    }
})

-----------------VCAR


exports.ox_target:addBoxZone({
    coords = vec3(-1660.2031, -1068.5292, 12.1604),
    size = vec3(1.0, 1.0, 1.0),
    rotation = 0,
    debug = false,
    options = {
        {
            name = 'arcade_var',
            label = 'Play VAR Challenge',
            icon = 'fas fa-puzzle-piece',
            distance = 2.0,
            onSelect = function()
                lib.callback('arcade:useToken', false, function(removed)
                    if not removed then
                        lib.notify({
                            title = 'Arcade Machine',
                            description = 'You need an Arcade Token to play!',
                            type = 'error'
                        })
                        return
                    end
                    local result = promise.new()

                    exports['ps-ui']:VarHack(function(success)
                        result:resolve(success)
                    end, 7, 45) 

                    local success = Citizen.Await(result)
                    if success then
                        lib.notify({
                            title = 'Arcade Machine',
                            description = 'You Won!',
                            type = 'success'
                        })
                    else
                        lib.notify({
                            title = 'Arcade Machine',
                            description = 'You failed!',
                            type = 'error'
                        })
                    end
                end)
            end
        }
    }
})

-------------------------------THERMITE

exports.ox_target:addBoxZone({
    coords = vec3(-1651.9476, -1068.2377, 12.1604), 
    size = vec3(1.0, 1.0, 1.0),
    rotation = 0,
    debug = false,
    options = {
        {
            name = 'arcade_thermite',
            label = 'Play Thermite Challenge',
            icon = 'fas fa-puzzle-piece',
            distance = 2.0,
            onSelect = function()
                lib.callback('arcade:useToken', false, function(removed)
                    if not removed then
                        lib.notify({
                            title = 'Arcade Machine',
                            description = 'You need an Arcade Token to play!',
                            type = 'error'
                        })
                        return
                    end
                    local result = promise.new()

                    exports['ps-ui']:Thermite(function(success)
                        result:resolve(success)
                    end, 15, 9, 3)

                    local success = Citizen.Await(result)
                    if success then
                        lib.notify({
                            title = 'Arcade Machine',
                            description = 'You Won!',
                            type = 'success'
                        })
                    else
                        lib.notify({
                            title = 'Arcade Machine',
                            description = 'You failed!',
                            type = 'error'
                        })
                    end
                end)
            end
        }
    }
})

---------------------------------------------SCRAMBLER

exports.ox_target:addBoxZone({
    coords = vec3(-1649.8650, -1065.6327, 12.1604), -- Replace with your arcade coords
    size = vec3(1.0, 1.0, 1.0),
    rotation = 0,
    debug = false,
    options = {
        {
            name = 'arcade_scrambler',
            label = 'Play Scrambler',
            icon = 'fas fa-puzzle-piece',
            distance = 2.0,
            onSelect = function()
                lib.callback('arcade:useToken', false, function(removed)
                    if not removed then
                        lib.notify({
                            title = 'Arcade Machine',
                            description = 'You need an Arcade Token to play!',
                            type = 'error'
                        })
                        return
                    end

                    local result = promise.new()

                    exports['ps-ui']:Scrambler(function(success)
                        result:resolve(success)
                    end, 'braille', 30, 1)

                    local success = Citizen.Await(result)
                    if success then
                        lib.notify({
                            title = 'Arcade Machine',
                            description = 'You Won!',
                            type = 'success'
                        })
                    else
                        lib.notify({
                            title = 'Arcade Machine',
                            description = 'You failed!',
                            type = 'error'
                        })
                    end
                end)
            end
        }
    }
})

----------------------------------


local huntingRifleHash = `WEAPON_HUNTINGRIFLE`

CreateThread(function()
    while true do
        Wait(0)

        local player = PlayerPedId()
        local weapon = GetSelectedPedWeapon(player)

        if weapon == huntingRifleHash then
            local hit, entity = GetEntityPlayerIsFreeAimingAt(PlayerId())
            if hit and IsEntityAPed(entity) and IsPedAPlayer(entity) then
                SetWeaponDamageModifierThisFrame(huntingRifleHash, 0.0)
            end
        end
    end
end)
