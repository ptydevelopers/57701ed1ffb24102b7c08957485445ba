$(function() {
   
	$.ajax({
		url: "./bin/cerrarsesion.php",
		type: "GET",
		cache: false,
        crossDomain: false,
		success: function(data) {
					 //alert(data.status);
				if (data.status == 1)
				{
					 window.location.href = "index.php";	
				}
		},
		error: function() {
			// Fail message
		},
	})
});
