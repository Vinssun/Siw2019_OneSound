/**

 * 
 */
var globalCount=0;
var saveButton = 0
var cont = 0;
var cont2 = 0; 
var cont3 = 0; 
var listaBraniChange = 0
var listaBraniAlbumChange = 0
var albumChange = 0
var albumVuoti=[]
var formData = new FormData();
var errore = 0

var width = $("#albumImage").css("width")
	$("#albumImage").css("height",""+width)

$(window).on('resize', function(){
	var width = $("#albumImage").css("width")
	$("#albumImage").css("height",""+width)
});

$("#albumList").on("change",function() {
	$("#listaBrani #titolo1").text('')
	var path = $(this).val()
	$("#albumImage").attr("src",path)
	$("#flickr").slideDown()
	$("#inputFlickrurl").val("")
//	formData.append("albumImage", $('#albumImageInput')[0].files[0])
//	
//	$('#albumImageInput')[0].files[0] =''
	
	
	if(path == "img/empty-album.png"){
		$("#nomeAlbum").val("")
		$("#titoloNuovoAlbum").slideDown()
		$("#listaBraniAlbum").hide()
	}else{
		formData.delete("albumImage")
		$("#nomeAlbum").val("")
		$("#titoloNuovoAlbum").slideUp()
		
		id = $("#albumList").find(":selected").attr("data-idAlbum")
		
		
		$("#listaBraniAlbum .lista").each(function(){
			$(this).remove()
		})
		cont3 = 0
		listaBraniAlbumChange = 0
		$.ajax({
	        type: 'get',
	        url: "getBraniAlbum",
	        data: {idAlbum: id},
	  		dataType: "text",		
			success: function (data){
				$("#contenitoreListe .spinner").hide();
				var b = JSON.parse(data);
				//alert(b)
				b.forEach(function(obj){
					$("<div data-id=\""+obj.id+" \"class=\"lista\">\r\n" + 
							"	        			<span class=\"nome\">" +
							"<input type=\"text\" class=\"form-control brano\" value=\""+obj.titolo+"\" name =\"nomeBrano\"></span>\r\n" + 
							"	        			<span class=\"genere\">\r\n" + 
							"	        				<select class=\"form-control\" class=\"listaCategorie\" >\r\n" + 
							"								<option disabled selected hidden >"+obj.genere+"</option>\r\n" + 
							"								<option class=\"genereOption\" >rock</option>\r\n" + 
							"								<option class=\"genereOption\" >pop</option>\r\n" + 
							"								<option class=\"genereOption\" >hip-hop</option>\r\n" + 
							"								<option class=\"genereOption\" >jazz</option>\r\n" + 
							"								<option class=\"genereOption\" >classica</option>\r\n" + 
							"								<option class=\"genereOption\" >dance</option>\r\n" + 
							"							</select>\r\n" + 
							"						</span>\r\n" + 
							"	        			<span class=\"link\"><input placeholder ='Opzionale' type=\"text\" class=\"form-control brano\" value=\""+obj.linkYoutube+"\" name =\"link\"></span>\r\n" +
							"						<span data-id=\""+obj.id+"\"class=\"delete\"><i class=\"fa fa-times-circle\" aria-hidden=\"true\"></i></span>\r\n" + 
							"	        		</div>").appendTo("#listaBraniAlbum");
					cont3++
				});
				if(cont3 == 0){
					$("#listaBraniAlbum #titolo1").text("Non sono presenti brani nell'album")
					$("#listaBraniAlbum .title").css("display",'none')
					albumVuoti.push(id)
				}else{
					$("#listaBraniAlbum #titolo1").text("Lista brani esistenti")
					
				}
				$("#listaBraniAlbum").show();
			},
	       
	        beforeSend: function(){  

				$("#contenitoreListe .spinner").show();
	        },
	        
	       error: function(){
	    	   errore = 1
	    	   window.location.href = "pageNotFound.jsp";
	       }
	       
	        
	    });
		
	}
	if(listaBraniChange == 0){
		deactiveSaveButton();
	}
});


