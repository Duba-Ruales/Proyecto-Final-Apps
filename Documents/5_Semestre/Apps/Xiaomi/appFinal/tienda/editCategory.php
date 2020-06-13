<?php
require_once "conexion.php";
$conexion=conexion();

	
	$id = $_POST['id'];
    $nombre = $_POST['nombre'];
   

	
	
	$conexion->query("UPDATE categoria SET nombre='".$nombre."'  WHERE id=". $id);

?>