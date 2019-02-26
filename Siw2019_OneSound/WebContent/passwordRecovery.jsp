<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<div class="container-login100">
	<div class="wrap-login100">
			<h3> Assistenza </h3>
		<div id="loadDiv">
			
					<label for="exampleInputEmail1" > Inserisci l'indirizzo email associato al tuo account.</label>
	
					<div class="wrap-input-m-b-10 validate-input"
						data-validate="Valid email is: a@b.c"> 
						<input class="form-control" type="email" id="recoveryEmail" name="email" placeholder="Enter E-mail">
						<span class="focus-input100" data-placeholder="Email"></span>
					</div>
					
	
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button id="recoveryButton" type = "button" class="btn oneMusic-btn mt-30">Recupera
								Password</button>
						</div>
					</div>
			</div>
			<div id="loading_screen">  
			</div>
			<div class="text-center p-t-50" id = "infoLabel-50">
						<label id='infoEmail' class="label--desc">${Message}</label>
						</div>
			<div class="text-center p-t-35">
					<span class="txt1"> Non sei registrato?</span> <a
						href="registrationForm.html" class="txt2"> Registrati </a> <br> <span
						class="txt1"> Vai a </span> <a id="login" href="login.jsp" class="txt2">
						Login </a>
				</div>
		
	</div>
</div>
<script src="js/login.js"></script>



