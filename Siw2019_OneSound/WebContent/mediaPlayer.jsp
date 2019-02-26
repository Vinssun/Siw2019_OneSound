<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title -->
<title>One Music - Modern Music HTML5 Template</title>

<!-- Favicon -->
<link rel="icon" href="img/core-img/favicon.ico">

<!-- Stylesheet -->
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="css/aggiunte.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>

<body>


	<%@ include file="commonPages/topPart.jsp"%>



	<!-- ##### Featured Artist Area Start ##### -->
    <section class="featured-artist-area section-padding-100 bg-img bg-overlay bg-fixed" style="background-image: url(img/bg-img/bg-4.jpg);">
        <div class="container spaziatura283">
            <div class="row align-items-end">
            	<!-- <div id = "centrale28"> -->
                <div class="col-12 col-md-5 col-lg-4">
                    <div class="featured-artist-thumb">
                        <img src="img/bg-img/fa.jpg" alt="">
                    </div>
                </div>
                <!-- <div class="col-12 col-md-5 col-lg-4 ">
            		DIV TATTICO PER NON ANDARE A CAPO, LE CLASSI spaziatura283 col-12 col-md-7 col-lg-8 FANNO ANDARE A CAPO
            	</div> -->
            	<div class=" spaziatura283 col-12 col-md-7 col-lg-8 ">
            		<h2 class = "testoBianco28">Artista <i id = "followArtista" class="fa fa-heart-o cuore"></i></h2>
            		<h5 class = "testoBianco28">Album <i id = "followAlbum" class="fa fa-heart-o cuore"></i></h5>
           		</div>
            	<!--</div> -->
            	<div class = "spaziatura283">
                <div class="col-12 col-md-7 col-lg-8">
                    <div class="featured-artist-content">
                        <div id = "playMusica" class="song-play-area">
                            <div class="song-name">
                                <p>01. Main Hit Song <i id = "piu" class="fa fa-plus-circle"></i></p>
                                
                            </div>
                            <audio preload="auto" controls>
                                <source src="audio/dummy-audio.mp3">
                            </audio>
                        </div>
                    </div>
                </div>
                </div>
                
			<div class = "spaziatura282 col-12 col-md-7 col-lg-8">
                <div  id = "canzoniAlbum28" class="song-play-area" >
                	<h1 class = "testoBianco28">Canzoni dell'album</h1>
                        <div class = "scroll">
							
							<h5 class = "testoBianco28">{p.titolo} <i id = "piu" class="fa fa-plus-circle "></i></h5>
							<h5 class = "testoBianco28">{p.titolo} <i id = "piu" class="fa fa-plus-circle"></i></h5>
							<h5 class = "testoBianco28">{p.titolo}</h5>
							<h3 class = "testoBianco28">{p.titolo}</h3>
							<h3 class = "testoBianco28">{p.titolo}</h3>
							<h3 class = "testoBianco28">{p.titolo}</h3>
							<h3 class = "testoBianco28">{p.titolo}</h3>
							<h3 class = "testoBianco28">{p.titolo}</h3>
							<h3 class = "testoBianco28">{p.titolo}</h3>
							<h3 class = "testoBianco28">{p.titolo}</h3>
							<h3 class = "testoBianco28">{p.titolo}</h3>
							<h3 class = "testoBianco28">{p.titolo}</h3>
							<h3 class = "testoBianco28">{p.titolo}</h3>
							<h3 class = "testoBianco28">{p.titolo}</h3>
							<h3 class = "testoBianco28">{p.titolo}</h3>
							<h3 class = "testoBianco28">{p.titolo}</h3>
							<h3 class = "testoBianco28">{p.titolo}</h3>
							<h3 class = "testoBianco28">{p.titolo}</h3>
							<h3 class = "testoBianco28">{p.titolo}</h3>
							<h3 class = "testoBianco28">{p.titolo}</h3>
							<h3 class = "testoBianco28">{p.titolo}</h3>
							<h3 class = "testoBianco28">{p.titolo}</h3>
							<h3 class = "testoBianco28">{p.titolo}</h3>
							<h3 class = "testoBianco28">{p.titolo}</h3>
							<h3 class = "testoBianco28">{p.titolo}</h3>
							<ul>
			
								<c:forEach items="${brani}" var="p"> 
								<li>
								<h3>
									<a href="#" class = "testoBianco28">${p.titolo} </a>
									<i class="fa fa-plus-circle piu"></i>
								</h3>
								</li>
								</c:forEach>
							</ul>
						</div>
				</div>
			</div>
            
            </div>
        </div>
    </section>
    <!-- ##### Featured Artist Area End ##### -->

			



	<!-- ##### All Javascript Script ##### -->
	<!-- jQuery-2.2.4 js -->
	<script src="js/jquery/jquery-2.2.4.min.js"></script>
	<!-- Popper js -->
	<script src="js/bootstrap/popper.min.js"></script>
	<!-- Bootstrap js -->
	<script src="js/bootstrap/bootstrap.min.js"></script>
	<!-- All Plugins js -->
	<script src="js/plugins/plugins.js"></script>
	<!-- Active js -->
	<script src="js/active.js"></script>
	
	<script src="js/following.js"></script>
</body>

</html>