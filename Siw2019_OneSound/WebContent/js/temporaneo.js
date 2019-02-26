$('#seguiAlbum').click(function(e){     
	e.preventDefault();
	
	id2=$(this).attr("id");
	callAjax("seguiAlbum",id2);
	
});

$('#seguiPlaylist').click(function(e){     
	e.preventDefault();
	
	id2=$(this).attr("id");
	callAjax("seguiPlaylist",id2);
	
});

$('#seguiUtente').click(function(e){     
	e.preventDefault();
	
	id2=$(this).attr("email");
	callAjax("seguiUtente",id2);
	
});

$('#unfollowAlbum').click(function(e){     
	e.preventDefault();
	
	id2=$(this).attr("id");
	callAjax("unfollowAlbum",id2);
	
});

$('#unfollowPlaylist').click(function(e){     
	e.preventDefault();
	
	id2=$(this).attr("id");
	callAjax("unfollowPlaylist",id2);
	
});

$('#unfollowUtente').click(function(e){     
	e.preventDefault();
	
	id2=$(this).attr("email");
	callAjax("unfollowUtente",id2);
	
});



function callAjax(op,id2) {
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
