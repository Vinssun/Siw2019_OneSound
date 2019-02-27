var canzoni =[];

$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();
    setCorrente();
    var f=$(".standardSpan").size();
    //alert(f)
    for(i=0;i<f;i++){
    	canzoni.push(false) ; 
    }
});

$(".myAudio").bind('ended', function(){
	var f=$(".standardSpan").size();
	if($("#loopButton").attr("data-premuto")=="true"){
		ok=false;
		for(i=0;i<f;i++){
	    	if(canzoni[i]==false){
	    		ok=true;
	    		
	    	}
		}
		if(ok==false){
			azzera();
		}
		next2();
	}else{
		
		if($("#randomButton").attr("data-premuto")=="false"){
			var count;
			var idCorrente=$("audio").attr("data-songCorrente");
			$(".standardSpan").each(function(){
				var id=$(this).attr("data-idSong");
				if(id==idCorrente){
					count=parseInt($(this).attr("data-count"));
					
				}
			});
			
			if(count!=f-1)
				next2();
		}else{
			var ok=false;
			for(i=0;i<f;i++){
		    	if(canzoni[i]==false){
		    		ok=true;
		    	}
			}
			if(ok==true){
				next2();
			}else{
				azzera();
			}
		}
		
	}
	
});

function azzera(){
	var f=$(".standardSpan").size();
		for(i=0;i<f;i++){
			canzoni=true;
		}
}

function next2(){
var f=$(".standardSpan").size();
	
	var idCorrente=$("audio").attr("data-songCorrente");
	var number=idCorrente;
	var count=0;
	
	if($("#randomButton").attr("data-premuto")=="true"){
		while((number==idCorrente && f!=1) || canzoni[count]==true){
			 count=Math.floor((Math.random() * f));
			 number=$("#song"+count).attr("data-idSong");
		}
	}else{
		$(".standardSpan").each(function(){
			var id=$(this).attr("data-idSong");
			if(id==idCorrente){
				count=parseInt($(this).attr("data-count"));
				if(count==f-1){	
					count=0;
				}else{
					count+=1;
				}
			}
		});
		
		
	}
	
	$("audio").attr("src",$("#song"+count).attr("data-link"));
	$("audio").attr("data-songCorrente",$("#song"+count).attr("data-idSong"));
	$("#titoloMediaPlayer").text($("#song"+count).attr("data-titolo"));
	setCorrente();
	$("audio").get(0).play();
	canzoni[count]=true;
	
}

$(".heartB").on("click",function(){
	if($(this).attr('src') == "img/empty-heart.png"){
		id2=$(this).attr("data-id");
		callAjax("addPreferito",id2);
		$(this).attr('src','img/full-heart.png');
	
	}else{
		id2=$(this).attr("data-id");
		callAjax("removePreferito",id2);
		$(this).attr('src','img/empty-heart.png');
	}
});
    
$(".play,.playB").on("click",function(){
	$(".standardSpan").css("background","black");
	$(this).parents("li:first").css("background","#1d1d1d");
	
	
	$("audio").attr("src",$(this).parents("li:first").attr("data-link"));
	$("audio").attr("data-songCorrente",$(this).parents("li:first").attr("data-idSong"));
	
	$("#titoloMediaPlayer").text($(this).parents("li:first").attr("data-titolo"));
	$("audio").get(0).play();	
	var i=$(this).parents("li:first").attr("data-songsCount");
	canzoni[i]=true;
});


$("#backButton").on("click",function(){
	var f=$(".standardSpan").size();
	
	var idCorrente=$("audio").attr("data-songCorrente");
	
	var count=0;
	$(".standardSpan").each(function(){
		var id=$(this).attr("data-idSong");
		if(id==idCorrente){
			count=parseInt($(this).attr("data-count"));
			if(count==0){	
				count=f-1;
			}else{
				count-=1;
			}
		}
	});
	
	
	$("audio").attr("src",$("#song"+count).attr("data-link"));
	$("audio").attr("data-songCorrente",$("#song"+count).attr("data-idSong"));
	
	$("#titoloMediaPlayer").text($("#song"+count).attr("data-titolo"));
	setCorrente();
	$("audio").get(0).play();
	canzoni[count]=true;
});


$("#nextButton").on("click",function(){
	var f=$(".standardSpan").size();
	var ok=false;
	for(i=0;i<f;i++){
    	if(canzoni[i]==false){
    		ok=true;
    	}
	}
	if(ok==false)
		azzera();
	next2();
});




function setCorrente(){
	var idCorrente=$("audio").attr("data-songCorrente");
		$(".standardSpan").each(function(){
		var id=$(this).attr("data-idSong");
		if(id==idCorrente){
			$(".standardSpan").css("background","black");
			$(this).css("background","#1d1d1d");
			count=parseInt($(this).attr("data-count"))
			canzoni[count]=true;
		}
	});
	 
}

$("#randomButton").on("click",function(){
	
	if($(this).attr("data-premuto")=="false"){
		$(this).attr("data-premuto","true");
		$(this).css("color","green");
	}else{
		$(this).attr("data-premuto","false");
		$(this).css("color","gray");
	}
	
});

$("#loopButton").on("click",function(){
	
	if($(this).attr("data-premuto")=="false"){
		$(this).attr("data-premuto","true");
		$(this).css("color","green");
	}else{
		$(this).attr("data-premuto","false");
		$(this).css("color","gray");
	}
	
});

function callAjax(op,id2) {
	$.ajax({
        type: 'Post',
        url: op,
        data: {id: id2},
  		dataType: "text",		
		
       error: function(){
    	   window.location.href = "pageNotFound.jsp";
       }
       
        
    });
}