$("#albumImage").hover(function(){
	if($("#albumList").val()!=null){
		$("#albumImageInput").prop('disabled', false);

		$("#modify").css("cursor","pointer")
		$("#modify").css("opacity","1")
		$("#albumImage").css("filter","brightness(50%)")
		$("#modify").css("filter","brightness(100%)")
	}else{
		$("#albumImageInput").prop('disabled', true);
		$("#modify").css("cursor","context-menu")
	}
},function(){
	
	$("#modify").css("opacity","0")
	$("#albumImage").css("filter","brightness(100%)")
});

$("#modify").hover(function(){
	if($("#albumList").val()!=null){
		
		$("#albumImageInput").prop('disabled', false);

		$("#modify").css("cursor","pointer")
		$("#modify").css("opacity","1")

		$("#albumImage").css("filter","brightness(50%)")
		$("#modify").css("filter","brightness(85%)")
	}else{
		$("#albumImageInput").prop('disabled', true);
		$("#modify").css("cursor","context-menu")
	}
},function(){
	$("#modify").css("opacity","0")
	
	$("#albumImage").css("filter","brightness(100%)")
	$("#modify").css("filter","brightness(100%)")
});

var dropFileForm = document.getElementById("dropFileForm");
var fileLabelText = document.getElementById("fileLabelText");
var uploadStatus = document.getElementById("uploadStatus");
var fileInput = document.getElementById("fileInput");
var droppedFiles;

function overrideDefault(event) {
  event.preventDefault();
  event.stopPropagation();
}

function fileHover() {
  dropFileForm.classList.add("fileHover");
 // $("#fileLabel").addClass("fileHover")
}

function fileHoverEnd() {
  dropFileForm.classList.remove("fileHover");
//  $("#fileLabel").removeClass("fileHover")
}

function addFiles(event) {
	/*var files = event.target.files
	var filename = files[0].name
	var extension = files[0].type
	*/
	if( cont2 == 0){
		$("#titolo1").text("Lista brani aggiunti")
		$("#firstLine").css("display","flex")
	}
	droppedFiles = event.target.files || event.dataTransfer.files;
	
	var filesLength = droppedFiles.length;
	var flag = 1
	for (var i = 0; i < filesLength; i++) {
		splitted = droppedFiles[i].type.split("/");
		if( splitted[0]!= "audio")
			flag = 0
			
	}
	if(flag == 1)
		showFiles(droppedFiles);
	else{
		$("#error").slideDown()
		window.setTimeout(function () {
			$("#error").slideUp()
	    }, 5000);
	}
}

$("#svuotaLabel").on("click",function(){
	cont = 0
	cont2 = 0
	$("#listaBrani #titolo1").text('')

//	$("#listaBrani #titolo1").text('Nessun brano \u00E8 stato aggiunto')
	$("#listaBrani #firstLine").css("display","none")
	$("#listaBrani .lista").each(function(){
		$(this).remove()
	});
	temp = formData.get("albumImage")
	temp2 = formData.get("flickr")
	formData = new FormData();
	if(temp!= null)
		formData.append("albumImage",temp)
	if(temp2!=null)
		formData.append("flickr",temp2)
	listaBraniChange = 0
	if($("#nomeAlbum").val()=="" && temp == null){
		deactiveSaveButton()
	}
	$("#fileInput").val('')
});

