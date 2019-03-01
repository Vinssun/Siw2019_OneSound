$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip(); 
});

$(".artistImage").each(function(){
	var width = $(this).css("width")
	$(this).css("height",""+width)
});

$(".albumImage").each(function(){
	var width = $(this).css("width")
	$(this).css("height",""+width)
});
$(".play,.add,.heart").each(function(){
	$(this).hide();
});

$(window).on('resize', function(){
	$(".artistImage").each(function(){
		var width = $(this).css("width")
		$(this).css("height",""+width)
	});

});

$("#followArtista").on('click', function(){
	
	if($("#followArtista").hasClass("fa-heart-o")){
		$("#followArtista").removeClass("fa-heart-o");
		$("#followArtista").addClass("fa-heart");
	}
	else{
		$("#followArtista").removeClass("fa-heart");
		$("#followArtista").addClass("fa-heart-o");
	}
	
});
$("#followAlbum").on('click', function(){
	if($("#followAlbum").hasClass("fa-heart-o")){
		$("#followAlbum").removeClass("fa-heart-o");
		$("#followAlbum").addClass("fa-heart");
	}
	else{
		$("#followAlbum").removeClass("fa-heart");
		$("#followAlbum").addClass("fa-heart-o");
	}
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



$(".single-album .albumImage").hover(function(){
    console.log("mous is over");
    $(this).css("filter"," brightness(50%)");
    $(this).next().css("width"," 40%");
    $(this).next().next().css("width"," 14%");
	
    $(this).next().show();
    $(this).next().next().show();
}, function(){
    console.log("mous leaves");
    $(this).next().hide();
    $(this).next().next().hide();
    $(this).css("filter"," brightness(100%)");
});

$(".thumbnail .miniImage").hover(function(){
    console.log("mous is over");
    $(this).css("filter"," brightness(50%)");	
    $(this).next().show();
}, function(){
    console.log("mous leaves");
    $(this).next().hide();
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

$(".thumbnail .play").hover(function(){

	$(this).show();
	$(this).next().show();
	$(this).css("filter"," brightness(90%)");
	$(this).prev().css("filter"," brightness(50%)");
},function(){
	$(this).hide();
	$(this).next().hide();
	//$(this).css("transform"," scale(1) translate(-50%,-50%)");
	$(this).css("filter"," brightness(100%)");
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



$(".add").hover(function(){
	$(this).show();
	$(this).prev().show();
	$(this).animate({ width: "17%"}, 100);
	$(this).prev().prev().css("filter"," brightness(50%)");
	if($(this).attr('src') == "img/check.png")
		$(this).attr('src','img/remove.png');
},function(){
	$(this).hide();
	$(this).prev().hide();
	$(this).animate({ width: "14%"}, 100);
	$(this).prev().prev().css("filter"," brightness(100%)");
	if($(this).attr('src') == "img/remove.png")
		$(this).attr('src','img/check.png');
});


$(".addAlbum,.addPlaylist").hover(function(){
	if($(this).attr('src') == "img/check.png")
		$(this).attr('src','img/remove.png');
},function(){
	if($(this).attr('src') == "img/remove.png")
		$(this).attr('src','img/check.png');
});


$(".add").on("click",function(){
	
	
	
	
	
	
	if($(this).attr('src') == "img/add.png"){
		var follower=parseInt($("[data-listAlbumFollower="+$(this).attr("data-id")+"]").text());
		
		$("[data-listAlbumFollower="+$(this).attr("data-id")+"]").text(follower+1);
		$("[data-albumFollower="+$(this).attr("data-id")+"]").text(follower+1);
		
		id2=$(this).attr("data-id");
		call2Ajax("seguiAlbum",id2);
		$(this).attr('src','img/check.png');
	}else if($(this).attr('src') == "img/remove.png"){
		var follower=parseInt($("[data-listAlbumFollower="+$(this).attr("data-id")+"]").text());
		
		$("[data-listAlbumFollower="+$(this).attr("data-id")+"]").text(follower-1);
		$("[data-albumFollower="+$(this).attr("data-id")+"]").text(follower+1);
		
		id2=$(this).attr("data-id");
		call2Ajax("unfollowAlbum",id2);
		$(this).attr('src','img/add.png');
	}
});

$(".addAlbum").on("click",function(){
	if($(this).attr('src') == "img/add.png"){
		id2=$(this).attr("data-id");
		call2Ajax("seguiAlbum",id2);
		$(this).attr('src','img/check.png');
	}else if($(this).attr('src') == "img/remove.png"){
		id2=$(this).attr("data-id");
		call2Ajax("unfollowAlbum",id2);
		$(this).attr('src','img/add.png');
	}
});

$(".addPlaylist").on("click",function(){
	if($(this).attr('src') == "img/add.png"){
		id2=$(this).attr("data-id");
		call2Ajax("seguiPlaylist",id2);
		$(this).attr('src','img/check.png');
	}else if($(this).attr('src') == "img/remove.png"){
		id2=$(this).attr("data-id");
		call2Ajax("unfollowPlaylist",id2);
		$(this).attr('src','img/add.png');
	}
});


$(".heartB").on("click",function(){
	if($(this).attr('src') == "img/empty-heart.png"){
		id2=$(this).attr("data-id");
		call2Ajax("addPreferito",id2);
		$(this).attr('src','img/full-heart.png');
	
	}else{
		id2=$(this).attr("data-id");
		call2Ajax("removePreferito",id2);
		$(this).attr('src','img/empty-heart.png');
	}
});


$(".heart").on("click",function(){
	
	
	if($(this).attr('src') == "img/empty-heart.png"){
		var follower=parseInt($(this).parent().next().children(":nth-child(3)").text());
		$(this).parent().next().children(":nth-child(3)").text(follower+1)
		id2=$(this).attr("data-email");
		call2Ajax("seguiUtente",id2);
		$(this).attr('src','img/full-heart.png');
	}else{
		var follower=parseInt($(this).parent().next().children(":nth-child(3)").text());
		$(this).parent().next().children(":nth-child(3)").text(follower-1)
		id2=$(this).attr("data-email");
		call2Ajax("unfollowUtente",id2);
		$(this).attr('src','img/empty-heart.png');
	}
});


$(".play").on("click",function(){
	
	var type=$(this).parents("div:first").attr("id");
	var operation;
	if(type=="divAlbum"){
		idAlbum=$(this).attr("data-idAlbum");
		operation="getCanzoniAlbum?idAlbum="+idAlbum;
	}if(type=="divBrano"){
		idCanz=$(this).attr("data-id");
		idAlbum=$(this).attr("data-idAlbum");
		operation="getCanzoniAlbum?idCanzone="+idCanz+"&idAlbum="+idAlbum;
	}if(type=="divPlaylist"){
		idPl=$(this).attr("data-idPlaylist");
		operation="getCanzoniPlaylistPb?idPlaylistPb="+idPl;
	}if(type=="divArtista"){
		email=$(this).attr("data-email");
		operation="getArtista?emailArtista="+email;
	}
	
	window.location.href = operation;
		
});


$(".playB").on("click",function(){
	var type=$(this).parent().attr("data-type");
	var operation;
	if(type=="album"){
		idAlbum=$(this).attr("data-idAlbum");
		operation="getCanzoniAlbum?idAlbum="+idAlbum;
	}if(type=="brano"){
		idCanz=$(this).attr("data-id");
		idAlbum=$(this).attr("data-idAlbum");
		operation="getCanzoniAlbum?idCanzone="+idCanz+"&idAlbum="+idAlbum;
	}if(type=="playlist"){
		idPl=$(this).attr("data-idPlaylist");
		operation="getCanzoniPlaylistPb?idPlaylistPb="+idPl;
	}
	
	window.location.href = operation;
		
});

$(".standardSpan").hover(function(){
	$(this).children("span:nth-child(2)").children().attr('src','img/play.png');
	if($(this).children("span:nth-child(3)").children().attr('src')=='img/darkAdd.png')
		$(this).children("span:nth-child(3)").children().attr('src','img/add.png');
	if($(this).children("span:nth-child(4)").children().attr('src')=='img/dark-empty-heart.png'){
		$(this).children("span:nth-child(4)").children().attr('src','img/empty-heart.png')
	}else if($(this).children("span:nth-child(4)").children().attr('src')=='img/dark-full-heart.png'){
		$(this).children("span:nth-child(4)").children().attr('src','img/full-heart.png')
	}
},function(){
	$(this).children("span:nth-child(2)").children().attr('src','img/darkPlay.png');
	if($(this).children("span:nth-child(3)").children().attr('src')=='img/add.png')
		$(this).children("span:nth-child(3)").children().attr('src','img/darkAdd.png');
	if($(this).children("span:nth-child(4)").children().attr('src')=='img/empty-heart.png'){
		$(this).children("span:nth-child(4)").children().attr('src','img/dark-empty-heart.png')
	}else if($(this).children("span:nth-child(4)").children().attr('src')=='img/full-heart.png'){
		$(this).children("span:nth-child(4)").children().attr('src','img/dark-full-heart.png')
	}
});


function call2Ajax(op,id2) {
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
