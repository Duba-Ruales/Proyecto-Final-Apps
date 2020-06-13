<?php

require_once "conexion.php";
	$conexion=conexion();

	$sql="SELECT * FROM usuarios ";
	//$result= DB::query($sql);
   
   if(isset($_GET['estado']) == TRUE){
	 $estado = $_GET['estado'];
	 $id = $_GET['id'];
	 if($estado=="ventas"){
		 $es = "admin";
	 }else{
		 $es = "ventas";
	 }
	 $sql = "UPDATE usuarios set estado='$es' WHERE id='$id'";
   }else{


	$id=$_POST["id"];
	$username = $_POST['username'];
	$password = $_POST['password'];
	$telefono = $_POST['telefono'];
	/* Fallas con direccion y cidad en la db*/
	$ciudad = $_POST['ciudad'];
	$direccion = $_POST['direccion'];
	$estado=['estado'];

	if(isset($id)==false){
		$estado = "ventas";

	$conexion->query("INSERT INTO usuarios (username,password,telefono,ciudad,direccion,estado) 
	VALUES ('".$username."','".$password."','".$telefono."','".$ciudad."','".$direccion."','".$estado."')");

	}
   }
  



?>