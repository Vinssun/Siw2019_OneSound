$(".heartSongImageClass").on("click",function(){
	
	
	var idB = $(this).attr("data-id");
	
	
	$(this).parents("li:first").remove();
	
	$.ajax({
        type: 'Post',
        url: "removePreferito",
        data: {id: idB},
        	
  		dataType: "text",		
		success: function (data){},
		error: function(){
			window.location.href = "pageNotFound.jsp";
		}
       
        
    });
	
});

$(".playB").on("click",function(){
	
	
	var idB=$(this).attr("data-id");
	var idA=$(this).attr("data-idAlbum");
	
	operation="getCanzoniAlbum?idCanzone="+idB+"&idAlbum="+idA;
	
	window.location.href = operation;
	
});
