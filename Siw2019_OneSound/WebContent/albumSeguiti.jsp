<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/general.css">
    <link rel="stylesheet" href="css/albumSeguiti.css">
	<!-- <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"> -->
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>        

<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
<link rel="stylesheet" href="css/aggiunteAlbum.css">
<link rel="stylesheet" href="css/general.css">


<div>
	<section class="contact-area bg-img bg-overlay bg-fixed has-bg-img" style="min-height: -webkit-fill-available;">
        <div>



			
    <section class="oneMusic-buy-now-area has-fluid section-padding-100">
        <div class="container-fluid">
        	<div class="row">
                <div class="col-12">
                    <div class="section-heading white">
                        <h2 class="testoBianco28">Album Seguiti</h2>
                    </div>
                </div>
            </div>
        </div>
          <c:if test="${fn:length(albums) > 0}">
          
          <div class="row"  id ="listaAlbum">
	            		<div class="col-12" style="display: contents;">
				<c:forEach items="${albums}" var="p"> 
	               <!-- Single Album -->
					<div class="single-album p" id="divAlbum" data-idAlbum="${p.id}">
						<img class="playlistImage" src="${p.immagine}" alt=""> 
						<img class="play"  data-idAlbum="${p.id}" data-id="${p.seguito}" src="img/play.png" alt="">
						<img class="add" data-id="${p.id}" src="img/check.png" alt="">
						<div class="album-info">
							<a href="#">
								<h5>${p.titolo}</h5>
								 <h6 class = "testoBianco28 testo">${p.utenteCaricatore.nome} ${p.utenteCaricatore.cognome}</h6>
							</a>
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
							<h2 class="section-heading testoBianco28">Non segui alcun album.</h2>
						</div>

						
            			</div></div>
					</c:if>
    </section>

   	
 </div>
     </section>
  </div>
 <script src="js/albumSeguiti.js"></script>
