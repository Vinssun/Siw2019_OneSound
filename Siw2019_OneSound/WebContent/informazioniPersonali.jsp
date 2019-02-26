<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>



<div style="z-index: 0;">

 	
  <!-- ##### Contact Area Start PROFILO BUONOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO##### -->

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
                        <form class="needs-validation" novalidate>
                        
                        <div class="form-row">
						    <div class="form-group col-md-6">
						      <label for="inputEmail4">Nome</label>
						      <input type="text" class="form-control" id="nome" data-id="${utente.premium}" placeholder="Nome" value="${utente.nome}" disabled>
						    	<div id = "nomeErr" class="invalid-tooltip">
						        	Inserisci nome valido
						        </div>
						    </div>
						    <div class="form-group col-md-6">
						     <label for="inputEmail4">Cognome</label>
						      <input type="text" class="form-control" id="cognome" placeholder="Cognome" value="${utente.cognome}" disabled>
                              <div id = "cognomeErr" class="invalid-tooltip">
						        	Inserisci cognome valido
						      </div>  	
						    </div>
						</div>
                         <div class="form-row">
						    <div class="form-group col-md-6">
						      <label for="inputEmail4">Nickname</label>
                              <input type="text" class="form-control" id="nickname" placeholder="Nickname" value="${utente.nickname}" disabled>
                               <div id = "nicknameErr" class="invalid-tooltip">
						        	Inserisci nickname valido
						      </div>           	
						    </div>
						    <div class="form-group col-md-6">
						     <label for="inputEmail4">Nascita</label>
                               <input type="date" class="form-control" id="dataNascita" value="${utente.dataStr}" required disabled>     	
						    </div>
						</div>
                        <div class="form-row">
						    <div class="form-group col-md-6">
						      <label for="inputEmail4">Email</label>
                              <input type="email" class="form-control" id="email" placeholder="E-mail" value="${utente.email}" disabled>
                                    
						    </div>
                        </div>
                            
                        <div class="form-row">
						    <div class="form-group col-md-6">
						      <label for="inputEmail4">Password</label>
                              <input type="password" class="form-control " id="password" placeholder="Password" value="${utente.password}" disabled>
                              <div id = "passwordErr" class="invalid-tooltip">
						        	Inserisci pasword valida
						      </div> 
						    </div>
						    <div id="confermaPass"class="form-group col-md-6">
						     <label for="inputEmail4" ">Conferma Password</label>
                              <input type="password" class="form-control" id="confirmPassword" placeholder="Conferma Password"  >
                               <div id = "confirmPasswordErr" class="invalid-tooltip">
						        	La password non corrisponde
						      </div> 
						    </div>
						    <div class="col-12 text-center" >
                                    <button id = "modificaProfilo" class="btn btn-lg  btn-dark" type="button">Modifica</button>
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

	<script src="js/informazioniPersonali.js"></script>