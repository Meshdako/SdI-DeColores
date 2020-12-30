SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


CREATE DATABASE IF NOT EXISTS `decolores` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `decolores`;

-- TABLA DE DATOS "USUARIOS"
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios`
(
`nom_usuario` varchar(50) COLLATE utf8_bin NOT NULL,
`password` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- INGRESANDO DATOS
	INSERT INTO `usuarios` (`nom_usuario`, `password`) VALUES 
	('admin@decolores.cl', '1234');

-- TABLA DE DATOS "BANCOS"
DROP TABLE IF EXISTS `bancos`;
CREATE TABLE IF NOT EXISTS `bancos`
(
	`cod_ban` int(11) NOT NULL AUTO_INCREMENT,
	`nom_ban` varchar(45) COLLATE utf8_bin NOT NULL,
	PRIMARY KEY (`cod_ban`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- INGRESANDO DATOS EN "BANCOS"
	INSERT INTO `bancos` (`cod_ban`, `nom_ban`) VALUES 
	(1, 'Banco Estado'),
	(2, 'Banco BBVA'),
	(3, 'Banco BCI'),
	(4, 'Banco de Chile'),
	(5, 'Banco Santander');

-- TABLA DE DATOS "TIPO CUENTA"
DROP TABLE IF EXISTS `tipo_cuenta`;
CREATE TABLE IF NOT EXISTS `tipo_cuenta`
(
	`cod_tipcuen` int(11) NOT NULL AUTO_INCREMENT,
	`tipo_cuen` varchar(15) COLLATE utf8_bin NOT NULL,
	PRIMARY KEY (`cod_tipcuen`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- INGRESANDO DATOS EN "TIPO CUENTA"
	INSERT INTO `tipo_cuenta` (`cod_tipcuen`, `tipo_cuen`) VALUES 
	(1, 'Corriente'),
	(2, 'Vista');

-- TABLA DE DATOS "PROV"
DROP TABLE IF EXISTS `prov`;
CREATE TABLE IF NOT EXISTS `prov`
(	`rut_empresa` varchar(10) COLLATE utf8_bin NOT NULL,
	`nom_empresa` varchar(50) COLLATE utf8_bin NOT NULL,
	`raz_soc` varchar(50) COLLATE utf8_bin NOT NULL,
	PRIMARY KEY (`rut_empresa`)
)ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- INGRESANDO DATOS EN "PROV"
	INSERT INTO `prov` (`rut_empresa`, `nom_empresa`, `raz_soc`) VALUES 
	('90656486-2', 'Cordeles del Buen Arturo', 'Cordeles A s.a'),
	('96745770-9', 'Textiles Do�a Lana', 'Hilos Bernardo ltda'),
	('92457126-8', 'Textiles Poderosos', 'Textiles Joaquin s.a'),
	('89894986-2', 'ACME', 'Repuestos ACME ltda'),
	('98456712-3', 'Artesania Marchant', 'Artes March Santana ltda');

-- TABLA DE DATOS "CUENTA"
DROP TABLE IF EXISTS `cuenta`;
CREATE TABLE IF NOT EXISTS `cuenta`
(
	`cod_cuen` int(11) NOT NULL AUTO_INCREMENT,
	`rut_empresa` varchar(11) COLLATE utf8_bin NOT NULL,
	`cod_ban` int(11) DEFAULT NULL,
	`cod_tipcuen` int(11) DEFAULT NULL,
	`num_cuen` bigint DEFAULT NULL,
	`rut_asoc` varchar(10) COLLATE utf8_bin NOT NULL,
	`titu_cuen` varchar(40) COLLATE utf8_bin NOT NULL,
	`email_cuen` varchar(40) COLLATE utf8_bin NOT NULL,
	PRIMARY KEY (`cod_cuen`),
	KEY `rut_empresa_idx` (`rut_empresa`),
	KEY `cod_ban_idx` (`cod_ban`),
	KEY `cod_tipcuen_idx` (`cod_tipcuen`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- INGRESO DATOS "CUENTA"
	INSERT INTO `cuenta` (`cod_cuen`, `rut_empresa`, `cod_ban`, `cod_tipcuen`, `num_cuen`, `rut_asoc`, `titu_cuen`, `email_cuen`) VALUES 
	(1, '90656486-2', 3, 1,  5057362487177253, '24319345-1', 'Arturo Merino Martinez', 'CordelesArturo@hotmail.cl'),
	(2, '96745770-9', 5, 2,  4533872279673425, '19881653-1', 'Bernardo Gomez Pe�a', 'Bgomez@gmail.com'),
	(3, '92457126-8', 1, 2,  8057332487177652, '13205061-9', 'Joaquin Soto del Pozo', 'JoaSPozo_1998@outlook.com'),
	(4, '89894986-2', 4, 1,  1533874299673845, '12934987-5', 'Fernando Camiroaga Fernandez', 'Felipito_2011@hotmail.com'),
	(5, '98456712-3', 2, 2,  9533874269673145, '14626321-6', 'Ricardo Marchant Santana', 'Ricky.m_San@yahoo.com');

-- TABLA DE DATOS "EMAILS"
DROP TABLE IF EXISTS `emails`; 
CREATE TABLE IF NOT EXISTS `emails`
(
	`cod_emails` int(11) NOT NULL AUTO_INCREMENT,
	`rut_empresa` varchar(10) COLLATE utf8_bin NOT NULL,
	`email_cont` varchar(30) COLLATE utf8_bin NOT NULL,
	`dom_email` varchar(20) COLLATE utf8_bin NOT NULL,
	PRIMARY KEY (`cod_emails`),
	KEY `rut_empresa_idx` (`rut_empresa`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- INGRESO DATOS "EMAILS"
	INSERT INTO `emails` (`cod_emails`, `rut_empresa`, `email_cont`, `dom_email`) VALUES
	(1, '90656486-2', 'CordelesArturo', 'hotmail.cl'),
	(2, '96745770-9', 'Bgomez', 'gmail.com'),
	(3, '92457126-8', 'JoaSPozo_1998', 'outlook.com'), 
	(4, '89894986-2', 'Felipito_2011', 'hotmail.com'),
	(5, '98456712-3', 'Ricky.m_San', 'yahoo.com');

-- TABLA DE DATOS "VENDE COMPRA"
DROP TABLE IF EXISTS `vende_compra`;
CREATE TABLE IF NOT EXISTS `vende_compra`
(
	`cod_vencom` int(11) NOT NULL AUTO_INCREMENT,
	`rut_empresa` varchar(10) COLLATE utf8_bin NOT NULL,
	`num_fact` int DEFAULT NULL,
	`prec_adqui` int DEFAULT NULL,
	`fecha_adqui` DATE DEFAULT NULL,
	`cant_prod` int DEFAULT NULL,
	PRIMARY KEY (`cod_vencom`),
	KEY `rut_empresa_idx` (`rut_empresa`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- INGRESO DATOS "VENDE COMPRA"
	INSERT INTO `vende_compra` (`cod_vencom`, `rut_empresa`, `num_fact`, `prec_adqui`, `fecha_adqui`, `cant_prod`) VALUES
	(1, '90656486-2', 1257, 2390, '01-09-2019', 10),
	(2, '96745770-9', 1354, 10470, '13-05-2019', 15),
	(3, '92457126-8', 6859, 19990, '18-10-2019', 10),
	(4, '89894986-2', 4726, 1890, '20-01-2020', 40),
	(5, '98456712-3', 4215, 2450, '24-12-2019', 25);

-- TABLA DE DATOS "CATEGORIAS"
DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias`
(
	`cod_cat` int(11) NOT NULL AUTO_INCREMENT,
	`cat_prod` varchar(20) COLLATE utf8_bin NOT NULL,
	PRIMARY KEY (`cod_cat`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- INGRESO DATOS "CATEGORIAS"
	INSERT INTO `categorias` (`cod_cat`, `cat_prod`) VALUES
	(1, 'Producto'),
	(2, 'Insumo');

-- TABLA DE DATOS "SUBCAT"
DROP TABLE IF EXISTS `subcat`;
CREATE TABLE IF NOT EXISTS `subcat`
(
	`cod_subcat` int(11) NOT NULL AUTO_INCREMENT,
	`sub_cat_prod` varchar(20) COLLATE utf8_bin NOT NULL,
	PRIMARY KEY (`cod_subcat`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- INGRESO DATOS "CUBCAT"
	INSERT INTO `subcat` (`cod_subcat`, `sub_cat_prod`) VALUES 
	(1, 'Textil'),
	(2, 'Repuesto'),
	(3, 'Artesan�a');

-- TABLA DE DATOS "PRODUCTOS"
DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos`
(
	`cod_prod` int(11) NOT NULL AUTO_INCREMENT,
	`cod_cat` int DEFAULT NULL,
	`cod_subcat` int DEFAULT NULL,
	`prec_vent` int DEFAULT NULL,
	`stock_tot` int DEFAULT NULL,
	`sala` int DEFAULT NULL,
	`nom_prod` varchar(50) COLLATE utf8_bin NOT NULL,
	PRIMARY KEY (`cod_prod`),
	KEY `cod_cat_idx` (`cod_cat`),
	KEY `cod_subcat_idx` (`cod_subcat`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- INGRESO DATOS "PRODUCTOS"
	INSERT INTO `productos` (`cod_prod`, `cod_cat`, `cod_subcat`, `prec_vent`, `stock_tot`, `sala`, `nom_prod`) VALUES
	(1, 1, 1, 3500, 10, 3, 'Cordel Trenzado Plus'),
	(2, 2, 1, 13000, 15, 5, 'Hilo de coser blanco de 5 m'),
	(3, 2, 1, 3000, 10, 3, 'Terciopelo Azul Marino'),
	(4, 2, 2, 2990, 40, 7, 'Repuesto Brother Puntera'),
	(5, 1, 3, 4000, 25, 6, 'Marco de Madera');

-- TABLA DE DATOS "REG PRODADQ"
DROP TABLE IF EXISTS `reg_prodadq`;
CREATE TABLE IF NOT EXISTS `reg_prodadq`
(
	cod_regprodadq int(11) NOT NULL AUTO_INCREMENT,
	cod_prod varchar(30) COLLATE utf8_bin NOT NULL,
	cod_vencom int DEFAULT NULL,
	PRIMARY KEY (`cod_regprodadq`),
	KEY `cod_prod_idx` (`cod_prod`),
	KEY `cod_vencom_idx` (`cod_vencom`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- INGRESO DATOS "REG PRODADQ"
	INSERT INTO `reg_prodadq` (cod_regprodadq, cod_prod, cod_vencom) VALUES
	(1, 1, 1), 
	(2, 2, 2),
	(3, 3, 3),
	(4, 4, 4),
	(5, 5, 5);

-- TABLA DE DATOS "GENERO"
DROP TABLE IF EXISTS `genero`;
CREATE TABLE IF NOT EXISTS `genero`
(
	`cod_gen` int(11) NOT NULL AUTO_INCREMENT,
	`genero` varchar(1) COLLATE utf8_bin NOT NULL,
	PRIMARY KEY (`cod_gen`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- INGRESO DATOS "GENERO"
	INSERT INTO `genero` (`cod_gen`, `genero`) VALUES
	(1, 'M'),
	(2, 'F'),
	(3, 'O');

-- TABLA DE DATOS "CLIENTE"
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente`
(
	`rut_cliente` varchar(10) COLLATE utf8_bin NOT NULL,
	`cod_gen` int DEFAULT NULL,
	`nom_cliente` varchar(30) COLLATE utf8_bin NOT NULL,
	`fecha_nac` DATE DEFAULT NULL,
	PRIMARY KEY (`rut_cliente`),
	KEY `cod_gen_idx` (`cod_gen`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- INGRESO DATOS "CLIENTE"
	INSERT INTO `cliente` (`rut_cliente`, `cod_gen`, `nom_cliente`, `fecha_nac`) VALUES
	('12397564-2', 1, 'Juanito Valdez', '02-04-1990'), 
	('12233404-k', 2, 'Natal�a Valdebenito', '03-09-1986'),
	('7707770-7', 3, 'Ra�l Allende', '23-06-1953'),
	('24473347-6', 2, 'Salvador Pinochet', '05-06-1970'),
	('6654831-7', 1, 'Samuel de Luque', '31-07-1989');

-- TABLA DE DATOS "COMPRA VEND"
DROP TABLE IF EXISTS `compra_vend`;
CREATE TABLE IF NOT EXISTS `compra_vend`
(
	`cod_comven` int(11) NOT NULL AUTO_INCREMENT,
	`rut_cliente` varchar(10) COLLATE utf8_bin NOT NULL,
	`num_bol` int DEFAULT NULL,
	`fecha_com` DATE DEFAULT NULL,
	`cant_prod` int DEFAULT NULL,
	PRIMARY KEY (`cod_comven`),
	KEY `rut_cliente_idx` (`rut_cliente`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- INGRESO DATOS "COMPRA VEND"
	INSERT INTO `compra_vend` (`cod_comven`, `rut_cliente`, `num_bol`, `fecha_com`, `cant_prod`) VALUES
	(1, '12397564-2', 75315, '01-07-2020', 7500),
	(2, '12233404-k', 74832, '12-04-2020', 5450),
	(3, '7707770-7', 65482, '06-05-2020', 12500),
	(4, '24473347-6', 21548, '01-02-2020', 20000),
	(5, '6654831-7', 36951, '29-07-2020', 13500);

-- TABLA DE DATOS "REG PRODVEND"
DROP TABLE IF EXISTS `reg_prodvend`;
CREATE TABLE IF NOT EXISTS `reg_prodvend`
(
	`cod_regprodvend` int(11) NOT NULL AUTO_INCREMENT,
	`cod_prod` int DEFAULT NULL,
	`cod_comven` int DEFAULT NULL,
	PRIMARY KEY (`cod_regprodvend`),
	KEY `cod_prod_idx` (`cod_prod`),
	KEY `cod_comven_idx` (`cod_comven`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- INGRESO DATOS "REG PRODVEND"
	INSERT INTO `reg_prodvend` (`cod_regprodvend`, `cod_prod`, `cod_comven`) VALUES
	(1, 1, 1),
	(2, 2, 2),
	(3, 3, 3),
	(4, 4, 4),
	(5, 5, 5);

-- TABLA DE DATOS "CLASE NUMCONT"
DROP TABLE IF EXISTS `clase_numcont`;
CREATE TABLE IF NOT EXISTS `clase_numcont`
(
	`cod_cncon` int(11) NOT NULL AUTO_INCREMENT,
	`clase_numcon` varchar(10) COLLATE utf8_bin NOT NULL,
	PRIMARY KEY (`cod_cncon`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- INGRESO DATOS "CLASE NUMCONT"
	INSERT INTO `clase_numcont` (`cod_cncon`, `clase_numcon`) VALUES 
	(1, 'Celular'),
	(2, 'Fijo');

-- TABLA DE DATOS "TEL PROV"
DROP TABLE IF EXISTS `tel_prov`;
CREATE TABLE IF NOT EXISTS `tel_prov`
(
	`cod_telprov` int(11) NOT NULL AUTO_INCREMENT,
	`rut_empresa` varchar(10) COLLATE utf8_bin NOT NULL,
	`cod_cncon` int DEFAULT NULL,
	`num_telprov` INT,
	PRIMARY KEY (`cod_telprov`),
	KEY `rut_empresa_idx` (`rut_empresa`),
	KEY `cd_cncon_idx` (`cod_cncon`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- INGRESO DATOS "TEL PROV"
	INSERT INTO `tel_prov` (`cod_telprov`, `rut_empresa`, `cod_cncon`, `num_telprov`) VALUES 
	(1, '90656486-2', 2, 262154759),
	(2, '96745770-9', 1, 975312486),
	(3, '92457126-8', 1, 942563425),
	(4, '89894986-2', 2, 248574185),
	(5, '98456712-3', 1, 932146785);

-- TABLA DE DATOS "TEL CLIENTE"
DROP TABLE IF EXISTS `tel_cliente`;
CREATE TABLE IF NOT EXISTS `tel_cliente`
(
	`cod_telcliente` int(11) NOT NULL AUTO_INCREMENT,
	`rut_cliente` varchar(10) COLLATE utf8_bin NOT NULL,
	`cod_cncon` int DEFAULT NULL,
	`num_telcliente` int DEFAULT NULL,
	PRIMARY KEY (`cod_telcliente`),
	KEY `rut_cliente_idx` (`rut_cliente`),
	KEY `cod_cncon_idx` (`cod_cncon`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- INGRESO DATOS "TEL CLIENTE"
	INSERT INTO `tel_cliente` (`cod_telcliente`, `rut_cliente`, `cod_cncon`, `num_telcliente`) VALUES
	(1, '12397564-2', 1, 912547823),
	(2, '12233404-k', 1, 912465785),
	(3, '7707770-7', 1, 912475369),
	(4, '24473347-6', 1, 995484752),
	(5, '6654831-7', 1, 932565874);

-- TABLA DE DATOS "ABONO"
DROP TABLE IF EXISTS `abono`;
CREATE TABLE IF NOT EXISTS `abono`
(
	`cod_abono` int(11) NOT NULL AUTO_INCREMENT,
	`fecha_abono` DATE DEFAULT NULL,
	`abono_serv`  int DEFAULT NULL,
	PRIMARY KEY (`cod_abono`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- INGRESO DATOS "ABONO"
	INSERT INTO `abono` (`cod_abono`, `fecha_abono`, `abono_serv`) VALUES
	(1, '01-07-2020', 3000),
	(2, '12-04-2020', 2180),
	(3, '06-05-2020', 5000),
	(4, '01-02-2020', 8000),
	(5, '29-07-2020', 5400);

-- TABLA DE DATOS "CONTRA OFRECEN"
DROP TABLE IF EXISTS `contra_ofrecen`;
CREATE TABLE IF NOT EXISTS `contra_ofrecen`
(
	`cod_contraofre` int(11) NOT NULL AUTO_INCREMENT,
	`rut_cliente` varchar(10) COLLATE utf8_bin NOT NULL,
	`cod_abono` int DEFAULT NULL,
	`num_bol` int DEFAULT NULL,
	`fecha_inicio` DATE DEFAULT NULL,
	`fecha_termino` DATE DEFAULT NULL,
	`prec_acord`  int DEFAULT NULL,
	PRIMARY KEY (`cod_contraofre`),
	KEY `rut_cliente_idx` (`rut_cliente`),
	KEY `cod_abono_idx` (`cod_abono`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- INGRESO DATOS "CONTRA OFRECEN"
	INSERT INTO `contra_ofrecen` (`cod_contraofre`, `rut_cliente`, `cod_abono`, `num_bol`, `fecha_inicio`, `fecha_termino`, `prec_acord`) VALUES
	(1, '12397564-2', 1, 75315, '01-07-2020', '15-07-2020', 7500),
	(2, '12233404-k', 2, 74832, '12-04-2020', '27-04-2020', 5450),
	(3, '7707770-7', 3, 65482, '06-05-2020', '21-04-2020', 12500),
	(4, '24473347-6', 4, 21548, '01-02-2020', '16-02-2020', 20000),
	(5, '6654831-7', 5, 36951, '29-07-2020', '14-08-2020', 13500);

-- TABLA DE DATOS "CATEGORIA SERV"
DROP TABLE IF EXISTS `categoria_serv`;
CREATE TABLE IF NOT EXISTS `categoria_serv`
(
	`cod_catserv` int(11) NOT NULL AUTO_INCREMENT,
	`cat_serv` varchar(10) COLLATE utf8_bin NOT NULL,
	PRIMARY KEY (`cod_catserv`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- INGRESO DATOS "CATEGORIA SERV"
	INSERT INTO `categoria_serv` (`cod_catserv`, `cat_serv`) VALUES
	(1, 'Costura'),
	(2, 'Bordado');

-- TABLA DE DATOS "SERVICIOS"
DROP TABLE IF EXISTS `servicios`;
CREATE TABLE IF NOT EXISTS `servicios`
(
	`cod_serv` int(11) NOT NULL AUTO_INCREMENT,
	`cod_catserv` int DEFAULT NULL,
	`nom_serv` varchar(50) COLLATE utf8_bin NOT NULL,
	PRIMARY KEY (`cod_serv`),
	KEY `cod_catserv_idx` (`cod_catserv`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- INGRESO DATOS "SERVICIOS"
	INSERT INTO `servicios` (`cod_serv`, `cod_catserv`, `nom_serv`) VALUES 
	(1, 1, 'Costura emblema en pantal�n color negro'),
	(2, 2, 'Bordado pa�uelo rosado'),
	(3, 1, 'Arreglo mantel de comedor'),
	(4, 2, 'Dise�o de caricatura polerones 4to a�o medio'),
	(5, 1, 'Costura emblema liceo en poleras');

-- TABLA DE DATOS "REG SERVICIO"
DROP TABLE IF EXISTS `reg_servicio`;
CREATE TABLE IF NOT EXISTS `reg_servicio`
(
	`cod_regserv` int(11) NOT NULL AUTO_INCREMENT,
	`cod_serv` int DEFAULT NULL,
	`cod_contraofre` int DEFAULT NULL,
	PRIMARY KEY (`cod_regserv`),
	KEY `cod_serv_idx` (`cod_serv`),
	KEY `cod_contraofre_idx` (`cod_contraofre`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- INGRESO DATOS "REG SERVICIO"
	INSERT INTO `reg_servicio` (`cod_regserv`, `cod_serv`, `cod_contraofre`) VALUES
	(1, 1, 1),
	(2, 2, 2),
	(3, 3, 3),
	(4, 4, 4),
	(5, 5, 5);