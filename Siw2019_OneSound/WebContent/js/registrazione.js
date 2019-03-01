var regexEmail = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

var password = document.getElementById("password"), confirm_password = document
		.getElementById("confirm_password");

function validatePassword() {
	if (password.value != confirm_password.value) {
		confirm_password.setCustomValidity("Passwords Don't Match");
	} else {
		confirm_password.setCustomValidity('');
	}
}

password.onchange = validatePassword;
confirm_password.onkeyup = validatePassword;

jQuery(document).ready(
				function($) {
					
					function getValueForm() {
						var array = [];
						$("input").each(function() {
							array.push($(this).val());
						});
						for (i = 0; i < array.length; i++) {
							if (array[i] === null || array[i] === "") {
								return false;
							}
						}
						return true;
					}

					function checkProseguiButton(valide) {

						var nome = new RegExp(/^[a-zA-Z]+(\s+[a-zA-Z]+)*$/);
						
						
						var namec = $('#name').val();
						var emailc = $('#email').val();
						var surnamec = $('#surname').val();
						var passwordc = $('#password').val();
						var passwordcc = $('#confirm_password').val();
						var datec = $('#date').val();
						var nickc = $('#Nickname').val();

						var nomeValido = nome.test(namec);
						var cognomeValido = nome.test(surnamec);
						//var emailValida = regexEmail.test(emailc);
						var nickValido = true;
						var dataValida = true;

						var passwordValida = passwordc.match(/^(?=.*\W)(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}/);
						var confermaPass = false;
						
						if(passwordc === ""){
							passwordValida = false;
						}
						
						if (nickc === ""){
							nickValido = false;
						}else{
							nickValido = true;
						}
						
						if (datec === ""){
							dataValida = false;
						}else{
							dataValida = true;
						}
						
						
						if (passwordc !== passwordcc || passwordcc === "") {
							confermaPass = false;
						} else {
							confermaPass = true;
						}

						if (!nomeValido) {
							//$("#name").css("background-color", "#ff00004a");
							$("#name").addClass("invalideInput");
							$("#name").removeClass("valideInput");
							$("#asteriscoNome").show();
						} else {
							//$("#name").css("background-color", "white");
							$("#name").addClass("valideInput");
							$("#name").removeClass("invalideInput");
							$("#asteriscoNome").hide();
						}
						if (!cognomeValido) {
							//$("#surname").css("background-color", "#ff00004a");
							$("#surname").addClass("invalideInput");
							$("#surname").removeClass("valideInput");
							
							$("#asteriscoCognome").show();
						} else {
							//$("#surname").css("background-color", "white");
							$("#surname").addClass("valideInput");
							$("#surname").removeClass("invalideInput");
							$("#asteriscoCognome").hide();
						}
						if (!passwordValida) {
							//$("#password").css("background-color","#ff00004a");
							$("#password").addClass("invalideInput");
							$("#password").removeClass("valideInput");
							$("#asteriscoPass").show();
							
						}else{
							//$("#password").css("background-color","white");
							$("#password").addClass("valideInput");
							$("#password").removeClass("invalideInput");
							$("#asteriscoPass").hide();
						}
						if (!confermaPass) {
							//$("#confirm_password").css("background-color","#ff00004a");
							$("#confirm_password").addClass("invalideInput");
							$("#confirm_password").removeClass("valideInput");
							
							$("#asteriscoPassword").show();
						} else {
							//$("#confirm_password").css("background-color","white");
							$("#confirm_password").addClass("valideInput");
							$("#confirm_password").removeClass("invalideInput");
							$("#asteriscoPassword").hide();
						}
						if(!nickValido){
							//$("#Nickname").css("background-color", "#ff00004a");
							$("#Nickname").addClass("invalideInput");
							$("#Nickname").removeClass("valideInput");
							
							$("#asteriscoNick").show();
						}else {
							//$("#Nickname").css("background-color", "white");
							$("#Nickname").addClass("valideInput");
							$("#Nickname").removeClass("invalideInput");
							$("#asteriscoNick").hide();
						}
						if(!dataValida){
							//$("#date").css("background-color", "#ff00004a");
							$("#date").addClass("invalideInput");
							$("#date").removeClass("valideInput");
							
							$("#asteriscoData").show();
						}else {
							//$("#date").css("background-color", "white");
							$("#date").addClass("valideInput");
							$("#date").removeClass("invalideInput");
							$("#asteriscoData").hide();
						}
						
						
						
						
						var tuttiCampiValidi = true;

						if(!nomeValido || !cognomeValido || !passwordValida || !confermaPass || !nickValido || !dataValida){
							tuttiCampiValidi = false;
						}
						
					/*	if(tuttiCampiValidi){
							$("#errori").hide();
						}else {
							$("#errori").show();
						}*/

						if(tuttiCampiValidi && emailValida){
							$("button[type=submit]").removeAttr("disabled");
						}else{
							$("button[type=submit]").attr("disabled","disabled");
						}
						
					}
					

					var email = false;

					$("input").bind("change paste keyup", function() {

						var valide = true;
						if (!check($('#email').val(), regexEmail)) {
							$("#email").removeClass("invalideInput");
							$("#email").removeClass("valideInput");
							$("#infoEmail").text("Inserisci un email valida.");
							valide = false;
						} else {

							valide = getValueForm();
						}
						if(email = true)
							checkProseguiButton(valide);
					});
					
					$("input[type = email").bind("change paste keyup",function() {
								var eVal = $('#email').val();
								
								if (check($('#email').val(), regexEmail)) {
										$("#infoEmail").text("Controllo email in corso...");
										
										$.ajax({
												type : 'GET',
												url : 'faiRegistrazione',
												data : {
												email : eVal
												},dataType : "text",
												success : function(data) {
													$("#infoEmail").text("");
													var p = JSON.parse(data);
													if (p.email == "presente") {
														$("#email").addClass("invalideInput");
														$("#email").removeClass("valideInput");
														$("#infoEmail").text("Email gi\340 presente.");				
														$("button[type=submit]").attr("disabled","disabled");
														email = false;
													}
													if (p.email == "no") {
															$("#email").addClass("valideInput");
															$("#email").removeClass("invalideInput");
															$("#infoEmail").text("Email valida.");
															//$("button[type=submit]").removeAttr("disabled");
															email = true;
															var valide = getValueForm();
														}
													}
												});

										}
									});

				});

function check(val, regex) {
	if (val != null || val != "")
		return regex.test(val);
	return true;
}

function checkBorn(val, regex) {
	if (val != null || val != "") {
		////alert(val);
		if (regex.test(val)) {
			var d = new Date();
			var v = new Date(val);
			if (d.getFullYear() - v.getFullYear() >= 10)
				return true;
			return false;
		}
	}
	return true;
}
