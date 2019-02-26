$(document).ready(function(){
	
	if($("#moreSongButton").length){
		
		for(var i = 5;i<$(".songElement").size();i++)
			$("#song"+i).hide();
		
	}
	if($("#moreAlbumButton").length){
		
		for(var i = 5;i<$(".albumElement").size();i++)
			$("#album"+i).hide();
		
	}
	
	if($("#morePlaylistButton").length){
		
		for(var i = 5;i<$(".playlistElement").size();i++)
			$("#playlist"+i).hide();
		
	}
	
	$("#noSongGenre").hide();
	
});

$("#moreSongButton,#filterButton").on("click",function(){
	var cont = 0
	var contElement = 0
	var filter = "all"
	if($(this).attr("id")=="filterButton"){
		$(".songElement").each(function(){
			if($("#filterComboBox").find('option:selected').text()=="Tutti i generi"){
				if(contElement<5){
					$(this).show();
					contElement++
				}else{
					$(this).hide();
				}
				cont++
			}else{
				if($(this).children("span:nth-child(8)").text()!=$("#filterComboBox").find('option:selected').val()){
					$(this).hide();
					filter = $("#filterComboBox").find('option:selected').val()
				}else{
					if(contElement<5){
						$(this).show();
						contElement++
					}else{
						$(this).hide();
					}
					cont++
				}
			}
			if(cont>5){
				$("#moreSongButton").show()
				$("#moreSongButton").text("Mostra altri")
				$("#noSongGenre").hide();
			}else if(cont==0){
				$("#moreSongButton").hide()
				$("#noSongGenre").show();
				
			}else{
				$("#moreSongButton").hide()
				$("#noSongGenre").hide();
			}
		});
	}else{
	if($(this).text()=="Mostra altri"){
		var i = 0
		$(this).text("Nascondi")
			$(".songElement").each(function(){
			if($("#filterComboBox").find('option:selected').text()=="Tutti i generi"){
				if(i>5){	
					$(this).slideDown();
				}
				i++
			}else{
				
				if($(this).children("span:nth-child(8)").text()==$("#filterComboBox").find('option:selected').val()){
					if(i>5){
						$(this).slideDown();
					}
				}
				i++
			}
		});
		
	}else{
		var i = 0
		$(this).text("Mostra altri")
		$(".songElement").each(function(){
		if($("#filterComboBox").find('option:selected').text()=="Tutti i generi"){
			if(i>5){	
				$(this).slideUp();
			}
			i++
		}else{
			if($(this).children("span:nth-child(7)").text()==$("#filterComboBox").find('option:selected').val()){
				i++
				if(i>5)
					$(this).slideUp();
			}
			
		}
	});
		
	}
	}
});

$("#moreAlbumButton").on("click",function(){
	if($(this).text()=="Mostra altri"){
		$(this).text("Nascondi")
		for(var i = 5;i<$(".albumElement").size();i++)
			$("#album"+i).slideDown();
	}else{
		$(this).text("Mostra altri")
		for(var i = 5;i<$(".albumElement").size();i++)
			$("#album"+i).slideUp();
	}
});

$("#morePlaylistButton").on("click",function(){
	if($(this).text()=="Mostra altri"){
		$(this).text("Nascondi")
		for(var i = 5;i<$(".playlistElement").size();i++)
			$("#playlist"+i).slideDown();
	}else{
		$(this).text("Mostra altri")
		for(var i = 5;i<$(".playlistElement").size();i++)
			$("#playlist"+i).slideUp();
	}
});
