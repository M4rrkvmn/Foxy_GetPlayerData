fx_version 'cerulean'
game 'gta5'

author 'M4rrk'
version '1.1'

client_script 'client/client.lua'
server_script {'server/server.lua','@oxmysql/lib/MySQL.lua','server/log.lua'}
shared_script 'config.lua'

ui_page 'ui/index.html'


files {
    'ui/index.html',
    'ui/script.js',
    'ui/styles.css',
}
