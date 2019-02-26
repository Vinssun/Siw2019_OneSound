<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

	<div class="container" >
		
			
			<c:if test="${fn:length(artisti) > 0}">
			<h1>Artisti trovati</h1>
			<!-- product mettere l'if per il length maggiore di 0 sopra-->
			<div class="row">
			<c:forEach items="${artisti}" var="p"> 
			<!-- foreach -->
					 <div class="col-4 col-sm-4 col-md-4 col-lg-2">
	                    <div class="single-album-area wow fadeInUp" data-wow-delay="200ms">
	                        <div id="divArtista" class="album-thumb" >
	                       	 	<img class="artistImage" src="img/bg-img/b2.jpg" alt="">
	                       	 	<img class="play" src="img/play.png" alt="" data-email="${p.email}">
	                       	 	
	                       	 	<c:if test="${p.seguito == true}">
	                       	 		<img class="heart" data-email="${p.email }" src="img/full-heart.png" alt="">
	                       	 	</c:if>
	                       	 	 <c:if test="${p.seguito == false}">
	                       	 		<img class="heart" data-email="${p.email }" src="img/empty-heart.png" alt="">
	                       	 	</c:if>
	                        </div>
	                        
	                        <div class="album-info">
	                            	<h2 id="nickName">${p.nickname}</h2>
	                                <h6 id="nameSurname">${p.nome} ${p.cognome}</h6>
	                        </div>
	                    </div>
	                </div>
					<!--  chiudi for each-->
					</c:forEach>
					</div>
					</c:if>
				
			
   			<c:if test="${fn:length(artisti) < 1}">
				<div>
					<h1>Nessun artista trovato.</h1>
				</div>
			</c:if>
			
			<c:if test="${fn:length(brani) > 0}">
			<h1>Brani trovati</h1>
			
			<div id="filter">
				<select id="filterComboBox" class="form-control">
				    <option value="allGenres">Tutti i generi</option>
				    <option value="pop">Pop</option>
				    <option value="hip-hop">Hip Hop</option>
				    <option value="rock">Rock</option>
				    <option value="dance">Dance</option>
				    <option value="classica">Classica</option>
				    <option value="jazz">Jazz</option>
				 </select>
				
				<button id="filterButton" class="btn oneMusic-btn m-2" type="button">Applica filtro</button>
			</div>
				
			<c:set var="songsCount" value="0"/>
			<ul id="songsList" class="list-group list-group-flush">
			<!-- product mettere l'if per il length maggiore di 0 sopra-->
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
			<c:forEach items="${brani}" var="p"> 
			<!-- foreach -->
			
			 
					<li id="song${songsCount}" data-idSong="${p.id}" class="list-group-item standardSpan songElement">
					  <span id="imageSpan"><img id="coverImage" src="img/bg-img/s1.jpg" alt=""></span>
					  <span id="playSongSpan"><img data-type="brano" id="playImage" class="playB" src="img/darkPlay.png" alt=""></span>
					  <span id="addSongSpan"><img id="addImage" class="addB" src="img/darkAdd.png" alt=""></span>
					  <c:if test="${p.preferito == true}">
	                       	 		<span id="heartSongSpan"><img id="heartSongImage" data-id="${p.id}" class="heartB" src="img/dark-full-heart.png" alt=""></span>
	                   </c:if>
	                   <c:if test="${p.preferito == false}">
	                       	 		<span id="heartSongSpan"><img id="heartSongImage" data-id="${p.id}" class="heartB" src="img/dark-empty-heart.png" alt=""></span>
	                   </c:if>
					  
					  <span id="titleSongSpan" class="crop"><label id="nameSurname" data-toggle="tooltip" data-placement="left" title="${p.titolo}">${p.titolo}</label></span>
					  <span id="artistSpan" class="crop"><label id="nameSurname" data-toggle="tooltip" data-placement="left" title="${p.utenteCaricatore.nickname}">${p.utenteCaricatore.nickname}</label></span>
					  <span id="albumSpan" class="crop"><label id="nameSurname" data-toggle="tooltip" data-placement="left" title="${p.album.titolo}">${p.album.titolo}</label></span>
					  <span id="genreSpan" class="crop"><label id="nameSurname" data-toggle="tooltip" data-placement="left" title="${p.genere.nome}">${p.genere.nome}</label></span>
					  </li>
					<!--  chiudi for each-->
					
					<c:set var="songsCount" value="${songsCount + 1}"/>
					</c:forEach>
					
			</ul>
			
				<h2 id="noSongGenre">Nessun brano con il genere inserito</h2>
					</c:if>
   			<c:if test="${fn:length(brani) < 1}">
				<div>
					<h1>Nessun brano trovato.</h1>
				</div>
			</c:if>
			<c:if test="${fn:length(brani) > 5}">
				<div class="moreButton">
					<button id="moreSongButton" class="btn oneMusic-btn m-2" type="button">Mostra altri</button>
				</div>
			</c:if>
   
			<c:if test="${fn:length(albums) > 0}">
   			<h1>Album trovati</h1>
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
					  <span id="imageSpan"><img id="coverImage" src="img/bg-img/s1.jpg" alt=""></span>
					  <span id="playSpan"><img data-type="album" id="playImage" class="playB" src="img/darkPlay.png" alt=""></span>
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
					<h1>Nessun album trovato.</h1>
				</div>
			</c:if>
			<c:if test="${fn:length(albums) > 5}">
				<div class="moreButton">
					<button id="moreAlbumButton" class="btn oneMusic-btn m-2" type="button">Mostra altri</button>
				</div>
			</c:if>
			
			
			<c:if test="${fn:length(playlists) > 0}">
			<h1>Playlist trovate</h1>
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
					  <span id="imageSpan"><img id="coverImage" src="img/bg-img/s1.jpg" alt=""></span>
					  <span id="playSpan"><img data-type="playlist"  id="playImage" class="playB" src="img/darkPlay.png" alt=""></span>
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
					<h1>Nessuna playlist trovata.</h1>
				</div>
			</c:if>
			<c:if test="${fn:length(playlists) > 5}">
				<div class="moreButton">
					<button id="morePlaylistButton" class="btn oneMusic-btn m-2" type="button">Mostra altri</button>
				</div>
			</c:if>
			
			
  </div>

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
        <button type="button" id="aggiungiBrano" class="btn btn-primary">Aggiungi</button>
      </div>
    </div>
  </div>
</div>

  <script src="js/following.js"></script>
  <script src="js/showProduct.js"></script>
  <script src="js/popupPlaylist.js"></script>