function showFiles(files) {
  /*if (files.length > 1) {
    fileLabelText.innerText = files.length + " files selected";
    var t = ""
    for (var i = 0; i < files.length; i++) {
    	 t+= files[i].name+"\n";
    }
    fileLabelText.innerText = t
  } else {
    fileLabelText.innerText = files[0].name;
  }*/
	
	for (var i = 0; i < files.length; i++) {
		reg = /(.*?)(?=\.[\w]+$)/;
		t = reg.exec(files[i].name);
		$("<div data-num=\""+cont+" \"class=\"lista\">\r\n" + 
			"	        			<span class=\"nome\">" +
			"<input type=\"text\" class=\"form-control brano\" value=\""+t[0]+"\" name =\"nomeBrano\"></span>\r\n" + 
			"	        			<span class=\"genere\">\r\n" + 
			"	        				<select class=\"form-control\" class=\"listaCategorie\" >\r\n" + 
			"								<option disabled selected hidden >Scegli il genere...</option>\r\n" + 
			"								<option class=\"genereOption\" >rock</option>\r\n" + 
			"								<option class=\"genereOption\" >pop</option>\r\n" + 
			"								<option class=\"genereOption\" >hip-hop</option>\r\n" + 
			"								<option class=\"genereOption\" >jazz</option>\r\n" + 
			"								<option class=\"genereOption\" >classica</option>\r\n" + 
			"								<option class=\"genereOption\" >dance</option>\r\n" + 
			"							</select>\r\n" + 
			"						</span>\r\n" + 
			"	        			<span class=\"link\"><input placeholder ='Opzionale'  type=\"text\" class=\"form-control brano\" name =\"link\"></span>\r\n" +
			"						<span data-file=\"file"+cont+"\"class=\"delete\"><i class=\"fa fa-times-circle\" aria-hidden=\"true\"></i></span>\r\n" + 
			"	        		</div>").appendTo("#listaBrani");
		formData.append("file-"+cont, files[i])
		//alert("file-"+cont+"  "+formData.get("file"+cont))
		cont++
		cont2++
		activeSaveButton()
		listaBraniChange = 1
	}
	if(files.length){
		id = $("#albumList").find(":selected").attr("data-idAlbum");
		albumVuoti = albumVuoti.filter(item => item !== id)
		for (var i = 0; i < albumVuoti.length; i++) {
			console(albumVuoti[i]+" ")
		}
	}
	//$("#fileInput").val('')
	
}


$(document).on('click','.fa-times-circle',function(){
	
	
	
	////alert(cont2)
	
	id = $(this).parent().attr("data-id")
	if(id!=null){

		
		$.ajax({
	        type: 'get',
	        url: "rimuoviBrano",
	        data: {idBrano: id},
	  		dataType: "text",		
			success: function (data){
				//alert("brano rimosso")
				if( cont3 == 0){
					 $("#listaBraniAlbum").hide();
				}
			},
	       
	        beforeSend: function(){  

	        },
			
	       error: function(){
	    	   errore = 1
	    	   window.location.href = "pageNotFound.jsp";
	       }
	       
	        
	    });
		cont3--;
		if(cont3 == 0)
			listaBraniChange = 0
		$(this).parent().parent().hide();
		
	}else{
		cont2--;
		name = $(this).parent().attr("data-file")
		formData.delete(name)
		$(this).parent().parent().remove();
		if( cont2 == 0){

			$("#listaBrani #titolo1").text('')
			$("#svuotaLabel").trigger("click");
		}
		
	}
	if(cont3 == 0){
		$('#myModal3').modal("show")
		id = $("#albumList").find(":selected").attr("data-idAlbum");
		albumVuoti.push(id)
	}
	if(cont2==0 && cont3==0){
		$("#listaBrani #titolo1").text("L'album \u00E8 vuoto")
	}else if(cont2==0){
		$("#listaBrani #titolo1").text('Nessun brano \u00E8 stato aggiunto')
	}
});
/*
function uploadFiles(event) {
  event.preventDefault();
  changeStatus("Uploading...");

  var formData = new FormData();

  for (var i = 0, file; (file = droppedFiles[i]); i++) {
    formData.append(fileInput.name, file, file.name);
  }

  var xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function(data) {
    //handle server response and change status of
    //upload process via changeStatus(text)
    console.log(xhr.response);
  };
  xhr.open(dropFileForm.method, dropFileForm.action, true);
  xhr.send(formData);
}
*/
function changeStatus(text) {
  uploadStatus.innerText = text;
}


