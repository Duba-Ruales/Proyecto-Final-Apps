<?php
  require_once "conexion.php";
  $conexion=conexion();
  

  $queryResult=$conexion->query("SELECT * from productos");
/*
$queryResult=$conexion->query("SELECT p.id,p.nombre,p.precio,p.descripcion,p.img,categoria.nombre AS nom_catg from productos AS p
INNER JOIN categoria ON p.id_catg_producto = p.id_catg_producto");*/


$result=array();

while($fetchData=$queryResult->fetch_assoc()){
	$result[]=$fetchData;
}

echo json_encode($result);

?>