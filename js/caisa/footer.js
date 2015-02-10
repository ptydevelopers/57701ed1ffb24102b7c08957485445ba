$(function() {
   
	$.ajax({
		url: "./bin/footer.php",
		type: "GET",
		cache: false,
        crossDomain: false,
		success: function(data) {
					 //alert(data.status);
				if (data.status == 1)
				{
					$("#IncludeFooter").append(data.info);		
				}
		},
		error: function() {
			// Fail message
		},
	})
});
