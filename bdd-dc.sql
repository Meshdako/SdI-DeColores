SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


CREATE DATABASE IF NOT EXISTS `decolores` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `decolores`;

 DROP TABLE IF EXISTS `usuarios`;
 CREATE TABLE IF NOT EXISTS `usuarios`
 (
 	`nom_usuario` varchar(50) COLLATE utf8_bin NOT NULL,
 	`password` varchar(50) COLLATE utf8_bin NOT NULL
 ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `bancos`;
CREATE TABLE IF NOT EXISTS `bancos`
(
	`cod_ban` int(11) NOT NULL AUTO_INCREMENT,
	`nom_ban` varchar(45) COLLATE utf8_bin NOT NULL,
	PRIMARY KEY (`cod_ban`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `tipo_cuenta`;
CREATE TABLE IF NOT EXISTS `tipo_cuenta`
(
	`cod_tipcuen` int(11) NOT NULL AUTO_INCREMENT,
	`tipo_cuen` varchar(15) COLLATE utf8_bin NOT NULL,
	PRIMARY KEY (`cod_tipcuen`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `prov`;
CREATE TABLE IF NOT EXISTS `prov`
(	`rut_empresa` varchar(10) COLLATE utf8_bin NOT NULL,
	`nom_empresa` varchar(50) COLLATE utf8_bin NOT NULL,
	`raz_soc` varchar(50) COLLATE utf8_bin NOT NULL,
	PRIMARY KEY (`rut_empresa`)
)ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `cuenta`;
CREATE TABLE IF NOT EXISTS `cuenta`
(
	`cod_cuen` int(11) NOT NULL AUTO_INCREMENT,
	`rut_empresa` varchar(10) COLLATE utf8_bin NOT NULL,
	`cod_ban` int(11) DEFAULT NULL,
	`cod_tipcuen` int(11) DEFAULT NULL,
	`num_cuen` bigint DEFAULT NULL,
	`rut_asoc` varchar(10) COLLATE utf8_bin NOT NULL,
	`titu_cuen` varchar(30) COLLATE utf8_bin NOT NULL,
	`email_cuen` varchar(30) COLLATE utf8_bin NOT NULL,
	PRIMARY KEY (`cod_cuen`),
	KEY `rut_empresa_idx` (`rut_empresa`),
	KEY `cod_ban_idx` (`cod_ban`),
	KEY `cod_tipcuen_idx` (`cod_tipcuen`)
	) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias`
(
	`cod_cat` int(11) NOT NULL AUTO_INCREMENT,
	`cat_prod` varchar(20) COLLATE utf8_bin NOT NULL,
	PRIMARY KEY (`cod_cat`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `subcat`;
CREATE TABLE IF NOT EXISTS `subcat`
(
	`cod_subcat` int(11) NOT NULL AUTO_INCREMENT,
	`sub_cat_prod` varchar(20) COLLATE utf8_bin NOT NULL,
	PRIMARY KEY (`cod_subcat`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos`
(
	`cod_prod` varchar(30) COLLATE utf8_bin NOT NULL,
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

DROP TABLE IF EXISTS `genero`;
CREATE TABLE IF NOT EXISTS `genero`
(
	`cod_gen` int(11) NOT NULL AUTO_INCREMENT,
	`genero` varchar(1) COLLATE utf8_bin NOT NULL,
	PRIMARY KEY (`cod_gen`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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

DROP TABLE IF EXISTS `reg_prodvend`;
CREATE TABLE IF NOT EXISTS `reg_prodvend`
(
	`cod_regprodvend` int(11) NOT NULL AUTO_INCREMENT,
	`cod_prod` varchar(30) COLLATE utf8_bin NOT NULL,
	`cod_comven` int DEFAULT NULL,
	PRIMARY KEY (`cod_regprodvend`),
	KEY `cod_prod_idx` (`cod_prod`),
	KEY `cod_comven_idx` (`cod_comven`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `clase_numcont`;
CREATE TABLE IF NOT EXISTS `clase_numcont`
(
	`cod_cncon` int(11) NOT NULL AUTO_INCREMENT,
	`clase_numcon` varchar(10) COLLATE utf8_bin NOT NULL,
	PRIMARY KEY (`cod_cncon`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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

DROP TABLE IF EXISTS `abono`;
CREATE TABLE IF NOT EXISTS `abono`
(
	`cod_abono` int(11) NOT NULL AUTO_INCREMENT,
	`fecha_abono` DATE DEFAULT NULL,
	`abono_serv`  int DEFAULT NULL,
	PRIMARY KEY (`cod_abono`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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

DROP TABLE IF EXISTS `categoria_serv`;
CREATE TABLE IF NOT EXISTS `categoria_serv`
(
	`cod_catserv` int(11) NOT NULL AUTO_INCREMENT,
	`cat_serv` varchar(10) COLLATE utf8_bin NOT NULL,
	PRIMARY KEY (`cod_catserv`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

DROP TABLE IF EXISTS `servicios`;
CREATE TABLE IF NOT EXISTS `servicios`
(
	`cod_serv` int(11) NOT NULL AUTO_INCREMENT,
	`cod_catserv` int DEFAULT NULL,
	`nom_serv` varchar(50) COLLATE utf8_bin NOT NULL,
	PRIMARY KEY (`cod_serv`),
	KEY `cod_catserv_idx` (`cod_catserv`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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


-- INSERT INTO `usuarios` VALUES (`admin`, `1234`);

INSERT INTO `tipo_cuenta` VALUES (1, `Corriente`);
INSERT INTO `tipo_cuenta` VALUES (2, `Vista`);

INSERT INTO `bancos` VALUES (1, `Banco Estado`);
INSERT INTO `bancos` VALUES (2, `Banco BBVA`);
INSERT INTO `bancos` VALUES (3, `Banco BCI`);
INSERT INTO `bancos` VALUES (4, `Banco de Chile`);
INSERT INTO `bancos` VALUES (5, `Banco Santander`);

INSERT INTO `prov` VALUES (`90656486-2`, `Cordeles del Buen Arturo`, `Cordeles A s.a`);
INSERT INTO `prov` VALUES (`96745770-9`, `Textiles Do�a Lana`, `Hilos Bernardo ltda`);
INSERT INTO `prov` VALUES (`92457126-8`, `Textiles Poderosos`, `Textiles Joaquin s.a`);
INSERT INTO `prov` VALUES (`89894986-2`, `ACME`, `Repuestos ACME ltda`);
INSERT INTO `prov` VALUES (`98456712-3`, `Artesania Marchant`, `Artes March Santana ltda`);

INSERT INTO `cuenta` VALUES (1, `90656486-2`, 3, 1,  5057362487177253, `24319345-1`, `Arturo Merino Martinez`, `CordelesArturo@hotmail.cl`);
INSERT INTO `cuenta` VALUES (2, `96745770-9`, 5, 2,  4533872279673425, `19881653-1`, `Bernardo Gomez Pe�a`, `Bgomez@gmail.com`);
INSERT INTO `cuenta` VALUES (3, `92457126-8`, 1, 2,  8057332487177652, `13205061-9`, `Joaquin Soto del Pozo`, `JoaSPozo_1998@outlook.com`);
INSERT INTO `cuenta` VALUES (4, `89894986-2`, 4, 1,  1533874299673845, `12934987-5`, `Fernando Camiroaga Fernandez`, `Felipito_2011@hotmail.com`);
INSERT INTO `cuenta` VALUES (5, `98456712-3`, 2, 2,  9533874269673145, `14626321-6`, `Ricardo Marchant Santana`, `Ricky.m_San@yahoo.com`);

INSERT INTO `emails` VALUES (1, `90656486-2`, `CordelesArturo`, `hotmail.cl`);
INSERT INTO `emails` VALUES (2, `96745770-9`, `Bgomez`, `gmail.com`);
INSERT INTO `emails` VALUES (3, `92457126-8`, `JoaSPozo_1998`, `outlook.com`); 
INSERT INTO `emails` VALUES (4, `89894986-2`, `Felipito_2011`, `hotmail.com`);
INSERT INTO `emails` VALUES (5, `98456712-3`, `Ricky.m_San`, `yahoo.com`);

INSERT INTO `vende_compra` VALUES (1, `90656486-2`, 1257, 2390, `01-09-2019`, 10);
INSERT INTO `vende_compra` VALUES (2, `96745770-9`, 1354, 10470, `13-05-2019`, 15);
INSERT INTO `vende_compra` VALUES (3, `92457126-8`, 6859, 19990, `18-10-2019`, 10);
INSERT INTO `vende_compra` VALUES (4, `89894986-2`, 4726, 1890, `20-01-2020`, 40);
INSERT INTO `vende_compra` VALUES (5, `98456712-3`, 4215, 2450, `24-12-2019`, 25);

INSERT INTO `categorias` VALUES (1, `Producto`);
INSERT INTO `categorias` VALUES (2, `Insumo`);

INSERT INTO `subcat` VALUES (1, `Textil`);
INSERT INTO `subcat` VALUES (2, `Repuesto`);
INSERT INTO `subcat` VALUES (3, `Artesan�a`);

INSERT INTO `productos` VALUES (1, 1, 1, 3500, 10, 3, `Cordel Trenzado Plus`);
INSERT INTO `productos` VALUES (2, 2, 1, 13000, 15, 5, `Hilo de coser blanco de 5 m`);
INSERT INTO `productos` VALUES (3, 2, 1, 3000, 10, 3, `Terciopelo Azul Marino`);
INSERT INTO `productos` VALUES (4, 2, 2, 2990, 40, 7, `Repuesto Brother Puntera`);
INSERT INTO `productos` VALUES (5, 1, 3, 4000, 25, 6, `Marco de Madera`);

INSERT INTO `reg_prodadq` VALUES (1, 1, 1); 
INSERT INTO `reg_prodadq` VALUES (2, 2, 2);
INSERT INTO `reg_prodadq` VALUES (3, 3, 3);
INSERT INTO `reg_prodadq` VALUES (4, 4, 4);
INSERT INTO `reg_prodadq` VALUES (5, 5, 5);

INSERT INTO `genero` VALUES (1, `M`);
INSERT INTO `genero` VALUES (2, `F`);
INSERT INTO `genero` VALUES (3, `O`);

INSERT INTO `cliente` VALUES (`12397564-2`, 1, `Juanito Valdez`, `02-04-1990`); 
INSERT INTO `cliente` VALUES (`12233404-k`, 2, `Natal�a Valdebenito`, `03-09-1986`);
INSERT INTO `cliente` VALUES (`7707770-7`, 3, `Ra�l Allende`, `23-06-1953`);
INSERT INTO `cliente` VALUES (`24473347-6`, 2, `Salvador Pinochet`, `05-06-1970`);
INSERT INTO `cliente` VALUES (`6654831-7`, 1, `Samuel de Luque`, `31-07-1989`);

INSERT INTO `compra_vend` VALUES (1, `12397564-2`, 75315, `01-07-2020`, 7500);
INSERT INTO `compra_vend` VALUES (2, `12233404-k`, 74832, `12-04-2020`, 5450);
INSERT INTO `compra_vend` VALUES (3, `7707770-7`, 65482, `06-05-2020`, 12500);
INSERT INTO `compra_vend` VALUES (4, `24473347-6`, 21548, `01-02-2020`, 20000);
INSERT INTO `compra_vend` VALUES (5, `6654831-7`, 36951, `29-07-2020`, 13500);

INSERT INTO `reg_prodvend` VALUES (1, 1, 1);
INSERT INTO `reg_prodvend` VALUES (2, 2, 2);
INSERT INTO `reg_prodvend` VALUES (3, 3, 3);
INSERT INTO `reg_prodvend` VALUES (4, 4, 4);
INSERT INTO `reg_prodvend` VALUES (5, 5, 5);

INSERT INTO `clase_numcont` VALUES (1, `Celular`);
INSERT INTO `clase_numcont` VALUES (2, `Fijo`);

INSERT INTO `tel_prov` VALUES (1, `90656486-2`, 2, 262154759);
INSERT INTO `tel_prov` VALUES (2, `96745770-9`, 1, 975312486);
INSERT INTO `tel_prov` VALUES (3, `92457126-8`, 1, 942563425);
INSERT INTO `tel_prov` VALUES (4, `89894986-2`, 2, 248574185);
INSERT INTO `tel_prov` VALUES (5, `98456712-3`, 1, 932146785);

INSERT INTO `tel_cliente` VALUES (1, `12397564-2`, 1, 912547823);
INSERT INTO `tel_cliente` VALUES (2, `12233404-k`, 1, 912465785);
INSERT INTO `tel_cliente` VALUES (3, `7707770-7`, 1, 912475369);
INSERT INTO `tel_cliente` VALUES (4, `24473347-6`, 1, 995484752);
INSERT INTO `tel_cliente` VALUES (5, `6654831-7`, 1, 932565874);

INSERT INTO `abono` VALUES (1, `01-07-2020`, 3000);
INSERT INTO `abono` VALUES (2, `12-04-2020`, 2180);
INSERT INTO `abono` VALUES (3, `06-05-2020`, 5000);
INSERT INTO `abono` VALUES (4, `01-02-2020`, 8000);
INSERT INTO `abono` VALUES (5, `29-07-2020`, 5400);

INSERT INTO `contra_ofrecen` VALUES (1, `12397564-2`, 1, 75315, `01-07-2020`, `15-07-2020`, 7500);
INSERT INTO `contra_ofrecen` VALUES (2, `12233404-k`, 2, 74832, `12-04-2020`, `27-04-2020`, 5450);
INSERT INTO `contra_ofrecen` VALUES (3, `7707770-7`, 3, 65482, `06-05-2020`, `21-04-2020`, 12500);
INSERT INTO `contra_ofrecen` VALUES (4, `24473347-6`, 4, 21548, `01-02-2020`, `16-02-2020`, 20000);
INSERT INTO `contra_ofrecen` VALUES (5, `6654831-7`, 5, 36951, `29-07-2020`, `14-08-2020`, 13500);

INSERT INTO `categoria_serv` VALUES (1, `Costura`);
INSERT INTO `categoria_serv` VALUES (2, `Bordado`);

INSERT INTO `servicios` VALUES (1, 1, `Costura emblema en pantal�n color negro`);
INSERT INTO `servicios` VALUES (2, 2, `Bordado pa�uelo rosado`);
INSERT INTO `servicios` VALUES (3, 1, `Arreglo mantel de comedor`);
INSERT INTO `servicios` VALUES (4, 2, `Dise�o de caricatura polerones 4to a�o medio`);
INSERT INTO `servicios` VALUES (5, 1, `Costura emblema liceo en poleras`);

INSERT INTO `reg_servicio` VALUES (1, 1, 1);
INSERT INTO `reg_servicio` VALUES (2, 2, 2);
INSERT INTO `reg_servicio` VALUES (3, 3, 3);
INSERT INTO `reg_servicio` VALUES (4, 4, 4);
INSERT INTO `reg_servicio` VALUES (5, 5, 5);