$("#albumImageInput").on("change", function(e) {
	var files = e.target.files,
	filesLength = files.length;
	for (var i = 0; i < filesLength; i++) {
		var f = files[i]
		var fileReader = new FileReader();
		
		fileReader.onload = (function(e) {

			var file = e.target;
			$("#albumImage").attr("src",e.target.result)
			
		});
		fileReader.readAsDataURL(f);
		formData.append("albumImage", files[i])
		activeSaveButton()
	}
	$(this).val('')
});


$("input").bind("change paste keyup",function(){
	if($("#nomeAlbum").val()=="" && formData.get("albumImage") == null && listaBraniAlbumChange == 0 && listaBraniChange == 0){
		deactiveSaveButton()
	}else{
		activeSaveButton()
	}
	
});

$(document).on("change paste keyup",'input,select',function(){
	$(this).css("background","#fff")
})

$(document).on("change paste keyup",'#listaBraniAlbum input,#listaBraniAlbum select',function(){
	listaBraniAlbumChange = 1
	activeSaveButton()
})



function activeSaveButton(){
	$("#salva").css("background-color", "#42cc8c")
	$("#salva").css("color", "#FFFFFF")
	$("#salva").css("border-color", "#FFFFFF")
	$("#salva").css("cursor","pointer")
	saveButton= 1
}
function deactiveSaveButton(){
	$("#salva").css("background-color", "#FFFFFF")
	$("#salva").css("color", "#000000")
	$("#salva").css("border", "0.1em solid #000000")
	$("#salva").css("cursor","context-menu")
	saveButton = 0
}
function salva(){
	if(saveButton == 1){
		validation = 1
		$("#valid").html(" <strong>ATTENZIONE!</strong> Completa i campi per proseguire!!")
		if($("#albumList").find(":selected").val() == "info"){
			validation = 0
			$("#albumList").css("background","#fd535359")
		}
		
		$(".lista").each(function(){
			if($(this).find("select").find(":selected").text() == "Scegli il genere..."){
				validation = 0
				$(this).find("select").css("background","#fd535359")
			}
			
			if($(this).find("input[name=nomeBrano]").val() == ""){
				validation = 0
				$(this).find("input[name=nomeBrano]").css("background","#fd535359")
			}
				
		});
		if($("#titoloNuovoAlbum").is(":visible") && $("#nomeAlbum").val()==""){
			validation = 0
			$("#nomeAlbum").css("background","#fd535359")
		}
		if(cont3 == 0 && cont2 == 0){
			validation = 0
			$("#valid").html("<strong>ATTENZIONE!</strong>Non sono presenti brani")
		}
		if(validation == 1){
			if(listaBraniAlbumChange == 1){
				var brani = [];
				var idAlbum = $("#albumList").find(":selected").attr("data-idAlbum");
				$("#listaBraniAlbum .lista").each(function(){
					var obj = new Object();
					obj.id = $(this).attr("data-id")
					obj.titolo = $(this).find("input[name=nomeBrano]").val()
				   	obj.genere  = $(this).find("select").find(":selected").text();
				   	obj.link = $(this).find("input[name=link]").val();
					obj.idAlbum = idAlbum
//					//alert(nome+" "+genere+" "+link)
					
					
					brani.push(obj);
				});
				
				 var jsonString= JSON.stringify(brani);
				 
				 $.ajax({
				        type: 'get',
				        url: 'aggiornaAlbum',
				        data: {list: jsonString},
				  		dataType: "text",		
						success: function (data){

							$("#contenitoreListe .spinner").hide();
							//alert("aggioranto")
							$("#complete").html("<strong>AGGIORNATO!</strong> L'album è stato aggioranto.")
							$("#complete").slideDown()
							window.setTimeout(function () {
								$("#complete").slideUp()
						    }, 5000);
						},
				       
				        beforeSend: function(){  

							$("#contenitoreListe .spinner").show();
				        },
				        
				       error: function(){
				    	   errore = 1
				    	   window.location.href = "pageNotFound.jsp";
				       }
				        
				    });
			}
			
			if(listaBraniChange == 1 ||$("#nomeAlbum").val()!="" || formData.get("albumImage") != null|| $("#inputFlickrurl").val() != ""){
				
				if($("#nomeAlbum").val()!=""){
					formData.append("titoloAlbum", $("#nomeAlbum").val())
				}else{
					formData.append("titoloAlbum", $("#albumList").find("select").find(":selected").text())
					formData.append("idAlbum",$("#albumList").find(":selected").attr("data-idAlbum"));
				}
				
				$("#listaBrani .lista").each(function(){
					num = $(this).attr("data-num")
					nome = $(this).find("input[name=nomeBrano]").val()
					genere = $(this).find("select").find(":selected").text();
					link = $(this).find("input[name=link]").val()
					//alert(nome+" "+genere+" "+link)
					
					formData.append("titolo-"+num, nome)
					formData.append("genere-"+num, genere)
					formData.append("link-"+num, link)
				
				});
				
				formData.append("flickr",$("#inputFlickrurl").val())
				
				$.ajax({
				    url: 'aggiornaAlbum',
				    data: formData,
				    type: "POST", //ADDED THIS LINE
				    // THIS MUST BE DONE FOR FILE UPLOADING
				    contentType: false,
				    processData: false,
				    // ... Other options like success and etc
				          		
					success: function (data){

						$("#contenitoreListe .spinner").hide();
						////alert("successo")
						$("#complete").html("<strong>COMPLETATO!</strong> Le modfiche sono state salvate.")
						$("#complete").slideDown()
						window.setTimeout(function () {
							$("#complete").slideUp()
					    }, 5000);
						formData = new FormData();
						//$("#listaBrani #titolo1").text('Nessun brano \u00E8 stato aggiunto')
						$("#listaBrani #titolo1").text('')
						$("#listaBrani #firstLine").css("display","none")
						$("#listaBrani .lista").each(function(){
							$(this).remove()
						});
						//$('option[value="img/empty-album.png"]').prop("selected", true);
						var b = JSON.parse(data);
						var idA;
						if($("#albumList").find(":selected").val() == "img/empty-album.png"){
							idA= b[0].id;
							$('<option class="albumOption" value="'+b[0].link+'" data-idAlbum="'+b[0].id +'" >'+b[0].titolo+'</option>').appendTo("#albumList")
						}else{
							idA = $("#albumList").find(":selected").attr("data-idAlbum")
						}
						$('option[data-idAlbum="'+idA+'"').prop("selected", true);
						$("#albumList").find(":selected").val(b[0].link)
						$("#albumList").trigger("change");
						
						albumVuoti = albumVuoti.filter(item => item !== idA)
						//alert("ciaoooo"+ data)
						//alert("weee "+ b)
						//alert($("#albumList").find(":selected").val())
						
					},
			       
			        beforeSend: function(){  

						$("#contenitoreListe .spinner").show();
			        },
					
			       error: function(){
			    	   errore = 1
			    	   window.location.href = "pageNotFound.jsp";
			       }
			       
			        
			    });
				
			}
			
			saveButton = 0
			cont2 = 0; 
			listaBraniChange = 0
			listaBraniAlbumChange = 0
			albumChange = 0
			formData = new FormData();
			deactiveSaveButton()
			$("#fileInput").val('')
		}else{
			$("#valid").slideDown()
			window.setTimeout(function () {
				$("#valid").slideUp()
		    }, 5000);
		}
	}
}


