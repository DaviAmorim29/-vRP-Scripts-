resource_manifest_version "77731fab-63ca-442c-a67b-abc70f28dfa5"

ui_page "client/html/ui.html"
files {
	"client/html/ui.html",
	"client/html/styles.css",
	"client/html/scripts.js",
	"configNui.js",
	"client/html/debounce.min.js",
	"client/html/sweetalert2.all.min.js",
	"client/html/assets/icons/pao.png",
	"client/html/assets/icons/agua.png",
    "client/html/assets/icons/espaguete.png",
    "client/html/assets/icons/leite.png",
    "client/html/assets/icons/limonada.png",
    "client/html/assets/icons/pao.png",
    "client/html/assets/icons/pipoca.png",
    "client/html/assets/icons/pizza.png",
    "client/html/assets/icons/rosquinha.png",
    "client/html/assets/icons/suco.png",
    "client/html/assets/icons/vinho.png",
    "client/html/assets/icons/vodka.png",
    "client/html/assets/icons/gps.png",
}

client_scripts {
	"lib/Tunnel.lua",
	"lib/Proxy.lua",
	"config.lua",
	"client/main.lua"
}

server_scripts {
	"@vrp/lib/utils.lua",
	"config.lua",
	"server/main.lua"
}
