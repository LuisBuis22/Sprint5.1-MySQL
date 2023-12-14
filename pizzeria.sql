SELECT * FROM `pizzeria-schema`.tienda;

DROP TABLE IF EXISTS `tienda`;
CREATE TABLE `tienda` (
  `id` int NOT NULL AUTO_INCREMENT,
  `direccion` varchar(45) NOT NULL,
  `codigo_postal` varchar(45) NOT NULL,
  `localidad` varchar(45) NOT NULL,
  `provincia` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `tienda` WRITE;
INSERT INTO `tienda` VALUES (1,'c/ Villarroel 45 ','08011','Barcelona','Barcelona');
UNLOCK TABLES;

DROP TABLE IF EXISTS `empleados`;

CREATE TABLE `empleados` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `nif` varchar(9) NOT NULL,
  `telefono` int NOT NULL,
  `categoria` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `empleados` WRITE;
INSERT INTO `empleados` VALUES (1,'Paco','Navarro','4756382J',675849944,'cocinero'),(2,'Marcos','Garcia','4635566H',647382910,'repartidor'),(3,'Pepe','Valdes','45366298Y',67443526,'repartidor');
UNLOCK TABLES;

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `direccion` varchar(60) NOT NULL,
  `codigo_postal` int NOT NULL,
  `localidad` varchar(45) NOT NULL,
  `provincia` varchar(45) NOT NULL,
  `telefono` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `clientes` WRITE;
INSERT INTO `clientes` VALUES (1,'Mario','Barral','c/ Lepanto 22 3º 1ª',8025,'Barcelona','Barcelona',674563902),(2,'Andrea','Perez','c/ Marina 32 2º 2ª',8026,'Barcelona','Barcelona',645372029),(3,'Teresa','Martinez','c/ Tarragona 26 2º 4ª',8011,'Barcelona','Barcelona',645362789),(4,'Marta','Fernandez','c/ Arago 62 3º 2ª',8011,'Barcelona','Barcelona',674789302),(5,'Lucas','Ramirez','c/ Viladomat 78 5º 1ª',8011,'Barcelona','Barcelona',675849945),(6,'Antonio','Alvarez','c/ Corcega 96 3º 2ª',8012,'Barcelona','Barcelona',677854938);
UNLOCK TABLES;

DROP TABLE IF EXISTS `categoria_producto`;
CREATE TABLE `categoria_producto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL COMMENT 'nombre categoria: hamburgesa, pizza o bebida',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `categoria_producto` WRITE;
INSERT INTO `categoria_producto` VALUES (1,'hamburguesa'),(2,'pizza'),(3,'bebida');
UNLOCK TABLES;

DROP TABLE IF EXISTS `producto`;
CREATE TABLE `producto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `precio` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `producto` WRITE;
INSERT INTO `producto` VALUES (1,'pizza','Margarita',9),(2,'hamburguesa','ternera lechuga tomate y queso',12),(3,'bebida','coca cola',2);
UNLOCK TABLES;

DROP TABLE IF EXISTS `comandas`;
CREATE TABLE `comandas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha_hora` datetime(1) NOT NULL COMMENT 'YYYY-MM-DD hh:mm:ss',
  `domicilio_recogida` varchar(60) NOT NULL,
  `producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_total` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `comandas` WRITE;
INSERT INTO `comandas` VALUES (2,'2023-10-22 20:12:23.0','domicilio',1,2,18),(3,'2023-10-22 20:26:43.0','recogida',3,3,6),(4,'2023-10-22 20:56:01.0','domicilio',2,1,12),(5,'2023-10-22 21:30:45.0','domicilio',3,1,2);
UNLOCK TABLES;

DROP TABLE IF EXISTS `reparto`;
CREATE TABLE `reparto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha_hora` datetime(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `reparto` WRITE;
INSERT INTO `reparto` VALUES (1,'2023-10-22 20:48:25.0'),(2,'2023-10-22 21:22:51.0'),(3,'2023-10-22 22:04:12.0');
UNLOCK TABLES;