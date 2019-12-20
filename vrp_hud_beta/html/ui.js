$(document).ready(function(){
    // $(".container").hide()
    window.addEventListener('message',function(event){
        var hud = event.data
        if (hud.show == true) {
            $(".container").fadeIn()
        } else if (hud.show == false) {
            $(".container").fadeOut()
        }

        if (hud.status) {
            hud.status.forEach(element => {
                $(".container").append(`
                    <div id="hunger" class="chart_hunger" data-percent="${element.fome}"><img style="left:-2px; top: 9px; width: 28px;height: 28px;" src="img/food.png" class="img_icon_drink"></div>
                    <div id="thirst" class="chart" data-percent="${element.sede}"><img style="left: 0.5px;" src="img/drink.png" class="img_icon_drink"></div>
                    <script>
                    // <i class="fas fa-wine-bottle"></i>
                    // <i class="fas fa-utensils"></i>
                    $(function() {
                        $(".chart").easyPieChart({
                            size: '45',
                            barColor: '#18a3ff',
                            animate: '1000',
                            trackColor: 'rgba(120,120,120,0.6)',
                            lineCap: 'butt',
                            scaleColor: false,
                            lineWidth: '4.5',
                        });
                        $(".chart_hunger").easyPieChart({
                            size: '45',
                            barColor: '#ff8940',
                            animate: '1000',
                            trackColor: 'rgba(120,120,120,0.6)',
                            lineCap: 'butt',
                            scaleColor: false,
                            lineWidth: '4.5',
                        })

                        setTimeout(function() {
                            $('.chart').data('${element.sede}').update(40);
                            $('.chart_hunger').data('${element.fome}').update(40);
                            $("#thirst").html("${element.sede}");
                            $("#hunger").html("${element.fome}");
                        }, 5000);
                    });
                    </script>
                    `)
            })
        }

    })
})