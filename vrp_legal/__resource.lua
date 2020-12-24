ui_page "nui/ui.html"

files {
    "nui/ui.html",
    "nui/ui.css",
    "nui/ui.js",
    "nui/font/gta-fonte.ttf",
    "nui/font/gta2.ttf",
    "nui/lixeiro.png"
}

client_scripts {"cfg/config.lua","lib/Proxy.lua","client.lua"}

server_script {"@vrp/lib/utils.lua","cfg/config.lua","server.lua"}