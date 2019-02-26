$(".play,.add,.heart").each(function(){
	$(this).hide();
});
$(".artistImage").each(function(){
	
	var width = $(this).css("width")
	$(this).css("height",""+width)
});
$(window).on('resize', function(){
	$(".artistImage").each(function(){
		
		var width = $(this).css("width")
		$(this).css("height",""+width)
	});
});


var hover = 0


$(".album-thumb .artistImage").hover(function(){
    console.log("mous is over");
    $(this).css("filter"," brightness(50%)");
    $(this).next().css("width"," 40%");
    $(this).next().next().css("width"," 14%");
	$(this).next().animate({ opacity : 1}, 250);
	$(this).next().next().animate({opacity : 1}, 250);
	
    $(this).next().show();
    $(this).next().next().show();
}, function(){
    console.log("mous leaves");
    $(this).next().hide();
    $(this).next().next().hide();
    $(this).css("filter"," brightness(100%)");
});



$(".single-album .play, .album-thumb .play").hover(function(){

	$(this).show();
	$(this).next().show();
	$(this).animate({ width: "43%"}, 100);
	$(this).prev().css("filter"," brightness(50%)");
},function(){
	$(this).hide();
	$(this).next().hide();
	$(this).animate({ width: "40%"}, 100);
	//$(this).css("transform"," scale(1) translate(-50%,-50%)");
	$(this).prev().css("filter"," brightness(100%)");
});




$(".heart").hover(function(){
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
	if($(this).attr('src') == "img/empty-heart.png"){
		id2=$(this).attr("data-email");
		callAjax2("seguiUtente",id2);
		$(this).attr('src','img/full-heart.png');
	}else{
		id2=$(this).attr("data-email");
		callAjax2("unfollowUtente",id2);
		$(this).attr('src','img/empty-heart.png');
		$(this).parent().parent().parent().hide();
	}
});





$(".play").on("click",function(){
	
	var type=$(this).parents("div:first").attr("id");
	alert(type);
	var operation;
	email=$(this).attr("data-email");
	operation="getArtista?emailArtista="+email;
	
	window.location.href = operation;
		
});







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













