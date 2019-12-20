description "Amorim#0567"

ui_page "ui.html"

files {
    "ui.html",
    "ui.css"
}

client_script {
    "client.lua"
}

server_scripts {
    "@vrp/lib/utils.lua",
    "server.lua"
}