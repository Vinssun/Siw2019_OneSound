/*
$(".album-thumb").hover(function(){

	$(this).find(".play").show();
	$(this).find(".heart").show();
	$(this).css("filter"," brightness(90%)");
	$(this).prev().css("filter"," brightness(50%)");
	$(this).find(".play").animate({ width: "43%"}, 100);
},function(){
	$(this).find(".play").hide();
	$(this).css("filter"," brightness(100%)");
	$(this).prev().css("filter"," brightness(100%)");
	$(this).find(".play").animate({ width: "40%"}, 100);
	
});
*/
$(".p").hover(function(){
	$(this).find(".playlistImage").css("filter","brightness(70%)")
	$(this).css("cursor","context-menu")
	$(this).css("filter","brightness(100%)")
},
function(){
	$(this).find(".playlistImage").css("filter","brightness(100%)")

})
$(document).ready(function() {
	$(".playlistImage").each(function(){
			$(this).css("max-height","300")
			
			    $(this).imagesLoaded(function() {
			    	var width = $(this).css("width")
			    	alert(width)
					$(this).css("height",""+width)
			    });
	});
});
$(window).on('resize', function(){
	$(".playlistImage").each(function(){
		var width = $(this).css("width")
		$(this).css("height",""+width)
	});

});
$(".play").hover(function(){
	$
	$(this).css("filter","brightness(90%)")
	$(this).css("cursor","pointer")
},
function(){
	$(this).css("filter","brightness(100%)")
	$(this).css("cursor","context-menu")

})

$(".play").on("click",function(){
	
	var type=$(this).parent().attr("id");
	var operation;
	if(type=="divAlbum"){
		idAlbum=$(this).attr("data-idAlbum");
		operation="getCanzoniAlbum?idAlbum="+idAlbum;
	}
	
	window.location.href = operation;
		
});


$(".single-album").hover(function(){

	$(this).find(".play").show();
	$(this).find(".play").next().show();
	$(this).find(".play").animate({ width: "43%"}, 100);
	$(this).find(".ilGenere").show();
	
},function(){
	$(this).find(".play").hide();

	$(this).find(".play").next().hide();
	$(this).find(".play").animate({ width: "40%"}, 100);
	$(this).find(".ilGenere").hide();
	
});
$(".add").hover(function(){
	$(this).show();
	$(this).animate({ width: "17%"}, 100);
	if($(this).attr('src') == "img/check.png")
		$(this).attr('src','img/remove.png');
},function(){
	$(this).animate({ width: "14%"}, 100);
	if($(this).attr('src') == "img/remove.png")
		$(this).attr('src','img/check.png');
});

$(".add").on("click",function(){
	id2=$(this).attr("data-id")
	$.ajax({
        type: 'Post',
        url: "unfollowAlbum",
        data: {id: id2},
  		dataType: "text",		
		success: function (data){
			
		},
       
        beforeSend: function(){  
        	
        	
        },
        
		
		
       error: function(){
    	   window.location.href = "pageNotFound.jsp";
       }
       
        
    });
	
	$(this).parent().remove();
})
/*$(".heart").hover(function(){
	alert("stai passando sopra heart");
	$(this).show();
	$(this).prev().show();
	$(this).animate({ width: "17%"}, 100);
	$(this).prev().prev().css("filter"," brightness(50%)");
},function(){
	$(this).hide();
	$(this).prev().hide();
	$(this).animate({ width: "14%"}, 100);
	$(this).prev().prev().css("filter"," brightness(100%)");
});




$(".heart").on("click",function(){
	id2=$(this).attr("data-id");
	callAjax2("unfollowAlbum",id2);
	$(this).parent().parent().parent().remove();
});

*/

$(".elimina").on("click",function(){
	id2=$(this).attr("data-id");
	callAjax2("unfollowAlbum",id2);
	$(this).parent().parent().parent().remove();
});






































$(".play").each(function(){
	$(this).animate({ width: "40%"}, 100);
	$(this).hide();
});


/*
$(".thumbnail").hover(function(){

	$(this).find(".play").show();
	$(this).css("filter"," brightness(90%)");
	$(this).prev().css("filter"," brightness(50%)");
	$(this).find(".play").animate({ width: "43%"}, 100);
},function(){
	$(this).find(".play").hide();
	$(this).css("filter"," brightness(100%)");
	$(this).prev().css("filter"," brightness(100%)");
	$(this).find(".play").animate({ width: "40%"}, 100);
	
});


$(".elimina").on("click",function(){
		id2=$(this).attr("data-id");
		callAjax2("unfollowAlbum",id2);
		$(this).parent().remove();
});*/


function callAjax2(op,id2) {
	$.ajax({
        type: 'Post',
        url: op,
        data: {id: id2},
  		dataType: "text",		
		success: function (data){
			
		},
       
        beforeSend: function(){  
        	
        	
        },
        
		
		
       error: function(){
    	   window.location.href = "pageNotFound.jsp";
       }
       
        
    });
}