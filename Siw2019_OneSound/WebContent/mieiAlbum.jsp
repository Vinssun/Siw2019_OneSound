<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<link rel="stylesheet" href="css/aggiunteAlbum.css">
<link rel="stylesheet" href="css/general.css">

<div>
	<section class="contact-area section-padding-100 bg-img bg-overlay bg-fixed has-bg-img" style="min-height: -webkit-fill-available;">
        <div class="container">



			<div class="row">
                <div class="col-12">
                    <div class="section-heading white">
                        <h2>I tuoi Album</h2>
                    </div>
                    <div id = "delete">
	              			 <button id = "bottoneAlbum" class="btn oneMusic-btn mt-30" type="button">Gestisci Album</button>
	            	</div>
                </div>
            </div>
		</div>
		
		
			
			
			<c:if test="${fn:length(albums) > 0}">
			<div class="row"  id ="listaAlbum">
	            		<div class="col-12" style="display: contents;">
				<c:forEach items="${albums}" var="p"> 
	               <!-- Single Album -->
					<div class="single-album p albumContainer" id="divAlbum">
						<img class="playlistImage" src="${p.immagine}" alt=""> 
						<img class="play" data-id="${p.id}" src="img/play.png" alt="">
						<div class="album-info">
								<h5>${p.titolo}</h5>
						</div>
					</div>
	              </c:forEach>
	             		
	           </div>
	           </div>
	
			</c:if>
			
			
			
			<c:if test="${fn:length(albums) < 1}">
				<div class="row">
	            			<div class="col-12">
				<div>
					<h2 class="section-heading white testoBianco28">Non sono presenti album.</h2>
				</div>
				
	         			</div>
	
	         			</div>
			</c:if>

			
			
			
		
   	</section>
 </div>
 
 
 
 <script src="js/album.js"></script>