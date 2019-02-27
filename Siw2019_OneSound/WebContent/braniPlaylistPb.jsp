<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<link rel="stylesheet" href="css/aggiunteAlbum.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="css/general.css">
<link rel="stylesheet" href="css/aggiunte.css">
   

	
        <div class="container">
						<div class="row">
			            <div class="col-12">
			                    <div class="section-heading white" style="margin: 27px 0 0px 0;">
			                    <img id="mediaPlayerProfileImage" src="${immagine}" style="margin-bottom: 10px;">
			                        <h2>${nome}</h2>
			                    </div>
			                </div>
			            </div>
</div>
<c:if test="${fn:length(brani) > 0}">
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
						  <span id="titleSongSpan">Titolo</span>
						  <span id="artistSpan">Artista</span>
						  <span id="albumSpan">Album</span>
						  <span id="genreSpan">Genere</span>
						</li>
						<c:set var="songsCount" value="0"/>
						 <c:forEach items="${brani}" var="p">
						 		
						 	<li id="song${songsCount}"  data-count="${songsCount}" data-idSong="${p.id}" data-link="${p.linkBrano}" data-titolo="${p.titolo}" class="list-group-item standardSpan">
								  <span id="imageSpan"><img id="coverImage" src="${p.album.immagine }" alt=""></span>
								  <span id="playSongSpan"><img id="playImage" class="playB" src="img/play.png" alt=""></span>
								  <span id="addSongSpan"><img id="addSongImage" class="addSongImageClass" data-id="${p.id}" data-type="pb" data-idPlaylist="${idPlaylist}" src="img/check.png" alt=""></span>
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
                     <div id = "playMusica" class="song-play-area" style="
    width: -webkit-fill-available;
">
                         <div class="song-name">
                                <p id="titoloMediaPlayer">${brano.titolo}</p>
                                
                         </div>
                         <audio preload="auto" data-songCorrente="${brano.id}" class="myAudio"  src="${brano.linkBrano}" controls >
                               <source src=""> 
                         </audio>
                            <div class="controls">
                            <i class='fas fa-random' id="randomButton" data-premuto="false"></i>
                            <i class= "fas fa-step-backward" id="backButton"></i>
                            <i class="fas fa-step-forward" id="nextButton"></i>
                            <i class='fas fa-sync-alt' id="loopButton" data-premuto="false"></i>
                            </div>
                        </div>
	                      
	                  
	                    </div>
	 </div>			
</c:if>			
<c:if test="${fn:length(brani) < 1}">
				<div id="nessunBrano">
					<h1 style="color:white;">La playlist non contiene brani.</h1>
				</div>
			</c:if>
 <script src="js/braniPlaylist.js"></script>
 <script src="js/mediaPlayer.js"></script>
