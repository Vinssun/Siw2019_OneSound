<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/general.css">


<div>
	<section class="contact-area bg-img bg-overlay bg-fixed has-bg-img" style="min-height: -webkit-fill-available;">

			 <!-- ##### Buy Now Area Start ##### -->
    <section class="oneMusic-buy-now-area has-fluid section-padding-100">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading white">
                        <h2 class="testoBianco28">Artisti Seguiti</h2>
                    </div>
                </div>
            </div>

            <div class="row">
            <c:if test="${fn:length(artisti) > 0}">
				 <c:forEach items="${artisti}" var="p">
	                <!-- Single Album Area -->
	                <div class="col-12 col-sm-6 col-md-4 col-lg-2" id = "${p.email}">
	                    <div class="single-album-area wow fadeInUp" data-wow-delay="200ms">
	                        <div class="album-thumb" id="divArtista">
	                       	 	<img class="artistImage settoDim" src="${p.immagine }" alt=""> 
	                       	 	<img class="play" src="img/play.png" alt="" data-email="${p.email}">
                       	 		<img class="heart" data-email="${p.email}" src="img/full-heart.png" alt="">
	                        </div>
	                        
	                        <div class="album-info">
	                            	<h2 class="testoBianco28" id="nickName">${p.nickname}</h2>
	                                <h6 class="testoBianco28" id="nameSurname">${p.nome} ${p.cognome}</h6>
	                        </div>
	                    </div>
	                </div>
		      </c:forEach>
			</c:if>
                

            </div>

					<c:if test="${fn:length(artisti) < 1}">
						<div class="row">
               			<div class="col-12">
						<div>
							<h2 class="section-heading testoBianco28">Non segui alcun artista.</h2>
						</div>

						
            			</div></div>
					</c:if>
        </div>
    </section>
    <!-- ##### Buy Now Area End ##### -->
					
					
					


   	
   	</section>
 </div>
 
 
 <script src="js/artistiSeguiti.js"></script>
