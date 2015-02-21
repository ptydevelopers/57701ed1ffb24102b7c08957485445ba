$(function() {

	$.ajax({
		url: "./bin/form_empleadoList.php",
		type: "GET",
		cache: false,
        crossDomain: false,
		success: function(data) {
				var oTable = $('#DataTables_Table_0').dataTable();  //Initialize the datatable
				oTable.fnClearTable();
				if (data.status == 1)
				{
					for(var i = 0; i < data.info.length; i++) {
						//alert(data.info[i].id_usuarios);
						oTable.fnAddData([
						data.info[i].numero_empleado,
						data.info[i].nombre,
						data.info[i].apellido,
						data.info[i].cedula,
						data.info[i].seguro_social,
						'<a class="btn btn-info" href="form_empleadoEdit.html?id='+data.info[i].id_empleado+'"><i class="icon-edit"></i></a>',
                                                '<a href="form_descuento_ingreso_x_empleado.html?id='+data.info[i].id_empleado+'" class="btn btn-success" role="button"> Ir a Desco/Ing</a>'
                                                ]);										
					} // End For

				}		
		},
		error: function() {
			// Fail message
		},
	})
});