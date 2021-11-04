fx_version 'adamant'
game 'gta5'

name 'RageUI';
description 'RageUI, and a project specially created to replace the NativeUILua-Reloaded library. This library allows to create menus similar to the one of Grand Theft Auto online.'


dependency 'nCoreGTA'


client_scripts {
    "src/RMenu.lua",
    "src/menu/RageUI.lua",
    "src/menu/Menu.lua",
    "src/menu/MenuController.lua",
    "src/components/*.lua",
    "src/menu/elements/*.lua",
    "src/menu/items/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/windows/*.lua",
    "jobs/pullover/pullover.lua",
    "jobs/arrest/arr_client.lua",
    "jobs/callouts/call_client.lua",
    "jobs/other/loadouts_cl.lua",
    "jobs/addons/tow.lua",
    "config/config.lua";
    "client/*.lua"
}

server_scripts { 
    "pullover/po_server.lua",
    "arrest/arr_server.lua",
    "callouts/call_server.lua",
    "other/loadouts_sv.lua",
    "@mysql-async/lib/MySQL.lua",
    "server/server.lua"
}