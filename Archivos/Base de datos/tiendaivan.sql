/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50151
Source Host           : 127.0.0.1:3306
Source Database       : tiendaivan

Target Server Type    : MYSQL
Target Server Version : 50151
File Encoding         : 65001

Date: 2018-06-15 13:05:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cargo
-- ----------------------------
DROP TABLE IF EXISTS `cargo`;
CREATE TABLE `cargo` (
  `Clv_Cargo` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`Clv_Cargo`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of cargo
-- ----------------------------
INSERT INTO `cargo` VALUES ('1', 'Cajero');
INSERT INTO `cargo` VALUES ('2', 'Gerente');
INSERT INTO `cargo` VALUES ('3', 'Cerillo');
INSERT INTO `cargo` VALUES ('4', 'Limpieza');
INSERT INTO `cargo` VALUES ('5', 'Almacenista');
INSERT INTO `cargo` VALUES ('6', 'Guardia de seguridad');
INSERT INTO `cargo` VALUES ('7', 'Ayudante general');

-- ----------------------------
-- Table structure for cliente
-- ----------------------------
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente` (
  `RFC_Cliente` varchar(15) NOT NULL,
  `Razon_Social` varchar(255) NOT NULL,
  `Direccion` varchar(255) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  `Email` varchar(255) NOT NULL,
  PRIMARY KEY (`RFC_Cliente`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of cliente
-- ----------------------------
INSERT INTO `cliente` VALUES ('CRPC460112U24', 'La tiendita', 'Jilotepec, Edo. de Mexico', '55-48-49-03-23', 'product@hotmail.com');
INSERT INTO `cliente` VALUES ('CVBNERRFGHH', 'Cliente3', 'Toluca,Estado de mexico', '55-74-78-89-96', 'cliente3@live.com.mx');
INSERT INTO `cliente` VALUES ('DFGHJY4848458', 'Cliente1', 'Monterrey', '55-47-85-12-52', 'cliente1@gmail.com');
INSERT INTO `cliente` VALUES ('EDRFGHNJK747', 'Cliente2', 'Guadalajara', '55-58-45-12-36', 'cliente2@outlook.com');
INSERT INTO `cliente` VALUES ('FRSA7265378362', 'La esquinita', 'Chiapas', '01-34-34-23-43', 'esquina1@hotmail.com');

-- ----------------------------
-- Table structure for comprar
-- ----------------------------
DROP TABLE IF EXISTS `comprar`;
CREATE TABLE `comprar` (
  `Clv_Compra` int(11) NOT NULL AUTO_INCREMENT,
  `Folio` varchar(20) NOT NULL,
  `Fecha` date NOT NULL,
  `Total` double NOT NULL DEFAULT '0',
  `RFC` varchar(15) NOT NULL,
  `Clv_Usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`Clv_Compra`) USING BTREE,
  KEY `RFC` (`RFC`) USING BTREE,
  KEY `asssqe` (`Clv_Usuario`) USING BTREE,
  CONSTRAINT `asssqe` FOREIGN KEY (`Clv_Usuario`) REFERENCES `usuario` (`Clv_Usuario`),
  CONSTRAINT `comprar_ibfk_1` FOREIGN KEY (`RFC`) REFERENCES `proveedor` (`RFC`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of comprar
-- ----------------------------
INSERT INTO `comprar` VALUES ('1', 'compra1', '2017-05-01', '50', '98S8377CV6', '1');
INSERT INTO `comprar` VALUES ('4', 'compra2', '2018-05-08', '200', 'GAPOU34GY', '2');
INSERT INTO `comprar` VALUES ('5', 'compra3', '2018-02-13', '150', '98S8377CV6', '1');
INSERT INTO `comprar` VALUES ('6', 'compra6', '2017-10-10', '580', '98S8377CV6', '2');
INSERT INTO `comprar` VALUES ('7', 'compra7', '2018-01-23', '452', '788WS84XS', '2');
INSERT INTO `comprar` VALUES ('8', 'compra8', '2018-05-14', '120', 'GAPOU34GY', '1');
INSERT INTO `comprar` VALUES ('9', 'compra9', '2017-07-19', '221', 'GAPOU34GY', '1');
INSERT INTO `comprar` VALUES ('10', 'compra10', '2017-05-16', '451', 'POLOD7E4E4', '1');
INSERT INTO `comprar` VALUES ('11', 'compra11', '2017-12-19', '89', 'ERFG4151515', '1');
INSERT INTO `comprar` VALUES ('12', 'compra12', '2018-10-10', '542', 'ERFG4151515', '1');
INSERT INTO `comprar` VALUES ('13', 'compra13', '2017-11-22', '130', '8856387787|', '1');
INSERT INTO `comprar` VALUES ('14', 'compra14', '2018-12-14', '128', '8856387787|', '1');
INSERT INTO `comprar` VALUES ('15', 'compra 15', '2017-01-18', '251', 'ERFG4151515', '2');
INSERT INTO `comprar` VALUES ('16', 'compra 16', '2018-11-27', '300', 'GAPOU34GY', '2');

-- ----------------------------
-- Table structure for detallecompra
-- ----------------------------
DROP TABLE IF EXISTS `detallecompra`;
CREATE TABLE `detallecompra` (
  `Clv_Detalle` int(11) NOT NULL AUTO_INCREMENT,
  `Clv_Compra` int(11) NOT NULL,
  `Codigo` varchar(50) NOT NULL,
  `Cantidad` double NOT NULL DEFAULT '0',
  `PrecioDeCompra` double NOT NULL,
  PRIMARY KEY (`Clv_Detalle`) USING BTREE,
  KEY `Clv_Compra` (`Clv_Compra`) USING BTREE,
  KEY `Codigo` (`Codigo`) USING BTREE,
  CONSTRAINT `detallecompra_ibfk_1` FOREIGN KEY (`Clv_Compra`) REFERENCES `comprar` (`Clv_Compra`),
  CONSTRAINT `detallecompra_ibfk_2` FOREIGN KEY (`Codigo`) REFERENCES `producto` (`Codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of detallecompra
-- ----------------------------
INSERT INTO `detallecompra` VALUES ('1', '1', '34654752342', '65', '422');
INSERT INTO `detallecompra` VALUES ('3', '4', '32223409', '10', '280');
INSERT INTO `detallecompra` VALUES ('4', '5', '7501147431113', '25', '1500');
INSERT INTO `detallecompra` VALUES ('5', '6', '34654752342', '14', '500');
INSERT INTO `detallecompra` VALUES ('6', '7', '7501147431113', '89', '350');
INSERT INTO `detallecompra` VALUES ('7', '8', '7501147431113', '35', '480');
INSERT INTO `detallecompra` VALUES ('8', '9', '7501147431113', '45', '200');
INSERT INTO `detallecompra` VALUES ('9', '10', '748512357458', '12', '100');
INSERT INTO `detallecompra` VALUES ('10', '11', '745869577477', '54', '35');
INSERT INTO `detallecompra` VALUES ('11', '12', '745869577477', '21', '54');
INSERT INTO `detallecompra` VALUES ('12', '10', '74562585265', '32', '75');

-- ----------------------------
-- Table structure for detalle_pago
-- ----------------------------
DROP TABLE IF EXISTS `detalle_pago`;
CREATE TABLE `detalle_pago` (
  `Clv_Depago` int(11) NOT NULL AUTO_INCREMENT,
  `Folio_Venta` varchar(10) NOT NULL,
  `Clv_Pago` int(11) NOT NULL,
  `Monto` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`Clv_Depago`) USING BTREE,
  KEY `Folio_Venta` (`Folio_Venta`) USING BTREE,
  KEY `Clv_Pago` (`Clv_Pago`) USING BTREE,
  CONSTRAINT `detalle_pago_ibfk_1` FOREIGN KEY (`Folio_Venta`) REFERENCES `vender` (`Folio_Venta`),
  CONSTRAINT `detalle_pago_ibfk_2` FOREIGN KEY (`Clv_Pago`) REFERENCES `forma_pago` (`Clv_Pago`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of detalle_pago
-- ----------------------------
INSERT INTO `detalle_pago` VALUES ('1', 'venta1', '2', '122');
INSERT INTO `detalle_pago` VALUES ('2', 'venta1', '1', '21');
INSERT INTO `detalle_pago` VALUES ('3', 'venta2', '2', '50');
INSERT INTO `detalle_pago` VALUES ('4', 'venta3', '2', '80');
INSERT INTO `detalle_pago` VALUES ('5', 'venta4', '1', '125');
INSERT INTO `detalle_pago` VALUES ('6', 'venta5', '1', '250');
INSERT INTO `detalle_pago` VALUES ('7', 'venta6', '1', '100');
INSERT INTO `detalle_pago` VALUES ('8', 'Venta7', '1', '68');

-- ----------------------------
-- Table structure for detalle_venta
-- ----------------------------
DROP TABLE IF EXISTS `detalle_venta`;
CREATE TABLE `detalle_venta` (
  `Clv_venta` int(11) NOT NULL AUTO_INCREMENT,
  `Folio_Venta` varchar(15) NOT NULL,
  `Codigo` varchar(50) NOT NULL,
  `Cantidad` double NOT NULL DEFAULT '0',
  `Precio_venta` double NOT NULL,
  PRIMARY KEY (`Clv_venta`) USING BTREE,
  KEY `Folio_Venta` (`Folio_Venta`) USING BTREE,
  KEY `Codigo` (`Codigo`) USING BTREE,
  CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`Folio_Venta`) REFERENCES `vender` (`Folio_Venta`),
  CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`Codigo`) REFERENCES `producto` (`Codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of detalle_venta
-- ----------------------------
INSERT INTO `detalle_venta` VALUES ('1', 'venta1', '34654752342', '4', '12');
INSERT INTO `detalle_venta` VALUES ('2', 'venta2', '32223409', '1', '21');
INSERT INTO `detalle_venta` VALUES ('3', 'venta3', '45236988742', '3', '20');
INSERT INTO `detalle_venta` VALUES ('4', 'venta4', '7501147431113', '8', '12');
INSERT INTO `detalle_venta` VALUES ('5', 'venta5', '748512357458', '2', '25');
INSERT INTO `detalle_venta` VALUES ('6', 'venta6', '745869577477', '5', '12');
INSERT INTO `detalle_venta` VALUES ('7', 'Venta7', '74562585265', '9', '5');

-- ----------------------------
-- Table structure for devolucion
-- ----------------------------
DROP TABLE IF EXISTS `devolucion`;
CREATE TABLE `devolucion` (
  `Clv_Devolucion` int(11) NOT NULL AUTO_INCREMENT,
  `Clv_venta` int(11) NOT NULL,
  `Clv_Usuario` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL DEFAULT '0',
  `Fecha` date NOT NULL,
  PRIMARY KEY (`Clv_Devolucion`) USING BTREE,
  KEY `Clv_venta` (`Clv_venta`) USING BTREE,
  KEY `Clv_Usuario` (`Clv_Usuario`) USING BTREE,
  CONSTRAINT `devolucion_ibfk_1` FOREIGN KEY (`Clv_venta`) REFERENCES `detalle_venta` (`Clv_venta`),
  CONSTRAINT `devolucion_ibfk_2` FOREIGN KEY (`Clv_Usuario`) REFERENCES `usuario` (`Clv_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of devolucion
-- ----------------------------

-- ----------------------------
-- Table structure for factura
-- ----------------------------
DROP TABLE IF EXISTS `factura`;
CREATE TABLE `factura` (
  `Folio_factura` varchar(10) NOT NULL,
  `Folio_Venta` varchar(10) NOT NULL,
  `RFC_Cliente` varchar(15) NOT NULL,
  `Fecha` date NOT NULL,
  PRIMARY KEY (`Folio_factura`) USING BTREE,
  KEY `Folio_Venta` (`Folio_Venta`) USING BTREE,
  KEY `RFC_Cliente` (`RFC_Cliente`) USING BTREE,
  CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`Folio_Venta`) REFERENCES `vender` (`Folio_Venta`),
  CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`RFC_Cliente`) REFERENCES `cliente` (`RFC_Cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of factura
-- ----------------------------
INSERT INTO `factura` VALUES ('factura', 'venta2', 'CRPC460112U24', '2018-06-11');
INSERT INTO `factura` VALUES ('factura1', 'venta1', 'FRSA7265378362', '2017-05-15');
INSERT INTO `factura` VALUES ('factura3', 'venta3', 'DFGHJY4848458', '2018-11-26');
INSERT INTO `factura` VALUES ('factura4', 'venta4', 'EDRFGHNJK747', '2018-10-17');
INSERT INTO `factura` VALUES ('factura5', 'venta5', 'FRSA7265378362', '2018-04-28');
INSERT INTO `factura` VALUES ('factura6', 'venta6', 'EDRFGHNJK747', '2017-11-30');
INSERT INTO `factura` VALUES ('factura7', 'Venta7', 'FRSA7265378362', '2017-08-01');

-- ----------------------------
-- Table structure for familia
-- ----------------------------
DROP TABLE IF EXISTS `familia`;
CREATE TABLE `familia` (
  `Clv_Fam` int(11) NOT NULL AUTO_INCREMENT,
  `Desc_Fam` varchar(255) NOT NULL,
  PRIMARY KEY (`Clv_Fam`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of familia
-- ----------------------------
INSERT INTO `familia` VALUES ('1', 'Jugos y bebidas');
INSERT INTO `familia` VALUES ('2', 'Pan');
INSERT INTO `familia` VALUES ('3', 'Vinos');
INSERT INTO `familia` VALUES ('4', 'Carnes');
INSERT INTO `familia` VALUES ('5', 'Verduras');
INSERT INTO `familia` VALUES ('6', 'Comida');
INSERT INTO `familia` VALUES ('7', 'Lacteos');
INSERT INTO `familia` VALUES ('8', 'Envutidos');
INSERT INTO `familia` VALUES ('9', 'Frutas');

-- ----------------------------
-- Table structure for forma_pago
-- ----------------------------
DROP TABLE IF EXISTS `forma_pago`;
CREATE TABLE `forma_pago` (
  `Clv_Pago` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`Clv_Pago`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of forma_pago
-- ----------------------------
INSERT INTO `forma_pago` VALUES ('1', 'Efectivo');
INSERT INTO `forma_pago` VALUES ('2', 'Tarjeta de Credito');
INSERT INTO `forma_pago` VALUES ('3', 'Deposito bacario');
INSERT INTO `forma_pago` VALUES ('4', 'Transferencia bancaria');

-- ----------------------------
-- Table structure for marca
-- ----------------------------
DROP TABLE IF EXISTS `marca`;
CREATE TABLE `marca` (
  `Clv_Marca` int(11) NOT NULL AUTO_INCREMENT,
  `Desc_Marca` varchar(255) NOT NULL,
  PRIMARY KEY (`Clv_Marca`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of marca
-- ----------------------------
INSERT INTO `marca` VALUES ('1', 'Bonafont');
INSERT INTO `marca` VALUES ('2', 'Tia rosa');
INSERT INTO `marca` VALUES ('3', 'Bimbo');
INSERT INTO `marca` VALUES ('5', 'Marinela');
INSERT INTO `marca` VALUES ('6', 'Quaqer');
INSERT INTO `marca` VALUES ('7', 'Gamesa');
INSERT INTO `marca` VALUES ('8', 'Danone');
INSERT INTO `marca` VALUES ('9', 'Jumex');
INSERT INTO `marca` VALUES ('10', 'Gatorade');
INSERT INTO `marca` VALUES ('11', 'Barcel');
INSERT INTO `marca` VALUES ('12', 'Sabritas');
INSERT INTO `marca` VALUES ('13', 'FUD');
INSERT INTO `marca` VALUES ('14', 'Herdez');
INSERT INTO `marca` VALUES ('15', 'La costeña');
INSERT INTO `marca` VALUES ('16', 'Maruchan');

-- ----------------------------
-- Table structure for presentacion
-- ----------------------------
DROP TABLE IF EXISTS `presentacion`;
CREATE TABLE `presentacion` (
  `Clave_Pres` int(11) NOT NULL AUTO_INCREMENT,
  `Desc_Pres` varchar(255) NOT NULL,
  PRIMARY KEY (`Clave_Pres`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of presentacion
-- ----------------------------
INSERT INTO `presentacion` VALUES ('1', 'Botella');
INSERT INTO `presentacion` VALUES ('2', 'Bolsa');
INSERT INTO `presentacion` VALUES ('3', 'Stick');
INSERT INTO `presentacion` VALUES ('4', 'Empaquetado');
INSERT INTO `presentacion` VALUES ('5', 'Lata');
INSERT INTO `presentacion` VALUES ('6', 'Bolsa');
INSERT INTO `presentacion` VALUES ('7', 'Suelta');
INSERT INTO `presentacion` VALUES ('8', 'Caja');
INSERT INTO `presentacion` VALUES ('9', 'Bebible');

-- ----------------------------
-- Table structure for producto
-- ----------------------------
DROP TABLE IF EXISTS `producto`;
CREATE TABLE `producto` (
  `Codigo` varchar(50) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `Descripcion` varchar(255) NOT NULL,
  `Precio_actual` double NOT NULL DEFAULT '0',
  `Existencia` double NOT NULL DEFAULT '0',
  `St_Maximo` double NOT NULL DEFAULT '0',
  `St_Minimo` double NOT NULL DEFAULT '0',
  `Clv_Marca` int(11) NOT NULL,
  `Clv_Fam` int(11) NOT NULL,
  `Clave_Pres` int(11) NOT NULL,
  `Estatus` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Codigo`) USING BTREE,
  KEY `Clv_Marca` (`Clv_Marca`) USING BTREE,
  KEY `Clv_Fam` (`Clv_Fam`) USING BTREE,
  KEY `Clave_Pres` (`Clave_Pres`) USING BTREE,
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`Clv_Marca`) REFERENCES `marca` (`Clv_Marca`),
  CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`Clv_Fam`) REFERENCES `familia` (`Clv_Fam`),
  CONSTRAINT `producto_ibfk_3` FOREIGN KEY (`Clave_Pres`) REFERENCES `presentacion` (`Clave_Pres`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of producto
-- ----------------------------
INSERT INTO `producto` VALUES ('123456985887', 'Agua bonafont', 'Agua de sabores', '850', '8', '30', '3', '12', '5', '8', '1');
INSERT INTO `producto` VALUES ('13582626268', 'Ensalada de verduras', 'Diferentes tipos de verduras precosidas', '32', '50', '420', '30', '14', '8', '5', '1');
INSERT INTO `producto` VALUES ('32223409', 'Sabritas', 'Papas con picante', '10', '45', '3', '1', '2', '1', '1', '1');
INSERT INTO `producto` VALUES ('34654752342', 'Coca-Cola', 'Refresco de 600 mlts', '15', '42', '130', '6', '1', '2', '2', '1');
INSERT INTO `producto` VALUES ('45236988742', 'Jumex Mango', 'Jugo de sabor mango', '10', '47', '100', '8', '9', '1', '1', '1');
INSERT INTO `producto` VALUES ('74562585265', 'Lechuga', 'Piensa empaquetada de lechuga', '11', '51', '500', '20', '14', '5', '2', '1');
INSERT INTO `producto` VALUES ('745869577477', 'Marianitas', 'Galletas de harina de maiz', '12', '5', '50', '3', '7', '6', '1', '1');
INSERT INTO `producto` VALUES ('748512357458', 'Chiles enlatados', 'Chiles en vinagre', '12', '28', '200', '10', '15', '8', '5', '1');
INSERT INTO `producto` VALUES ('7501147431113', 'barra Nutritiva', 'Barra de granola, miel arroz inflado', '15', '35', '100', '10', '6', '2', '1', '1');

-- ----------------------------
-- Table structure for proveedor
-- ----------------------------
DROP TABLE IF EXISTS `proveedor`;
CREATE TABLE `proveedor` (
  `RFC` varchar(15) NOT NULL,
  `Razon_Social` varchar(255) NOT NULL,
  `Proveedor` varchar(255) NOT NULL,
  `Direccion` varchar(255) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  `Correo_Ele` varchar(255) NOT NULL,
  PRIMARY KEY (`RFC`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of proveedor
-- ----------------------------
INSERT INTO `proveedor` VALUES ('74SW4748E4', 'Herdez Mexico', 'Herdez', 'Guadalajara, jaslisco', '018874558889', 'HerdezMexicoNew@hotmail.com');
INSERT INTO `proveedor` VALUES ('788WS84XS', 'Grupo Bimbo', 'Bimbo', 'Ciudad de mexico', '5512478536', 'BimboMexico@gmail.com');
INSERT INTO `proveedor` VALUES ('8856387787|', 'Grupo jumex', 'Jumex', 'cuidad de mexico', '5578412789', 'jumexMex@hotmail.com');
INSERT INTO `proveedor` VALUES ('98S8377CV6', 'Bona', 'Bonafont', 'Ecatepec D.F', '8754745790', 'Bonaf_Life@gmail.com');
INSERT INTO `proveedor` VALUES ('ERFG4151515', 'La costeña mexico', 'La Costeña', 'Nuevo leon, Guanajuato', '018554748859', 'Lacosteñamexico@gmail.com');
INSERT INTO `proveedor` VALUES ('GAPOU34GY', 'PepsiCo Mexico', 'Gamesa', 'Calzada vallejo No 743, D.F', '018004263721', 'GamesaMexico12@gmail.com');
INSERT INTO `proveedor` VALUES ('POLOD7E4E4', 'Sabritas Mexico', 'Sabritas', 'Monterrey, Nuevo leon', '014887748859', 'SabritasMex@Outlook.com');

-- ----------------------------
-- Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `Clv_Usuario` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) NOT NULL,
  `contrasenia` varchar(8) NOT NULL,
  `Clv_Cargo` int(11) NOT NULL,
  PRIMARY KEY (`Clv_Usuario`) USING BTREE,
  KEY `Clv_Cargo` (`Clv_Cargo`) USING BTREE,
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`Clv_Cargo`) REFERENCES `cargo` (`Clv_Cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO `usuario` VALUES ('1', 'Navi', '12345', '1');
INSERT INTO `usuario` VALUES ('2', 'Ismael', '01234', '2');

-- ----------------------------
-- Table structure for vender
-- ----------------------------
DROP TABLE IF EXISTS `vender`;
CREATE TABLE `vender` (
  `Folio_Venta` varchar(10) NOT NULL,
  `Fecha` date NOT NULL,
  `Clv_Usuario` int(11) NOT NULL,
  `Total` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`Folio_Venta`) USING BTREE,
  KEY `Clv_Usuario` (`Clv_Usuario`) USING BTREE,
  CONSTRAINT `vender_ibfk_1` FOREIGN KEY (`Clv_Usuario`) REFERENCES `usuario` (`Clv_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of vender
-- ----------------------------
INSERT INTO `vender` VALUES ('venta1', '2017-04-18', '1', '48');
INSERT INTO `vender` VALUES ('venta2', '2018-06-11', '2', '21');
INSERT INTO `vender` VALUES ('venta3', '2018-06-08', '1', '60');
INSERT INTO `vender` VALUES ('venta4', '2017-07-20', '1', '96');
INSERT INTO `vender` VALUES ('venta5', '2017-11-29', '2', '50');
INSERT INTO `vender` VALUES ('venta6', '2018-11-13', '1', '60');
INSERT INTO `vender` VALUES ('Venta7', '2018-09-26', '2', '45');

-- ----------------------------
-- Procedure structure for compra
-- ----------------------------
DROP PROCEDURE IF EXISTS `compra`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `compra`(
pClv_Compra int,
pFolio VARCHAR(20),
pFecha DATE,
pTotal DOUBLE,
pRFC VARCHAR(15))
BEGIN
DECLARE fol VARCHAR(20);
SELECT '' INTO fol;
SELECT comprar.Folio INTO fol FROM comprar WHERE comprar.Folio = pFolio;
IF fol = pFolio THEN
SELECT 'El Folio ya se Encuentra Registrado' AS Error;
ELSE
INSERT comprar VALUES(
pClv_compra,
pFolio,
pFecha,
pTotal,
pRFC);
SELECT 'Compra con exito' AS Exito;
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for comprar
-- ----------------------------
DROP PROCEDURE IF EXISTS `comprar`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `comprar`(
pFolio VARCHAR(20),
pFecha DATE,
pTotal DOUBLE,
pRFC VARCHAR(15))
BEGIN
DECLARE fol VARCHAR(20);
SELECT '' INTO fol;
SELECT comprar.Folio INTO fol FROM comprar WHERE comprar.Folio = pFolio;
IF fol = pFolio THEN
SELECT 'El Folio ya se Encuentra Registrado' AS Error;
ELSE
INSERT comprar VALUES(
DEFAULT,
pFolio,
pFecha,
pTotal,
pRFC);
SELECT 'Compra con exito' AS Exito;
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for detalleCom
-- ----------------------------
DROP PROCEDURE IF EXISTS `detalleCom`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `detalleCom`(
pClv_Detalle int,
pClv_Compra int,
pCodigo varchar(50),
pCantidad double,
pPrecioDeCompra double)
BEGIN
DECLARE varCompra int;
DECLARE varCodigo varchar(50);
SELECT '' INTO varCodigo;
SELECT comprar.Clv_Compra INTO varCompra FROM comprar WHERE comprar.Clv_Compra=pClv_Compra;
SELECT producto.Codigo INTO varCodigo FROM producto WHERE producto.Codigo=pCodigo;

IF varCompra <> '' AND varCodigo <> '' THEN
INSERT detallecompra VALUES (
pClv_Detalle,
varCompra,
varCodigo,
pCantidad,
pPrecioDeCompra);
UPDATE producto SET producto.Existencia=producto.Existencia+pCantidad WHERE producto.Codigo=pCodigo;
SELECT 'Actualizado, la compra fue registrada exitosamente' AS Correcto;
ELSE
SELECT 'A ocurrido un error' AS Error;
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for detalleCompra
-- ----------------------------
DROP PROCEDURE IF EXISTS `detalleCompra`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `detalleCompra`(pClv_Detalle int,
pFolio varchar(20),
pCodigo varchar(50),
pCantidad double,
pPrecioDeCompra double)
BEGIN
DECLARE varFolio varchar(20);
DECLARE varCodigo varchar(50);
SELECT '' INTO varCodigo;
SELECT comprar.Clv_Compra INTO varFolio FROM comprar WHERE comprar.Folio=pFolio;
SELECT producto.Codigo INTO varCodigo FROM producto WHERE producto.Codigo=pCodigo;

IF varFolio <> '' AND varCodigo <> '' THEN
INSERT detallecompra VALUES (
pClv_Detalle,
varFolio,
varCodigo,
pCantidad,
pPrecioDeCompra);
UPDATE producto SET producto.Existencia=producto.Existencia+pCantidad WHERE producto.Codigo=pCodigo;
SELECT 'Actualizado, la compra fue registrada exitosamente' AS Correcto;
ELSE
SELECT 'A ocurrido un error' AS Error;
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for detalleVen
-- ----------------------------
DROP PROCEDURE IF EXISTS `detalleVen`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `detalleVen`(pClv_venta int,
pFolio_Venta varchar(15),
pCodigo varchar(50),
pCantidad double,
pPrecio_venta double)
BEGIN
DECLARE varFolv VARCHAR(15);
DECLARE varCond VARCHAR(50);
SELECT '' INTO varFolv;
SELECT '' INTO varCond;
SELECT vender.Folio_Venta INTO varFolv FROM vender WHERE vender.Folio_Venta = pFolio_Venta;
SELECT producto.Codigo INTO varCond FROM producto WHERE producto.Codigo = pCodigo;

IF varFolv <> '' AND varCond <> '' THEN
INSERT detalle_venta VALUES (
pClv_venta,
varFolv,
varCond,
pCantidad,
pPrecio_venta);
-- UPDATE vender SET vender.Total=pCantidad*pPrecio_venta WHERE vender.Folio_Venta=pFolio_Venta;
UPDATE producto SET producto.Existencia=producto.Existencia-pCantidad WHERE producto.Codigo=pCodigo;
SELECT 'Actualizado, la venta fue registrada exitosamente' AS Correcto;
ELSE
SELECT 'Error en los datos' AS ErrorFatal;
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for insertaProducto
-- ----------------------------
DROP PROCEDURE IF EXISTS `insertaProducto`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertaProducto`(
pCodigo varchar(50),
pnombre varchar(20),
pDescripcion varchar(255),
pPrecio_actual double,
pExistencia double,
pSt_Maximo double,
pSt_Minimo double,
pDesc_Marca varchar(255),
pDesc_Fam varchar(255),
pDesc_Pres varchar(255),
pEstatus char(1))
BEGIN
DECLARE varMarca,varFam,varPres int;
-- SELECT '' INTO varMarca;
-- SELECT '' INTO varFam;
-- SELECT '' INTO varPres;-- Es para limpiar las variables varMarca, varFam y varPres

SELECT marca.Clv_Marca INTO varMarca FROM marca WHERE marca.Desc_Marca = pDesc_Marca;
SELECT familia.Clv_Fam INTO varFam FROM familia WHERE familia.Desc_Fam = pDesc_Fam;
SELECT presentacion.Clave_Pres INTO varPres FROM presentacion WHERE presentacion.Desc_Pres = pDesc_Pres;
IF varMarca <> '' AND varFam <> '' AND varPres <> '' THEN
INSERT producto VALUES (
pCodigo,
pnombre,
pDescripcion,
pPrecio_actual,
pExistencia,
pSt_Maximo,
pSt_Minimo,
varMarca,
varFam,
varPres,
pEstatus);
ELSE
SELECT 'Error algo no salio bien' AS Error;
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for insertCargo
-- ----------------------------
DROP PROCEDURE IF EXISTS `insertCargo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertCargo`(
accion VARCHAR(1),
pDescripcion VARCHAR (255))
BEGIN
DECLARE valor VARCHAR (255);
DECLARE nuevoValor VARCHAR(255);
SELECT cargo.Descripcion INTO valor FROM cargo WHERE cargo.Descripcion = pDescripcion;
IF accion = 'I' THEN
	IF valor = pDescripcion THEN
	SELECT 'El cargo ya existia' AS Error;
	ELSE 
	INSERT cargo VALUES (DEFAULT,pDescripcion);
	SELECT 'El cargo se a registrado' AS Mensaje;
END IF;
ELSE
IF valor = pDescripcion THEN
IF nuevoValor = pDescripcion THEN
SELECT 'El cargo ya fue registrado con anterioridad' AS Error;
ELSE 
UPDATE cargo SET cargo.Descripcion = nuevoValor WHERE cargo.Descripcion = pDescripcion;
SELECT 'Actualizacion exitosa';
END IF;
END IF;
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for proCargo
-- ----------------------------
DROP PROCEDURE IF EXISTS `proCargo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proCargo`(pClv_Cargo INT, pDescripcion VARCHAR(255))
BEGIN
DECLARE valor VARCHAR(255);
DECLARE nuevoValor VARCHAR(255);
SELECT cargo.Descripcion INTO valor FROM cargo WHERE cargo.Descripcion = pDescripcion;
IF valor = pDescripcion THEN
SELECT 'Error, el cargo ya fue registrado anteriormente' AS Error;
ELSE 
INSERT cargo VALUES (
pClv_Cargo,
pDescripcion);
SELECT 'Cargo agregado exitosamente' AS Correcto;
END IF;
SELECT cargo.Clv_Cargo INTO nuevoValor FROM cargo WHERE cargo.Clv_Cargo = pClv_Cargo;
IF valor = pDescripcion THEN
IF pClv_Cargo = nuevoValor THEN
UPDATE cargo SET cargo.Descripcion = valor WHERE cargo.Descripcion = pDescripcion;
SELECT 'Se ha actualizado exitosamente' AS Correcto;
END IF;
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for procediCliente
-- ----------------------------
DROP PROCEDURE IF EXISTS `procediCliente`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procediCliente`(
pRFC_Cliente VARCHAR(15),
pRazon_Social VARCHAR(255),
pDireccion VARCHAR(255),
pTelefono VARCHAR(20),
PEmail VARCHAR(255))
BEGIN
DECLARE varRFC VARCHAR(15);
SELECT '' INTO varRFC ;
SELECT cliente.RFC_Cliente INTO varRFC FROM cliente WHERE cliente.RFC_Cliente=pRFC_Cliente;
IF varRFC=pRFC_Cliente THEN
SELECT 'Error el RFC insertado ya existe' AS Error;
ELSE
INSERT cliente VALUES (
pRFC_Cliente,
pRazon_Social,
pDireccion,
pTelefono,
pEmail);
SELECT 'El proveedor se a registrado correctamente' AS Correcto;
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for procediDetallePago
-- ----------------------------
DROP PROCEDURE IF EXISTS `procediDetallePago`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procediDetallePago`(
pFolio_Venta VARCHAR(10),
pDesc VARCHAR(255),
pMonto DOUBLE)
BEGIN
DECLARE varFolv VARCHAR(10);
DECLARE varClv VARCHAR(255);
-- DECLARE varTotal DOUBLE;
SELECT '' INTO varFolv;
SELECT '' INTO varClv;
SELECT vender.Folio_Venta INTO varFolv FROM vender WHERE vender.Folio_Venta = pFolio_Venta;
SELECT forma_pago.Clv_Pago INTO varClv FROM forma_pago WHERE forma_pago.Descripcion = pDesc;
IF varFolv <> '' AND varClv <> '' THEN
-- SELECT vender.Folio_Venta INTO varTotal FROM vender WHERE vender.Total = pMonto;
INSERT detalle_pago VALUES (
DEFAULT,
varFolv,
varClv,
pMonto);
-- UPDATE detalle_pago SET detalle_pago.Monto=detalle_pago.Monto-pCantidad WHERE producto.Codigo=pCodigo;
SELECT 'La forma de pago fue registrada exitosamente' AS Correcto;
ELSE
SELECT 'Error en los datos' AS ErrorFatal;
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for procediDetPago
-- ----------------------------
DROP PROCEDURE IF EXISTS `procediDetPago`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procediDetPago`(
pClv_Depago INT,
pFolio_Venta VARCHAR(10),
pDesc VARCHAR(255),
pMonto DOUBLE)
BEGIN
DECLARE varFolv VARCHAR(10);
DECLARE varClv VARCHAR(255);
-- DECLARE varTotal DOUBLE;
SELECT '' INTO varFolv;
SELECT '' INTO varClv;
SELECT vender.Folio_Venta INTO varFolv FROM vender WHERE vender.Folio_Venta = pFolio_Venta;
SELECT forma_pago.Clv_Pago INTO varClv FROM forma_pago WHERE forma_pago.Descripcion = pDesc;
IF varFolv <> '' AND varClv <> '' THEN
-- SELECT vender.Folio_Venta INTO varTotal FROM vender WHERE vender.Total = pMonto;
INSERT detalle_pago VALUES (
pClv_DePago,
varFolv,
varClv,
pMonto);
-- UPDATE detalle_pago SET detalle_pago.Monto=detalle_pago.Monto-pCantidad WHERE producto.Codigo=pCodigo;
SELECT 'La forma de pago fue registrada exitosamente' AS Correcto;
ELSE
SELECT 'Error en los datos' AS ErrorFatal;
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for procediDevolucion
-- ----------------------------
DROP PROCEDURE IF EXISTS `procediDevolucion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procediDevolucion`(
pClv_Devolucion INT,
pClv_venta INT,
pClv_Usuario INT,
pCantidad INT,
pFecha DATE)
BEGIN
DECLARE varVenta INT;
DECLARE varUsua INT;
SELECT detalle_venta.Clv_venta INTO varVenta FROM detalle_venta WHERE detalle_venta.Clv_venta= pClv_venta;
SELECT usuario.Clv_Usuario INTO varUsua FROM usuario WHERE usuario.Clv_Usuario = pClv_Usuario;
IF varVenta = '' THEN
SELECT 'Error en los datos' AS ErrorFatal;
ELSE
INSERT devolucion VALUES (
pClv_Devolucion,
pClv_venta,
varUsua,
pCantidad,
pFecha);
SELECT 'La devolucion fue registrada exitosamente' AS Correcto;
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for procediFactura
-- ----------------------------
DROP PROCEDURE IF EXISTS `procediFactura`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procediFactura`(
pFolio_factura VARCHAR(10),
pFolio_Venta VARCHAR(10),
pRFC_Cliente VARCHAR(15),
pFecha DATE)
BEGIN
DECLARE varVenta VARCHAR(10);
DECLARE varRFC VARCHAR(15);
SELECT '' INTO varVenta;
SELECT '' INTO varRFC;
SELECT vender.Folio_Venta INTO varVenta FROM vender WHERE vender.Folio_Venta=pFolio_Venta;
SELECT cliente.RFC_Cliente INTO varRFC FROM cliente WHERE cliente.RFC_Cliente=pRFC_Cliente;
IF varVenta <> '' AND varRFC <> '' THEN
INSERT factura VALUES (
pFolio_factura,
varVenta,
varRFC,
pFecha);
SELECT 'La factura se a registrado correctamente' AS Correcto;
ELSE
SELECT 'Error, ingresa datos validos' AS Error;
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for procediFamilia
-- ----------------------------
DROP PROCEDURE IF EXISTS `procediFamilia`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procediFamilia`(
accion VARCHAR(1),
pDesc_Fam VARCHAR(255),
nuevoValor VARCHAR(255))
BEGIN
DECLARE valor VARCHAR(255);
SELECT familia.Desc_Fam INTO valor FROM familia WHERE familia.Desc_Fam = pDesc_Fam;
IF accion = 'I' THEN
IF valor = pDesc_Fam THEN
SELECT 'La Familia ya fue registrada con anterioridad' AS Error;
ELSE 
INSERT familia VALUES (DEFAULT,pDesc_Fam);
SELECT 'La familia se registro con exito' AS Correcto;
END IF;
SELECT familia.Desc_Fam INTO nuevoValor FROM familia WHERE familia.Desc_Fam = pDesc_Fam;
ELSEIF nuevoValor = NULL THEN
SELECT 'Ingresa datos validos' AS Error;
ELSE 
UPDATE familia SET familia.Desc_Fam = nuevoValor WHERE familia.Desc_Fam = pDesc_Fam;
SELECT 'Se actualizo correctamente' AS Correcto;
END IF;
-- END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for procediForPago
-- ----------------------------
DROP PROCEDURE IF EXISTS `procediForPago`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procediForPago`(
pDescripcion VARCHAR(255))
BEGIN
DECLARE varDesc VARCHAR(255);
SELECT '' INTO varDesc;
SELECT forma_pago.Descripcion INTO varDesc FROM forma_pago WHERE forma_pago.Descripcion = pDescripcion;
IF varDesc = pDescripcion THEN
SELECT 'Error algo no salio bien' AS Error;
ELSE
INSERT forma_pago VALUES (
DEFAULT,
pDescripcion);
SELECT 'La forma de pago se registro exitosamente' AS Correcto;
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for procedimientMarca
-- ----------------------------
DROP PROCEDURE IF EXISTS `procedimientMarca`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedimientMarca`(pDesc_Marca VARCHAR(255),nuevoValor VARCHAR(255))
BEGIN
DECLARE val VARCHAR(255);
DECLARE accion VARCHAR(1);
IF accion = 'I' THEN
SELECT marca.Desc_Marca INTO val FROM marca WHERE marca.Desc_Marca = pDesc_Marca;-- Asigamos valor a la variable val y la comparamos
IF val = pDesc_Marca OR nuevoValor = pDesc_Marca THEN-- <> significa diferente
SELECT 'Error la marca ya existe en la Base de Datos' AS Mensaje_Error;
ELSE
INSERT marca VALUES (DEFAULT,pDesc_Marca);
SELECT 'La marca fue registrada exitosamente' AS Mensaje;-- El select sirve para mostrar lo que queramos
END IF;
SELECT marca.Desc_Marca INTO nuevoValor FROM marca WHERE marca.Desc_Marca = pDesc_Marca;
ELSEIF nuevoValor = NULL THEN
SELECT 'Error debes ingresar otro dato' AS Error;
ELSE
UPDATE marca SET marca.Desc_Marca = nuevoValor WHERE marca.Desc_Marca = pDesc_Marca;
SELECT 'Actualizado' AS Informacion;
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for procedimientoMarca
-- ----------------------------
DROP PROCEDURE IF EXISTS `procedimientoMarca`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedimientoMarca`(pAccion VARCHAR(1), pDesc_Marca VARCHAR(255), nuevoValor VARCHAR(255))
BEGIN
DECLARE val VARCHAR(255);
IF accion = 'I' THEN
SELECT marca.Desc_Marca INTO val FROM marca WHERE marca.Desc_Marca = pDesc_Marca;-- Asigamos valor a la variable val y la comparamos
IF val = pDesc_Marca OR nuevoValor = pDesc_Marca THEN-- <> significa diferente
SELECT 'Error la marca ya existe en la Base de Datos' AS Mensaje_Error;
ELSE
INSERT marca VALUES (DEFAULT,pDesc_Marca);
SELECT 'La marca fue registrada exitosamente' AS Mensaje;-- El select sirve para mostrar lo que queramos
END IF;
SELECT marca.Desc_Marca INTO nuevoValor FROM marca WHERE marca.Desc_Marca = pDesc_Marca;
ELSEIF nuevoValor = NULL THEN
SELECT 'Error debes ingresar otro dato' AS Error;
ELSE
UPDATE marca SET marca.Desc_Marca = nuevoValor WHERE marca.Desc_Marca = pDesc_Marca;
SELECT 'Actualizado' AS Informacion;
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for procediPresentacion
-- ----------------------------
DROP PROCEDURE IF EXISTS `procediPresentacion`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procediPresentacion`(
-- accion VARCHAR(1),
pDesc_Pres VARCHAR(255),
nuevoValor VARCHAR(255))
BEGIN
DECLARE val VARCHAR(255);
-- IF accion = 'I' THEN
SELECT presentacion.Desc_Pres INTO val FROM presentacion WHERE presentacion.Desc_Pres = pDesc_Pres;
IF val = pDesc_Pres OR nuevoValor = pDesc_Pres THEN
SELECT 'Error la marca ya existe en la Base de Datos' AS Mensaje_Error;
ELSE
INSERT presentacion VALUES (DEFAULT,pDesc_Pres);
SELECT 'La marca fue registrada exitosamente' AS Correcto;
END IF;
SELECT presentacion.Desc_Pres INTO nuevoValor FROM presentacion WHERE presentacion.Desc_Pres = pDesc_Pres;
IF nuevoValor = pDesc_Pres THEN
UPDATE presentacion SET presentacion.Desc_Pres = nuevoValor WHERE presentacion.Desc_Pres = pDesc_Pres;
SELECT 'Actualizado' AS Actualizacion_Correcta;
ELSE
SELECT 'Error debes ingresar otro dato' AS Error;
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for procediUsuario
-- ----------------------------
DROP PROCEDURE IF EXISTS `procediUsuario`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procediUsuario`(
pClv_Usuario INT,
pNombre	VARCHAR(255),
pcontrasenia VARCHAR(8),
pDescripcion VARCHAR(255))
BEGIN
DECLARE val VARCHAR(255);
SELECT cargo.Clv_Cargo INTO val FROM cargo WHERE cargo.Descripcion = pDescripcion;
IF val = pNombre THEN
SELECT 'Error el Usuario ya existe en la Base de Datos' AS Mensaje_Error;
ELSE
INSERT usuario VALUES (
pClv_Usuario,
pNombre,
pcontrasenia,
val);
SELECT 'El usuario se a registrado correctamente' AS Correcto;
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for procedProveedor
-- ----------------------------
DROP PROCEDURE IF EXISTS `procedProveedor`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedProveedor`(
pRFC VARCHAR(15),
pRazon_Social VARCHAR (255),
pProveedor	VARCHAR(255),
pDireccion VARCHAR(255),
pTelefono VARCHAR(255),
pCorreo_Ele VARCHAR(255))
BEGIN
DECLARE varRFC VARCHAR(15);
SELECT '' INTO varRFC ;
SELECT proveedor.RFC INTO varRFC FROM proveedor WHERE proveedor.RFC = pRFC;
IF varRFC = pRFC THEN
SELECT 'Error, El RFC ingresado ya se encuentra Registrado' AS Error;
ELSE 
INSERT proveedor VALUES (
pRFC,
pRazon_Social,
pProveedor,
pDireccion,
pTelefono,
pCorreo_Ele);
SELECT 'Proveedor registrado' AS Correcto;
END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for venta
-- ----------------------------
DROP PROCEDURE IF EXISTS `venta`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `venta`(
pFolio_Venta VARCHAR(10),
pFecha Date,
pNombre VARCHAR(255),
pTotal DOUBLE)
BEGIN
DECLARE nFolio_Venta VARCHAR(10);
DECLARE varUsuario INT;
SELECT '' INTO nFolio_Venta;
-- ELECT '' INTO varUsuario;
SELECT vender.Folio_venta INTO nFolio_Venta FROM vender WHERE vender.Folio_venta = pFolio_Venta;
SELECT usuario.Clv_Usuario INTO varUsuario FROM usuario WHERE usuario.Nombre = pNombre;
IF nFolio_Venta = pFolio_Venta THEN
SELECT 'Esta venta ya esta registrada' AS Error;
ELSE
IF varUsuario <> '' THEN
INSERT vender VALUES(
pFolio_Venta,
pFecha,
varUsuario,
pTotal);
SELECT 'Venta exitosa' AS Mensaje;
ELSE
SELECT 'Usuario invalido' AS Error;
END IF;
END IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `VentaProducto`;
DELIMITER ;;
CREATE TRIGGER `VentaProducto` AFTER INSERT ON `detalle_venta` FOR EACH ROW BEGIN
UPDATE producto SET producto.existencia = producto.existencia - NEW.cantidad WHERE producto.codigo = NEW.codigo;
UPDATE vender SET vender.Total=(SELECT SUM(detalle_venta.Cantidad*detalle_venta.Precio_venta) FROM detalle_venta WHERE detalle_venta.Folio_Venta=NEW.Folio_Venta)
WHERE vender.Folio_Venta=NEW.Folio_Venta;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `Actualizar`;
DELIMITER ;;
CREATE TRIGGER `Actualizar` AFTER UPDATE ON `detalle_venta` FOR EACH ROW BEGIN
UPDATE producto SET producto.Existencia=producto.Existencia+OLD.Cantidad+NEW.Cantidad WHERE producto.codigo=NEW.codigo;
UPDATE vender SET vender.Total=(SELECT SUM(detalle_venta.Cantidad*detalle_venta.Precio_venta) FROM detalle_venta WHERE detalle_venta.Folio_Venta=NEW.Folio_Venta)
WHERE vender.Folio_Venta=NEW.Folio_Venta;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `Eliminar`;
DELIMITER ;;
CREATE TRIGGER `Eliminar` AFTER DELETE ON `detalle_venta` FOR EACH ROW BEGIN
UPDATE producto SET producto.existencia=producto.existencia+OLD.cantidad WHERE producto.codigo=OLD.codigo;
UPDATE vender SET vender.Total=((SELECT SUM(detalle_venta.Cantidad*detalle_venta.Precio_venta) FROM detalle_venta WHERE detalle_venta.Folio_Venta=OLD.Folio_Venta))
WHERE vender.Folio_Venta=OLD.Folio_Venta;
END
;;
DELIMITER ;
