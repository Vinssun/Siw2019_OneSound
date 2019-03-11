<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<link rel="stylesheet" href="css/flipclock.css">
<div >

 	
  <!-- ##### Contact Area Start ##### -->

    <section class="contact-area bg-img bg-overlay bg-fixed has-bg-img" style="padding-bottom: 3%;">
        <div style="margin: 0;width: 100%;/* min-width: -webkit-fill-available; */min-height: -webkit-fill-available;">

            <div class="row" style="text-align: center;width: 100%;">
                <div class="col-12"  >
                	<label id="title">IL TUO ACCOUNT PREMIUM SCADE TRA:</label>
                </div>
                <div id="clock" class="clock" data-time = "${time}"></div>
                <label id="message"class=".message"></label>
            </div>
        </div>
    </section>
    <!-- ##### Contact Area End ##### -->
 
</div>
<script src="js/flipclock.js"></script>
<script type="text/javascript">
		var clock;
	
		$(document).ready(function() {
			var clock;
			var t = $('.clock').attr("data-time");
			clock = $('.clock').FlipClock({
		        clockFace: 'DailyCounter',
		        autoStart: false,
		        callbacks: {
		        	stop: function() {
		        		$('.message').html("L'abbonamento al servizio premium \u00E8 scaduto.")
		        	}
		        }
		    });
				    
		    clock.setTime(parseInt(t));
		    clock.setCountdown(true);
		    clock.start();

		});
		
	
	</script>