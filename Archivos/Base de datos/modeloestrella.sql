/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50151
Source Host           : 127.0.0.1:3306
Source Database       : modeloestrella

Target Server Type    : MYSQL
Target Server Version : 50151
File Encoding         : 65001

Date: 2018-06-15 13:05:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dimcompra
-- ----------------------------
DROP TABLE IF EXISTS `dimcompra`;
CREATE TABLE `dimcompra` (
  `numCompra` int(11) NOT NULL AUTO_INCREMENT,
  `Clv_Detalle` int(11) DEFAULT NULL,
  `Clv_Compra` int(11) DEFAULT NULL,
  `Codigo` varchar(50) DEFAULT NULL,
  `Cantidad` double(255,0) DEFAULT NULL,
  `PrecioDeCompra` double(255,0) DEFAULT NULL,
  `Folio` varchar(20) DEFAULT NULL,
  `Total` double(255,0) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `RFC` varchar(15) DEFAULT NULL,
  `Clv_Usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`numCompra`) USING BTREE,
  KEY `ab` (`Codigo`) USING BTREE,
  KEY `da` (`RFC`) USING BTREE,
  KEY `dasqwsa` (`Clv_Usuario`) USING BTREE,
  CONSTRAINT `ab` FOREIGN KEY (`Codigo`) REFERENCES `dimproducto` (`codigo`),
  CONSTRAINT `da` FOREIGN KEY (`RFC`) REFERENCES `dimproveedor` (`RFC`),
  CONSTRAINT `dasqwsa` FOREIGN KEY (`Clv_Usuario`) REFERENCES `dimusuario` (`Clv_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of dimcompra
-- ----------------------------
INSERT INTO `dimcompra` VALUES ('1', '1', '1', '34654752342', '65', '422', 'compra1', '27430', '2017-05-01', '98S8377CV6', '1');
INSERT INTO `dimcompra` VALUES ('2', '3', '4', '32223409', '10', '280', 'compra2', '2800', '2018-05-08', 'GAPOU34GY', '2');
INSERT INTO `dimcompra` VALUES ('3', '4', '5', '7501147431113', '25', '1500', 'compra3', '37500', '2018-02-13', '98S8377CV6', '1');
INSERT INTO `dimcompra` VALUES ('4', '5', '6', '34654752342', '14', '500', 'compra6', '7000', '2017-10-10', '98S8377CV6', '2');
INSERT INTO `dimcompra` VALUES ('5', '6', '7', '7501147431113', '89', '350', 'compra7', '31150', '2018-01-23', '788WS84XS', '2');
INSERT INTO `dimcompra` VALUES ('6', '7', '8', '7501147431113', '35', '480', 'compra8', '16800', '2018-05-14', 'GAPOU34GY', '1');
INSERT INTO `dimcompra` VALUES ('7', '8', '9', '7501147431113', '45', '200', 'compra9', '9000', '2017-07-19', 'GAPOU34GY', '1');
INSERT INTO `dimcompra` VALUES ('8', '9', '10', '748512357458', '12', '100', 'compra10', '1200', '2017-05-16', 'POLOD7E4E4', '1');
INSERT INTO `dimcompra` VALUES ('9', '10', '11', '745869577477', '54', '35', 'compra11', '1890', '2017-12-19', 'ERFG4151515', '1');
INSERT INTO `dimcompra` VALUES ('10', '11', '12', '745869577477', '21', '54', 'compra12', '1134', '2018-10-10', 'ERFG4151515', '1');
INSERT INTO `dimcompra` VALUES ('11', '12', '10', '74562585265', '32', '75', 'compra10', '2400', '2017-05-16', 'POLOD7E4E4', '1');

-- ----------------------------
-- Table structure for dimfactura
-- ----------------------------
DROP TABLE IF EXISTS `dimfactura`;
CREATE TABLE `dimfactura` (
  `Folio_factura` varchar(10) NOT NULL,
  `RFC_Cliente` varchar(15) DEFAULT NULL,
  `Razon_Social` varchar(255) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`Folio_factura`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of dimfactura
-- ----------------------------
INSERT INTO `dimfactura` VALUES ('factura', 'CRPC460112U24', 'La tiendita', '2018-06-11');
INSERT INTO `dimfactura` VALUES ('factura1', 'FRSA7265378362', 'La esquinita', '2017-05-15');
INSERT INTO `dimfactura` VALUES ('factura3', 'DFGHJY4848458', 'Cliente1', '2018-11-26');
INSERT INTO `dimfactura` VALUES ('factura4', 'EDRFGHNJK747', 'Cliente2', '2018-10-17');
INSERT INTO `dimfactura` VALUES ('factura5', 'FRSA7265378362', 'La esquinita', '2018-04-28');
INSERT INTO `dimfactura` VALUES ('factura6', 'EDRFGHNJK747', 'Cliente2', '2017-11-30');
INSERT INTO `dimfactura` VALUES ('factura7', 'FRSA7265378362', 'La esquinita', '2017-08-01');

-- ----------------------------
-- Table structure for dimpago
-- ----------------------------
DROP TABLE IF EXISTS `dimpago`;
CREATE TABLE `dimpago` (
  `Clv_Depago` int(11) NOT NULL,
  `FormaPago` varchar(255) DEFAULT NULL,
  `Monto` double(255,0) DEFAULT NULL,
  PRIMARY KEY (`Clv_Depago`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of dimpago
-- ----------------------------
INSERT INTO `dimpago` VALUES ('1', 'Tarjeta de Credito', '122');
INSERT INTO `dimpago` VALUES ('2', 'Efectivo', '21');
INSERT INTO `dimpago` VALUES ('3', 'Tarjeta de Credito', '50');
INSERT INTO `dimpago` VALUES ('4', 'Tarjeta de Credito', '80');
INSERT INTO `dimpago` VALUES ('5', 'Efectivo', '125');
INSERT INTO `dimpago` VALUES ('6', 'Efectivo', '250');
INSERT INTO `dimpago` VALUES ('7', 'Efectivo', '100');
INSERT INTO `dimpago` VALUES ('8', 'Efectivo', '68');

-- ----------------------------
-- Table structure for dimproducto
-- ----------------------------
DROP TABLE IF EXISTS `dimproducto`;
CREATE TABLE `dimproducto` (
  `codigo` varchar(50) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `Precio_actual` double(255,0) DEFAULT NULL,
  `Existencia` double(255,0) DEFAULT NULL,
  `stockMax` double(255,0) DEFAULT NULL,
  `stockMin` double(255,0) DEFAULT NULL,
  `Marca` varchar(255) DEFAULT NULL,
  `Familia` varchar(255) DEFAULT NULL,
  `Presentacion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of dimproducto
-- ----------------------------
INSERT INTO `dimproducto` VALUES ('123456985887', 'Agua bonafont', 'Agua de sabores', '850', '8', '30', '3', 'Sabritas', 'Verduras', 'Caja');
INSERT INTO `dimproducto` VALUES ('13582626268', 'Ensalada de verduras', 'Diferentes tipos de verduras precosidas', '32', '50', '420', '30', 'Herdez', 'Envutidos', 'Lata');
INSERT INTO `dimproducto` VALUES ('32223409', 'Sabritas', 'Papas con picante', '10', '45', '3', '1', 'Tia rosa', 'Jugos y bebidas', 'Botella');
INSERT INTO `dimproducto` VALUES ('34654752342', 'Coca-Cola', 'Refresco de 600 mlts', '15', '42', '130', '6', 'Bonafont', 'Pan', 'Bolsa');
INSERT INTO `dimproducto` VALUES ('45236988742', 'Jumex Mango', 'Jugo de sabor mango', '10', '47', '100', '8', 'Jumex', 'Jugos y bebidas', 'Botella');
INSERT INTO `dimproducto` VALUES ('74562585265', 'Lechuga', 'Piensa empaquetada de lechuga', '11', '51', '500', '20', 'Herdez', 'Verduras', 'Bolsa');
INSERT INTO `dimproducto` VALUES ('745869577477', 'Marianitas', 'Galletas de harina de maiz', '12', '5', '50', '3', 'Gamesa', 'Comida', 'Botella');
INSERT INTO `dimproducto` VALUES ('748512357458', 'Chiles enlatados', 'Chiles en vinagre', '12', '28', '200', '10', 'La costeña', 'Envutidos', 'Lata');
INSERT INTO `dimproducto` VALUES ('7501147431113', 'barra Nutritiva', 'Barra de granola, miel arroz inflado', '15', '35', '100', '10', 'Quaqer', 'Pan', 'Botella');

-- ----------------------------
-- Table structure for dimproveedor
-- ----------------------------
DROP TABLE IF EXISTS `dimproveedor`;
CREATE TABLE `dimproveedor` (
  `RFC` varchar(15) NOT NULL,
  `Razon_Social` varchar(255) DEFAULT NULL,
  `Proveedor` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`RFC`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of dimproveedor
-- ----------------------------
INSERT INTO `dimproveedor` VALUES ('74SW4748E4', 'Herdez Mexico', 'Herdez');
INSERT INTO `dimproveedor` VALUES ('788WS84XS', 'Grupo Bimbo', 'Bimbo');
INSERT INTO `dimproveedor` VALUES ('8856387787|', 'Grupo jumex', 'Jumex');
INSERT INTO `dimproveedor` VALUES ('98S8377CV6', 'Bona', 'Bonafont');
INSERT INTO `dimproveedor` VALUES ('ERFG4151515', 'La costeña mexico', 'La Costeña');
INSERT INTO `dimproveedor` VALUES ('GAPOU34GY', 'PepsiCo Mexico', 'Gamesa');
INSERT INTO `dimproveedor` VALUES ('POLOD7E4E4', 'Sabritas Mexico', 'Sabritas');

-- ----------------------------
-- Table structure for dimusuario
-- ----------------------------
DROP TABLE IF EXISTS `dimusuario`;
CREATE TABLE `dimusuario` (
  `Clv_Usuario` int(11) NOT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `Cargo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Clv_Usuario`) USING BTREE,
  KEY `Clv_Usuario` (`Clv_Usuario`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of dimusuario
-- ----------------------------
INSERT INTO `dimusuario` VALUES ('1', 'Navi', 'Cajero');
INSERT INTO `dimusuario` VALUES ('2', 'Ismael', 'Gerente');

-- ----------------------------
-- Table structure for dimventa
-- ----------------------------
DROP TABLE IF EXISTS `dimventa`;
CREATE TABLE `dimventa` (
  `clvVenta` int(11) NOT NULL AUTO_INCREMENT,
  `Clv_venta` int(11) DEFAULT NULL,
  `Folio_Venta` varchar(255) DEFAULT NULL,
  `Codigo` varchar(50) DEFAULT NULL,
  `Cantidad` double(255,0) DEFAULT NULL,
  `Precio_venta` double(255,0) DEFAULT NULL,
  `Total` double(255,0) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Clv_Depago` int(11) DEFAULT NULL,
  `Folio_factura` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`clvVenta`) USING BTREE,
  KEY `qq` (`Codigo`) USING BTREE,
  KEY `a` (`Folio_factura`) USING BTREE,
  KEY `assss` (`Clv_Depago`) USING BTREE,
  CONSTRAINT `a` FOREIGN KEY (`Folio_factura`) REFERENCES `dimfactura` (`Folio_factura`),
  CONSTRAINT `assss` FOREIGN KEY (`Clv_Depago`) REFERENCES `dimpago` (`Clv_Depago`),
  CONSTRAINT `qq` FOREIGN KEY (`Codigo`) REFERENCES `dimproducto` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of dimventa
-- ----------------------------
INSERT INTO `dimventa` VALUES ('1', '1', 'venta1', '34654752342', '4', '12', '48', '2017-04-18', '1', 'factura1');
INSERT INTO `dimventa` VALUES ('3', '2', 'venta2', '32223409', '1', '21', '21', '2018-06-11', '3', 'factura');
INSERT INTO `dimventa` VALUES ('4', '3', 'venta3', '45236988742', '3', '20', '60', '2018-06-08', '4', 'factura3');
INSERT INTO `dimventa` VALUES ('5', '4', 'venta4', '7501147431113', '8', '12', '96', '2017-07-20', '5', 'factura4');
INSERT INTO `dimventa` VALUES ('6', '5', 'venta5', '748512357458', '2', '25', '50', '2017-11-29', '6', 'factura5');
INSERT INTO `dimventa` VALUES ('7', '6', 'venta6', '745869577477', '5', '12', '60', '2018-11-13', '7', 'factura6');
INSERT INTO `dimventa` VALUES ('8', '7', 'Venta7', '74562585265', '9', '5', '45', '2018-09-26', '8', 'factura7');
