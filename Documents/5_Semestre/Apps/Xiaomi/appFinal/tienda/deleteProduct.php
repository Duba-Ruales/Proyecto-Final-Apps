<?php
require_once "conexion.php";
$conexion=conexion();

	$id=$_POST['id'];
	$conexion->query("DELETE FROM productos WHERE id='$id'");

?>