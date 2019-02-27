<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
	<link rel='stylesheet' href='css/pageNotFound.css'>
	<link rel="stylesheet" href="css/general.css">
</head>

<body>
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
            <div class="classy-nav-container breakpoint-off">
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
     <section class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/breadcumb3.jpg);"></section>
	<section>
	        <div class="container">
	           
	        <div id="notfound">
				<div class="notfound">
					<div class="notfound-404">
						<h3>Oops! Page not found</h3>
						<h1><span>4</span><span>0</span><span>4</span></h1>
					</div>
				<h2>we are sorry, but the page you requested was not found</h2>
				</div>
			</div>
	           
	           
	        </div>
	    </section>
	    <!-- ##### Album Catagory Area End ##### -->
	


    
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
    
     
</body>

</html>