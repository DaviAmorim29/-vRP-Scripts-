var cars = false

$(document).ready(function () {
  $(".container").hide();
  window.addEventListener('message', function (event) {
    var item = event.data;
    if (item.show == true) {
      open()
    }
    if (item.show == false) {
      close();
    }
    if (item.foods) {
      $("#foods").empty();
      item.foods.forEach(element => {
        $("#foods").append(`
          <div style="background-image: url('assets/icons/${element.icon}'); background-size: 95px 95px;">
            <p class="price">R$ ${element.price}</p>
            <p class="name">${element.realname}</p><a data-logo="${element.icon}" data-name="${element.realname}" data-price="${element.price}" data-idname="${element.name}" onclick="open_food(this)" class="buy"><i class="fas fa-shopping-cart"></i></a>
          </div>
        `);
      });
    }









    if (item.notify == true) {
      Swal.fire({
        title: item.titulo,
        text: item.desc,
        type: item.type,
        background: 'linear-gradient(to top right,rgba(50,50,50,1), rgba(50,50,50,0.9))',
      })
    }
  });
  document.onkeyup = function (data) {
    if (data.which == 27) {
      $.post('http://vrp_mercado/close', JSON.stringify({}));
    }
  };
  $(".closeButton").click(function () {
    $.post('http://vrp_mercado/close', JSON.stringify({}));
  });
});






function open_food(element) {
  var data = element.dataset
  Swal.fire({
    title: ""+data.name+"",
    imageUrl: "assets/icons/"+data.logo+"",
    padding: '15px',
    imageWidth: 90,
    imageAlt: ""+data.name+"",
    text: "Selecione a quantidade de "+data.name+"",
    background: 'linear-gradient(to top right,rgba(50,50,50,1), rgba(50,50,50,0.9))',
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    cancelButtonText: 'Voltar',
    confirmButtonText: 'Comprar',
    input: "number",
  }).then((result) => {
    if (result.value) {
      if (result.value > 0) {
        $.post("http://vrp_mercado/buy", JSON.stringify({
          quantidade : result.value,
          price : data.price,
          idname : data.idname,
          name : data.name,
        }));
      } else {
        Swal.fire({
          title: "Atenção",
          icon: "warning",
          text: 'Valor digitado é nulo',
          background: 'linear-gradient(to top right,rgba(50,50,50,1), rgba(50,50,50,0.9))',
        })
      }
    }
  })
}










function open() {
  $(".container").fadeIn();
  $("#meio").css("display", "block");
  cars = true
}
function close() {
  $(".container").fadeOut();
  $("#meio").css("display", "none");
}