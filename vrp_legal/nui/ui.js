

$(document).ready(function(){

    window.addEventListener( 'message', function( event ) {
           var item = event.data;
   
                if ( item.legal == true ) {
                $('.container').css('display','block');
            } else if ( item.legal == false ) {
                $('.container').css("display","none");
            }
       });

    $("#minerador").click(function(){
        $.post('http://vrp_legal/minerador', JSON.stringify({}));2
    });

    $("#mecanico").click(function(){
        $.post('http://vrp_legal/mecanico', JSON.stringify({}));2
    });

    $("#taxi").click(function(){
        $.post('http://vrp_legal/taxi', JSON.stringify({}));2
    });

    $("#sedex").click(function(){
        $.post('http://vrp_legal/sedex', JSON.stringify({}));2
    });

    $("#pescador").click(function(){
        $.post('http://vrp_legal/pescador', JSON.stringify({}));2
    });

    $("#lixeiro").click(function(){
        $.post('http://vrp_legal/lixeiro', JSON.stringify({}));2
    });

    $("#close").click(function(){
        $.post('http://vrp_legal/close', JSON.stringify({}));2
    });
   
   })