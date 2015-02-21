<?php
session_start();
if (empty($_SESSION["id_usuario"])) 
{
 $json = array("status" => 0);
}
else
{
$str_rol = ($_SESSION['id_rol'] == 1 ? "SAdministrador" : ($_SESSION['id_rol'] == 2 ? "Administrador" : ($_SESSION['id_rol'] == 3 ? "Usuario" : "")));
$result="";
$result='<div class="navbar">
    <div class="navbar-inner">
        <div class="container-fluid">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
            </a>
            <div class="row-fluid">
                    <a class="brand span2" href="index.html"><span>'.$_SESSION['nombre_empresa'].'</span></a>
            </div>		
            <!-- start: Header Menu -->
            <div class="nav-no-collapse header-nav">
                <ul class="nav pull-right">

                <!-- start: Notifications Dropdown -->

                <!-- end: Notifications Dropdown -->
                <!-- start: Message Dropdown -->

                <!-- end: Message Dropdown -->

                <!-- start: User Dropdown -->
                    <li class="dropdown">
                        <a class="btn account dropdown-toggle" data-toggle="dropdown" href="#">
                            <div class="avatar"><i class="icon-th icon-large"></i></div>
                            <div class="user">
                            <span class="name">'.$str_rol.'</span>
                            </div>
                        </a>
                        <ul class="dropdown-menu">
                                <li class="dropdown-menu-title"></li>
                                <li><a href="cerrarsesion.html"><i class="icon-off"></i> Cerrar Sesion</a></li>
                        </ul>
                    </li>
                <!-- end: User Dropdown -->
                </ul>
            </div>
            <!-- end: Header Menu -->
        </div>
    </div>
</div>';
 $json = array("status" => 1, "info" => $result);
}
header('Content-type: application/json');
echo json_encode($json);
	
?>