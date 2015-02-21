<?php
// archivo txt
$filas=file('miarchivo.txt');
// iniciamos contador y la fila a cero
$i=0;
$numero_fila=0;
// mientras exista una fila
while($filas[$i]!=NULL){
// incremento contador de la fila
$row = $filas[$i+1]; 
// genero array con por medio del separador "," que es el que tiene el archivo txt
$sql = explode(",",$row);
// incrementamos contador
$i++;
$numero_fila++;
// imprimimos datos en pantalla
echo 'Id: '.$row[0].'<br/>';
echo 'Nombre: '.$row[1].'<br/>';
echo 'Apellidos: '.$row[2].'<br/>';
echo 'Profesión: '.$row[3].'<br/>';
echo 'Edad: '.$row[4].'<br/>';
echo 'Ciudad: '.$row[5].'<br/><br/>';
}
?>
