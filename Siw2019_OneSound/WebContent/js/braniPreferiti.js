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

$(document).ready(function() {
	$(".im").each(function(){
			$(this).css("max-height","150")
			$(this).css("width","100")
			var width = $(this).css("width")
			$(this).css("height",""+width)
	});
});
$(window).on('resize', function(){
	$(".im").each(function(){
		var width = $(this).css("width")
		$(this).css("height",""+width)
	});

});

/*
$(".playB").on("click",function(){
	
	
	var idB=$(this).attr("data-id");
	var idA=$(this).attr("data-idAlbum");
	
	operation="getCanzoniAlbum?idCanzone="+idB+"&idAlbum="+idA;
	
	window.location.href = operation;
	
});*/
