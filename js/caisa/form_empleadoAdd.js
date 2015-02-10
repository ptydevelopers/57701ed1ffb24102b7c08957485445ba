$(function() {
		$.ajax({
			url: "./bin/form_empleadoAdd.php",
			type: "GET",
			//data: "sw=" + 1,
			cache: false,
			crossDomain: false,
			success: function(data) { //Si se ejecuta correctamente
			  
				if(data.status == 1)
				{
					$('#ddlGender').append(data.gender);
					$('#ddlStatesCivil').append(data.statescivil); 
					$('#ddlStatesEmployee').append(data.statesemployee);
					$('#ddlNationality').append(data.nationality);
					$('#ddlPosition').append(data.position);
					
					$('#ddlSeccionDepart').empty();
					$('#ddlSeccionDepart').append(data.sectionsdepart);
					$('#ddlSeccionDepart').trigger('liszt:updated');
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
			//var datastring = $("#form_empleado").serialize();
            var employeenum = $("input#txtEmployeeNum").val();
            var identitycardnum = $("input#txtIdentityCardNum").val();
			var socisecunum = $("input#txtSociSecuNum").val();
			var lastnames = $("input#txtLastNames").val();
            var names = $("input#txtNames").val();
			var gender = $("select#ddlGender").val();
			var nationality = $("select#ddlNationality").val();
			var statescivil = $("select#ddlStatesCivil").val();
			var datebirth = $("input#txtDateBirth").val();
            var typeblood = $("input#txtTypeBlood").val();
			var statesemployee = $("select#ddlStatesEmployee").val();
			var secciondepart = $("select#ddlSeccionDepart").val();
			var position = $("select#ddlPosition").val();
			var basehours = $("input#txtBaseHours").val();
			var rathours = $("input#txtRatHours").val();
			var salary = $("input#txtSalary").val();
			var datecontract = $("input#txtDateContract").val();
			var datecarnet = $("input#txtDateCarnet").val();
			var payment = $("select#ddlPayment").val();
			var syndicate = $("select#ddlSyndicate").val();
			var keyrent = $("input#txtKeyRent").val();
			var paymentm = $("input#txtPaymentM").val();
			var paymentf = $("input#txtPaymentF").val();
			var dateadmission = $("input#txtDateAdmission").val();
			var dateholidays = $("input#txtDateHolidays").val();
			var datetermination = $("input#txtDateTermination").val();
			var isr = $("select#ddlISR").val();

            /*alert(employeenum +''+identitycardnum+''+socisecunum+''+lastnames+''+ 
					names+''+gender+''+nationality+''+statescivil+''+datebirth+''+ 
					typeblood+''+statesemployee+''+secciondepart+''+position+''+
					basehours+''+rathours+''+salary+''+datecontract+''+datecarnet+''+ 
					payment+''+syndicate+''+keyrent+''+paymentm+''+paymentf+''+ 
					dateadmission+''+dateholidays+''+datetermination+''+isr);*/
           
            $.ajax({
                url: "./bin/form_empleadoAdd.php",
                type: "POST",
                data: 
				{
                    employeenum:employeenum, 
					identitycardnum:identitycardnum,
					socisecunum:socisecunum,
					lastnames:lastnames, 
					names:names, 
					gender:gender, 
					nationality:nationality, 
					statescivil:statescivil,
					datebirth:datebirth, 
					typeblood:typeblood, 
					statesemployee:statesemployee,
					secciondepart:secciondepart,					
					position:position,
					basehours:basehours,
					rathours:rathours,
					salary:salary, 
					datecontract:datecontract, 
					datecarnet:datecarnet, 
					payment:payment, 
					syndicate:syndicate, 
					keyrent:keyrent, 
					paymentm:paymentm, 
					paymentf:paymentf, 
					dateadmission:dateadmission, 
					dateholidays:dateholidays, 
					datetermination:datetermination,
					isr:isr
                },
                cache: false,
				crossDomain: false,
                success: function(data) {
				   // Success message
				   //alert(data.status);
					if(data.status == 1)
					{
							$('#success').html("<div class='alert alert-success'>");
							$('#success > .alert-success').append("<strong>El Empleado fue registrado correctamente</strong>");
							$('#success > .alert-success').append('</div>');

							//clear all fields
							$('#form_empleado').trigger("reset");
					}
					else
					{
						    $('#success').html("<div class='alert alert-danger'>");
							$('#success > .alert-danger').append("NO se registro el Empleado");
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