
CREATE SCHEMA IF NOT EXISTS mydb;

-- -----------------------------------------------------
-- Table mydb.Laboratorio
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.Laboratorio (
  cod_laboratorio INT NOT NULL,
  nombre_laboratorio VARCHAR(45) NULL,
  tlf_laboratorio INT NULL,
  contacto_laboratorio VARCHAR(45) NULL,
  dir_laboratorio VARCHAR(45) NULL,
  fax_laboratorio INT NULL,
  PRIMARY KEY (cod_laboratorio));


-- -----------------------------------------------------
-- Table mydb.Medicamento
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.Medicamento (
  cod_medicamento INT NOT NULL,
  cod_laboratorio INT NOT NULL,
  nombre_medicamento VARCHAR(45) NULL,
  precio_medicamento INT NULL,
  stock INT NULL,
  ventas_medicamento INT NULL,
  receta SMALLINT NULL,
  Tipo VARCHAR(45) NULL,
  PRIMARY KEY (cod_medicamento, cod_laboratorio),
  CONSTRAINT fk_Medicamento_1
    FOREIGN KEY (cod_laboratorio)
    REFERENCES mydb.Laboratorio (cod_laboratorio)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE INDEX fk_Medicamento_1_idx ON mydb.Medicamento(cod_laboratorio ASC);
CREATE UNIQUE INDEX fk_Medicamento_unq_idx ON mydb.Medicamento(cod_medicamento ASC);

-- -----------------------------------------------------
-- Table mydb.Familia
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.Familia (
  nombre_familia VARCHAR(45) NOT NULL,
  cod_medicamento INT NOT NULL,
  PRIMARY KEY (nombre_familia, cod_medicamento),
  CONSTRAINT fk_cod_med
    FOREIGN KEY (cod_medicamento)
    REFERENCES mydb.Medicamento (cod_medicamento)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE INDEX fk_cod_med_idx ON mydb.Familia(cod_medicamento ASC);

-- -----------------------------------------------------
-- Table mydb.Compra
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.Compra (
  cod_factura INT NOT NULL,
  cod_medicamento INT NOT NULL,
  instante_compra TIMESTAMP NULL,
  PRIMARY KEY (cod_factura, cod_medicamento),
  CONSTRAINT fk_cod_med2
    FOREIGN KEY (cod_medicamento)
    REFERENCES mydb.Medicamento (cod_medicamento)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE INDEX fk_cod_med2_idx ON mydb.Compra(cod_medicamento ASC);
CREATE UNIQUE INDEX fk_cod_fact_unq_idx ON mydb.Compra(cod_factura ASC);

-- -----------------------------------------------------
-- Table mydb.Compra_Cliente_Credito
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.Compra_Cliente_Credito (
  dni VARCHAR(9) NOT NULL,
  cod_factura INT NOT NULL,
  nombre_cliente VARCHAR(45) NULL,
  tlf_cliente INT NULL,
  datos_bancarios VARCHAR(45) NULL,
  fecha_cobro DATE NULL,
  total_gastado INT NULL,
  PRIMARY KEY (dni, cod_factura),
  CONSTRAINT fk_Compra_Cliente_Credito_1
    FOREIGN KEY (cod_factura)
    REFERENCES mydb.Compra (cod_factura)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE INDEX fk_Compra_Cliente_Credito_1_idx ON mydb.Compra_Cliente_Credito(cod_factura ASC);
-- -----------------------------------------------------
-- Table mydb.Factura
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.Factura (
  cod_factura INT NOT NULL,
  cod_medicamento INT NOT NULL,
  cantidad_comprada INT NULL,
  PRIMARY KEY (cod_factura, cod_medicamento),
  CONSTRAINT fk_Factura_1
    FOREIGN KEY (cod_factura)
    REFERENCES mydb.Compra (cod_factura)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Data for table mydb.Laboratorio
-- -----------------------------------------------------

INSERT INTO mydb.Laboratorio (cod_laboratorio, nombre_laboratorio, tlf_laboratorio, contacto_laboratorio, dir_laboratorio, fax_laboratorio) VALUES (1, 'Bayer', 235738265, 'Juan Manuel', 'Calle de San Rafael', 736253849);
INSERT INTO mydb.Laboratorio (cod_laboratorio, nombre_laboratorio, tlf_laboratorio, contacto_laboratorio, dir_laboratorio, fax_laboratorio) VALUES (2, 'Econature', 956253876, 'María', 'Calle Doctor Esquerdo', 826389163);
INSERT INTO mydb.Laboratorio (cod_laboratorio, nombre_laboratorio, tlf_laboratorio, contacto_laboratorio, dir_laboratorio, fax_laboratorio) VALUES (3, 'Biomedipharma', 123654375, 'Javier', 'Calle Collado Mediano', 982555387);

COMMIT;


-- -----------------------------------------------------
-- Data for table mydb.Medicamento
-- -----------------------------------------------------

INSERT INTO mydb.Medicamento (cod_medicamento, cod_laboratorio, nombre_medicamento, precio_medicamento, stock, ventas_medicamento, receta, Tipo) VALUES (0, 1, 'Paracetamol', 3, 2500, 3500, 0, 'comprimido');
INSERT INTO mydb.Medicamento (cod_medicamento, cod_laboratorio, nombre_medicamento, precio_medicamento, stock, ventas_medicamento, receta, Tipo) VALUES (1, 1, 'Loratadina', 5, 7865, 4894, 0, 'jarabe');
INSERT INTO mydb.Medicamento (cod_medicamento, cod_laboratorio, nombre_medicamento, precio_medicamento, stock, ventas_medicamento, receta, Tipo) VALUES (2, 2, 'Ibuprofeno', 5, 66699, 20000, 1, 'comprimido');
INSERT INTO mydb.Medicamento (cod_medicamento, cod_laboratorio, nombre_medicamento, precio_medicamento, stock, ventas_medicamento, receta, Tipo) VALUES (3, 3, 'Bisolvon', 8, 7654, 34555, 0, 'jarabe');



-- -----------------------------------------------------
-- Data for table mydb.Familia
-- -----------------------------------------------------

INSERT INTO mydb.Familia (nombre_familia, cod_medicamento) VALUES ('Analgésicos', 0);
INSERT INTO mydb.Familia (nombre_familia, cod_medicamento) VALUES ('Antialérgicos', 1);
INSERT INTO mydb.Familia (nombre_familia, cod_medicamento) VALUES ('Antiinflamatorios', 2);
INSERT INTO mydb.Familia (nombre_familia, cod_medicamento) VALUES ('Antitusivos', 3);



-- -----------------------------------------------------
-- Data for table mydb.Compra
-- -----------------------------------------------------

INSERT INTO mydb.Compra (cod_factura, cod_medicamento, instante_compra) VALUES (0, 0, '2018-03-13 13:23:12');
INSERT INTO mydb.Compra (cod_factura, cod_medicamento, instante_compra) VALUES (1, 1, '2018-06-01 8:30:23');
INSERT INTO mydb.Compra (cod_factura, cod_medicamento, instante_compra) VALUES (2, 2, '2018-11-03 20:46:10');
INSERT INTO mydb.Compra (cod_factura, cod_medicamento, instante_compra) VALUES (3, 3, '2018-01-22 23:23:48');



-- -----------------------------------------------------
-- Data for table mydb.Compra_Cliente_Credito
-- -----------------------------------------------------

INSERT INTO mydb.Compra_Cliente_Credito (dni, cod_factura, nombre_cliente, tlf_cliente, datos_bancarios, fecha_cobro, total_gastado) VALUES ('86256734S', 0, 'Yeray Expñosito García', 345234678, 'ES2784639937163826378927', '2018-11-23', 150);
INSERT INTO mydb.Compra_Cliente_Credito (dni, cod_factura, nombre_cliente, tlf_cliente, datos_bancarios, fecha_cobro, total_gastado) VALUES ('98762436D', 1, 'Sergio Ravelo Vegino', 834762478, 'ES2362739898127619285163', '2019-01-17', 80);
INSERT INTO mydb.Compra_Cliente_Credito (dni, cod_factura, nombre_cliente, tlf_cliente, datos_bancarios, fecha_cobro, total_gastado) VALUES ('67329045H', 2, 'María Isabel Pérez Sosa', 865184766, 'ES8261563981383782643636', '2019-02-23', 230);



-- -----------------------------------------------------
-- Data for table mydb.Factura
-- -----------------------------------------------------

INSERT INTO mydb.Factura (cod_factura, cod_medicamento, cantidad_comprada) VALUES (0, 0, 2);
INSERT INTO mydb.Factura (cod_factura, cod_medicamento, cantidad_comprada) VALUES (1, 1, 1);
INSERT INTO mydb.Factura (cod_factura, cod_medicamento, cantidad_comprada) VALUES (2, 2, 3);
INSERT INTO mydb.Factura (cod_factura, cod_medicamento, cantidad_comprada) VALUES (3, 3, 3);




