var regexEmail = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
(function ($) {
    "use strict";


    /*==================================================================
    [ Focus input ]*/
    $('.input100').each(function(){
        $(this).on('blur', function(){
            if($(this).val().trim() != "") {
                $(this).addClass('has-val');
            }
            else {
                $(this).removeClass('has-val');
            }
        })    
    })
  
  
    /*==================================================================
    [ Validate ]*/
    var input = $('.validate-input .input100');
    
    $('.validate-form').on('submit',function(){
        var check = true;
        
        for(var i=0; i<input.length; i++) {
            if(validate(input[i]) == false){
                showValidate(input[i]);
                check=false;
            }
        }

        return check;
    });
    


    $('.validate-form .input100').each(function(){
        $(this).focus(function(){
           hideValidate(this);
        });
    });

    function validate (input) {
    	//alert("si")
        if($(input).attr('type') == 'email' || $(input).attr('name') == 'email') {
            if($(input).val().trim().match(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/) == null) {
                return false;
            }
        }
        else {
            if($(input).val().trim() == ''){
                return false;
            }
        }
    }

    function showValidate(input) {
        var thisAlert = $(input).parent();

        $(thisAlert).addClass('alert-validate');
    }

    function hideValidate(input) {
        var thisAlert = $(input).parent();

        $(thisAlert).removeClass('alert-validate');
    }
    
    /*==================================================================
    [ Show pass ]*/
    var showPass = 0;
    $('.btn-show-pass').on('click', function(){
        if(showPass == 0) {
            $(this).next('input').attr('type','text');
            $(this).find('i').removeClass('zmdi-eye');
            $(this).find('i').addClass('zmdi-eye-off');
            showPass = 1;
        }
        else {
            $(this).next('input').attr('type','password');
            $(this).find('i').addClass('zmdi-eye');
            $(this).find('i').removeClass('zmdi-eye-off');
            showPass = 0;
        }
        
    });
    $('#recovery').click(function(){
		
		$('#firstDiv').load('passwordRecovery.jsp')
	});
    
    $('#login').click(function(){
		//alert("indietro");
		$('#firstDiv').load('login.jsp')
	});
    //$("#recoveryButton").attr("disabled", "disabled");
    
$("#recoveryEmail").bind("change paste keyup",function(){
		//alert("ciao");
	 	var eVal =  $('#recoveryEmail').val();
	  	if(check($('#recoveryEmail').val(),regexEmail)){
	  		
	  	
		  	$.ajax({
		  		type: 'GET',
		  		url: 'registraUtente',
		  		data: {email: eVal},
		  		dataType: "text",
				success: function (data){
					$("#infoEmail").text("");
					var p=JSON.parse(data);
					if(p.email == "presente"){

						$("#recoveryButton").removeAttr("disabled");
					}
					if(p.email == "no"){
					
						$("#recoveryButton").attr("disabled", "disabled");
						$("#infoEmail").text("Email non registrata.");
						checkProseguiButton(valide);
						 
					}
				}
		  	});
	  
	  	}
	});


    
function check(val,regex){
	  if(val != null || val !="")
		  return regex.test(val);
	  return true;
	}


$("#recoveryButton").on("click",function(){
	if($('#recoveryEmail').val()!=""){
	  	var recipient = $('#recoveryEmail').val();
	  	var	subject = "Recupero password account";

	  	$.ajax({
	  		type: 'POST',
	  		url: 'EmailSendingServlet',
	  		data: {recipient: recipient,
	  				subject:subject},
	  		dataType: "text",
			success: function (data){
				$('#loading_screen').css('display','none');
				$('#infoLabel-50').css('display','block');
				$('#loadDiv').html(data);
				window.setTimeout(function () {
			        window.location.href = "login.jsp";
			    }, 4000);
			}, 
			beforeSend: function(){  
	        	
				$('#infoLabel-50').css('display','none');
	        	$('#loading_screen').css('display','block');
	        },
	  	});
	  
	}else{
		$("#infoEmail").text("Inserisci un'email.");
	}
});

})(jQuery);