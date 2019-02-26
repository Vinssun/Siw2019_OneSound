$("#playButton").on('click', function(){
	
	if($("#playButton").hasClass("fa-play")){
		$("#playButton").removeClass("fa-play");
		$("#playButton").addClass("fa-pause");
	}
	else{
		$("#playButton").removeClass("fa-pause");
		$("#playButton").addClass("fa-play");
	}
	
});



/*$(".leIcone").hover(function(){
	$(this).find("#laX2").show();
	$(this).find("#cuore7").hide();
},function(){
	$(this).find("#laX2").hide();
	$(this).find("#cuore7").show();

});*/

$(".riga").hover(function(){
	$(this).find(".ilMioPlay7").css("color", "white");
	$(this).find(".cuore28").css("color", "white");
	$(this).css("border-color", "gray");
	$(this).find(".ilMioPlay7").css("transform", "scale(1.5)");
},function(){
	$(this).find(".ilMioPlay7").css("color", "gray");
	$(this).find(".cuore28").css("color", "gray");
	$(this).css("border-color", "darkslategrey");
	$(this).find(".ilMioPlay7").css("transform", "scale(1)");
});



