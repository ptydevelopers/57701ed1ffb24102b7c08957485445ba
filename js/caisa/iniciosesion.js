$(function() {

$.ajax({
	url: "./bin/iniciosesion.php",
	type: "GET",
	cache: false,
	crossDomain: false,
	success: function(data) { //Si se ejecuta correctamente
		if(data.status == 1)
		{
			$('#ddlCompany').append(data.company);
		}
	},
	error: function(data){
	//En caso de error mostramos una ventan a de error.
	//$('#msjError').popup( "open" );
	}
})
	
$("input,select,textarea").jqBootstrapValidation({
        preventSubmit: true,
        submitError: function($form, event, errors) {
            // something to have when submit produces an error ?
            // Not decided if I need it yet
        },
        submitSuccess: function($form, event) {
            event.preventDefault(); // prevent default submit behaviour
            // get values from FORM
			var company = $("select#ddlCompany").val();
            var user = $("input#txtUser").val();
            var pass = $("input#txtPass").val();
			
            //alert(nombreusuario);
			 
            ////var firstName = name; // For Success/Failure Message
            // Check for white space in name for Success/Fail message
            ////if (firstName.indexOf(' ') >= 0) {
                ////firstName = name.split(' ').slice(0, -1).join(' ');
            ////}
            $.ajax({
                url: "./bin/iniciosesion.php",
                type: "POST",
                data: {
				    company:company,
                    user: user,
                    pass: pass
					
                },
                cache: false,
				crossDomain: false,
                success: function(data) {
				   // Success message
				   //alert(data.info[i].status);
					if(data.status == 0)
					{
						    $('#success').html("<div class='alert alert-danger'>");
							$('#success > .alert-danger').append("Las Credenciales no son validas");
							$('#success > .alert-danger').append('</div>');
							//clear all fields
							$('#login').trigger("reset");
					}
					else
					{
						  window.location.href = "form_inicio.html";
					}
                },
                error: function() {
                    // Fail message
                },
            })
        },
        filter: function() {
            return $(this).is(":visible");
        },
    });
});


