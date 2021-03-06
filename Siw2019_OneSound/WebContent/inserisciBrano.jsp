<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>One Sound</title>

    <!-- Favicon -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="css/general.css">
    
     

</head>
<body>
	    <!-- Preloader -->
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="lds-ellipsis">
            <div></div>
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>

    <!-- ##### Header Area Start ##### -->
    <header class="header-area">
        <!-- Navbar Area -->
        <div class="oneMusic-main-menu">
            <div class="classy-nav-container breakpoint-off">
                <div class="container">
                    <!-- Menu -->
                    <nav class="classy-navbar justify-content-between" id="oneMusicNav">

                        <!-- Nav brand -->
                        <a href="home" class="nav-brand"><img src="img/core-img/logo.png" alt=""></a>

                        <!-- Navbar Toggler -->
                        <div class="classy-navbar-toggler">
                            <span class="navbarToggler"><span></span><span></span><span></span></span>
                        </div>

                        <!-- Menu -->
                        <div class="classy-menu" style=" margin: auto;">

                            <!-- Close Button -->
                            <div class="classycloseIcon">
                                <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                            </div>
                            <!-- Nav Start -->
                            <div class="classynav">
                                <ul>
                                	<li><a href="getProfile">Profile</a></li>
                                    <li><a href="home">Home</a></li>
                                    <li><a href="albums-store.jsp">Search</a></li>
                                   
                                </ul>

                                <!-- Login/Register & Cart Button -->
                                <div class="login-register-cart-button d-flex align-items-center" style="margin-left: 67px;">
                                    <!-- Login/Register -->
                                    <div class="login-register-btn" style="display: flex;">
                                        <c:if test="${name != null}">
                                        	<p id="loginBtn" class="loginWelcome">Benvenuto ${name}</p>
                                        	<a href="getLogin?logout=true"" id="loginBtn" style="margin: auto -33px auto 0;">Logout</a>
                                    	</c:if>
                                    	<c:if test="${name == null}">
                                    		<a href="getLogin" id="loginBtn">Login / Register</a>
                                    	</c:if>
                                    	
                                    </div>

                                </div>
                            </div>
                            <!-- Nav End -->

                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- ##### Header Area End ##### -->
	 <div class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/breadcumb2.jpg);">
        <div class="bradcumbContent">
            <h2>Gestione Album</h2>
        </div>
    </div>
   
	<form id="dropFileForm" action="" method="post" onsubmit="uploadFiles(event)">
		<div class="container">
		 <div class="alert alert-success" role="alert" id = "complete">
					  
					</div>
			
      		<div class="row">
        		<div id="album">
        			<div id="conteinerAlbumImage" >
						<img id="albumImage" alt="" src="img/empty-album.png">
						<label id="modify"for="albumImageInput" ><h4 class="txt-W"> Modifica </h4></label>
						<input id="albumImageInput" name="albumImage" accept="image/*" type="file">
					</div>
					<div id="flickr">
						<h6 >Cerca l'immagine su Flickr</h6>
						<span id ="containerFlickr">
							<input type="text" class="form-control"  id="inputFlickr">
							<input type="text" class="form-control"  id="inputFlickrurl">
							<button type="button" class="btn btn-primary" onclick="cercaSuFlickr()">Cerca</button>
						</span>
					</div>
					<h6 class="infoText">Scegli l'album da modificare:</h6>
					<select class="form-control" id="albumList">
						<option disabled selected hidden class="albumOption" id="defaultOption" value ="info">Si prega di scegliere...</option>
						<option class="albumOption" id="creaAlbum" value="img/empty-album.png">Crea nuovo album</option>
						<c:forEach items="${albums}" var="p">
							<option class="albumOption" value="${p.immagine}" data-idAlbum="${p.id}" >${p.titolo}</option>
						</c:forEach>
					</select>
					<div id="titoloNuovoAlbum">
						<h6 >Nome Album: </h6>
						 <input type="text" class="form-control" id="nomeAlbum">
					 </div>
					<input type="file" name="files[]" accept="audio/*" id="fileInput" multiple onchange="addFiles(event)">
					<div class="flexDiv">
					   <label id="rimuoviAlbum" >
						    <i class="fa fa-times  fa-3x" aria-hidden="true"></i>
						    <label id="fileLabelText">
						      Elimina Album
						    </label>
					   </label>
					   <label id="svuotaEsistenti" >
					    <i class="fa fa-trash-o  fa-3x" aria-hidden="true"></i>
					    <label id="fileLabelText">
					      Svuota lista brani esistenti
					    </label>
					   </label>
					</div>
					<div class="flexDiv">
					  <label for="fileInput" id="fileLabel" ondragover="overrideDefault(event);fileHover();" ondragenter="overrideDefault(event);fileHover();" ondragleave="overrideDefault(event);fileHoverEnd();" ondrop="overrideDefault(event);fileHoverEnd();
					        addFiles(event);">
					    <i class="fa fa-download fa-3x"></i>
					    <br>
					    <label id="fileLabelText">
					      Choose a file or drag it here
					    </label>
					   </label>
					   
					   <label id="svuotaLabel" >
					    <i class="fa fa-trash-o  fa-3x" aria-hidden="true"></i>
					    <label id="fileLabelText">
					      Svuota lista brani aggiunti
					    </label>
					   </label>
					</div>
					
					<div style="font-size:1.5em">
						<a id="salva" href="#" onclick="salva();" class="button5" style="font-size:20px;font-weight:300;">Salva modifiche</a>
					</div>
				   <div class="alert alert-danger" role="alert" id = "error">
					  <strong>ATTENZIONE!</strong> Puoi inserire solo file audio!!
					</div>
					<div class="alert alert-danger" role="alert" id = "valid">
					  <strong>ATTENZIONE!</strong> Completa i campi per proseguire!!
					</div>

									  
				</div>
				<div id="contenitoreListe">
					
	        		<div id="listaBrani">
		        		<h2 id = "titolo1">Seleziona un album per iniziare a modificare</h2>
		        		<div id = "firstLine">
		        			<span class="nome"><h5>Nome brano</h5></span>
		        			<span class="genere"><h5>Genere</h5></span>
		        			<span class="link"><h5>Link Youtube</h5></span>
		        			<span class="delete"></span>
		        		</div>
		        		
		        		
	        		</div>
	        		<div id="listaBraniAlbum">
		        		<h2 id = "titolo1">Lista brani esistenti</h2>
		        		<div id = "firstLine">
		        			<span class="nome"><h5>Nome brano</h5></span>
		        			<span class="genere"><h5>Genere</h5></span>
		        			<span class="link"><h5>Link Youtube</h5></span>
		        			<span class="delete"></span>
		        		</div>
		        		
	        		</div>
	        		<div class="spinner" id="spinnerInserimento">
					  <div class="bounce1"></div>
					  <div class="bounce2"></div>
					  <div class="bounce3"></div>
					</div>
	        		
        		</div>
        	</div>            
	  	</div>
	  
	  
	</form>


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">ATTENZIONE</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        Stai per eliminare tutti i brani esistenti nell'album. I brani non sarannno pi&#250; disponibili.<br>Vuoi continuare?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Chiudi</button>
        <button type="button" id="svuotaAlbum"class="btn btn-primary">Si</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">ATTENZIONE</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        Stai per eliminare l'album. Le canzoni contenute non sarannno pi&#250; disponibili.<br>Vuoi continuare?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Chiudi</button>
        <button type="button" id="eliminaAlbum"class="btn btn-primary">Si</button>
      </div>
    </div>
  </div>
</div>


<!-- Modal -->
<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">ATTENZIONE</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	Se l'album rimarr&#225; vuoto verr&#225; eliminato.
      </div>
      <div class="modal-footer">
        <button type="button" id="capitoButton" class="btn btn-primary">Capito</button>
      </div>
    </div>
  </div>
</div>
    


<!-- Modal -->
<div class="modal fade  bd-example-modal-lg" id="youtube" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div id="iframeContent"class="modal-dialog modal-lg modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Youtube videos</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
     	
        <iframe id="videoYoutube" src="" 
        frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
        <h6 for="searchvideo">Ricerca su youtube</h6>
        <div class="input-group mb-3">
		  <input id="searchvideo"type="text" class="form-control" placeholder="Cerca " >
		  <div class="input-group-append">
		    <button id="cercaSuYoutube" class="btn btn-outline-secondary" type="button">Youtube</button>
		  </div>
		</div>
		<h6 for="listaVideoYoutube">Lista video trovati</h6>
       <select class="form-control" id="listaVideoYoutube" > 
			
		</select> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button id="salvaLink"type="button" data-dismiss="modal" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

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
    <script src="js/upload.js"></script>
    <script src="js/apiFlickr.js"></script>
    <script>
   
    </script>
</body>

</html>




