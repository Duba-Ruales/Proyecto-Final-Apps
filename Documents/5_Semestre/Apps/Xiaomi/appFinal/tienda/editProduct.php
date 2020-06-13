<?php

	
require_once "conexion.php";
$conexion=conexion();
	
	$id = $_POST['id'];
    $nombre = $_POST['nombre'];
    $precio = $_POST['precio'];
    $descripcion = $_POST['descripcion'];
    $categoria = $_POST['id_catg_producto'];
   // $imagen=addslashes(file_get_contents($_FILES['imagen']['tmp_name']));
//Por agregar imagen

	
	
	$conexion->query("UPDATE productos SET nombre='".$nombre."', precio='".$precio."', 
    descripcion='".$descripcion."',id_catg_producto='".$categoria."'   WHERE id=". $id);

?>