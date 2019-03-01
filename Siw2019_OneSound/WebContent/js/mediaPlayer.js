var canzoni =[];

$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();
    setCorrente();
    var f=$(".standardSpan").size();
    for(i=0;i<f;i++){
    	canzoni.push(false) ; 
    }
});

$("#youTubeButton").hover(function(){
	$(this).css("color","red");
},function(){
	$(this).css("color","inherit");
});

$("#youTubeButton").on("click",function(){
	resize()
	if($(this).attr("data-linkYoutube")==""){
		$("#videoYoutube").css("display","none")
		$("#videoYoutubeLabel").css("display","block")
	}else{
		$("#videoYoutubeLabel").css("display","none")
		$("#videoYoutube").css("display","block")
	}
	$(this).css("color","red");
	$("audio").get(0).pause();
	
});

function resize(){
	width = parseInt($("#iframeContent").css("max-width"))-32
	
	$("#videoYoutube").css("width","100%")

	$("#videoYoutube").css("height",""+(parseInt(width)/16*9))
}

$(window).on('resize', function(){
	resize()
});


$('#youtube').on('hidden.bs.modal', function () {
	$('#videoYoutube').attr('src',$('#videoYoutube').attr('src'));
	$("#youTubeButton").css("color","inherit");
})

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
	$("#lyricsButton").attr("data-artista",$("#song"+count).attr("data-artista"))
	$("#lyricsButton").attr("data-titolo",$("#song"+count).attr("data-titolo"))
	$("#videoYoutube").attr("src",$("#song"+count).attr("data-linkYoutube"));
	$("#youTubeButton").attr("data-linkYoutube",$("#song"+count).attr("data-linkYoutube"));
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
	$("#lyricsButton").attr("data-artista",$(this).parents("li:first").attr("data-artista"))
	$("#lyricsButton").attr("data-titolo",$(this).parents("li:first").attr("data-titolo"))
	$("#videoYoutube").attr("src",$(this).parents("li:first").attr("data-linkYoutube"));
	$("#youTubeButton").attr("data-linkYoutube",$(this).parents("li:first").attr("data-linkYoutube"));
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
	$("#lyricsButton").attr("data-artista",$("#song"+count).attr("data-artista"))
	$("#lyricsButton").attr("data-titolo",$("#song"+count).attr("data-titolo"))
	$("#videoYoutube").attr("src",$("#song"+count).attr("data-linkYoutube"));
	$("#youTubeButton").attr("data-linkYoutube",$("#song"+count).attr("data-linkYoutube"));
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


$("#lyricsButton").on("hover",function(){
	$(this).css("color","white")
},function(){
	$(this).css("color","#808080")
});

