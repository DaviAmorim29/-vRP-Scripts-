

$(document).ready(function(){

    window.addEventListener( 'message', function( event ) {
           var item = event.data;
   
                if ( item.legal == true ) {
                $('.container').css('display','block');
            } else if ( item.legal == false ) {
                $('.container').css("display","none");
            }
       });

    $("#cocaina").click(function(){
        $.post('http://vrp_ilegal/cocaina', JSON.stringify({}));2
    });

    $("#maconha").click(function(){
        $.post('http://vrp_ilegal/maconha', JSON.stringify({}));2
    });

    $("#metanfetamina").click(function(){
        $.post('http://vrp_ilegal/metanfetamina', JSON.stringify({}));2
    });

    $("#hacker").click(function(){
        $.post('http://vrp_ilegal/hacker', JSON.stringify({}));2
    });

    $("#ladraocarros").click(function(){
        $.post('http://vrp_ilegal/ladraocarros', JSON.stringify({}));2
    });

    $("#assaltante").click(function(){
        $.post('http://vrp_ilegal/assaltante', JSON.stringify({}));2
    });


    $("#close").click(function(){
        $.post('http://vrp_ilegal/close', JSON.stringify({}));2
    });
   
   })