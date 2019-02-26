<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<link rel="stylesheet" href="css/aggiunteAlbum.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="css/braniPreferiti.css">
<link rel="stylesheet" href="css/general.css">
<link rel="stylesheet" href="css/aggiunte.css">
    

<div >
	<section class="contact-area section-padding-100 bg-img bg-overlay bg-fixed has-bg-img" style="padding-bottom: 3%; min-height: -webkit-fill-available;">
	
        <div class="container">
						<div class="row">
			                <div class="col-12">
			                    <div class="section-heading white">
			                        <h2>Brani Preferiti</h2>
			                    </div>
			                </div>
			            </div>
			 <c:if test="${fn:length(brani) > 0}">
			
			<c:set var="songsCount" value="0"/>
			<ul id="songsList" class="list-group">
			<!-- product mettere l'if per il length maggiore di 0 sopra-->
					<li class="list-group-item">
					  <span id="playSongSpan"></span>
					  <span id="heartSongSpan"></span>
					  <span id="titleSongSpan">Titolo</span>
					  <span id="artistSpan">Artista</span>
					  <span id="albumSpan">Album</span>
					  <span id="genreSpan">Genere</span>
					</li>
			<c:forEach items="${brani}" var="p"> 
			<!-- foreach -->
			 
			 
					<li id="song${songsCount}" data-idSong="${p.id}" class="list-group-item standardSpan songElement">
					  <span id="playSongSpan"><img id="playImage" data-id="${p.id}" data-idAlbum="${p.album.id}" class="playB" src="img/play.png" alt=""></span>
	                  <span id="heartSongSpan"><img id="heartSongImage" data-id="${p.id}" class="heartB heartSongImageClass" src="img/full-heart.png" alt=""></span>
					  <span id="titleSongSpan" class="crop"><label id="nameSurname" data-toggle="tooltip" data-placement="left" title="${p.titolo}">${p.titolo}</label></span>
					  <span id="artistSpan" class="crop"><label id="nameSurname" data-toggle="tooltip" data-placement="left" title="${p.utenteCaricatore.nickname}">${p.utenteCaricatore.nickname}</label></span>
					  <span id="albumSpan" class="crop"><label id="nameSurname" data-toggle="tooltip" data-placement="left" title="${p.album.titolo}">${p.album.titolo}</label></span>
					  <span id="genreSpan" class="crop"><label id="nameSurname" data-toggle="tooltip" data-placement="left" title="${p.genere.nome}">${p.genere.nome}</label></span>
					  </li>
					<!--  chiudi for each-->
					
					<c:set var="songsCount" value="${songsCount + 1}"/>
					</c:forEach>
					
			</ul>
			
					</c:if>
   			<c:if test="${fn:length(brani) < 1}">
				<div>
					<h1>Nessun brano preferito.</h1>
				</div>
			</c:if>
	

   		</div>
   	</section>
 </div>
 <script src="js/braniPreferiti.js" ></script>
 
