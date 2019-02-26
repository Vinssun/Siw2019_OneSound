jQuery(document).ready(function($) {
	
	$("#registrati").click(function() {
		
	
	var nome = new RegExp(/^[a-zA-Z]+(\s+[a-zA-Z]+)*$/);
		
		
	var namec = $('#name').val();
	var emailc = $('#email').val();
	var surnamec = $('#surname').val();
	var passwordc = $('#password').val();
	var passwordcc = $('#confirm_password').val();
	var datec = $('#date').val();

	var nomeValido = nome.test(namec);
	var cognomeValido = nome.test(surnamec);

	var passwordValida = true;// passc.match(/^(?=.*\W)(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}/);
	var confermaPass = false;
	
	if(passwordc === ""){
		passwordValida = false;
	}
	
	
	if (passwordc !== passwordcc) {
		confermaPass = false;
	} else {
		confermaPass = true;
	}

	if (!nomeValido) {
		$("#name").css("background-color", "#ff00004a");
		$("#asteriscoNome").show();
	} else {
		$("#name").css("background-color", "white");
		$("#asteriscoNome").hide();
	}
	if (!cognomeValido) {
		$("#surname").css("background-color", "#ff00004a");
		$("#asteriscoCognome").show();
	} else {
		$("#surname").css("background-color", "white");
		$("#asteriscoCognome").hide();
	}
	if (passwordValida) {
		$("#password").css("background-color","white");
		$("#asteriscoPass").hide();
		if (!confermaPass) {
			$("#confirm_password").css("background-color","#ff00004a");
			$("#asteriscoPassword").show();
		} else {
			$("#confirm_password").css("background-color","white");
			$("#asteriscoPassword").hide();
		}
	}else{
		$("#password").css("background-color","#ff00004a");
		$("#asteriscoPass").show();
	}
	
	var tuttiCampiValidi = true;

	if(!nomeValido || !cognomeValido || !passwordValida || !confermaPass){
		tuttiCampiValidi = false;
	}
	
	if(tuttiCampiValidi){
		$("#errori").hide();
	}else {
		$("#errori").show();
	}
	
	});
	

});