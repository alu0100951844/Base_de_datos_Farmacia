
CREATE SCHEMA IF NOT EXISTS mydb;

-- -----------------------------------------------------
-- Table mydb.Laboratorio
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.Laboratorio (
  cod_laboratorio INT NOT NULL,
  nombre_laboratorio VARCHAR(45) NULL,
  tlf_laboratorio INT(9) NULL,
  contacto_laboratorio VARCHAR(45) NULL,
  dir_laboratorio VARCHAR(45) NULL,
  fax_laboratorio INT(9) NULL,
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
  receta TINYINT(1) NULL,
  Tipo VARCHAR(45) NULL,
  PRIMARY KEY (cod_medicamento, cod_laboratorio),
  CONSTRAINT fk_Medicamento_1
    FOREIGN KEY (cod_laboratorio)
    REFERENCES mydb.Laboratorio (cod_laboratorio)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

 CREATE INDEX fk_Medicamento_1_idx ON mydb.Medicamento(cod_laboratorio ASC);

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
  instante_compra DATETIME NULL,
  PRIMARY KEY (cod_factura, cod_medicamento),
  CONSTRAINT fk_cod_med2
    FOREIGN KEY (cod_medicamento)
    REFERENCES mydb.Medicamento (cod_medicamento)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE INDEX fk_cod_med2_idx ON mydb.Compra(cod_medicamento ASC);
-- -----------------------------------------------------
-- Table mydb.Compra_Cliente_Credito
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.Compra_Cliente_Credito (
  dni VARCHAR(9) NOT NULL,
  cod_factura INT NOT NULL,
  nombre_cliente VARCHAR(45) NULL,
  tlf_cliente INT(9) NULL,
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

