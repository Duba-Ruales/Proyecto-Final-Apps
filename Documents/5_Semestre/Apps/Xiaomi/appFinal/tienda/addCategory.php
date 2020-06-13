<?php
    require_once "conexion.php";
	$conexion=conexion();
   
/* 
    $registercategoria = $_POST['nombre']; */
    $categoria = $_POST['nombre'];

    $validarcategorias = $conexion -> query("SELECT * FROM categoria WHERE nombre = '$categoria' ");
    $resultado = array();

    if(mysqli_num_rows($validarcategorias) > 0)
    {
        while($extraerdatos = $validarcategorias -> fetch_assoc()){
            $resultado[] = $extraerdatos;
        }   
    }else{
        $conexion->query("INSERT INTO categoria(nombre) VALUES('$categoria')");
    }
    
    echo json_encode($resultado);
?>