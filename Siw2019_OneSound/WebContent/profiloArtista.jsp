<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
    <link rel="stylesheet" href="css/aggiunte.css">
    <link rel="stylesheet" href="css/general.css">
    <link rel="stylesheet" href="css/profiloArtista.css">
    <link rel="stylesheet" href="css/searchResult.css">
    

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
         <div id="artistTopImage">
        	<img id="artistProfileImage" src="${artista.immagine}">
        	<h1 id="nickName">${artista.nickname}</h1>
        </div>
        
    </section>
    <!-- ##### Breadcumb Area End ##### -->
    
    
 

	<div id="artistBody">
	<div class="container" id="contenitore">
	   
			<c:if test="${fn:length(albums) > 0}">
   			<h1>Album di ${artista.nickname}</h1>
   			<c:set var="albumCount" value="0"/>
			<ul id="songsList" class="list-group list-group-flush">
			<!-- product mettere l'if per il length maggiore di 0 sopra-->
				<li class="list-group-item">
					  <span id="imageSpan"></span>
					  <span id="playSpan"></span>
					  <span id="addSpan"></span>
					  <span id="titleSpan">Titolo</span>
					  <span id="artistSpan">Artista</span>
					</li>
			
			<c:forEach items="${albums}" var="p"> 
			<!-- foreach --> 
			
					<li id="album${albumCount}" class="list-group-item standardSpan albumElement">
					  <span id="imageSpan"><img id="coverImage" src="${p.immagine }" alt=""></span>
					  <span id="playSpan" data-type="album" ><img id="playImage" data-idAlbum="${p.id}" class="playB" src="img/darkPlay.png" alt=""></span>
					   <c:if test="${p.seguito == true}">
	                       	 		<span id="addSpan"><img id="addImage" data-id="${p.id}" class="addAlbum" src="img/check.png" alt=""></span>
	                   </c:if>
	                   <c:if test="${p.seguito == false}">
	                       	 		<span id="addSpan"><img id="addImage" data-id="${p.id}" class="addAlbum" src="img/darkAdd.png" alt=""></span>
	                   </c:if>
					  <span id="titleSpan" class="crop"><label id="nameSurname" data-toggle="tooltip" data-placement="left" title="${p.titolo}">${p.titolo}</label></span>
					  <span id="artistSpan" class="crop"><label id="nameSurname" data-toggle="tooltip" data-placement="left" title="${p.utenteCaricatore.nickname}">${p.utenteCaricatore.nickname}</label></span>
					  </li>
					
					<c:set var="albumCount" value="${albumCount + 1}"/>
					<!--  chiudi for each-->
					</c:forEach>
			</ul>
					</c:if>
   			<c:if test="${fn:length(albums) < 1}">
				<div>
					<h1>${artista.nickname} non nessun album.</h1>
				</div>
			</c:if>
			<c:if test="${fn:length(albums) > 5}">
				<div class="moreButton">
					<button id="moreAlbumButton" class="btn oneMusic-btn m-2" type="button">Mostra altri</button>
				</div>
			</c:if>
			
			
			<c:if test="${fn:length(playlists) > 0}">
			<h1>Playlist di ${artista.nickname}</h1>
			<c:set var="playlistCount" value="0"/>
			<ul id="songsList" class="list-group list-group-flush">
			<!-- product mettere l'if per il length maggiore di 0 sopra-->
				<li class="list-group-item">
					  <span id="imageSpan"></span>
					  <span id="playSpan"></span>
					  <span id="addSpan"></span>
					  <span id="titleSpan">Titolo</span>
					  <span id="artistSpan">Artista</span>
					</li>
			<c:forEach items="${playlists}" var="p"> 
			<!-- foreach --> 
					<li id="playlist${playlistCount}" class="list-group-item standardSpan playlistElement">
					  <span id="imageSpan"><img id="coverImage" src="${p.immagine}" alt=""></span>
					  <span  data-type="playlist" id="playSpan"><img data-idPlaylist="${p.id}" id="playImage" class="playB" src="img/darkPlay.png" alt=""></span>
					   <c:if test="${p.seguito == true}">
	                       	 		<span id="addSpan"><img id="addImage" data-id="${p.id}" class="addPlaylist" src="img/check.png" alt=""></span>
	                   </c:if>    	 	
	                   <c:if test="${p.seguito == false}">
	                       	 		<span id="addSpan"><img id="addImage" data-id="${p.id}" class="addPlaylist" src="img/darkAdd.png" alt=""></span>
	                   </c:if>
					  <span id="titleSpan" class="crop"><label id="nameSurname" data-toggle="tooltip" data-placement="left" title="${p.nome}">${p.nome}</label></span>
					  <span id="artistSpan" class="crop"><label id="nameSurname" data-toggle="tooltip" data-placement="left" title="${p.utente.nickname}">${p.utente.nickname}</label></span>
					 </li>
					
					<c:set var="playlistCount" value="${playlistCount + 1}"/>
					<!--  chiudi for each-->
					</c:forEach>
			</ul>
					</c:if>
   			<c:if test="${fn:length(playlists) < 1}">
				<div>
					<h1>${artista.nickname} non ha nessuna playlist.</h1>
				</div>
			</c:if>
			<c:if test="${fn:length(playlists) > 5}">
				<div class="moreButton">
					<button id="morePlaylistButton" class="btn oneMusic-btn m-2" type="button">Mostra altri</button>
				</div>
			</c:if>
			
			
			
    </div>
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
     
     <script src="js/showProduct.js"></script>
     <script src="js/following.js"></script>
     
     
</body>

</html>