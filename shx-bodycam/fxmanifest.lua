fx_version "cerulean"
author "shinohere #discord"
description "shx-bodycam"
game "gta5"
lua54 "yes"

shared_script "@ox_lib/init.lua"
shared_script "config.lua"
server_script "server/sv_main.lua"
client_script "client/cl_main.lua"

ui_page "html/index.html"

files {
  'html/index.html',
	'html/**/*.*',
}
