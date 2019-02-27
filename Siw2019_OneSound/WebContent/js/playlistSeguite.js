/**
 * 
 */

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
$(".p").on("click",function(){
	
	var operation;
	
	idPl=$(this).attr("data-idPlaylist");
	operation="getCanzoniPlaylistPb?idPlaylistPb="+idPl;
	
	
	window.location.href = operation;
		
});

