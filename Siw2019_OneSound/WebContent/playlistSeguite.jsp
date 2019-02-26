<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<link rel="stylesheet" href="css/general.css">
<section class="latest-albums-area section-padding-100">
	<div class="container">
		 <div class="row">
                <div class="col-12">
                    <div class="section-heading white" style="width: 94%;left: 10%;">
                        <h2>Le mie Playlists seguite</h2>
                        </div>
                    </div>
                </div>
            </div>
		<div class="row" id ="contenitoreLista">
			<div class="col-12" id="playlistList" data-type="pr">
					<c:forEach items="${playlists}" var="p">
						<!-- Single Album -->
						<div class="single-album p" id="divPlaylist" data-idplaylist="${p.id}">
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

  <script src="js/playlistSeguite.js"></script>