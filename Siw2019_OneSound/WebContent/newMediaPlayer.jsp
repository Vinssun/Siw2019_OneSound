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
    <link rel="stylesheet" href="css/newMediaPlayer.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css'>

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
	

    <!-- ##### Breadcumb Area Start ##### -->
    <section class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/breadcumb3.jpg);">
         <div id="mediaPlayerTopImage" class="container">
        	<img id="mediaPlayerProfileImage" src="${brano.album.immagine}">
        	<div id="albumName">${brano.album.titolo}<br><span id="artistName">${brano.utenteCaricatore.nickname}</span></div>
        </div>

    </section>
    <!-- ##### Breadcumb Area End ##### -->
    
    
 
<div id="outer">
	<div id="mediaPlayerBody">
	<div class="container" id="contenitore">
	    <!-- ##### Song Area Start ##### -->
	    <div class="one-music-songs-area mb-70">
	        <div class="container">
					<ul id="songsList" class="list-group list-group-flush">
						<li class="list-group-item">
						  <span id="imageSpan"></span>
						  <span id="playSongSpan"></span>
						  <span id="addSongSpan"></span>
						  <span id="heartSongSpan"></span>
						  <span id="titleSongSpan">Titolo</span>
						  <span id="artistSpan">Artista</span>
						  <span id="albumSpan">Album</span>
						  <span id="genreSpan">Genere</span>
						</li>
						<c:set var="songsCount" value="0"/>
						 <c:forEach items="${brani}" var="p">
						 		
						 	<li id="song${songsCount}"  data-linkYoutube="${p.linkVideo}" data-count="${songsCount}" data-idSong="${p.id}" data-link="${p.linkBrano}" data-titolo="${p.titolo}" class="list-group-item standardSpan">
								  <span id="imageSpan"><img id="coverImage" src="${p.album.immagine}" alt=""></span>
								  <span id="playSongSpan"><img id="playImage" class="play" src="img/play.png" alt=""></span>
								  <span id="addSongSpan"><img id="addImage" class="addB" src="img/add.png" alt=""></span>
								  <c:if test="${p.preferito == true}">
				                       	 		<span id="heartSongSpan"><img id="heartSongImage" data-id="${p.id}" class="heartB" src="img/full-heart.png" alt=""></span>
				                   </c:if>
				                   <c:if test="${p.preferito == false}">
				                       	 		<span id="heartSongSpan"><img id="heartSongImage" data-id="${p.id}" class="heartB" src="img/empty-heart.png" alt=""></span>
				                   </c:if>
								  
								  <span id="titleSongSpan" class="crop"><label id="nameSurname" data-toggle="tooltip" data-placement="left" title="${p.titolo}">${p.titolo}</label></span>
								  <span id="artistSpan" class="crop"><label id="nameSurname" data-toggle="tooltip" data-placement="left" title="${p.utenteCaricatore.nickname}">${p.utenteCaricatore.nickname}</label></span>
								  <span id="albumSpan" class="crop"><label id="nameSurname" data-toggle="tooltip" data-placement="left" title="${p.album.titolo}">${p.album.titolo}</label></span>
								  <span id="genreSpan" class="crop"><label id="nameSurname" data-toggle="tooltip" data-placement="left" title="${p.genere.nome}">${p.genere.nome}</label></span>
					 	 </li>
						 <c:set var="songsCount" value="${songsCount + 1}"/>
						</c:forEach>
					</ul>
	            <div class="row">
	            </div> 
	        </div>
	    </div>
    </div>
    </div>
	              <div id="base">
                     <div id = "playMusica" class="song-play-area">
                         <div class="song-name">
                                <p id="titoloMediaPlayer">${brano.titolo}</p>
                                
                         </div>
                         <audio preload="auto" data-songCorrente="${brano.id}" class="myAudio"  src="${brano.linkBrano}" controls >
                               <source src=""> 
                         </audio>
                            <div class="controls">
                            <i id="youTubeButton" data-linkYoutube="${brano.linkVideo}" data-toggle="modal" data-target="#youtube" class="fab fa-youtube" aria-hidden="true"></i>
                            <i class='fas fa-random' id="randomButton" data-premuto="false"></i>
                            <i class= "fas fa-step-backward" id="backButton"></i>
                            <i class="fas fa-step-forward" id="nextButton"></i>
                            <i class='fas fa-sync-alt' id="loopButton" data-premuto="false"></i>
                            </div>
                        </div>
	                      
	                  
	                    </div>
	 </div>
    <!-- ##### Song Area End ##### -->
<!-- Modal -->
<div class="modal fade" id="playlistModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Aggiungi alla playlist</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body"> Seleziona la playlist : 
      	
      	
      	<button type="button" id="playlistPrivateButton" class="btn btn-primary" style="margin: 2%;">Playlist Privata</button>
      	<button type="button" id="playlistPubblicheButton" class="btn btn-secondary">Playlist Pubblica</button> 
      	
      	<select id="playlistPubbliche" class="form-control" style="display: none;">
				<c:forEach items="${playlistsPb}" var="p">
				    <option value="${p.id}">${p.nome}</option>
				</c:forEach>
		</select>
		
		<select id="playlistPrivate" class="form-control">
				<c:forEach items="${playlistsPr}" var="p">
				    <option value="${p.id}">${p.nome}</option>
				</c:forEach>
		</select>
		
      </div>
      <div class="modal-footer">
      <span id="branoAggiunto" style="float: left;color: green;display:none;">Il brano è stato aggiunto alla playlist</span>
        <button type="button" id="aggiungiBrano" class="btn btn-primary">Aggiungi</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade  bd-example-modal-lg" id="youtube" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div id="iframeContent"class="modal-dialog modal-lg modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Youtube videos</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
     	<label id="videoYoutubeLabel">Non è associato alcun video</label>
        <iframe id="videoYoutube" src="${brano.linkVideo}" 
        frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
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
    
    <script src="js/ricerca.js"></script>
    
    <script src="js/mediaPlayer.js"></script>
    
    <script src="js/popupPlaylist.js"></script>
     
</body>

</html>