$(document).ready(function(){
    window.addEventListener("message",function(event){
        var type = event.data.tipo
        var msg = event.data.msg
        var nave = "<div id = '"+type+"'>"+msg+"</div>"
        $(nave).appendTo("#notify").hide().fadeIn(500).delay(5000).fadeOut(500);
    });
})