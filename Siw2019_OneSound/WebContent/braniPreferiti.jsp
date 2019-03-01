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
    


	
        <div class="container pt-5">
						<div class="row">
			                <div class="col-12">
			                    <div class="section-heading white">
			                        <h2>Brani Preferiti</h2>
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
						  <span id="imageSpan">Cover</span>
						  <span id="playSongSpan"></span>
						  <span id="addSongSpan"></span>
						  <span id="titleSongSpan">Titolo</span>
						  <span id="artistSpan">Artista</span>
						  <span id="albumSpan">Album</span>
						  <span id="genreSpan">Genere</span>
						</li>
						<c:set var="songsCount" value="0"/>
						 <c:forEach items="${brani}" var="p">
						 		
						 	<li id="song${songsCount}"  data-linkYoutube="${p.linkVideo}" data-artista="${ p.utenteCaricatore.nickname}" data-count="${songsCount}" data-idSong="${p.id}" data-link="${p.linkBrano}" data-titolo="${p.titolo}" class="list-group-item standardSpan">
								  <span id="imageSpan"><img class="im" id="coverImage" src="${p.album.immagine }" alt=""></span>
								  <span id="playSongSpan"><img id="playImage" class="playB" src="img/play.png" alt=""></span>
								  <span></span>
								  <span id="heartSongSpan"><img id="heartSongImage" data-id="${p.id}" class="heartSongImageClass" src="img/full-heart.png" alt=""></span>
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
                            <i id="youTubeButton" data-linkYoutube="${brano.linkVideo}" data-toggle="modal" data-target="#youtube" class="fab fa-youtube" aria-hidden="true"></i>
                            <i class='fas fa-random' id="randomButton" data-premuto="false"></i>
                            <i class= "fas fa-step-backward" id="backButton"></i>
                            <i class="fas fa-step-forward" id="nextButton"></i>
                            <i class='fas fa-sync-alt' id="loopButton" data-premuto="false"></i>
                            <i id="lyricsButton" class="fa fa-align-justify" data-artista="${brano.utenteCaricatore.nickname}" data-titolo="${brano.titolo}" aria-hidden="true" data-toggle="modal" data-target="#lyricsModal" ></i>
                            </div>
                        </div>
	                      
	                  
	                    </div>
	 </div>			
</c:if>	

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
		
<c:if test="${fn:length(brani) < 1}">
				<div id="nessunBrano">
					<h1 style="color:white;">Non hai brani preferiti.</h1>
				</div>
			</c:if>
			
			
<!-- Modal -->
<div class="modal fade" id="lyricsModal" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title" id="exampleModalLongTitle">Lyrics</h1>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <label id = "lyrics"></label>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
 <script src="js/mediaPlayer.js"></script>
 <script src="js/braniPreferiti.js" ></script>
 
