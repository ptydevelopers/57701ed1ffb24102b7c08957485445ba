$(function() {
		 //alert(getUrlVars()["id"]);
		 var id=getUrlVars()["id"];
		 getInfoUser(id);

		function getUrlVars() {
			var vars = {};
			var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
			vars[key] = value;
			});
		  return vars;
		}
        function getInfoUser(id) {	
		    $.ajax({
				url: "./bin/form_usuarioEdit.php",
				type: "GET",
				data: "id=" + id,
				cache: false,
                crossDomain: false,
				success: function(data) {
				 //alert(data.info[0].id_fk_rol);
				
						if (data.status == 1)
						{
							$('#txtUser').val(data.info[0].nombre_usuario);
							$('#txtPass').val(data.info[0].pwd);
							$('#ddlRoles').append(data.roles);
							$('#ddlStates').append(data.states);
							//$('select[name="ddlRoles"]').find('option[value="'+data.info[0].id_fk_rol+'"]').attr("selected",true);
							//$('select[name="ddlStates"]').find('option[value="'+data.info[0].id_fk_estado+'"]').attr("selected",true);
							//$('ddlRoles > option[value="'.data.info[0].id_fk_rol.'"]').attr('selected', 'selected');
						}		
				},
				error: function() {
					// Fail message
				},
			})
        }

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
            
            ////var firstName = name; // For Success/Failure Message
            // Check for white space in name for Success/Fail message
            ////if (firstName.indexOf(' ') >= 0) {
                ////firstName = name.split(' ').slice(0, -1).join(' ');
            ////}
            $.ajax({
                url: "./bin/form_usuarioEdit.php",
                type: "POST",
                data: {
				    id:id, 
                    user: user,
                    pass: pass,
					roles: roles,
                    states: states
                },
                cache: false,
				crossDomain: false,
                success: function(data) {
				   // Success message
				   //alert(id);
					if(data.status == 1)
					{
							$('#success').html("<div class='alert alert-success'>");
							$('#success > .alert-success').append("<strong>El Usuario fue Modificado correctamente</strong>");
							$('#success > .alert-success').append('</div>');

							//clear all fields
							$('#form_usuario').trigger("reset");
					}
					else
					{
						    $('#success').html("<div class='alert alert-danger'>");
							$('#success > .alert-danger').append("NO se Modifico el Usuario");
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


