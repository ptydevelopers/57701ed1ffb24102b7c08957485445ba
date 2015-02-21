<?php
session_start();
//require_once ('lib/nusoap.php'); 
require_once ('../../WSCaisa/lib/nusoap.php'); 
//$wsdl= "http://". $_SERVER['SERVER_NAME']."/WSCaisa/MyService.php?wsdl";
$wsdl= "http://". $_SERVER['SERVER_NAME']."/demos/WSCaisa/MyService.php?wsdl";

//Create object that referer a web services 
$client = new nusoap_client($wsdl,true); 
$result="";
$param = array(); 
$connect=mysqli_connect("localhost","UserCaisa","UserCaisa","planillas");
if($_SERVER['REQUEST_METHOD'] == "POST"){
    // Get data

    //$id_empresa = isset($_POST['numcompany']) ? mysqli_real_escape_string($connect, $_POST['numcompany']) :  "";
	$anno_fiscal = isset($_POST['']) ? mysqli_real_escape_string($connect, $_POST['namecompany']) :  "";
	$frecuencia_pago = isset($_POST['']) ? mysqli_real_escape_string($connect, $_POST['legalrepres']) :  "";
	$numero_periodo = isset($_POST['']) ? mysqli_real_escape_string($connect, $_POST['address']) :  "";
	$fecha_pago = isset($_POST['zip']) ? mysqli_real_escape_string($connect, $_POST['zip']) :  "";
	$desde = isset($_POST['comment']) ? mysqli_real_escape_string($connect, $_POST['comment']) :  "";
	$hasta = isset($_POST['phone']) ? mysqli_real_escape_string($connect, $_POST['phone']) :  "";
	$secuencia = isset($_POST['activitycode']) ? mysqli_real_escape_string($connect, $_POST['activitycode']) :  "";

    //Give it value at parameter 
    $param = array('nombre_empresa' => $nombre_empresa,'representante_legal' => $representante_legal,
	'direccion' => $direccion,'apartado_postal' => $apartado_postal,'comentario' => $comentario,
	'telefono_1' => $telefono_1,'codigo_actividad' => $codigo_actividad); 
	$result = $client->call('AddCompany',$param,'','','',true);

}
else
{
}

// fault if any
if ($client->fault) {
    echo 'Fault';
    print_r($result);
    echo '';
} 
else 
{
// Check for errors
    $err = $client->getError();
    if ($err) {
        // Display the error
        echo 'Error:'.$err;
    } 
	else 
	{
        // Display the result
        if($result!=false)
         {
			header('Content-type: application/json');
			if($result[0]['msg']!='OK')
			{
				$json = array("status" => 0, "info" => $result);
				
			}
			else
			{
				$json = array("status" => 1, "info" => $result);
				
				
			}
			echo json_encode($json);
         }
    }
}		
?>