<?php
require_once "conexion.php";
$conexion=conexion();

	$id=$_POST['id'];
	$conexion->query("DELETE FROM usuarios WHERE id=".$id);

?>