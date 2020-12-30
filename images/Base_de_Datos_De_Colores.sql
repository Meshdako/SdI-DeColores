CREATE DATABASE decolores;
GO

USE decolores;

CREATE TABLE bancos
(
	cod_ban INT PRIMARY KEY,
	nom_ban VARCHAR(20)
);

CREATE TABLE tipo_cuenta
(
	cod_tipcuen INT PRIMARY KEY,
	tipo_cuen VARCHAR(15)
);

CREATE TABLE prov
(	rut_empresa VARCHAR(10) PRIMARY KEY,
	nom_empresa VARCHAR(50),
	raz_soc VARCHAR(50)
);

CREATE TABLE cuenta
(
	cod_cuen INT PRIMARY KEY,
	rut_empresa VARCHAR(10) FOREIGN KEY REFERENCES prov(rut_empresa),
	cod_ban INT FOREIGN KEY REFERENCES bancos(cod_ban),
	cod_tipcuen INT FOREIGN KEY REFERENCES tipo_cuenta(cod_tipcuen),
	num_cuen BIGINT,
	rut_asoc VARCHAR(10),
	titu_cuen VARCHAR(30),
	email_cuen VARCHAR(30)
);

CREATE TABLE emails
(
	cod_emails INT PRIMARY KEY,
	rut_empresa VARCHAR(10) FOREIGN KEY REFERENCES prov(rut_empresa),
	email_cont VARCHAR(30),
	dom_email VARCHAR(20)
);

CREATE TABLE vende_compra
(
	cod_vencom INT PRIMARY KEY,
	rut_empresa VARCHAR(10) FOREIGN KEY REFERENCES prov(rut_empresa),
	num_fact INT,
	prec_adqui INT,
	fecha_adqui DATE,
	cant_prod INT
);

CREATE TABLE categorias
(
	cod_cat INT PRIMARY KEY,
	cat_prod VARCHAR(20)
);

CREATE TABLE subcat
(
	cod_subcat INT PRIMARY KEY,
	sub_cat_prod VARCHAR(50)
);

CREATE TABLE productos
(
	cod_prod VARCHAR(30) PRIMARY KEY,
	cod_cat INT FOREIGN KEY REFERENCES categorias(cod_cat),
	cod_subcat INT FOREIGN KEY REFERENCES subcat(cod_subcat),
	prec_vent INT,
	stock_tot INT,
	sala INT,
	nom_prod VARCHAR(50)
);

CREATE TABLE reg_prodadq
(
	cod_regprodadq INT PRIMARY KEY,
	cod_prod VARCHAR(30) FOREIGN KEY REFERENCES productos(cod_prod),
	cod_vencom INT FOREIGN KEY REFERENCES vende_compra(cod_vencom)
);

CREATE TABLE genero
(
	cod_gen INT PRIMARY KEY,
	genero VARCHAR(1)
);

CREATE TABLE cliente
(
	rut_cliente VARCHAR(10) PRIMARY KEY,
	cod_gen INT FOREIGN KEY REFERENCES genero(cod_gen),
	nom_cliente VARCHAR(30),
	fecha_nac DATE
);

CREATE TABLE compra_vend
(
	cod_comven INT PRIMARY KEY,
	rut_cliente VARCHAR(10) FOREIGN KEY REFERENCES cliente(rut_cliente),
	num_bol INT,
	fecha_com DATE,
	cant_prod INT
);

CREATE TABLE reg_prodvend
(
	cod_regprodvend INT PRIMARY KEY,
	cod_prod VARCHAR(30) FOREIGN KEY REFERENCES productos(cod_prod),
	cod_comven INT FOREIGN KEY REFERENCES compra_vend(cod_comven)
);

CREATE TABLE clase_numcont
(
	cod_cncon INT PRIMARY KEY,
	clase_numcon VARCHAR(10)
);

CREATE TABLE tel_prov
(
	cod_telprov INT PRIMARY KEY,
	rut_empresa VARCHAR(10) FOREIGN KEY REFERENCES prov(rut_empresa),
	cod_cncon INT FOREIGN KEY REFERENCES clase_numcont(cod_cncon),
	num_telprov INT
);

CREATE TABLE tel_cliente
(
	cod_telcliente INT PRIMARY KEY,
	rut_cliente VARCHAR(10) FOREIGN KEY REFERENCES cliente(rut_cliente),
	cod_cncon INT FOREIGN KEY REFERENCES clase_numcont(cod_cncon),
	num_telcliente INT
);

CREATE TABLE abono
(
	cod_abono INT PRIMARY KEY,
	fecha_abono DATE,
	abono_serv INT
);

CREATE TABLE contra_ofrecen
(
	cod_contraofre INT PRIMARY KEY,
	rut_cliente VARCHAR(10) FOREIGN KEY REFERENCES cliente(rut_cliente),
	cod_abono INT FOREIGN KEY REFERENCES abono(cod_abono),
	num_bol INT,
	fecha_inicio DATE,
	fecha_termino DATE,
	prec_acord INT
);

