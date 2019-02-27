<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title -->
<title>One Sound</title>

<!-- Favicon -->
<link rel="icon" href="img/core-img/favicon.ico">

<!-- Stylesheet -->
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="css/registrazione.css">


</head>

<body>
	
	<!-- ##### Breadcumb Area Start ##### -->
	<section class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/breadcumb3.jpg);height: 140px;">
    
		<div class="bradcumbContent">
			<h2>Registration</h2>
		</div>
	</section>
	<!-- ##### Breadcumb Area End ##### -->

	<!-- ##### Login Area Start ##### -->
	<section class="login-area section-padding-100">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-12 col-lg-8">
					<div class="login-content" style="box-shadow: 0 0 20px 5px rgba(0, 0, 0, 0.07);">
						<h3>Registrazione</h3>
						<!-- Login Form -->
						<div class="login-form">
							<form method="POST" id="form" action="faiRegistrazione" style="text-align: -webkit-auto;">
								<div class="form-group">
									<div class="exampleInputEmail1">
										<span id="asteriscoNome">*</span>Nome
									</div>
									<input id="name" class="form-control" placeholder="First Name"
										type="text" name="first_name"
										title="Must be letters" required>
								</div>
								<div class="form-group">
									<div class="exampleInputEmail1">
										<span id="asteriscoCognome">*</span>Cognome
									</div>
									<input class="form-control" placeholder="Last Name" type="text"
										name="last_name" id="surname" title="Must be letters" required>
								</div>
								<div class="form-group">
									<div class="exampleInputEmail1">
										<span id="asteriscoNick">*</span>Nickname
										<input class="form-control" placeholder="Nickname" type="text" name="nickname" id="Nickname" title="" required>
									</div>
								</div>
								<div class="form-group">
									<span id="asteriscoData">*</span>Data nascita<input
										class="form-control" type="date" name="date" id="date"
										required>
								</div>

								<div class="form-group">
									<label class="exampleInputEmail1">Email</label> <input
										id="email" class="form-control" type="email" name="email"
										required> <label id='infoEmail' class="label--desc"></label>
									<!-- <label id="asteriscoEmail">*campo
										mancante</label> -->

								</div>

								<div class="form-group">
									<span id="asteriscoPass">*</span> Password
									
									<input class="form-control" type="password" id="password">

								</div>
								<div class="form-group">
									<span id="asteriscoPassword">*</span>Conferma Password <input class="form-control" type="password" id="confirm_password" name="confirmPassword" required>
									<!-- <span id="PassC">La password non corrisponde</span> -->
								</div>
								<span id="errori">*Inserisci correttamente i campi</span>
								<button id = "registrati" type="submit" class="btn oneMusic-btn" 
								style="margin-top: 44px;margin-bottom: 21px;" disabled="disabled">Registrati</button>
								<div class="text-center p-t-35">
									<span class="txt1"> Hai un account? </span> <a
										href="login.jsp" class="txt2"> Login </a> <br>
									
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ##### Login Area End ##### -->



	<!-- ##### All Javascript Script ##### -->
	<!-- jQuery-2.2.4 js -->
	<script src="js/jquery/jquery-2.2.4.min.js"></script>
	<!-- Popper js -->
	<script src="js/bootstrap/popper.min.js"></script>
	<!-- Bootstrap js -->
	<script src="js/bootstrap/bootstrap.min.js"></script>
	<!-- All Plugins js -->
	<script src="js/plugins/plugins.js"></script>
	<!-- Active js -->
	<script src="js/active.js"></script>
	
	<script src="js/registrazione.js"></script>
	<!-- <script src="js/registrazione2.js"></script> -->
</body>

</html>