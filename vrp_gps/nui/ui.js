
$(document).ready(function(){

 window.addEventListener( 'message', function( event ) {
        var item = event.data;

        if ( item.showPlayerMenu == true ) {
	$('body').css('background-color','transparent');

$('.main').css('display','block');
} else if ( item.showPlayerMenu == false ) { // Hide the menu

$('.main').css('display','none');
$('body').css('background-color','transparent important!');
	$("body").css("background-image","none");

        }
    });
	
	$("#hospital").click(function(){
        $.post('http://vrp_gps/hospital', JSON.stringify({}));2
    });

    $("#delegacia").click(function(){
        $.post('http://vrp_gps/delegacia', JSON.stringify({}));2
    });

    $("#praca").click(function(){
        $.post('http://vrp_gps/praca', JSON.stringify({}));2
    });

    $("#academia").click(function(){
        $.post('http://vrp_gps/academia', JSON.stringify({}));2
    });

    $("#concessionaria").click(function(){
        $.post('http://vrp_gps/concessionaria', JSON.stringify({}));2
    });

    $("#agencia").click(function(){
        $.post('http://vrp_gps/agencia', JSON.stringify({}));2
    });

    $("#favela").click(function(){
        $.post('http://vrp_gps/favela', JSON.stringify({}));2
    });

    $("#closebtn").click(function(){
        $.post('http://vrp_gps/closeButton', JSON.stringify({}));2
    });

})