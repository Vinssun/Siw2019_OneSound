$(".play").each(function(){
	$(this).animate({ width: "40%"}, 100);
	$(this).hide();
});
$(".playlistImage").each(function(){
	$(this).css("width","300")
	var width = $(this).css("width")
	$(this).css("height",""+width)
})
$(window).on('resize', function(){
	$(".playlistImage").each(function(){
		var width = $(this).css("width")
		$(this).css("height",""+width)
	});

});
$(".p").hover(function(){
	$(this).find(".playlistImage").css("filter","brightness(70%)")
	$(this).css("cursor","context-menu")
	$(this).css("filter","brightness(100%)")
},
function(){
	$(this).find(".playlistImage").css("filter","brightness(100%)")

})

$(".play").hover(function(){
	$(this).css("filter","brightness(90%)")
	$(this).css("cursor","pointer")
},
function(){
	$(this).css("filter","brightness(100%)")
	$(this).css("cursor","context-menu")

})


$(".single-album").hover(function(){

	$(this).find(".play").show();
	
	$(this).find(".play").animate({ width: "43%"}, 100);
	$(this).find(".ilGenere").show();
},function(){
	$(this).find(".play").hide();

	$(this).find(".play").animate({ width: "40%"}, 100);
	$(this).find(".ilGenere").hide();
	
});


$("#bottoneAlbum").on("click",function(){
	window.location.href='getMieiAlbum?gestione=true';	
});


$(".play").on("click",function(){
	
	
	var idA=$(this).attr("data-id");
	
	operation="getCanzoniAlbum?idAlbum="+idA;
	
	window.location.href = operation;
	
});