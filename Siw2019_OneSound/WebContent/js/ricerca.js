$(document).ready(function(){
    $('#inputRicerca').keypress(function(e){
      if(e.keyCode==13)
      $('#search').click();
    });
});

//getCanzoniGenere


$(".genresImage,.genresName").on("click",function(){     
	
	alert("ricercagenere");
	var genere=$(this).attr("data-id");
	alert(genere)
	callAjaxRicerca("getCanzoniGenere",genere);
});

$('#search').click(function(e){     
	e.preventDefault();
	e.stopPropagation();
	alert("ricerca");
   
	
   var r = new RegExp(/[a-zA-Z]+/);
   
   eVal =  $('#inputRicerca').val();
   
   
   alert(eVal);
	
   if(r.test(eVal)){
	   callAjaxRicerca("effettuaRicerca",eVal);
//	   	$.ajax({
//		        type: 'GET',
//		        url: "effettuaRicerca",
//		        data: {nome: eVal},
//		  		dataType: "text",		
//				success: function (data){
//					alert("SUCCESSO");
//					$('#loading_screen').css('display','none');	
//					$('#result').html(data);
//				},
//		       
//		        beforeSend: function(){  
//		        	
//		        	$('#result').html("");
//		        	$('#loading_screen').css('display','block');
//		        	$('#contenitore').css('display','none');
//		        },
//		        
//				
//				
//		       error: function(){
//		    	   window.location.href = "pageNotFound.jsp";
//		       }
//		       
//		        
//		    });
	   
   }
});


function callAjaxRicerca(url,eVal){
	$.ajax({
        type: 'GET',
        url: url,
        data: {nome: eVal},
  		dataType: "text",		
		success: function (data){
			$(".spinner").fadeOut();
			$('#result').html(data);
		},
       
        beforeSend: function(){  
        	
        	$('#result').html("");
        	$(".spinner").fadeIn();
        	$('#contenitore').fadeOut()
        },
        
		
		
       error: function(){
    	   window.location.href = "pageNotFound.jsp";
       }
       
        
    });
}