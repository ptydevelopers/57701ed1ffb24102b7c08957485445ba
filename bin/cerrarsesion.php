<?php
  session_start();
  unset($_SESSION["id_usuario"]); 
  unset($_SESSION["id_rol"]);
  unset($_SESSION['id_empresa']);
  unset($_SESSION['nombre_empresa']);
  session_destroy();
header('Content-type: application/json');
$json = array("status" => 1);
echo json_encode($json);
	
?>