fx_version 'cerulean'
game 'gta5'

author 'FB - Shop'
description 'Et Jobcenter som udnytter ox scripts'
discord 'https://discord.gg/RXKxvsVJp2'
version '1.0.0'
lua54 'yes'

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}

shared_scripts {'@es_extended/imports.lua','@ox_lib/init.lua'}

dependencies {
    'es_extended',
    'ox_lib',
    'ox_target'
}
