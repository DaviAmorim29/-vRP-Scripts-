ui_page "html/ui.html"

files {
    "html/ui.html",
    "html/ui.css",
    "html/ui.js",
    "html/jquery.easypiechart.js",
    "html/img/food.png",
    "html/img/drink.png"
}


server_scripts {"@vrp/lib/utils.lua","server.lua"}

client_script "client.lua"