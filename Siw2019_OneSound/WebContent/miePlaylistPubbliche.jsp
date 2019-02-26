<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<link rel="stylesheet" href="css/general.css">
<section class="latest-albums-area section-padding-100">
	<div class="container">
		 <div class="row">
                <div class="col-12">
                    <div class="section-heading white">
                        <h2>Le mie Playlists pubbliche</h2>
                        <div id = "create">
                          	<button id = "creaPlaylist"  type="button" class="btn" data-toggle="modal" data-target="#myModal">
 										<i class="fa fa-plus"></i>
							</button>
                        <span id="subtitleButton">Crea Playlist</span>
                        </div>
                        <div id = "delete">
                          	<button id = "deletePlaylist"  type="button" class="btn" data-active = "false" data-toggle="modal" data-target="#myModal3">
 										<i class="fa fa-times"></i>
							</button>
                        <span id="subtitleButton2">Rimuovi Playlist</span>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
		<div class="row" id ="contenitoreLista">
			<div class="col-12" id="playlistList" data-type="pb">
					<c:forEach items="${playlists}" var="p">
						<!-- Single Album -->
						<div class="single-album p" id="divAlbum" data-idplaylist="${p.id}">
							<img class="playlistImage" src="${p.immagine}" alt=""> 
							<div class="album-info">
								<a href="#">
									<h5>${p.nome}</h5>
								</a>
							</div>
						</div>
					</c:forEach>

		</div>
	</div>
</section>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
 <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content" style="text-align: -webkit-center;">
      <div class="modal-header">
        <h2 class="modal-title" id="exampleModalLabel">Crea la tua Playlist Privata</h2>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        			<div id="conteinerAlbumImage" >
						<img id="albumImage" alt="" src="img/playlist.png">
						<label id="modify"for="albumImageInput" style=" transition: all 200ms;background: whitesmoke;width: 50%;opacity: 1;margin: 0 0 -22px 0;"><h2 style="transition: all 200ms;"> Modifica </h2></label>
						<input id="albumImageInput" name="albumImage" accept="image/*" type="file">
					</div>
					<div style="width: 50%;margin: 26px 0 0 0;">
						<h3 >Nome Playlist: </h3>
						 <input type="text" class="form-control" id="nomePlaylist">
					 </div>
      </div>
      <div class="modal-footer">
        <button id = "save"type="button" class="btn btn-secondary" style="font-size: large;" >Crea Playlist</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h2 class="modal-title" id="exampleModalLongTitle">ATTENZIONE</h2>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	Modalit&#225; rimozione attiva. Clicca le playlist che vuoi eliminare. Per uscire dalla modalit&#225; rimozione clicca di nuovo sul tasto rimuovi playlist.
      </div>
      <div class="modal-footer">
        <button type="button" id="capitoButton" class="btn btn-primary" data-dismiss="modal" style="font-size: larger;">Capito</button>
      </div>
    </div>
  </div>
</div>
    <script src="js/following.js"></script>
     <script src="js/playlist.js"></script>