$("#lyricsButton").on("click",function(){
	$('#lyrics').css("white-space","pre-wrap")
	//x = '\"Davide come sta?\" me lo hai mai chiesto?\r\nChiama un’ambulanza frate fai presto\r\nChe il sogno che avevo non è mai questo\r\nMi sa lo sai il resto (ye)\r\nChe ti scrivo pure oggi\r\nMi chiedo dove ti appoggi\r\nChe fai dopo esci con me?\r\nCosì giriamo come gli orologi\r\nUn po’ come quando non c’erano i soldi\r\nE vivere così non era un obbligo\r\n\r\nNon ci sono nodi nel mio pettine\r\nMa c’ho il nome su qualche proiettile\r\nNon ho la disciplina che ci metti te\r\nSe per me la mattina qua sono le ventitré (ye)\r\nFaccio la borsa, venti magliette, poi le cartine, le sigarette\r\nTanto qualcosa la scordo sempre\r\nNe ho una già girata da accendere\r\nTu ricordati e vienimi a prendere\r\n\r\nE vienimi a prendere\r\nIn mezzo alla polvere\r\nRicordi non c’erano soldi, c’eravamo io e te\r\nI sogni più grossi dentro\r\nNuvole tossiche\r\nIn fondo ci ho visto qualcosa\r\nPensavo che fossi te\r\nE vienimi a prendere\r\nIn mezzo alla polvere\r\nRicordi non c’erano soldi, c’eravamo io e te\r\nI sogni più grossi dentro\r\nNuvole tossiche\r\nIn fondo ci ho visto qualcosa\r\nPensavo che fossi te\r\nPensavo che fossi te\r\n\r\nNon sconfiggi la vita\r\nL’ho imparato col tempo\r\nSe la capisci può farti contento\r\nLa prendo per mano e balliamo un lento\r\nIn una stanza senza pavimento\r\nScusa è così che mi sento\r\nSono una specie di esperimento\r\nAspetto due ore e ritento\r\nMa tanto c’ha sempre il telefono spento\r\nLa legge di Murphy\r\nLa pelle coi graffi\r\nIn camera con le emozioni che mi prendono a schiaffi\r\n\r\nCi sta che non ne parlo\r\nPerché c’ho il cuore che è la pista di Montecarlo\r\nFumo questo missile che riuscirebbe a bucare il marmo\r\nÈ il mio segreto per stare calmo (baby)\r\nTorno a casa la notte\r\nMa so che non ho sonno\r\nIl letto mi inghiotte\r\nLo sa che non dormo\r\nFossi in un film sarebbe un film horror\r\nE quelli finiscono sempre con un morto\r\n\r\nE vienimi a prendere\r\nIn mezzo alla polvere\r\nRicordi non c’erano soldi, c’eravamo io e te\r\nI sogni più grossi dentro\r\nNuvole tossiche\r\nIn fondo ci ho visto qualcosa\r\nPensavo che fossi te\r\nE vienimi a prendere\r\nIn mezzo alla polvere\r\nRicordi non c’erano soldi, c’eravamo io e te\r\nI sogni più grossi dentro\r\nNuvole tossiche\r\nIn fondo ci ho visto qualcosa\r\nPensavo che fossi te\r\nPensavo che fossi te\r\n\r\n(E vienimi a prendere in mezzo alla polvere\r\nRicordi non c’erano soldi, c’eravamo io e te\r\nI sogni più grossi dentro\r\nNuvole tossiche\r\nIn fondo ci ho visto qualcosa\r\nPensavo che fossi te\r\nPensavo che fossi te)'
	//x.replace(/[!"#$%&'()*+,.\/:;<=>?@[\\\]^`{|}~]/g, "\\\\$&")
	//x=unicodeToChar(x)
	/*	x=x.replace(/’/gm, "\47").replace(/è/gm, "\350")

	$("#lyrics").text( latinConverter(x))*/
	artist=$("#lyricsButton").attr("data-artista")
	song=$("#lyricsButton").attr("data-titolo")
	
	//getRequest(artist,song)
	$("#lyrics").text("");
	$.ajax({
        type: 'post',
        url: "getLyrics",
        data: {titolo: song,artista:artist},
  		dataType: "text",		
		success: function (data){
			var json = JSON.parse(data);
			x = latinConverter(json.result)
			if(x == "" || x == undefined)
				$("#lyrics").text("Ci dispiace ma il testo non \350 disponibile.");
			else{
				$("#lyrics").text(x);
			}
		},
	       
               
       error: function(){
    	   window.location.href = "pageNotFound.jsp";
       }
       
        
    });
	
});

function latinConverter(x)
{
	return x.replace(/À/gm, "\300").replace(/Á/gm, "\301").replace(/Â/gm, "\302").replace(/Ã/gm, "\303").replace(/Ä/gm, "\304").replace(/Å/gm, "\305").replace(/Æ/gm, "\306").replace(/Ç/gm, "\307").replace(/È/gm, "\310").replace(/É/gm, "\311").replace(/Ê/gm, "\312").replace(/Ë/gm, "\313").replace(/Ì/gm, "\314").replace(/Í/gm, "\315").replace(/Î/gm, "\316").replace(/Ï/gm, "\317").replace(/Ð/gm, "\320").replace(/Ñ/gm, "\321").replace(/Ò/gm, "\322").replace(/Ó/gm, "\323").replace(/Ô/gm, "\324").replace(/Õ/gm, "\325").replace(/Ö/gm, "\326").replace(/×/gm, "\327").replace(/Ø/gm, "\330").replace(/Ù/gm, "\331").replace(/Ú/gm, "\332").replace(/Û/gm, "\333").replace(/Ü/gm, "\334").replace(/Ý/gm, "\335").replace(/Þ/gm, "\336").replace(/ß/gm, "\337").replace(/à/gm, "\340").replace(/á/gm, "\341").replace(/â/gm, "\342").replace(/ã/gm, "\343").replace(/ä/gm, "\344").replace(/å/gm, "\345").replace(/æ/gm, "\346").replace(/ç/gm, "\347").replace(/è/gm, "\350").replace(/é/gm, "\351").replace(/ê/gm, "\352").replace(/ë/gm, "\353").replace(/ì/gm, "\354").replace(/í/gm, "\355").replace(/î/gm, "\356").replace(/ï/gm, "\357").replace(/ð/gm, "\360").replace(/ñ/gm, "\361").replace(/ò/gm, "\362").replace(/ó/gm, "\363").replace(/ô/gm, "\364").replace(/õ/gm, "\365").replace(/ö/gm, "\366").replace(/÷/gm, "\367").replace(/ø/gm, "\370").replace(/ù/gm, "\371").replace(/ú/gm, "\372").replace(/û/gm, "\373").replace(/ü/gm, "\374").replace(/ý/gm, "\375").replace(/þ/gm, "\376").replace(/ÿ/gm, "\377")
 }
