<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title -->
<title>One Sound</title>

<!-- Favicon -->
<link rel="icon" href="img/core-img/favicon.ico">

<!-- Stylesheet -->
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css'>
<link rel="stylesheet" href="css/aggiunteProfilo.css">
<link rel="stylesheet" href="css/spinnerLoading.css">
<link rel="stylesheet" href="css/arrow.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

	

</head>

<body class = "backgroud-scuro">

	<!-- ************************************ -->

    <!-- Preloader -->
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="lds-ellipsis">
            <div></div>
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>

    <!-- ##### Header Area Start ##### -->
    <header class="header-area">
        <!-- Navbar Area -->
        <div class="oneMusic-main-menu">
             <div class="classy-nav-container breakpoint-off" style="background: #282828;box-shadow: 0px -20px 20px 6px #282828;">
                <div class="container">
                    <!-- Menu -->
                    <nav class="classy-navbar justify-content-between" id="oneMusicNav">
						
						
						
                        <!-- Nav brand -->
                        <a href="home" class="nav-brand"><img src="img/core-img/logo.png" alt=""></a>

                        <!-- Navbar Toggler -->
                        <div class="classy-navbar-toggler">
                            <span class="navbarToggler"><span></span><span></span><span></span></span>
                        </div>

                        <!-- Menu -->
                        <div class="classy-menu" style=" margin: auto;">

                            <!-- Close Button -->
                            <div class="classycloseIcon">
                                <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                            </div>
                            <!-- Nav Start -->
                            <div class="classynav">
                                <ul>
                                	<li><a href="getProfile">Profile</a></li>
                                    <li><a href="home">Home</a></li>
                                    <li><a href="albums-store.jsp">Search</a></li>
                                </ul>

                                <!-- Login/Register & Cart Button -->
                                <div class="login-register-cart-button d-flex align-items-center" style="margin-left: 67px;">
                                    <!-- Login/Register -->
                                    <div class="login-register-btn" style="display: flex;">
                                        <c:if test="${name != null}">
                                        	<p id="loginBtn" class="loginWelcome">Benvenuto ${name}</p>
                                        	<a href="getLogin?logout=true" id="loginBtn" style="margin: auto -33px auto 0;">Logout</a>
                                    	</c:if>
                                    	<c:if test="${name == null}">
                                    		<a href="getLogin" id="loginBtn">Login / Register</a>
                                    	</c:if>
                                    	
                                    </div>

                                </div>
                            </div>
                            <!-- Nav End -->

                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- ##### Header Area End ##### -->
	
	
	<!-- ************************************ -->
	<div class = "spaziatura">
		<ul id="sideMenu" class = "profiloul" style="z-index: 3;background-color: #343434;">
		
			<li class = "profiloli immagineDelProfilo">
				<!-- data-toggle="modal" data-target="#myModal" <h6 id = "modificaImmagine" class = "testoBianco28" style="visibility: hidden;">Cambia Immagine</h6> style="visibility: hidden;"-->
				<img id = "immagineProfilo" class = "mediaPlayerProfileImage" src="${utente.immagine}">
				<label id="modificaImmagine" for="files1" class="fas fa-camera" aria-hidden="true"></label>
				
				<input type="file" id="files1" name="files[]" accept="image/*" style="visibility:hidden; display: none;"/>
			</li>
							
			<li class = "profiloli"><a class="active prof" id="infoProfilo" href="#">Profilo</a></li>
			<li class = "profiloli"><a class="prof" id="mieiAlbum" href="#">Album</a></li>
			<li class = "profiloli"><a class="prof" id="miePlaylistPubbliche" href="#">Playlist pubbliche</a></li>
			<li class = "profiloli"><a class="prof" id="miePlaylistPrivate" href="#">Playlist private</a></li>
			<li class = "profiloli"><a class="prof" id="artistiSeguiti" href="#">Artisti Seguiti</a></li>
			<li class = "profiloli"><a class="prof" id="albumSeguiti" href="#">Album Seguiti</a></li>
			<li class = "profiloli"><a class="prof" id="playlistSeguite" href="#">Playlist Seguite</a></li>
			<li class = "profiloli"><a class="prof" id="braniPreferiti" href="#">Brani Prefetiti</a></li>
			
			<li class = "profiloli bottoneMargin">
	            	<button id = "premiumAccount" class="btn" type="button">Account Premium</button>
	        </li>
			
		</ul>
		<div>
			<i id="arrow" class=" fa fa-caret-down" data-visible="true" ></i>
		</div>
		
				<div class="spinner">
				  <div class="bounce1"></div>
				  <div class="bounce2"></div>
				  <div class="bounce3"></div>
				</div>
		
		
		<div style="background: #454444;min-height: -webkit-fill-available;">
			<div id="contenitore"  >
				
				<%@ include file="informazioniPersonali.jsp" %>
				
			</div>
		</div>
	</div>	


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
	
	<script src="js/following.js"></script>
	<script src="js/profilo.js"></script>
</body>

</html>