<?php
session_start();
$result="";
$result='<footer>
    <p>
        <span style="text-align:left;float:left">&copy; 2013 <a href="http://bootstrapmaster.com" alt="Bootstrap Themes">creativeLabs</a></span>
        <span class="hidden-phone" style="text-align:right;float:right">Powered by: <a href="http://admintemplates.co" alt="Bootstrap Admin Templates">SimpliQ</a></span>
    </p>

</footer>';

header('Content-type: application/json');
$json = array("status" => 1, "info" => $result);
echo json_encode($json);
	
?>