$(function() {
   
	$.ajax({
		url: "./bin/menu.php",
		type: "GET",
		cache: false,
        crossDomain: false,
		success: function(data) {
					 //alert(data.status);
				if (data.status == 1)
				{
					$("#IncludeMenu").append(data.info);		
				}
					jQuery(document).ready(function(a) {
						a("ul.main-menu li a").each(function() {
							if (a(a(this))[0].href == String(window.location)) {
								a(this).parent().addClass("active")
							}
						});
						a("ul.main-menu li ul li a").each(function() {
							if (a(a(this))[0].href == String(window.location)) {
								a(this).parent().addClass("active");
								a(this).parent().parent().show()
							}
						});
						a(".dropmenu").click(function(b) {
							b.preventDefault();
							a(this).parent().find("ul").slideToggle()
						})
					});
						
		},
		error: function() {
			// Fail message
		},
	})
});
