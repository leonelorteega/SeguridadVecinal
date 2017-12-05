<?php
$host = "localhost";
$user="root";
$dateb = "sistema_alerta";
$pw="";
$con=mysqli_connect($host,$user,$pw) or die ("error al conectar");
$base=mysqli_select_db($con,$dateb)or die("error al seleccionar la base de datos ");
?>