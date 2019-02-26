<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

    <link rel="stylesheet" type="text/css" href="css/creditCardFormStyle.css">
     <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
<div>

 	
  <!-- ##### Contact Area Start ##### -->

    <section class="contact-area bg-img bg-overlay bg-fixed has-bg-img" style="padding-bottom: 3%;">
        <div class="container" style="margin: 0;min-width: -webkit-fill-available;min-height: -webkit-fill-available;">

            <div class="row">
                <div class="col-12"  style="padding: 0;">
                
                	<img id="imgtitlePremium"alt="" src="img/premium.png">
                	<button id = "diventaPremium" class="btn" type="button" data-toggle="modal" data-target="#payModal">Diventa Premium</button>
                </div>
                <div id="functionImage">
                	<span id="uploadSong" ><img src="img/uploadSong.png"></img></span>
                	<span id="uploadAlbum" ><img src="img/uploadAlbum.png"></img></span>
                	<span id="sharePlaylist" ><img src="img/sharePlaylist.png"></img></span>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Contact Area End ##### -->

</div>


<!-- Modal -->
<div class="modal fade" id="payModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document"style="min-width: 680px;">

    <div class="modal-content">
      <div class="modal-header">
       
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="container-fluid">
        
        <div class="creditCardForm">
            <div class="heading">
                <h1>Conferma acquisto</h1>
            </div>
            <div class="payment">
                    <div class="form-group owner">
                        <label for="owner">Proprietario carta</label>
                        <input type="text" class="form-control white" id="owner">
                    </div>
                    <div class="form-group CVV">
                        <label for="cvv">CVV</label>
                        <input type="text" class="form-control white" id="cvv">
                    </div>
                    <div class="form-group" id="card-number-field">
                        <label for="cardNumber">Numero carta</label>
                        <input type="text" class="form-control white" id="cardNumber">
                    </div>
                    <div class="form-group" id="expiration-date">
                        <label>Data scadenza</label>
                        <select>
                            <option value="01">Gennaio</option>
                            <option value="02">Febraio </option>
                            <option value="03">Marzo</option>
                            <option value="04">Aprile</option>
                            <option value="05">Maggio</option>
                            <option value="06">Giugno</option>
                            <option value="07">Luglio</option>
                            <option value="08">Agosto</option>
                            <option value="09">Settembre</option>
                            <option value="10">Ottobre</option>
                            <option value="11">Novembre</option>
                            <option value="12">Dicembre</option>
                        </select>
                        <select>
                            <option value="17"> 2017</option>
                            <option value="18"> 2018</option>
                            <option value="19"> 2019</option>
                            <option value="20"> 2020</option>
                            <option value="21"> 2021</option>
                            <option value="22"> 2022</option>
                            <option value="23"> 2023</option>
                            <option value="24"> 2024</option>
                            <option value="25"> 2025</option>
                            <option value="26"> 2026</option>
                            <option value="27"> 2027</option>
                            <option value="28"> 2028</option>
                        </select>
                    </div>
                    <div class="form-group" id="credit_cards">
                        <img src="img/visa.jpg" id="visa">
                        <img src="img/mastercard.jpg" id="mastercard">
                        <img src="img/amex.jpg" id="amex">
                    </div>
                    <div class="form-group" id="pay-now">
                        <button type="button" class="btn btn-default" id="confirm-purchase">Confirm</button>
                    </div>
            </div>
        </div>
    </div>
        
      </div>
     
    </div>
  </div>
</div>

    <script src="js/jquery.payform.min.js" charset="utf-8"></script>
    <script src="js/script.js"></script>