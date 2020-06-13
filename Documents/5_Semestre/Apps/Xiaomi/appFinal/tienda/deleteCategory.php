<?php
      require_once "conexion.php";
      $conexion=conexion();

   /*  $deletecategoria = $_POST['id_categoria']; */
   $id=$_POST['id'];

    $categoria_en_uso = $conexion -> query("SELECT * FROM productos WHERE id = '$id'");
    $resultado = array();
    while($extraerdatos = $categoria_en_uso -> fetch_assoc()){
        $resultado[] = $extraerdatos;
    }
    if(mysqli_num_rows($categoria_en_uso) == 0)
    {
        $borracat = $conexion -> query("DELETE FROM categoria WHERE id='$id'");
    }

    echo json_encode($resultado);
    
?>