CREATE TABLE categoria_serv
(
	cod_catserv INT PRIMARY KEY,
	cat_serv VARCHAR(30)
);

CREATE TABLE servicios
(
	cod_serv INT PRIMARY KEY,
	cod_catserv INT FOREIGN KEY REFERENCES categoria_serv(cod_catserv),
	nom_serv VARCHAR(50)
);

CREATE TABLE reg_servicio
(
	cod_regserv INT PRIMARY KEY,
	cod_serv INT FOREIGN KEY REFERENCES servicios(cod_serv),
	cod_contraofre INT FOREIGN KEY REFERENCES contra_ofrecen(cod_contraofre)
);


SET DATEFORMAT dmy;
GO
	INSERT INTO tipo_cuenta VALUES (1, 'Corriente');
	INSERT INTO tipo_cuenta VALUES (2, 'Vista');
	
	INSERT INTO bancos VALUES (1, 'Banco Estado');
	INSERT INTO bancos VALUES (2, 'Banco BBVA');
	INSERT INTO bancos VALUES (3, 'Banco BCI');
	INSERT INTO bancos VALUES (4, 'Banco de Chile');
	INSERT INTO bancos VALUES (5, 'Banco Santander');

	INSERT INTO prov VALUES ('90656486-2', 'Cordeles del Buen Arturo', 'Cordeles A s.a');
	INSERT INTO prov VALUES ('96745770-9', 'Textiles Doña Lana', 'Hilos Bernardo ltda');
	INSERT INTO prov VALUES ('92457126-8', 'Textiles Poderosos', 'Textiles Joaquin s.a');
	INSERT INTO prov VALUES ('89894986-2', 'ACME', 'Repuestos ACME ltda');
	INSERT INTO prov VALUES ('98456712-3', 'Artesania Marchant', 'Artes March Santana ltda');

	INSERT INTO cuenta VALUES (1, '90656486-2', 3, 1,  5057362487177253, '24319345-1', 'Arturo Merino Martinez', 'CordelesArturo@hotmail.cl');
 	INSERT INTO cuenta VALUES (2, '96745770-9', 5, 2,  4533872279673425, '19881653-1', 'Bernardo Gomez Peña', 'Bgomez@gmail.com');
	INSERT INTO cuenta VALUES (3, '92457126-8', 1, 2,  8057332487177652, '13205061-9', 'Joaquin Soto del Pozo', 'JoaSPozo_1998@outlook.com');
 	INSERT INTO cuenta VALUES (4, '89894986-2', 4, 1,  1533874299673845, '12934987-5', 'Fernando Camiroaga Fernandez', 'Felipito_2011@hotmail.com');
 	INSERT INTO cuenta VALUES (5, '98456712-3', 2, 2,  9533874269673145, '14626321-6', 'Ricardo Marchant Santana', 'Ricky.m_San@yahoo.com');

	INSERT INTO emails VALUES (1, '90656486-2', 'CordelesArturo', 'hotmail.cl');
	INSERT INTO emails VALUES (2, '96745770-9', 'Bgomez', 'gmail.com');
	INSERT INTO emails VALUES (3, '92457126-8', 'JoaSPozo_1998', 'outlook.com'); 
	INSERT INTO emails VALUES (4, '89894986-2', 'Felipito_2011', 'hotmail.com');
	INSERT INTO emails VALUES (5, '98456712-3', 'Ricky.m_San', 'yahoo.com');

	INSERT INTO vende_compra VALUES (1, '90656486-2', 1257, 2390, '01-09-2019', 10);
	INSERT INTO vende_compra VALUES (2, '96745770-9', 1354, 10470, '13-05-2019', 15);
	INSERT INTO vende_compra VALUES (3, '92457126-8', 6859, 19990, '18-10-2019', 10);
	INSERT INTO vende_compra VALUES (4, '89894986-2', 4726, 1890, '20-01-2020', 40);
	INSERT INTO vende_compra VALUES (5, '98456712-3', 4215, 2450, '24-12-2019', 25);

	INSERT INTO categorias VALUES (1, 'Producto');
	INSERT INTO categorias VALUES (2, 'Insumo');

	INSERT INTO subcat VALUES (1, 'Textil');
	INSERT INTO subcat VALUES (2, 'Repuesto');
	INSERT INTO subcat VALUES (3, 'Artesanía');

	INSERT INTO productos VALUES (1, 1, 1, 3500, 10, 3, 'Cordel Trenzado Plus');
	INSERT INTO productos VALUES (2, 2, 1, 13000, 15, 5, 'Hilo de coser blanco de 5 m');
	INSERT INTO productos VALUES (3, 2, 1, 3000, 10, 3, 'Terciopelo Azul Marino');
	INSERT INTO productos VALUES (4, 2, 2, 2990, 40, 7, 'Repuesto Brother Puntera');
	INSERT INTO productos VALUES (5, 1, 3, 4000, 25, 6, 'Marco de Madera');

	INSERT INTO reg_prodadq VALUES (1, 1, 1); 
	INSERT INTO reg_prodadq VALUES (2, 2, 2);
	INSERT INTO reg_prodadq VALUES (3, 3, 3);
	INSERT INTO reg_prodadq VALUES (4, 4, 4);
	INSERT INTO reg_prodadq VALUES (5, 5, 5);

	INSERT INTO genero VALUES (1, 'M');
	INSERT INTO genero VALUES (2, 'F');
	INSERT INTO genero VALUES (3, 'O');

	INSERT INTO cliente VALUES ('12397564-2', 1, 'Juanito Valdez', '02-04-1990'); 
	INSERT INTO cliente VALUES ('12233404-k', 2, 'Natalía Valdebenito', '03-09-1986');
	INSERT INTO cliente VALUES ('7707770-7', 3, 'Raúl Allende', '23-06-1953');
	INSERT INTO cliente VALUES ('24473347-6', 2, 'Salvador Pinochet', '05-06-1970');
	INSERT INTO cliente VALUES ('6654831-7', 1, 'Samuel de Luque', '31-07-1989');

	INSERT INTO compra_vend VALUES (1, '12397564-2', 75315, '01-07-2020', 7500);
	INSERT INTO compra_vend VALUES (2, '12233404-k', 74832, '12-04-2020', 5450);
	INSERT INTO compra_vend VALUES (3, '7707770-7', 65482, '06-05-2020', 12500);
	INSERT INTO compra_vend VALUES (4, '24473347-6', 21548, '01-02-2020', 20000);
	INSERT INTO compra_vend VALUES (5, '6654831-7', 36951, '29-07-2020', 13500);

	INSERT INTO reg_prodvend VALUES (1, 1, 1);
	INSERT INTO reg_prodvend VALUES (2, 2, 2);
	INSERT INTO reg_prodvend VALUES (3, 3, 3);
	INSERT INTO reg_prodvend VALUES (4, 4, 4);
	INSERT INTO reg_prodvend VALUES (5, 5, 5);

	INSERT INTO clase_numcont VALUES (1, 'Celular');
	INSERT INTO clase_numcont VALUES (2, 'Fijo');

	INSERT INTO tel_prov VALUES (1, '90656486-2', 2, 262154759);
	INSERT INTO tel_prov VALUES (2, '96745770-9', 1, 975312486);
	INSERT INTO tel_prov VALUES (3, '92457126-8', 1, 942563425);
	INSERT INTO tel_prov VALUES (4, '89894986-2', 2, 248574185);
	INSERT INTO tel_prov VALUES (5, '98456712-3', 1, 932146785);

	INSERT INTO tel_cliente VALUES (1, '12397564-2', 1, 912547823);
	INSERT INTO tel_cliente VALUES (2, '12233404-k', 1, 912465785);
	INSERT INTO tel_cliente VALUES (3, '7707770-7', 1, 912475369);
	INSERT INTO tel_cliente VALUES (4, '24473347-6', 1, 995484752);
	INSERT INTO tel_cliente VALUES (5, '6654831-7', 1, 932565874);

	INSERT INTO abono VALUES (1, '01-07-2020', 3000);
	INSERT INTO abono VALUES (2, '12-04-2020', 2180);
	INSERT INTO abono VALUES (3, '06-05-2020', 5000);
	INSERT INTO abono VALUES (4, '01-02-2020', 8000);
	INSERT INTO abono VALUES (5, '29-07-2020', 5400);

	INSERT INTO contra_ofrecen VALUES (1, '12397564-2', 1, 75315, '01-07-2020', '15-07-2020', 7500);
	INSERT INTO contra_ofrecen VALUES (2, '12233404-k', 2, 74832, '12-04-2020', '27-04-2020', 5450);
	INSERT INTO contra_ofrecen VALUES (3, '7707770-7', 3, 65482, '06-05-2020', '21-04-2020', 12500);
	INSERT INTO contra_ofrecen VALUES (4, '24473347-6', 4, 21548, '01-02-2020', '16-02-2020', 20000);
	INSERT INTO contra_ofrecen VALUES (5, '6654831-7', 5, 36951, '29-07-2020', '14-08-2020', 13500);

	INSERT INTO categoria_serv VALUES (1, 'Costura');
	INSERT INTO categoria_serv VALUES (2, 'Bordado');

	INSERT INTO servicios VALUES (1, 1, 'Costura emblema en pantalón color negro');
	INSERT INTO servicios VALUES (2, 2, 'Bordado pañuelo rosado');
	INSERT INTO servicios VALUES (3, 1, 'Arreglo mantel de comedor');
	INSERT INTO servicios VALUES (4, 2, 'Diseño de caricatura polerones 4to año medio');
	INSERT INTO servicios VALUES (5, 1, 'Costura emblema liceo en poleras');

	INSERT INTO reg_servicio VALUES (1, 1, 1);  
	INSERT INTO reg_servicio VALUES (2, 2, 2);
	INSERT INTO reg_servicio VALUES (3, 3, 3);
	INSERT INTO reg_servicio VALUES (4, 4, 4);
	INSERT INTO reg_servicio VALUES (5, 5, 5);