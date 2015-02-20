<!DOCTYPE html>
<html>
<body>

<?php
$myfile = fopen("miarchivo.txt", "r") or die("Unable to open file!");
// Output one line until end-of-file
while(!feof($myfile)) {
   echo fgets($myfile) . "<br>";
}
fclose($myfile);

/*
$myfile = file_get_contents("miarchivo.txt");
echo $myfile ;
*/

?>

</body>
</html>