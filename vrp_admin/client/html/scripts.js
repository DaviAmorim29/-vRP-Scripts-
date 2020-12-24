/*
  __  __           _            _                 _  __                         _____  
 |  \/  |         | |          | |               | |/ /                        |  __ \ 
 | \  / | __ _  __| | ___      | |__  _   _      | ' / __ _ ___ _ __   ___ _ __| |__) |
 | |\/| |/ _` |/ _` |/ _ \     | '_ \| | | |     |  < / _` / __| '_ \ / _ \ '__|  _  / 
 | |  | | (_| | (_| |  __/     | |_) | |_| |     | . \ (_| \__ \ |_) |  __/ |  | | \ \ 
 |_|  |_|\__,_|\__,_|\___|     |_.__/ \__, |     |_|\_\__,_|___/ .__/ \___|_|  |_|  \_\
                                       __/ |                   | |                     
                                      |___/                    |_|                     

  Author: Kasper Rasmussen
  Steam: https://steamcommunity.com/id/kasperrasmussen
*/

let openCaseID;
let openCaseAuthor;
let supportPermissions;
let loadingscreen = false;
let loadingscreen_delay = 0;

$(document).ready(function () {
	window.addEventListener('message', function (event) {
		var item = event.data;
		$('*').scrollTop(0);
		if (item.show == true) {
			open();
			openMyCases();
		}
		if (item.show == false) {
			close();
		}
		if (item.options) {
			if (item.options.supportPermissions == true) {
				supportPermissions = item.options.supportPermissions;
				$("#btnSupportCases").css("display", "block");
			} else {
				supportPermissions = false;
				$("#btnSupportCases").css("display", "none");
			}
		}
		if (item.showMyCases) {
			$(".nav-item").attr("class", "nav-item");
			$("#btnMyCases").attr("class", "nav-item active");
			$("#my-cases-container").empty();
			if (item.cases.length > 0) {
				item.cases.forEach(element => {
					let currentStauts;
					if (element.status == 1) {
						currentStauts = "Em aberto";
					} else {
						currentStauts = "Fechados";
					}
					if (element.title.length > 60) {
						element.title = element.title.substr(0, 60) + ' ...';
					}
					$("#my-cases-container").append(`
						<div class="case flex" onclick="openCase(${element.id})">
							<p>#${element.id}</p>
							<p>${element.title}</p>
							<p>Status: ${currentStauts}</p>
						</div>
					`);
				});
			} else {
				$("#my-cases-container").append(`
					<h3 class="cases-empty">Sem Tickets</h3>
				`);
			}
			setTimeout(function () {
				$("#my-cases").css("display", "block");
				$("#support-cases").css("display", "none");
				$("#new-case").css("display", "none");
				$("#show-case").css("display", "none");
				$("#loadingscreen").css("display", "none");
			}, 1000);
		}
		if (item.showSupportCases) {
			$(".nav-item").attr("class", "nav-item");
			$("#btnSupportCases").attr("class", "nav-item active");
			$("#support-cases-container").empty();
			if (item.cases.length > 0) {
				item.cases.forEach(element => {
					if (element.title.length > 60) {
						element.title = element.title.substr(0, 60) + ' ...';
					}
					$("#support-cases-container").append(`
						<div class="case flex" onclick="openCase(${element.id})">
							<p>#${element.id}</p>
							<p>${element.title}</p>
							<p>ID: ${element.user_id}</p>
						</div>
					`);
				});
			} else {
				$("#support-cases-container").append(`
					<h3 class="cases-empty">Sem casos pendentes</h3>
				`);
			}
			setTimeout(function () {
				$("#my-cases").css("display", "none");
				$("#support-cases").css("display", "block");
				$("#new-case").css("display", "none");
				$("#show-case").css("display", "none");
				$("#loadingscreen").css("display", "none");
			}, 1000);
		}
		if (item.openCase) {
			$(".nav-item").attr("class", "nav-item");
			if (item.case.title.length > 80) {
				$(".case-info #case-title").html(item.case.title.substr(0, 80) + ' ...');
			} else {
				$(".case-info #case-title").html(item.case.title);
			}
			$(".case-info #case-author-id span").html(item.case.user_id);
			$(".case-info #case-message").html(item.case.message);
			$('#show-case').scrollTop(0);
			if (item.case.status == 1) {
				$(".caseOpen").css("display", "block");
				$(".caseClosed").css("display", "none");
			} else {
				$(".caseOpen").css("display", "none");
				$(".caseClosed").css("display", "block");
			}
			CKEDITOR.instances.replyEditor.setData('');
			openCaseID = item.case.id;
			openCaseAuthor = item.case.user_id;
			if (item.replies) {
				$(".case-replies").empty();
				item.replies.forEach(element => {
					$(".case-replies").append(`
						<div class="reply">
							<p>Seu ID: ${element.user_id}</p>
							<p>${element.message}</p>
						</div>
					`);
				});
			}
			if (supportPermissions == true) {
				$(".support-btn").css("display", "block");
			} else {
				$(".support-btn").css("display", "none");
			}
			setTimeout(function () {
				$("#my-cases").css("display", "none");
				$("#support-cases").css("display", "none");
				$("#new-case").css("display", "none");
				$("#show-case").css("display", "block");
				$("#loadingscreen").css("display", "none");
			}, 1000);
		}
	});
	document.onkeyup = function (data) {
		if (data.which == 27) {
			$.post('http://vrp_admin/close', JSON.stringify({}));
		}
	};
	$(".btnClose").click(function () {
		$.post('http://vrp_admin/close', JSON.stringify({}));
	});
});

