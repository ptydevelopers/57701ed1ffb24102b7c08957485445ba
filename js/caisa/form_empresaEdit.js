$(function() {
		 //alert(getUrlVars()["id"]);
		 var id=getUrlVars()["id"];
		 getInfoCompany(id);

		function getUrlVars() {
			var vars = {};
			var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
			vars[key] = value;
			});
		  return vars;
		}
        function getInfoCompany(id) {	
		    $.ajax({
				url: "./bin/form_empresaEdit.php",
				type: "GET",
				data: "id=" + id,
				cache: false,
                crossDomain: false,
				success: function(data) {
				 
				
						if (data.status == 1)
						{
							$('#txtNumcompany').val(data.info[0].id_empresa);
							$('#txtNamecompany').val(data.info[0].nombre_empresa);
							$('#txtLegalrepres').val(data.info[0].representante_legal);
							$('#txtAddress').val(data.info[0].direccion);
							$('#txtZip').val(data.info[0].apartado_postal);
							$('#txtPhone').val(data.info[0].telefono_1);
							$('#txtComment').val(data.info[0].comentario);
							$('select[name="ddlActivitycode"]').find('option[value="'+data.info[0].codigo_actividad+'"]').attr("selected",true);
							//$('#ddlActivitycode').val(data.info[0].codigo_actividad);

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
            var numcompany = $("input#txtNumcompany").val();
			var namecompany = $("input#txtNamecompany").val();
            var legalrepres = $("input#txtLegalrepres").val();
			var address = $("input#txtAddress").val();
            var zip = $("input#txtZip").val();
			var phone = $("input#txtPhone").val();
            var comment = $("input#txtComment").val();
			var activitycode = $("select#ddlActivitycode").val();
			
			
            //alert(datetermination);
            ////var firstName = name; // For Success/Failure Message
            // Check for white space in name for Success/Fail message
            ////if (firstName.indexOf(' ') >= 0) {
                ////firstName = name.split(' ').slice(0, -1).join(' ');
            ////}
            $.ajax({
                url: "./bin/form_empresaEdit.php",
                type: "POST",
                data: {
                    numcompany:numcompany,
					namecompany:namecompany,
                    legalrepres:legalrepres, 
					address:address,
                    zip:zip,
                    phone:phone,
				    comment:comment,
				    activitycode:activitycode
				},
                cache: false,
				crossDomain: false,
                success: function(data) {
				   // Success message
				   //alert(data.info[i].status);
					if(data.status == 1)
					{
							$('#success').html("<div class='alert alert-success'>");
							$('#success > .alert-success').append("<strong>El Empresa fue registrado correctamente</strong>");
							$('#success > .alert-success').append('</div>');

							//clear all fields
							$('#form_usuario').trigger("reset");
					}
					else
					{
						    $('#success').html("<div class='alert alert-danger'>");
							$('#success > .alert-danger').append("NO se registro la Empresa");
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


