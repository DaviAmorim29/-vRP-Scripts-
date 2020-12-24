resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

ui_page "nui/ui.html"

files {
	"nui/ui.html",
	"nui/main.html",
	"nui/marca.html",
   	"nui/ui.js",
	"nui/ui.css",
	"nui/style.css",
	"nui/delega.png",
	"nui/destino.png",
	"nui/gta-fonte.ttf",
	"nui/praca.png",
}

client_script {
  'Proxy.lua',
  'click.lua'
}

server_script {
  '@vrp/lib/utils.lua',
  'server.lua'
}
