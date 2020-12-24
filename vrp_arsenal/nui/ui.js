$(document).ready(function(){

    window.addEventListener( 'message', function( event ) {
           var item = event.data;
   
                if ( item.recruta == true ) {
                $('.recruta').css('display','block');
            } else if ( item.recruta == false ) {
                $('.recruta').css("display","none");
            } else if ( item.soldado == true ) {
                $('.soldado').css("display", "block");
            } else if ( item.soldado == false ) {
                $(".soldado").css("display", "none");
            } else if ( item.cabo == true ) {
                $('.cabo').css("display", "block");
            } else if ( item.cabo == false ) {
                $(".cabo").css("display", "none");
            } else if ( item.sgt3 == true ) {
                $('.sgt3').css("display", "block");
            } else if ( item.sgt3 == false ) {
                $(".sgt3").css("display", "none");
            } else if ( item.sgt2 == true ) {
                $('.sgt2').css("display", "block");
            } else if ( item.sgt2 == false ) {
                $(".sgt2").css("display", "none");
            } else if ( item.sgt1 == true ) {
                $('.sgt1').css("display", "block");
            } else if ( item.sgt1 == false ) {
                $(".sgt1").css("display", "none");
            } else if ( item.subten == true ) {
                $('.subten').css("display", "block");
            } else if ( item.subten == false ) {
                $(".subten").css("display", "none");
            } else if ( item.ten2 == true ) {
                $('.ten2').css("display", "block");
            } else if ( item.ten2 == false ) {
                $(".ten2").css("display", "none");
            } else if ( item.ten1 == true ) {
                $('.ten1').css("display", "block");
            } else if ( item.ten1 == false ) {
                $(".ten1").css("display", "none");
            } else if ( item.capitao == true ) {
                $('.capitao').css("display", "block");
            } else if ( item.capitao == false ) {
                $(".capitao").css("display", "none");
            } else if ( item.major == true ) {
                $('.major').css("display", "block");
            } else if ( item.major == false ) {
                $(".major").css("display", "none");
            } else if ( item.tencel == true ) {
                $('.tencel').css("display", "block");
            } else if ( item.tencel == false ) {
                $(".tencel").css("display", "none");
            } else if ( item.cel == true ) {
                $('.cel').css("display", "block");
            } else if ( item.cel == false ) {
                $(".cel").css("display", "none");
            } else if ( item.comandante == true ) {
                $('.comandante').css("display", "block");
            } else if ( item.comandante == false ) {
                $(".comandante").css("display", "none");
            }
       });






    $("#recruta").click(function(){
        $.post('http://vrp_arsenal/recruta', JSON.stringify({}));2
    });

    $("#soldado").click(function(){
        $.post('http://vrp_arsenal/soldado', JSON.stringify({}));2
    });

    $("#cabo").click(function(){
        $.post('http://vrp_arsenal/cabo', JSON.stringify({}));2
    });

    $("#sgt3").click(function(){
        $.post('http://vrp_arsenal/sgt3', JSON.stringify({}));2
    });

    $("#sgt2").click(function(){
        $.post('http://vrp_arsenal/sgt2', JSON.stringify({}));2
    });

    $("#sgt1").click(function(){
        $.post('http://vrp_arsenal/sgt1', JSON.stringify({}));2
    });

    $("#subten").click(function(){
        $.post('http://vrp_arsenal/subten', JSON.stringify({}));2
    });

    $("#ten2").click(function(){
        $.post('http://vrp_arsenal/ten2', JSON.stringify({}));2
    });

    $("#ten1").click(function(){
        $.post('http://vrp_arsenal/ten1', JSON.stringify({}));2
    });

    $("#capitao").click(function(){
        $.post('http://vrp_arsenal/capitao', JSON.stringify({}));2
    });

    $("#major").click(function(){
        $.post('http://vrp_arsenal/major', JSON.stringify({}));2
    });

    $("#tencel").click(function(){
        $.post('http://vrp_arsenal/tencel', JSON.stringify({}));2
    });

    $("#cel").click(function(){
        $.post('http://vrp_arsenal/cel', JSON.stringify({}));2
    });

    $("#comandante").click(function(){
        $.post('http://vrp_arsenal/comandante', JSON.stringify({}));2
    });


    $(".close").click(function(){
        $.post('http://vrp_arsenal/close', JSON.stringify({}));2
    });
   
   })