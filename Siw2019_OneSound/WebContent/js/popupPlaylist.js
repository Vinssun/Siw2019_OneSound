var idB;

$(".addB").on("click",function(){
     		$('#playlistModal').modal("show")
     		$('#playlistPrivate').show()
     		$('#playlistPubblicheButton').removeClass("btn-primary");
     		$('#playlistPubblicheButton').addClass("btn-secondary");
     		$('#playlistPrivateButton').removeClass("btn-secondary");
     		$('#playlistPrivateButton').addClass("btn-primary");
     		$('#playlistPubbliche').hide()
     		idB=$(this).parents("li:first").attr("data-idSong");
});
     	
$("#playlistPubblicheButton").on("click",function(){
     		$('#playlistPubbliche').show()
     		$('#playlistPubblicheButton').removeClass("btn-secondary");
     		$('#playlistPubblicheButton').addClass("btn-primary");
     		$('#playlistPrivateButton').removeClass("btn-primary");
     		$('#playlistPrivateButton').addClass("btn-secondary");
     		$('#playlistPrivate').hide()
     	});
     	
$("#playlistPrivateButton").on("click",function(){
     		$('#playlistPrivate').show()
     		$('#playlistPubblicheButton').removeClass("btn-primary");
     		$('#playlistPubblicheButton').addClass("btn-secondary");
     		$('#playlistPrivateButton').removeClass("btn-secondary");
     		$('#playlistPrivateButton').addClass("btn-primary");
     		$('#playlistPubbliche').hide()
});


$("#aggiungiBrano").on("click",function(){
	var t="pr";
	var idP=$("#playlistPrivate option:selected").val();
	if($("#playlistPubbliche").is(":visible")){
		t="pb";
		idP=$("#playlistPubbliche option:selected").val();
	}
	
	$.ajax({
        type: 'Post',
        url: "aggiungiBranoPl",
        data: {tipo: t,idPlaylist: idP, brano: idB},
        	
  		dataType: "text",		
		success: function (data){
			$("#branoAggiunto").fadeIn(1000);
		    setInterval(function(){$("#branoAggiunto").fadeOut()},3000);

			
		},
		error: function(){
			window.location.href = "pageNotFound.jsp";
		}
       
        
    });
});
     	
     	
     