$("#svuotaEsistenti").on("click",function(){
	if($("#albumList").find(":selected").attr("value") != "info")
		$('#myModal').modal("show")
});
$("#rimuoviAlbum").on("click",function(){

	if($("#albumList").find(":selected").val() != "img/empty-album.png")
		$('#myModal2').modal("show")
	else
	$("#listaBrani #titolo1").text('Non puoi eliminare un album prima di crearlo')
});

$("#capitoButton").on("click",function(){
	$('#myModal3').modal("hide")
});

$("#svuotaAlbum").on("click",function(){
	id = $("#albumList").find(":selected").attr("data-idAlbum");
	
	$.ajax({
        type: 'get',
        url: 'svuotaAlbum',
        data: {idAlbum: id},
  		dataType: "text",		
		success: function (data){

			$("#contenitoreListe .spinner").hide();
			//alert("svuotato")
			$("#listaBraniAlbum .lista").each(function(){
				$(this).remove()
			})
			cont3 = 0
			$("#listaBraniAlbum #titolo1").text("Non sono presenti brani nell'album")
			listaBraniAlbumChange = 0
			$('#myModal').modal("hide")
		},
       
        beforeSend: function(){  

			$("#contenitoreListe .spinner").show();
        },
        
       error: function(){
    	   errore = 1
    	   window.location.href = "pageNotFound.jsp";
       }
       
    });
});
$("#eliminaAlbum").on("click",function(){

	
	
	id = $("#albumList").find(":selected").attr("data-idAlbum");
	$.ajax({
        type: 'get',
        url: 'rimuoviAlbum',
        data: {idAlbum: id},
  		dataType: "text",		
		success: function (data){

			$("#contenitoreListe .spinner").hide();
			//alert("rimosso")
			$('#myModal2').modal("hide")
			$('option[value="img/empty-album.png"]').prop("selected", true);
			$('option[data-idAlbum="'+id+'"]').remove();
			$("#albumList").trigger("change");
			
		},
       
        beforeSend: function(){  
        	

			$("#contenitoreListe .spinner").show();
        },
        
		
		
       error: function(){
    	   errore = 1
    	   window.location.href = "pageNotFound.jsp";
       }
       
        
    });
});
$(window).on('beforeunload', function(){
	rimuoviAlbumVuoti()
});

