<?php
/* 
$connect = new mysqli("localhost","root","","android");
if($connect){
	
	 
}else{
	echo "Fallo, revise ip o firewall";
	exit();
} */
?>
<?php 
	function conexion()
	{
		return $conexion=mysqli_connect("localhost","root","","tienda");
	}

 ?>