<?php
     //$conexion = @mysqli_connect('localhost', 'root', '', 'agenda');
   $conexion = @mysqli_connect('127.0.0.1', 'u646610080_olivasandrea', 'Utd_2020', 'u646610080_olivasandrea');

    if($conexion->connect_errno){
        die("La conexión ha fallado");
    }
?>