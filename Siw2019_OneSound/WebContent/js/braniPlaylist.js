$(".addSongImageClass").each(function(){
	$(this).css("width","17%");
})
$(".addSongImageClass").hover(function(){
	$(this).show();
	$(this).prev().show();
	$(this).animate({ width: "17%"}, 100);
	$(this).prev().prev().css("filter"," brightness(50%)");
	if($(this).attr('src') == "img/check.png")
		$(this).attr('src','img/remove.png');
},function(){
	$(this).prev().hide();
	$(this).prev().prev().css("filter"," brightness(100%)");
	if($(this).attr('src') == "img/remove.png")
		$(this).attr('src','img/check.png');
});

$(".addSongImageClass").on("click",function(){
	
	
	var t = "pr";
	var idB = $(this).attr("data-id");
	var idP = $(this).attr("data-idPlaylist"); 
	if($(this).attr("data-type")=="pb"){
		t = "pb";
	}
	
	$(this).parents("li:first").remove();
	
	$.ajax({
        type: 'Post',
        url: "rimuoviBranoPl",
        data: {tipo: t,idPlaylist: idP, brano: idB},
        	
  		dataType: "text",		
		success: function (data){
		},
		error: function(){
			window.location.href = "pageNotFound.jsp";
		}
       
        
    });
	
});

