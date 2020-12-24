ui_page "index.html"

files {
    "index.html",
    "style.css"
}

client_script "client.lua"

server_scripts {
    "@vrp/lib/utils.lua",
    "server.lua"
}