<?php

    require_once "conexion.php";
	$conexion=conexion();
	
    $nombre = $_POST['nombre'];
    $precio = $_POST['precio'];
    $descripcion = $_POST['descripcion'];
    $categoria = $_POST['id_catg_producto'];
    //AddImg
    $image= $_FILES['image']['name'];
    $imagePath = "img_temp/".$image; //Ubicacion
    move_uploaded_file($_FILES['image']['tmp_name'],$imagePath);


	
	
	$conexion->query(("INSERT INTO productos (nombre,precio,descripcion,id_catg_producto,imagen) 
                        VALUES ('".$nombre."','".$precio."','".$descripcion."','".$categoria."','".$image."')"));

?>