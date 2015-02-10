$(function() {
	$.ajax({
		url: "./bin/header.php",
		type: "GET",
		cache: false,
		crossDomain: false,
		success: function(data) {
						 //alert(data.status);
					if (data.status == 0)
					{
					  window.location.href = "cerrarsesion.html";			
					}
					else
					{
						 $("#IncludeHeader").append(data.info);	
					}
		},
		error: function() {
				// Fail message
		},
	})
});
