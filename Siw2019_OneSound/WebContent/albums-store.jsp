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
    <link rel="stylesheet" href="css/searchBar.css">
    <link rel="stylesheet" href="css/searchResult.css">
    <link rel="stylesheet" href="css/general.css">
   
    
	<link rel="stylesheet" href="css/spinnerLoading.css">
    

</head>

<body>

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
                                        	<a href="getLogin?logout=true"" id="loginBtn" style="margin: auto -33px auto 0;">Logout</a>
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
    <!-- ##### Breadcumb Area Start ##### -->
    <section class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/breadcumb3.jpg);">
       				
       				<div id="searchBar" class="container">
						  <input id = "inputRicerca" autocomplete="off" class="form-control" name="nome" placeholder="Cerca qui">
						  <button id = "search" type="button" class="btn btn-light"><i class="fa fa-search" aria-hidden="true"></i></button>
					</div>
        
    </section>
    <!-- ##### Breadcumb Area End ##### -->
    
    
    
		


		<div class="spinner black">
			  <div class="bounce1"></div>
			  <div class="bounce2"></div>
			  <div class="bounce3"></div>
			</div>


	<div id="result"></div>


	<div class="container" id="contenitore">
	
		
		
	    <!-- ##### Album Catagory Area Start ##### -->
	    <section class="album-catagory section-padding-100-0">
	        <div class="container">
	            <!--<div class="row">
	                <div class="col-12">
	                    <div class="browse-by-catagories catagory-menu d-flex flex-wrap align-items-center mb-70">
	                        <a href="#" data-filter="*">Browse All</a>
	                        <a href="#" data-filter=".a" class="active">A</a>
	                        <a href="#" data-filter=".b">B</a>
	                        <a href="#" data-filter=".c">C</a>
	                        <a href="#" data-filter=".d">D</a>
	                        <a href="#" data-filter=".e">E</a>
	                        <a href="#" data-filter=".f">F</a>
	                        <a href="#" data-filter=".g">G</a>
	                        <a href="#" data-filter=".h">H</a>
	                        <a href="#" data-filter=".i">I</a>
	                        <a href="#" data-filter=".j">J</a>
	                        <a href="#" data-filter=".k">K</a>
	                        <a href="#" data-filter=".l">L</a>
	                        <a href="#" data-filter=".m">M</a>
	                        <a href="#" data-filter=".n">N</a>
	                        <a href="#" data-filter=".o">O</a>
	                        <a href="#" data-filter=".p">P</a>
	                        <a href="#" data-filter=".q">Q</a>
	                        <a href="#" data-filter=".r">R</a>
	                        <a href="#" data-filter=".s">S</a>
	                        <a href="#" data-filter=".t">T</a>
	                        <a href="#" data-filter=".u">U</a>
	                        <a href="#" data-filter=".v">V</a>
	                        <a href="#" data-filter=".w">W</a>
	                        <a href="#" data-filter=".x">X</a>
	                        <a href="#" data-filter=".y">Y</a>
	                        <a href="#" data-filter=".z">Z</a>
	                        <a href="#" data-filter=".number">0-9</a>
	                    </div>
	                </div>
	            </div>
						 -->
				<h1 id="genresTitle">Generi</h1>
	            <div class="row oneMusic-albums">
	
	                <!-- Single Album -->
	                <div class="col-4 col-sm-4 col-md-3 col-lg-2 single-album-item t c">
	                    <div class="single-album">
	                        <img data-id="pop" class="genresImage" src="img/pop.png" alt="">
	                        <div data-id="pop" class="album-info genresName">
	                                <h5>Pop</h5>
	                        </div>
	                    </div>
	                </div>
	
	                <!-- Single Album -->
	                <div class="col-4 col-sm-4 col-md-3 col-lg-2 single-album-item s e q">
	                    <div class="single-album">
	                        <img data-id="hip-hop" class="genresImage" src="img/hiphop.png" alt="">
	                        <div data-id="hip-hop" class="album-info genresName">
	                                <h5>Hip Hop</h5>
	                        </div>
	                    </div>
	                </div>
	
	                <!-- Single Album -->
	                <div class="col-4 col-sm-4 col-md-3 col-lg-2 single-album-item w f r">
	                    <div class="single-album">
	                        <img data-id="rock" class="genresImage" src="img/rock.png" alt="">
	                        <div data-id="rock" class="album-info genresName">
	                                <h5>Rock</h5>
	                        </div>
	                    </div>
	                </div>
	
	                <!-- Single Album -->
	                <div class="col-4 col-sm-4 col-md-3 col-lg-2 single-album-item t g u">
	                    <div class="single-album">
	                        <img data-id="classica" class="genresImage" src="img/classica.png" alt="">
	                        <div data-id="classica" class="album-info genresName">
	                                <h5>Classica</h5>
	                        </div>
	                    </div>
	                </div>
	
	                <!-- Single Album -->
	                <div class="col-4 col-sm-4 col-md-3 col-lg-2 single-album-item d h v">
	                    <div class="single-album">
	                        <img data-id="dance" class="genresImage" src="img/dance.png" alt="">
	                        <div data-id="dance" class="album-info genresName">
	                                <h5>Dance</h5>
	                        </div>
	                    </div>
	                </div>
	
	                <!-- Single Album -->
	                <div class="col-4 col-sm-4 col-md-3 col-lg-2 single-album-item t i x">
	                    <div class="single-album">
	                        <img data-id="jazz" class="genresImage" src="img/jazz.png" alt="">
	                        <div data-id="jazz" class="album-info genresName">
	                                <h5>Jazz</h5>
	                        </div>
	                    </div>
	                </div>
	
	               
	            </div>
	        </div>
	    </section>
	    <!-- ##### Album Catagory Area End ##### -->
	

    </div>
    <!-- ##### Song Area End ##### -->

  
    
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
    
     <script src="js/ricerca.js"></script>
     
     
</body>

</html>