function getRequest(artist,song) {
    var url = 'https://orion.apiseeds.com/api/music/lyric/'+artist+'/'+song;
    //alert(searchTerm)
    var params = {
    	apikey : 'r9yJocIMg7okDzM3VVwqcN1ybhu4LkCJ5AIBmeONlxR1KziHlUxc9WdAmI5CEFrT',
        
    };

    $.getJSON(url, params, showResults);
}

//https://orion.apiseeds.com/api/music/lyric/Gemitaiz/Davide?apikey=r9yJocIMg7okDzM3VVwqcN1ybhu4LkCJ5AIBmeONlxR1KziHlUxc9WdAmI5CEFrT


function showResults(results) {
  var html = "";
  x = results.result.track.text
  
  $("#lyrics").text( latinConverter(x))
}
/*\"Davide come sta?\" me lo hai mai chiesto?\r\nChiama un’ambulanza frate fai presto\r\nChe il sogno che avevo non è mai questo\r\nMi sa lo sai il resto (ye)\r\nChe ti scrivo pure oggi\r\nMi chiedo dove ti appoggi\r\nChe fai dopo esci con me?\r\nCosì giriamo come gli orologi\r\nUn po’ come quando non c’erano i soldi\r\nE vivere così non era un obbligo\r\n\r\nNon ci sono nodi nel mio pettine\r\nMa c’ho il nome su qualche proiettile\r\nNon ho la disciplina che ci metti te\r\nSe per me la mattina qua sono le ventitré (ye)\r\nFaccio la borsa, venti magliette, poi le cartine, le sigarette\r\nTanto qualcosa la scordo sempre\r\nNe ho una già girata da accendere\r\nTu ricordati e vienimi a prendere\r\n\r\nE vienimi a prendere\r\nIn mezzo alla polvere\r\nRicordi non c’erano soldi, c’eravamo io e te\r\nI sogni più grossi dentro\r\nNuvole tossiche\r\nIn fondo ci ho visto qualcosa\r\nPensavo che fossi te\r\nE vienimi a prendere\r\nIn mezzo alla polvere\r\nRicordi non c’erano soldi, c’eravamo io e te\r\nI sogni più grossi dentro\r\nNuvole tossiche\r\nIn fondo ci ho visto qualcosa\r\nPensavo che fossi te\r\nPensavo che fossi te\r\n\r\nNon sconfiggi la vita\r\nL’ho imparato col tempo\r\nSe la capisci può farti contento\r\nLa prendo per mano e balliamo un lento\r\nIn una stanza senza pavimento\r\nScusa è così che mi sento\r\nSono una specie di esperimento\r\nAspetto due ore e ritento\r\nMa tanto c’ha sempre il telefono spento\r\nLa legge di Murphy\r\nLa pelle coi graffi\r\nIn camera con le emozioni che mi prendono a schiaffi\r\n\r\nCi sta che non ne parlo\r\nPerché c’ho il cuore che è la pista di Montecarlo\r\nFumo questo missile che riuscirebbe a bucare il marmo\r\nÈ il mio segreto per stare calmo (baby)\r\nTorno a casa la notte\r\nMa so che non ho sonno\r\nIl letto mi inghiotte\r\nLo sa che non dormo\r\nFossi in un film sarebbe un film horror\r\nE quelli finiscono sempre con un morto\r\n\r\nE vienimi a prendere\r\nIn mezzo alla polvere\r\nRicordi non c’erano soldi, c’eravamo io e te\r\nI sogni più grossi dentro\r\nNuvole tossiche\r\nIn fondo ci ho visto qualcosa\r\nPensavo che fossi te\r\nE vienimi a prendere\r\nIn mezzo alla polvere\r\nRicordi non c’erano soldi, c’eravamo io e te\r\nI sogni più grossi dentro\r\nNuvole tossiche\r\nIn fondo ci ho visto qualcosa\r\nPensavo che fossi te\r\nPensavo che fossi te\r\n\r\n(E vienimi a prendere in mezzo alla polvere\r\nRicordi non c’erano soldi, c’eravamo io e te\r\nI sogni più grossi dentro\r\nNuvole tossiche\r\nIn fondo ci ho visto qualcosa\r\nPensavo che fossi te\r\nPensavo che fossi te)*/
