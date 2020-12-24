$(document).ready(function(){

    window.addEventListener( 'message', function( event ) {
           var item = event.data;

            if ( item.heal == true ) {
                $('.heal').css('display','block');
            } else if ( item.heal == false ) {
                $('.heal').css('display','none');
            } else if ( item.healfree == true ) {
                $(".healfree").css("display", "block");
            } else if ( item.healfree == false ) {
                $(".healfree").css("display", "none");
            } else if ( item.buy == true ) {
                $(".buy").css("display", "block");
            } else if ( item.buy == false ) {
                $(".buy").css("display", "none");
            }
       });





       $("#kit-free").click(function(){
        $.post('http://vrp_convenio/free', JSON.stringify({}));2
       });


       $("#kit-pago").click(function(){
        $.post('http://vrp_convenio/pago', JSON.stringify({}));2
       });


       $("#assinar").click(function(){
        $.post('http://vrp_convenio/unimed', JSON.stringify({}));2
       });

        $("#closebtn").click(function(){
            $.post('http://vrp_convenio/closeButton', JSON.stringify({}));2
        });
        $("#fechar").click(function(){
            $.post('http://vrp_convenio/closeButton', JSON.stringify({}));2
        });
        $(".fechar2").click(function(){
            $.post('http://vrp_convenio/closeButton', JSON.stringify({}));2
        });
   
})