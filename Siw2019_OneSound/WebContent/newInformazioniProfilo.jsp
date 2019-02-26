<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<link rel="stylesheet" href="css/newProfilo.css">

<div style="margin-left:16%;">

 	
  <!-- ##### Contact Area Start PROFILO BRUTTOOOOOOOOOOOOOOOOOOOOOOOOOOO##### -->

    <section class="contact-area section-padding-50 bg-img bg-overlay bg-fixed has-bg-img" style="padding-bottom: 3%; min-height: -webkit-fill-available;">
        <div class="container" >
        
        
        <div class="col-md-7 ">

				<div class="panel panel-default">
					<div class="panel-heading">
						<h4>${utente.nickname }</h4>
					</div>
					<div class="panel-body">

						<div class="box box-info">

							<div class="box-body">
								<div class="col-sm-6">
									<div align="center">
										<img alt="User Pic" src="${utente.immagine }" id="profile-image1" class="img-circle img-responsive">

										<!--Upload Image Js And Css-->

				                        <div class="testoBianco28 following">
				                        	<i id = "followArtista2" class="fa fa-heart cuore spostaSotto">
				                                <span class="counter">${utente.follower}</span>
				                          	</i>
				                        </div>





									</div>

									<br>

									<!-- /input-group -->
								</div>

								<hr style="margin: 5px 0 5px 0;">

								<div class="clearfix"></div>
								<div class="bot-border"></div>
								<div class="col-sm-5 col-xs-6 tital testoBianco28">Nome:</div>
								<div class="col-sm-7 col-xs-6 ">
									<input type="text" class="form-control marginLeft" id="nome" placeholder="Nome" value="${utente.nome}" disabled>
                                   	<h6 id = "nomeErr" class = "testoBianco28 marginLeft" style="visibility: hidden;">Inserisci nome valido</h6>
                                </div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>

								<div class="col-sm-5 col-xs-6 tital testoBianco28">Cognome:</div>
								<div class="col-sm-7">
									<input type="text" class="form-control marginLeft" id="cognome" placeholder="Cognome" value="${utente.cognome}" disabled>
                                    	<h6 id = "cognomeErr" class = "testoBianco28 marginLeft" style="visibility: hidden;">Inserisci cognome valido</h6>
                                </div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>
								
								<div class="col-sm-5 col-xs-6 tital testoBianco28">Nickname:</div>
								<div class="col-sm-7">
									<input type="text" class="form-control marginLeft" id="nickname" placeholder="Nickname" value="${utente.nickname}" disabled>
                                </div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>
								
								<div class="col-sm-5 col-xs-6 tital testoBianco28">Data di nascita:</div>
								<div class="col-sm-7">
									<input type="date" class="form-control marginLeft" id="dataNascita" value="${utente.dataStr}" required disabled>
                                </div>

								<div class="clearfix"></div>
								<div class="bot-border"></div>
								
								<div class="col-sm-5 col-xs-6 tital testoBianco28">Email:</div>
								<div class="col-sm-7">
									<input type="email" class="form-control marginLeft" id="email" placeholder="E-mail" value="${utente.email}" disabled>
                                </div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>
								
								<div class="col-sm-5 col-xs-6 tital testoBianco28">Password:</div>
								<div class="col-sm-7">
									<input type="password" class="form-control marginLeft" id="password" placeholder="Password" value="${utente.password}" disabled>
                                   	<h6 id = "passwordErr" class = "testoBianco28 marginLeft" style="visibility: hidden;">Inserisci pasword valida</h6>
                                </div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>
								
								<div class="col-sm-5 col-xs-6 tital testoBianco28">Conferma password:</div>
								<div class="col-sm-7">
									<input type="password" class="form-control marginLeft" id="confirmPassword" placeholder="Conferma Password"  style="visibility: hidden;">
                              		<h6 id = "confirmPasswordErr" class = "testoBianco28 marginLeft" style="visibility: hidden;">La password non corrisponde</h6>
                                </div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>


								<!-- /.box-body -->
							</div>
							<!-- /.box -->
					    	<div class="col-12 text-center" style="margin: -69px 0 0 0;">
					            <button id = "modificaProfilo" class="btn oneMusic-btn mt-30" type="button">Modifica</button>
            				</div>
    
						</div>


					</div>
				</div>
			</div>
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        

           
            <!-- <div class="row">
                <div class="col-12">
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
            </div>-->
        </div>
    </section>
    <!-- ##### Contact Area End ##### -->

</div>