$(window).bind('unload', function(){
	rimuoviAlbumVuoti()
});
$(window).bind('reload', function(){
	rimuoviAlbumVuoti()
});

function rimuoviAlbumVuoti(){
	album= []
	for (var i = 0; i < albumVuoti.length; i++) {
		var obj = new Object();
		obj.id = albumVuoti[i]
		album.push(obj)
	}
	 var jsonString= JSON.stringify(album);
	 
	 $.ajax({
	        type: 'get',
	        url: 'rimuoviAlbumVuoti',
	        data: {list: jsonString},
	  		dataType: "text",		
			success: function (data){
				$("#contenitoreListe .spinner").hide();
			},
	       
	        beforeSend: function(){  
				$("#contenitoreListe .spinner").show();
	        },
	        
	       error: function(){
	    	   errore = 1
	    	   window.location.href = "pageNotFound.jsp";
	       }
	        
	    });
}
function cercaSuFlickr() {
	
	var parola=$("#inputFlickr").val();
	//alert(parola);
	
	var partePrima = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=71542c171848da257b3caa214f7ed00f&text=";
	var parteSeconda = "&format=json&nojsoncallback=1";
	
	var chiamata = partePrima + parola + parteSeconda;
	
	
		$.ajax({
	        type: 'GET',
	        url: chiamata,
	  		dataType: "text",		
			success: function (data){
				var json = JSON.parse(data);

				//alert(json.photos.photo[5].id);
				var count = Object.keys(json.photos.photo).length;
				globalCount=(globalCount+1)%count;
				var foto = "https://farm" + json.photos.photo[globalCount].farm + ".staticflickr.com/" + json.photos.photo[globalCount].server + "/" + json.photos.photo[globalCount].id + "_" + json.photos.photo[globalCount].secret + ".jpg";
				$("#inputFlickrurl").val(foto)
				$("#albumImageInput").val("")
				$("#albumImage").attr("src",foto);
				activeSaveButton()
				
			},
	        beforeSend: function(){  
	        	
	        	
	        },
	        
			
			
	       error: function(){
	    	   window.location.href = "pageNotFound.jsp";
	       }
	       
	        
	    });
	}