/**
 * 
 */

formData = new FormData();

$("#albumImage").css("width","50%")
$("#modify").css("opacity", "1")
var width = $("#albumImage").css("width")
	$("#albumImage").css("height",""+width)
	
$(".playlistImage").each(function(){
		$(this).css("width","300")
		var width = $(this).css("width")
		$(this).css("height",""+width)
	})
$(window).on('resize', function(){
	var width = $("#albumImage").css("width")
	$("#albumImage").css("height",""+width)
	$(".playlistImage").each(function(){
		var width = $(this).css("width")
		$(this).css("height",""+width)
	})
});

$("#creaPlaylist").on("click",function(){
	$("#albumImage").attr("src","img/playlist.png")
	$("#save").addClass("btn-secondary")
	$("#save").removeClass("btn-primary")
	$("#save").attr("data-dismiss","")
	$("#nomePlaylist").val("")
});

$("#creaPlaylist, #subtitleButton").hover(function(){
	$("#creaPlaylist").css("background-color","white")
	$("#subtitleButton").css("color","white")
},function(){
	$("#creaPlaylist").css("background-color","#7d7d7d")
	$("#subtitleButton").css("color","#7d7d7d")
});


$("#modify").hover(function(){
	$("#modify").css("background-color","black")
	$("#modify h2").css("color","white")
},function(){
	$("#modify").css("background-color","whitesmoke")
	$("#modify h2").css("color","black")
});

$("#albumImageInput").on("change", function(e) {
	var files = e.target.files,
	filesLength = files.length;
	for (var i = 0; i < filesLength; i++) {
		var f = files[i]
		var fileReader = new FileReader();
		
		fileReader.onload = (function(e) {

			var file = e.target;
			var width = $("#albumImage").css("width")
			$("#albumImage").css("height",""+width)
			$("#albumImage").attr("src",e.target.result)
			
		});
		fileReader.readAsDataURL(f);
		formData.append("playlistImage", files[i])
	}
	$(this).val('')
});

$("#nomePlaylist").bind("change paste keyup",function(){
	reg = /^\s*$/;
	if(reg.test($("#nomePlaylist").val())){
		$("#save").addClass("btn-secondary")
		$("#save").removeClass("btn-primary")
		$("#save").attr("data-dismiss","")
	}else{
		$("#save").removeClass("btn-secondary")
		$("#save").addClass("btn-primary")
		
		$("#save").attr("data-dismiss","modal")
	}
});
$("#save").on("click",function(){
	reg = /^\s*$/;
	if(!reg.test($("#nomePlaylist").val())){
		formData.append("titolo",$("#nomePlaylist").val())
		
		id = 0
		op = ""
		
		if($("#playlistList").attr("data-type") == "pr")
			op ="addPlaylistPrivata"
		else
			op = "addPlaylistPubblica"
				
		$.ajax({
		    url: op,
		    data: formData,
		    type: "POST", //ADDED THIS LINE
		    // THIS MUST BE DONE FOR FILE UPLOADING
		    contentType: false,
		    processData: false,
		    // ... Other options like success and etc
		          		
			success: function (data){
				formData = new FormData();
				var b = JSON.parse(data);
				
				$(
						"						<div class=\"single-album p x\" id=\"divAlbum\" data-idplaylist=\""+b[0].id+"\">\r\n" + 
						"							<img class=\"playlistImage\" src=\""+$("#albumImage").attr("src")+"\" alt=\"\"> \r\n" + 
						"							<div class=\"album-info\">\r\n" + 
						"								<a href=\"#\">\r\n" + 
						"									<h5>"+$("#nomePlaylist").val()+"</h5>\r\n" + 
						"								</a>\r\n" + 
						"							</div>\r\n" + 
						"						</div>").appendTo("#playlistList")
						$(".playlistImage").each(function(){
							var width = $(this).css("width")
							$(this).css("height",""+width)
						})
			},
	       
	        beforeSend: function(){  
	
				//$("#contenitoreListe .spinner").show();
	        },
			
	       error: function(){
	    	   errore = 1
	    	   window.location.href = "pageNotFound.jsp";
	       }
	       
	        
	    });
		
	}
	

	
});

$("#deletePlaylist").on("click",function(){
	if($(this).attr("data-active") == "false"){
		$(this).attr("data-active", "true")
		$(this).attr("data-target", "#myModal3")
		$("#deletePlaylist").css("background-color","red")
		$("#subtitleButton2").css("color","red")
	}else{
		$(this).attr("data-target", "")
		$("#deletePlaylist").css("background-color","#7d7d7d")
		$("#subtitleButton2").css("color","#7d7d7d")
		$(this).attr("data-active", "false")
	}
});

$(".p").on("click",function(){
	if($("#deletePlaylist").attr("data-active") == "true"){
		t = $("#playlistList").attr("data-type")
		id= $(this).attr("data-idplaylist")
		$.ajax({
			 type: 'Post',
	        url: 'eliminaPlaylist',
	        data: {tipo: t, idPlaylist:id},
	  		dataType: "text",
	  		
			success: function (data){
				//alert("successo")
				
			},
	       
	        beforeSend: function(){  

				//$("#contenitoreListe .spinner").show();
	        },
			
	       error: function(){
	    	   errore = 1
	    	   window.location.href = "pageNotFound.jsp";
	       }
	       
	        
	    });
		$(this).remove()
	}else{
		t = $("#playlistList").attr("data-type")
		eVal=""
			
		id= $(this).attr("data-idplaylist")
		n = $(this).children(".playlistImage").attr('data-nome')
		imm = $(this).children(".playlistImage").attr('src')
		//alert(n)
		if(t=="pb")
			eVal='getBraniPlaylistPb'
		else
			eVal="getBraniPlaylistPr"
		$.ajax({
			type : 'GET',
			url : eVal,
			data: {idPlaylist:id,nome:n,immagine:imm},
	  		dataType: "text",
			
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
})
$(document).on("click",".x",function(){
	if($("#deletePlaylist").attr("data-active") == "true"){
		t = $("#playlistList").attr("data-type")
		id= $(this).attr("data-idplaylist")
		$.ajax({
			 type: 'Post',
	        url: 'eliminaPlaylist',
	        data: {tipo: t, idPlaylist:id},
	  		dataType: "text",
	  		
			success: function (data){
				//alert("successo")
				
			},
	       
	        beforeSend: function(){  

				//$("#contenitoreListe .spinner").show();
	        },
			
	       error: function(){
	    	   errore = 1
	    	   window.location.href = "pageNotFound.jsp";
	       }
	       
	        
	    });
		$(this).remove()
	}else{
		t = $("#playlistList").attr("data-type")
		eVal=""
		id= $(this).attr("data-idplaylist")
		if(t=="pb")
			eVal='getBraniPlaylistPb'
		else
			eVal="getBraniPlaylistPr"
		$.ajax({
			type : 'GET',
			url : eVal,
			data: {idPlaylist:id},
	  		dataType: "text",
			
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
})
