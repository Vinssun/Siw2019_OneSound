/**
 * 
 */
$(".p").on("click",function(){
	
	var operation;
	
	idPl=$(this).attr("data-idPlaylist");
	operation="getCanzoniPlaylistPb?idPlaylistPb="+idPl;
	
	
	window.location.href = operation;
		
});