<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>



<div style="margin-left:16%;">

 	
  <!-- ##### Contact Area Start PROFILO BUONOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO ORIGINEEEEEEE##### -->

    <section class="contact-area section-padding-100 bg-img bg-overlay bg-fixed has-bg-img" style="padding-bottom: 3%; min-height: -webkit-fill-available;">
        <div class="container" >

            <div class="row">
                <div class="col-12">
                    <div class="section-heading white">
                        <h2>Il mio profilo</h2>
                        <div class="testoBianco28 following">
                        	<i id = "followArtista2" class="fa fa-heart cuore spostaSotto">
                                <span class="counter">${utente.follower}</span>
                          	</i>
                        </div>
                        
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <!-- Contact Form Area -->
                    <div class="contact-form-area">
                        <form action="#" method="post">
                            <div class="row">
                                <div class="margineBottom lunghezza">
                                	<h4 class = "testoBianco28 margineTop marginRight">Nome:</h4>
                       			</div>
                                <div class="col-md-6 col-lg-4">
                                    <div class="margineBottom marginAuto">
                                    	<input type="text" class="form-control marginLeft" id="nome" placeholder="Nome" value="${utente.nome}" disabled>
                                    	<h6 id = "nomeErr" class = "testoBianco28 marginLeft" style="visibility: hidden;">Inserisci nome valido</h6>
                                    </div>
                                </div>
                                <div class="margineBottom lunghezza">
                                	<h4 class = "testoBianco28 margineTop marginRight">Cognome:</h4>
                       			</div>
                                <div class="col-md-6 col-lg-4">
                                    <div class="margineBottom marginAuto">
                                        <input type="text" class="form-control marginLeft" id="cognome" placeholder="Cognome" value="${utente.cognome}" disabled>
                                    	<h6 id = "cognomeErr" class = "testoBianco28 marginLeft" style="visibility: hidden;">Inserisci cognome valido</h6>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="margineBottom lunghezza">
                                	<h4 class = "testoBianco28 margineTop marginRight">Nickname:</h4>
                       			</div>
                                <div class="col-md-6 col-lg-4">
                                    <div class="margineBottom marginAuto">
                                        <input type="text" class="form-control marginLeft" id="nickname" placeholder="Nickname" value="${utente.nickname}" disabled>
                                    </div>
                                </div>
                            </div>	
                            <div class="row">
                                <div class="margineBottom lunghezza">
                                	<h4 class = "testoBianco28 margineTop marginRight">Nascita:</h4>
                       			</div>
                                <div class="col-md-6 col-lg-4">
                                    <div class="margineBottom marginAuto">
                                        <input type="date" class="form-control marginLeft" id="dataNascita" value="${utente.dataStr}" required disabled>
                                    </div>
                                </div>
                                <div class="margineBottom lunghezza">
                                	<h4 class = "testoBianco28 margineTop marginRight">Email:</h4>
                       			</div>
                                <div class="col-md-6 col-lg-4">
                                    <div class="margineBottom marginAuto">
                                        <input type="email" class="form-control marginLeft" id="email" placeholder="E-mail" value="${utente.email}" disabled>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="margineBottom lunghezza">
                                	<h4 class = "testoBianco28 margineTop marginRight">Password:</h4>
                       			</div>
                                <div class="col-md-6 col-lg-4">
                                    <div class="margineBottom marginAuto">
                                        <input type="password" class="form-control marginLeft" id="password" placeholder="Password" value="${utente.password}" disabled>
                                    	<h6 id = "passwordErr" class = "testoBianco28 marginLeft" style="visibility: hidden;">Inserisci pasword valida</h6>
                                    </div>
                                </div>
                                <div class="margineBottom lunghezza">
                                	<h4 id = "labelConferma" class = "testoBianco28 margineTop marginRight" style="visibility: hidden;">Conferma Password:</h4>
                       			</div>
                                <div class="col-md-6 col-lg-4">
                                    <div class="margineBottom marginAuto">
                                        <input type="password" class="form-control marginLeft" id="confirmPassword" placeholder="Conferma Password"  style="visibility: hidden;">
                                   		<h6 id = "confirmPasswordErr" class = "testoBianco28 marginLeft" style="visibility: hidden;">La password non corrisponde</h6>
                                    </div>
                                </div>
                                <div class="col-12 text-center" style="margin: -69px 0 0 0;">
                                    <button id = "modificaProfilo" class="btn oneMusic-btn mt-30" type="button">Modifica</button>
                                </div>
                               
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Contact Area End ##### -->

</div>