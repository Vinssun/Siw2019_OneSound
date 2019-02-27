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
                        <h2>Le mie Playlists seguite</h2>
                        </div>
                    </div>
                </div>
            </div>
		<div class="row" id ="contenitoreLista">
			<div class="col-12" id="playlistList" data-type="pr">
            <c:if test="${fn:length(playlists) > 0}">
			
					<c:forEach items="${playlists}" var="p">
						<!-- Single Album -->
						<div class="single-album p" id="divPlaylist" data-idplaylist="${p.id}">
							<img class="playlistImage" src="${p.immagine}" alt=""> 
							<div class="album-info">
									<h5>${p.nome}</h5>
							</div>
						</div>
					</c:forEach>

	</c:if>
		</div>
	</div>
				<c:if test="${fn:length(playlists) < 1}">
						<div class="row">
               			<div class="col-12">
						<div>
							<h2 class="section-heading testoBianco28">Non segui alcuna playlist.</h2>
						</div>

						
            			</div></div>
					</c:if>
</section>

  <script src="js/playlistSeguite.js"></script>