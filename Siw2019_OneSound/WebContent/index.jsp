<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>

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
    <link rel="stylesheet" href="css/general.css">
    
     

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
	
	    <!-- ##### Hero Area Start ##### -->
    <section class="hero-area">
        <div class="hero-slides owl-carousel">
            <!-- Single Hero Slide -->
            <div class="single-hero-slide d-flex align-items-center justify-content-center">
                <!-- Slide Img -->
                <div class="slide-img bg-img" style="background-image: url(img/bg-img/bg-1.jpg);"></div>
                <!-- Slide Content -->
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="hero-slides-content text-center">
                                <h2 data-animation="fadeInUp" data-delay="300ms">One sound<span>One sound</span></h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Single Hero Slide -->
            <div class="single-hero-slide d-flex align-items-center justify-content-center">
                <!-- Slide Img -->
                <div class="slide-img bg-img" style="background-image: url(img/bg-img/bg-2.jpg);"></div>
                <!-- Slide Content -->
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="hero-slides-content text-center">
                                <h2 data-animation="fadeInUp" data-delay="300ms">For you<span>For you</span></h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Hero Area End ##### -->

    <!-- ##### Latest Albums Area Start ##### -->
    <section class="latest-albums-area section-padding-100">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading style-2">
                        <h2>Latest Albums</h2>
                    </div>
                </div>
            </div>
            
		
			
            <div class="row">
                <div class="col-12">
                    <div class="albums-slideshow owl-carousel">
                    	<c:forEach items="${albumRecenti}" var="p">
	                        <!-- Single Album -->
	                        <div class="single-album" id="divAlbum">
	                            <img class="albumImage" src="${p.immagine}" alt="">
	                            <img class="play" data-id="${p.seguito}" data-idAlbum="${p.id}" src="img/play.png" alt="">
	                            <c:if test="${p.seguito == true}">
	                       	 		<img class="add" data-id="${p.id}" src="img/check.png" alt="">
	                       	 	</c:if>
	                       	 	 <c:if test="${p.seguito == false}">
	                       	 		<img class="add" data-id="${p.id}"src="img/add.png" alt="">
	                       	 	</c:if>
	                            <div class="album-info">
		                            <h5>${p.titolo}</h5>
		                            <p>Ha <span data-listAlbumFollower="${p.id}">${p.follower}</span> follower</p>
	                            </div>
	                        </div>
						</c:forEach>
						
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Latest Albums Area End ##### -->
    
    <!-- ##### Buy Now Area Start ##### -->
    <section class="oneMusic-buy-now-area has-fluid bg-gray section-padding-100">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading style-2">
		                <h2>Popular Artist</h2>
                    </div>
                </div>
            </div>

            <div class="row">
				<c:forEach items="${utentiPiuSeguiti}" var="p">
	                <!-- Single Album Area -->
	                <div class="col-12 col-sm-6 col-md-4 col-lg-2">
	                    <div class="single-album-area wow fadeInUp" data-wow-delay="200ms">
	                        <div class="album-thumb" id="divArtista">
	                       	 	<img class="artistImage" src="${p.immagine }" alt="">
	                       	 	<img class="play" src="img/play.png" alt="" data-email="${p.email }">
	                       	 	
	                       	 	<c:if test="${p.seguito == true}">
	                       	 		<img class="heart" data-email="${p.email }" src="img/full-heart.png" alt="">
	                       	 	</c:if>
	                       	 	 <c:if test="${p.seguito == false}">
	                       	 		<img class="heart" data-email="${p.email }" src="img/empty-heart.png" alt="">
	                       	 	</c:if>
	                        </div>
	                        
	                        <div id="artistData" class="album-info">
	                            	<h2 id="nickName">${p.nickname}</h2>
	                                <span id="nameSurname">${p.nome} ${p.cognome}</span>
	                                <span id="nameSurname">${p.follower}</span>
	                                <span id="nameSurname"><i class="fa fa-heart" aria-hidden="true"></i></span>
	                        </div>
	                    </div>
	                </div>
		        </c:forEach>

                

            </div>

        </div>
    </section>
    <!-- ##### Buy Now Area End ##### -->
    
    <!-- ##### Miscellaneous Area Start ##### -->
    <section class="miscellaneous-area section-padding-100-0">
        <div class="container">
            <div class="row">
                <!-- ***** Weeks Top ***** -->
                <div class="col-12 col-lg-4">
                    <div class="weeks-top-area mb-100">
                        <div class="section-heading text-left mb-50 wow fadeInUp" data-wow-delay="50ms">
		                    <h2>Album pi&#250; seguiti</h2>
                        </div>
						<c:forEach items="${albumPiuSeguiti}" var="p">
	                        <!-- Single Top Item -->
	                        <div class="single-top-item d-flex wow fadeInUp" data-wow-delay="100ms">
	                            <div class="thumbnail" id="divAlbum">
	                                <img class="miniImage" src="${p.immagine}" alt="">
	                                <img class="play" src="img/play.png" data-idAlbum="${p.id}" alt="">
	                            </div>
	                            <div class="content-">
	                                <h6>${p.titolo}</h6>
	                                <h6>${p.utenteCaricatore.nickname}</h6>
			                        <p>Ha <span data-albumFollower="${p.id}">${p.follower}</span> follower</p>
	                            </div>
	                        </div>
						</c:forEach>
                        
                    </div>
                </div>
                
                
                <!-- ***** Weeks Top ***** -->
                <div class="col-12 col-lg-4">
                    <div class="weeks-top-area mb-100">
                        <div class="section-heading text-left mb-50 wow fadeInUp" data-wow-delay="50ms">
		                    <h2>Playlist pi&#250; seguite</h2>
                        </div>
						<c:forEach items="${playlist}" var="p">
	                        <!-- Single Top Item -->
	                        <div class="single-top-item d-flex wow fadeInUp" data-wow-delay="100ms">
	                            <div class="thumbnail" id="divPlaylist">
	                                <img class="miniImage" src="${p.immagine}" alt="">
	                                <img class="play" src="img/play.png" data-idPlaylist="${p.id}" alt="">
	                            </div>
	                            <div class="content-">
	                                <h6>${p.nome}</h6>
			                        <p id="nameSurname">${p.utente.nickname}</p>
			                        <p>Ha ${p.follower} follower</p>
	                            </div>
	                        </div>
						</c:forEach>
                        
                    </div>
                </div>
                
                
                <!-- ***** Weeks Top ***** -->
                <div class="col-12 col-lg-4">
                    <div class="weeks-top-area mb-100">
                        <div class="section-heading text-left mb-50 wow fadeInUp" data-wow-delay="50ms">
		                    <h2>Ultimi brani</h2>
                        </div>
						<c:forEach items="${ultimiBraniInseriti}" var="p">
	                        <!-- Single Top Item -->
	                        <div class="single-top-item d-flex wow fadeInUp" data-wow-delay="100ms">
	                            <div class="thumbnail" id="divBrano">
	                                <img class="miniImage" src="${p.album.immagine}" alt="">
	                                <img class="play" src="img/play.png" alt="" data-id="${p.id}" data-idAlbum="${p.album.id}">
	                            </div>
	                            <div class="content-">
	                                <h6>${p.titolo}</h6>
			                        <p id="nameSurname">${p.utenteCaricatore.nickname}</p>
	                            </div>
	                        </div>
						</c:forEach>
                        
                    </div>
                </div>
    		</div>
        </div>
    </section>


    

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
</body>

</html>