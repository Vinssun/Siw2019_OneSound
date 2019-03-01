/**
 * 
 */

$("#modificaProfilo").on('click', function(){
	var titolo = $('#modificaProfilo').text();
	if(titolo === "Modifica"){
		
		$("#confermaPass").fadeIn()
		$('#nome').attr('disabled', false);
		$('#cognome').attr('disabled', false);
		$('#dataNascita').attr('disabled', false);
		$('#password').attr('disabled', false);
		$("#nickname").attr('disabled', false);
		
		$('#nome').css('opacity', '1');
		$('#cognome').css('opacity', '1');
		$('#dataNascita').css('opacity', '1');
		$('#password').css('opacity', '1');
		$("#nickname").css('opacity', '1');
		$("#confirmPassword").css("opacity", "1");
		$('#modificaProfilo').text("Conferma");
	}
	else{
		
		var nomec = $('#nome').val();
		var cognomec = $('#cognome').val();
		var passc = $('#password').val();
		var cpassc = $('#confirmPassword').val();
		var nickc = $('#nickname').val();


		var nomeValido = nomec.match(/^[a-zA-Z]+(\s+[a-zA-Z]+)*$/);
		var cognomeValido = cognomec.match(/^[a-zA-Z]+(\s+[a-zA-Z]+)*$/);
		var passwordValida = passc.match(/^(?=.*\W)(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}/);
		var confermaPass = false;
		var nickValido = true;

		
		if (passc === ""){
			passwordValida = false;
		}else{
			passwordValida = true;
		}
		
		if (nickc === ""){
			nickValido = false;
		}else{
			nickValido = true;
		}
		
		
		if (cpassc !== passc) {
			confermaPass = false;
		}
		else {
			confermaPass = true;
		}

		if(!nomeValido){
			$("#nomeErr").slideDown()
		}else{
			$("#nomeErr").slideUp()
		}
		if(!cognomeValido){
			$("#cognomeErr").slideDown()
		}else{
			$("#cognomeErr").slideUp()
		}
		if(!passwordValida){
			$("#passwordErr").slideDown()
		}else{
			$("#passwordErr").slideUp()
		}
		if(!confermaPass){
			$("#confirmPasswordErr").slideDown()
		}else{
			$("#confirmPasswordErr").slideUp()
		}
		if(!nickValido){
			$("#nicknameErr").slideDown()
		}else {
			$("#nicknameErr").slideUp()
		}
		
		
		if (nomeValido && cognomeValido && passwordValida && confermaPass && nickValido) {
			var utente = {
				name : $('#nome').val(),
				surname : $('#cognome').val(),
				password : $('#confirmPassword').val(),
				date : $('#dataNascita').val(),
				premium : $("#nome").attr("data-id")
			};
			$.ajax({
				type : 'POST',
				url : 'modificaInformazioni',
				datatype : "json",
				contentType : "application/json",
				data : JSON.stringify(utente),

				success : function(data) {
					$("#confermaPass").fadeOut()
					$('#nome').attr('disabled', true);
					$('#cognome').attr('disabled', true);
					$('#dataNascita').attr('disabled', true);
					$('#password').attr('disabled', true);
					$('#modificaProfilo').text("Modifica");
					
					$('#nome').css('opacity', '0.6');
					$('#cognome').css('opacity', '0.6');
					$('#dataNascita').css('opacity', '0.6');
					$('#password').css('opacity', '0.6');
					$("#nickname").css('opacity', '0.6');
					
				},

				error : function() {
					window.location.href = "pageNotFound.jsp";
				}

			});
		
		}
	}
	
});