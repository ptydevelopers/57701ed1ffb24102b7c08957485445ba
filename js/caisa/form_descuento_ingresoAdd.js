$(function() {
		$.ajax({
			url: "./bin/form_descuento_ingresoAdd.php",
			type: "GET",
			cache: false,
			crossDomain: false,
			success: function(data) { //Si se ejecuta correctamente
				if(data.status == 1)
				{
					  $('#ddlRoles').append(data.roles);
					  $('#ddlStates').append(data.states);
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
            var user = $("input#txtUser").val();
            var pass = $("input#txtPass").val();
			var roles = $("select#ddlRoles").val();
			var states = $("select#ddlStates").val();
			
			
            //alert(datetermination);
            ////var firstName = name; // For Success/Failure Message
            // Check for white space in name for Success/Fail message
            ////if (firstName.indexOf(' ') >= 0) {
                ////firstName = name.split(' ').slice(0, -1).join(' ');
            ////}
            $.ajax({
                url: "./bin/form_descuento_ingresoAdd.php",
                type: "POST",
                data: {
                    user: user,
                    pass: pass,
					roles: roles,
                    states: states
                },
                cache: false,
				crossDomain: false,
                success: function(data) {
				   // Success message
				   //alert(data.info[i].status);
					if(data.status == 1)
					{
							$('#success').html("<div class='alert alert-success'>");
							$('#success > .alert-success').append("<strong>El Descuento/Ingreso fue registrado correctamente</strong>");
							$('#success > .alert-success').append('</div>');

							//clear all fields
							$('#form_usuario').trigger("reset");
					}
					else
					{
						    $('#success').html("<div class='alert alert-danger'>");
							$('#success > .alert-danger').append("NO se registro el Descuento/Ingreso");
							$('#success > .alert-danger').append('</div>');
							//clear all fields
							//$('#form_usuario').trigger("reset");
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