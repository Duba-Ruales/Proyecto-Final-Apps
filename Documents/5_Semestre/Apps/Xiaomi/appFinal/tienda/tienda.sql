-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         5.7.24 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para tienda
CREATE DATABASE IF NOT EXISTS `tienda` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `tienda`;

-- Volcando estructura para tabla tienda.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tienda.categoria: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` (`id`, `nombre`) VALUES
	(1, 'Celulares'),
	(2, 'Computadores'),
	(3, 'Juegos'),
	(4, 'Mascotas'),
	(5, 'Inmuebles'),
	(6, 'Instrumentos Musicales');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;

-- Volcando estructura para tabla tienda.productos
CREATE TABLE IF NOT EXISTS `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text,
  `precio` text,
  `descripcion` text,
  `img` text,
  `id_catg_producto` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_productos_categoria` (`id_catg_producto`),
  CONSTRAINT `FK_productos_categoria` FOREIGN KEY (`id_catg_producto`) REFERENCES `categoria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tienda.productos: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` (`id`, `nombre`, `precio`, `descripcion`, `img`, `id_catg_producto`) VALUES
	(1, 'Xiaomi Pocophone F2 Pro', '1800000', 'Es un nuevo smartphone de la serie POCO de Xiaomi.', 'celular.jpg', 1),
	(2, 'Portatil Acer 53lp Core I5 8va 1tb+128gb Ssd Gtx 1050 4gb', '3171900', 'Explora y disfruta un nuevo nivel de Gaming mas inmersivo con la pantalla Full HD y la potente tecnologia del Nitro 5.', 'scaled_image_picker8830482214009219269.jpg', 2),
	(3, 'Piano Teclado Electronico Yamaha Dgx-660b + Adaptador Pa150', '3560000', 'El nuevo Yamaha DGX-660 es el ultimo piano digital de conjunto que presenta una variedad de caracteristicas interactivas que hacen mas divertida la musica.', 'scaled_image_picker1681425350289611504.jpg', 6),
	(4, 'Perro labrador', '850000', 'Hermoso perro cachorro, te brindara gran amor  y ademas es muy jugueton.', 'scaled_image_picker6746124552696750041.jpg', 4);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;

-- Volcando estructura para tabla tienda.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `telefono` text NOT NULL,
  `ciudad` text NOT NULL,
  `direccion` text NOT NULL,
  `estado` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla tienda.usuarios: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`, `username`, `password`, `telefono`, `ciudad`, `direccion`, `estado`) VALUES
	(1, 'carlos', '1234', '3122302446', 'San Francisco', 'Los pinos', 'admin'),
	(2, 'carlos', 'carlos', '12345', 'XD', 'Gg', 'ventas'),
	(3, 'Franklin', 'xd', '323', 'Mocoa', 'La loma', 'ventas'),
	(4, 'Jugoxd', 'gay', '332', 'das', 'aaa', 'ventas'),
	(5, 'fsd', 'dsf', 'fds', 'fds', 'fds', 'ventas');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
