var formData = new FormData();


$(".immagineDelProfilo").hover(function(){
/*
	$(this).find("#modificaImmagine").css("font-size", "x-large");
	$(this).find("#modificaImmagine").css("float", "right");*/
	//$(this).find("#modificaImmagine").css("color", "white");
},function(){
	
/*	$(this).find("#modificaImmagine").css("font-size", "large");
	$(this).find("#modificaImmagine").css("transform", "translate(0%, -150%)");*/
	//$(this).find("#modificaImmagine").css("color", "gray");
	
});

var width = $("#immagineProfilo").css("width")
$("#immagineProfilo").css("height",""+width)


$("#arrow").on("click",function(){
	if($(this).attr("data-visible") == "true"){
		$(this).attr("data-visible","false")
		$(this).animate(
		    {left:"0px", deg: 90 },
		    {
		      duration: 250,
		      step: function(now) {
		        $(this).css({ transform: 'rotate(-90deg)' });
		      }
		    }
		  );
		$("#sideMenu").fadeIn()
		$("#sideMenu").toggle('slide')
	}else{
		$(this).attr("data-visible","true")
		
		$(this).animate(
		    {left:"270px", deg: 90 },
		    {
		      duration: 250,
		      step: function(now) {
		    	  $(this).css({left:"270px"})
		        $(this).css({ transform: 'rotate(90deg)' });
		      }
		    }
		  );
		
		$("#sideMenu").fadeOut()
		$("#sideMenu").toggle('slide')
	}
})


/*$("#immagineProfilo").mouseenter(function(){
	$("#modificaImmagine").css("visibility", "visible");
});

$("#immagineProfilo").mouseleave(function(){
	$("#modificaImmagine").css("visibility", "hidden");
});*/


$('#infoProfilo').on('click',function(e) {
	e.preventDefault();
	$("#mieiAlbum").removeClass("active");
	$("#miePlaylistPubbliche").removeClass("active");
	$("#miePlaylistPrivate").removeClass("active");
	$("#artistiSeguiti").removeClass("active");
	$("#albumSeguiti").removeClass("active");
	$("#playlistSeguite").removeClass("active");
	$("#braniPreferiti").removeClass("active");
	$("#infoProfilo").addClass("active");
	
	
	
	alert("ciaox")
	var eVal = "getInformazioniPersonali";

	callAjaxProfilo(eVal);
});


$('#mieiAlbum').on('click',function(e) {
	e.preventDefault();
	
	$("#infoProfilo").removeClass("active");
	$("#miePlaylistPubbliche").removeClass("active");
	$("#miePlaylistPrivate").removeClass("active");
	$("#artistiSeguiti").removeClass("active");
	$("#albumSeguiti").removeClass("active");
	$("#braniPreferiti").removeClass("active");
	$("#playlistSeguite").removeClass("active");
	$("#mieiAlbum").addClass("active");
	
	
	var eVal = "getMieiAlbum";
	alert(eVal)
	callAjaxProfilo(eVal);
});

$('#miePlaylistPubbliche').on('click',function(e) {
	e.preventDefault();
	
	$("#mieiAlbum").removeClass("active");
	$("#infoProfilo").removeClass("active");
	$("#miePlaylistPrivate").removeClass("active");
	$("#artistiSeguiti").removeClass("active");
	$("#albumSeguiti").removeClass("active");
	$("#braniPreferiti").removeClass("active");
	$("#playlistSeguite").removeClass("active");
	$("#miePlaylistPubbliche").addClass("active");
	

	var eVal = "getMiePlaylistPubbliche";

	callAjaxProfilo(eVal);
});

$('#miePlaylistPrivate').on('click',function(e) {
	e.preventDefault();
	
	$("#mieiAlbum").removeClass("active");
	$("#miePlaylistPubbliche").removeClass("active");
	$("#infoProfilo").removeClass("active");
	$("#artistiSeguiti").removeClass("active");
	$("#albumSeguiti").removeClass("active");
	$("#playlistSeguite").removeClass("active");
	$("#braniPreferiti").removeClass("active");
	$("#miePlaylistPrivate").addClass("active");
	
	var eVal = "getMiePlaylistPrivate";

	callAjaxProfilo(eVal);
});

$('#artistiSeguiti').on('click',function(e) {
	e.preventDefault();

	$("#mieiAlbum").removeClass("active");
	$("#miePlaylistPubbliche").removeClass("active");
	$("#miePlaylistPrivate").removeClass("active");
	$("#albumSeguiti").removeClass("active");
	$("#infoProfilo").removeClass("active");
	$("#playlistSeguite").removeClass("active");
	$("#braniPreferiti").removeClass("active");
	$("#artistiSeguiti").addClass("active");
	
	
	var eVal = "getArtistiSeguiti";

	callAjaxProfilo(eVal);
});