function open() {
	$(".container").fadeIn();
}
function close() {
	$(".container").fadeOut();
	$("#my-cases").css("display", "none");
	$("#support-cases").css("display", "none");
	$("#new-case").css("display", "none");
	$("#show-case").css("display", "none");
}
function openMyCases() {
	openLoadingscreen();
	$.post('http://vrp_admin/getCases', JSON.stringify({}));
}
function openSupportCases() {
	openLoadingscreen();
	$.post('http://vrp_admin/getSupportCases', JSON.stringify({}));
}
function openNewCase() {
	$("#my-cases").css("display", "none");
	$("#support-cases").css("display", "none");
	$("#new-case").css("display", "block");
	$("#show-case").css("display", "none");
	$(".nav-item").attr("class", "nav-item");
	$("#btnNewCase").attr("class", "nav-item active");
	CKEDITOR.instances.newCaseEditor.setData('');
	$(".new-case-title").val("");
}
function openCase(id) {
	if (!id) {
		Swal.fire(
			'Houve um problema!',
			'Não foi possível achar o caso',
			'warning'
		);
		return;
	}
	openLoadingscreen();
	$.post('http://vrp_admin/getCase', JSON.stringify({
		id: id
	}));
}
function openLoadingscreen() {
	$("#my-cases").css("display", "none");
	$("#support-cases").css("display", "none");
	$("#new-case").css("display", "none");
	$("#show-case").css("display", "none");
	$("#loadingscreen").css("display", "block");
	$(".nav-item").attr("class", "nav-item");
}

function applyReply() {
	let message = CKEDITOR.instances.replyEditor.getData();
	if (!message) {
		Swal.fire(
			'Tenho um problema!',
			'Escreva a mensagem',
			'warning'
		);
		return;
	}
	if (!openCaseID)
		return openMyCases();
	$.post('http://vrp_admin/applyReply', JSON.stringify({
		message: message,
		case_id: openCaseID
	}));
}

async function closeCase() {
	if (!openCaseID)
		return openMyCases();

	let confirmed = await btn_confirm("Encerrar caso");
	if (confirmed) {
		$.post('http://vrp_admin/closeCase', JSON.stringify({
			case_id: openCaseID
		}));
	}
}

async function deleteCase() {
	if (!openCaseID)
		return openMyCases();

	let confirmed = await btn_confirm("Deletar caso");
	if (confirmed) {
		$.post('http://vrp_admin/deleteCase', JSON.stringify({
			case_id: openCaseID
		}));
	}
}

function gotoPlayer() {
	if (!openCaseID)
		return openMyCases();

	$.post('http://vrp_admin/gotoPlayer', JSON.stringify({
		targetID: openCaseAuthor
	}));
}

function newCase() {
	let title = $(".new-case-title").val();
	let message = CKEDITOR.instances.newCaseEditor.getData();
	$.post('http://vrp_admin/newCase', JSON.stringify({
		title: title,
		message: message
	}));
}

function btn_confirm(title) {
	return new Promise((resolve, reject) => {
		Swal.fire({
			title: title,
			text: "Você tem certeza ? não tem como voltar atrás",
			type: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: 'Confirmar',
			background: 'linear-gradient(to top right,rgba(50,50,50,1), rgba(50,50,50,0.9))',
			cancelButtonText: "Cancelar"
		}).then((result) => {
			if (result.value) {
				resolve(true);
			}
		})
	});
}