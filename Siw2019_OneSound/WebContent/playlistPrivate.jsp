<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<link rel="stylesheet" href="css/aggiunteAlbum.css">


<div style="margin-left:16%;">
	<section class="contact-area section-padding-100 bg-img bg-overlay bg-fixed has-bg-img" style="background-image: url(img/bg-img/bg-2.jpg);">
        <div class="container">



			<div class="row">
                <div class="col-12">
                    <div class="section-heading white">
                        <h2>Playlist Private</h2>
                    </div>
                </div>
            </div>
			
			
			
			
					<c:if test="${fn:length(albums) > 0}">
					<div class="row">
               		<div class="col-12">
						<c:forEach items="${albums}" var="p"> 
			                <div class="col-12 col-sm-6 col-md-3">
			                    <div class="single-album-area">
			                        <div class="album-thumb bordo">
		                                <img class="miniImage copertina" src="${p.immagine}" alt="">
		                                <img class="play" data-id="${p.seguito}" src="img/play.png" alt="">
			                            <!-- <div class="play-icon">
			                                <a href="#" class="video--play--btn"><span class="icon-play-button"></span></a>
			                            </div> -->
			                        </div>
			                        <div class="album-info">
			                               <h5 class = "testoBianco28 testo">${p.titolo}</h5>
			                        </div>
			                    </div>
			                </div>
			              </c:forEach>
			              <div>
	               			 <button id = "bottoneAlbum" class="btn oneMusic-btn mt-30" type="button">Gestisci Album</button>
		            	</div>
		              
		            </div>
		            </div>
					</c:if>
					
					
					
					<c:if test="${fn:length(albums) < 1}">
						<div class="row">
               			<div class="col-12">
						<div>
							<h2 class="section-heading white testoBianco28">Non sono presenti playlist private.</h2>
						</div>
						<div class="text-right">
               				 <button id = "bottoneAlbum" class="btn oneMusic-btn mt-30" type="button">Aggiungi Playlist</button>
            			</div>
            			</div>
            			</div>
					</c:if>

			
			
			
			
			
			
			
				
   	
   		</div>
   	</section>
 </div>
 
 
 
 <script src="js/album.js"></script>