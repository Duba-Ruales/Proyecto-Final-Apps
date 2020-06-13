<?php

require_once "conexion.php";
$conexion=conexion();

	
	$id = $_POST['id'];
	$username = $_POST['username'];
	$password = $_POST['password'];
	$telefono = $_POST['telefono'];
	$ciudad = $_POST['ciudad'];
	$direccion = $_POST['direccion'];

	
	
	$conexion->query("UPDATE usuarios SET username='".$username."', password='".$password."', telefono='".$telefono."', ciudad='".$ciudad."', direccion='".$direccion."'   WHERE id=". $id);

?>