$('#albumSeguiti').on('click',function(e) {
	e.preventDefault();
	
	$("#mieiAlbum").removeClass("active");
	$("#miePlaylistPubbliche").removeClass("active");
	$("#miePlaylistPrivate").removeClass("active");
	$("#artistiSeguiti").removeClass("active");
	$("#infoProfilo").removeClass("active");
	$("#playlistSeguite").removeClass("active");
	$("#braniPreferiti").removeClass("active");
	$("#albumSeguiti").addClass("active");
	

	var eVal = "getAlbumSeguiti";

	callAjaxProfilo(eVal);
});

$('#playlistSeguite').on('click',function(e) {
	e.preventDefault();
	
	$("#mieiAlbum").removeClass("active");
	$("#miePlaylistPubbliche").removeClass("active");
	$("#miePlaylistPrivate").removeClass("active");
	$("#artistiSeguiti").removeClass("active");
	$("#albumSeguiti").removeClass("active");
	$("#infoProfilo").removeClass("active");
	$("#braniPreferiti").removeClass("active");
	$("#playlistSeguite").addClass("active");
	

	var eVal = "getPlaylistSeguite";

	callAjaxProfilo(eVal);
});

$('#braniPreferiti').on('click',function(e) {
	e.preventDefault();
	
	$("#mieiAlbum").removeClass("active");
	$("#miePlaylistPubbliche").removeClass("active");
	$("#infoProfilo").removeClass("active");
	$("#artistiSeguiti").removeClass("active");
	$("#albumSeguiti").removeClass("active");
	$("#playlistSeguite").removeClass("active");
	$("#miePlaylistPrivate").removeClass("active");
	$("#braniPreferiti").addClass("active");
	

	var eVal = "getPreferenzeBrani";

	callAjaxProfilo(eVal);
});

$("#premiumAccount").on("click",function(){
	$.ajax({
		type : 'Post',
		url : "accountPremium",
		
		success : function(data) {
			alert("ciaoo")
			$(".spinner").fadeOut();
			//$('.spinner').css('display', 'none');
			//$('#contenitore').css('display', 'block');
			$('#contenitore').fadeIn()
			$('#contenitore').html(data);
		},
		beforeSend : function() {
			$(".spinner").fadeIn();
			//$('.spinner').css('display', 'block');
			//$('#contenitore').css('display', 'none');
			$('#contenitore').fadeOut()
		},

		error : function() {
			 window.location.href = "pageNotFound.jsp";
		}

	});
});



function callAjaxProfilo(eVal) {
	
		  
//		  if(history.pushState) {
//		    history.pushState(null, null, "profile?operazione=myAccount"); 
		    
//		  }

	
	$.ajax({
		type : 'GET',
		url : eVal,
		
		
		success : function(data) {
			
			//$('.spinner').css('display', 'none');
			$(".spinner").fadeOut();
			//$('#contenitore').css('display', 'block');
			$('#contenitore').fadeIn()
			$('#contenitore').html(data);
		},
		beforeSend : function() {
			$(".spinner").fadeIn();
			//$('.spinner').css('display', 'block');
			//$('#contenitore').css('display', 'none');
			$('#contenitore').fadeOut()
		},

		error : function() {
			 window.location.href = "pageNotFound.jsp";
		}

	});

}




$("#files1").on("change", function(e) {
	var files = e.target.files,
	filesLength = files.length;
	alert(filesLength)
	for (var i = 0; i < filesLength; i++) {
		var f = files[i]
		var fileReader = new FileReader();
		
		fileReader.onload = (function(e) {

			var file = e.target;
			$("#immagineProfilo").attr("src",e.target.result)
		});
		fileReader.readAsDataURL(f);
		alert("prima del formData")
		formData.append("immagineProfilo", files[i])
		alert("dopo del formData")
		 
	}
	alert("dopo")
	$(this).val('')
	cambiaFoto();
}); 

function cambiaFoto(){
	$.ajax({
    url: 'cambiaFoto',
    data: formData,
    type: "POST", //ADDED THIS LINE
    // THIS MUST BE DONE FOR FILE UPLOADING
    contentType: false,
    processData: false,
    // ... Other options like success and etc
          		
	success: function (data){
		alert("successo")
	},
	beforeSend : function (){
		alert("before")
	}
	});
	
}
