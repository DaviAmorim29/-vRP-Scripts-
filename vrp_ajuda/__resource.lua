resource_manifest_version "77731fab-63ca-442c-a67b-abc70f28dfa5"

ui_page "client/html/ui.html"
files {
	"client/html/ui.html",
	"client/html/styles.css",
	"client/html/scripts.js",
	"configNui.js",
	"client/html/debounce.min.js",
	"client/html/sweetalert2.all.min.js",
	"client/html/assets/banner.png",
	"client/html/assets/logo.png",
	
	"client/html/assets/key_ctrl.jpg",
	"client/html/assets/key_left_arrow.jpg",
	"client/html/assets/key_right_arrow.jpg",
	"client/html/assets/key_up_arrow.jpg",
	"client/html/assets/key_down_arrow.jpg",

	"client/html/assets/key_b.jpg",
	"client/html/assets/key_f3.jpg",
	"client/html/assets/key_t.jpg",
	"client/html/assets/key_l.jpg",
	"client/html/assets/key_g.jpg",
	"client/html/assets/key_h.jpg",
	"client/html/assets/key_x.jpg",
	"client/html/assets/key_z.jpg",
	"client/html/assets/key_f1.jpg",
	"client/html/assets/key_f2.jpg",
	"client/html/assets/key_f6.jpg",
	"client/html/assets/key_f9.jpg",
	"client/html/assets/key_n.jpg",
	"client/html/assets/key_f10.jpg",
	"client/html/assets/key_u.jpg",
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
