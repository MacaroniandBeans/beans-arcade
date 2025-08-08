shared_script '@fiveguard/shared_fg-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Beans'
description 'Arcade'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua',
}


client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}

dependencies {
    'qb-core',
    'ox_inventory',
    'oxmysql'
}