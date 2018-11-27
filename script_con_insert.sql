-- MySQL Script generated by MySQL Workbench
-- mar 27 nov 2018 16:39:18 WET
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS mydb DEFAULT CHARACTER SET utf8 ;
USE mydb ;

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
  PRIMARY KEY (cod_laboratorio))
ENGINE = InnoDB;


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
  INDEX fk_Medicamento_1_idx (cod_laboratorio ASC),
  UNIQUE INDEX fk_Medicamento_unq_idx (cod_medicamento ASC),
  CONSTRAINT fk_Medicamento_1
    FOREIGN KEY (cod_laboratorio)
    REFERENCES mydb.Laboratorio (cod_laboratorio)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table mydb.Familia
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.Familia (
  nombre_familia VARCHAR(45) NOT NULL,
  cod_medicamento INT NOT NULL,
  PRIMARY KEY (nombre_familia, cod_medicamento),
  INDEX fk_cod_med_idx (cod_medicamento ASC),
  CONSTRAINT fk_cod_med
    FOREIGN KEY (cod_medicamento)
    REFERENCES mydb.Medicamento (cod_medicamento)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table mydb.Compra
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.Compra (
  cod_factura INT NOT NULL,
  cod_medicamento INT NOT NULL,
  instante_compra TIMESTAMP NULL,
  PRIMARY KEY (cod_factura, cod_medicamento),
  INDEX fk_cod_med2_idx (cod_medicamento ASC),
  UNIQUE INDEX fk_cod_fact_unq_idx (cod_factura ASC),
  CONSTRAINT fk_cod_med2
    FOREIGN KEY (cod_medicamento)
    REFERENCES mydb.Medicamento (cod_medicamento)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


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
  INDEX fk_Compra_Cliente_Credito_1_idx (cod_factura ASC),
  CONSTRAINT fk_Compra_Cliente_Credito_1
    FOREIGN KEY (cod_factura)
    REFERENCES mydb.Compra (cod_factura)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


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
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table mydb.Laboratorio
-- -----------------------------------------------------
START TRANSACTION;
USE mydb;
INSERT INTO mydb.Laboratorio (cod_laboratorio, nombre_laboratorio, tlf_laboratorio, contacto_laboratorio, dir_laboratorio, fax_laboratorio) VALUES (1, 'Bayer', 235738265, 'Juan Manuel', 'Calle de San Rafael', 736253849);
INSERT INTO mydb.Laboratorio (cod_laboratorio, nombre_laboratorio, tlf_laboratorio, contacto_laboratorio, dir_laboratorio, fax_laboratorio) VALUES (2, 'Econature', 956253876, 'María', 'Calle Doctor Esquerdo', 826389163);
INSERT INTO mydb.Laboratorio (cod_laboratorio, nombre_laboratorio, tlf_laboratorio, contacto_laboratorio, dir_laboratorio, fax_laboratorio) VALUES (3, 'Biomedipharma', 123654375, 'Javier', 'Calle Collado Mediano', 982555387);

COMMIT;


-- -----------------------------------------------------
-- Data for table mydb.Medicamento
-- -----------------------------------------------------
START TRANSACTION;
USE mydb;
INSERT INTO mydb.Medicamento (cod_medicamento, cod_laboratorio, nombre_medicamento, precio_medicamento, stock, ventas_medicamento, receta, Tipo) VALUES (0, 1, 'Paracetamol', 3, 2500, 3500, 0, 'comprimido');
INSERT INTO mydb.Medicamento (cod_medicamento, cod_laboratorio, nombre_medicamento, precio_medicamento, stock, ventas_medicamento, receta, Tipo) VALUES (1, 1, 'Loratadina', 5, 7865, 4894, 0, 'jarabe');
INSERT INTO mydb.Medicamento (cod_medicamento, cod_laboratorio, nombre_medicamento, precio_medicamento, stock, ventas_medicamento, receta, Tipo) VALUES (2, 2, 'Ibuprofeno', 5, 66699, 20000, 1, 'comprimido');
INSERT INTO mydb.Medicamento (cod_medicamento, cod_laboratorio, nombre_medicamento, precio_medicamento, stock, ventas_medicamento, receta, Tipo) VALUES (3, 3, 'Bisolvon', 8, 7654, 34555, 0, 'jarabe');

COMMIT;


-- -----------------------------------------------------
-- Data for table mydb.Familia
-- -----------------------------------------------------
START TRANSACTION;
USE mydb;
INSERT INTO mydb.Familia (nombre_familia, cod_medicamento) VALUES ('Analgésicos', 0);
INSERT INTO mydb.Familia (nombre_familia, cod_medicamento) VALUES ('Antialérgicos', 1);
INSERT INTO mydb.Familia (nombre_familia, cod_medicamento) VALUES ('Antiinflamatorios', 2);
INSERT INTO mydb.Familia (nombre_familia, cod_medicamento) VALUES ('Antitusivos', 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table mydb.Compra
-- -----------------------------------------------------
START TRANSACTION;
USE mydb;
INSERT INTO mydb.Compra (cod_factura, cod_medicamento, instante_compra) VALUES (0, 0, '2018-03-13 13:23:12');
INSERT INTO mydb.Compra (cod_factura, cod_medicamento, instante_compra) VALUES (1, 1, '2018-06-01 8:30:23');
INSERT INTO mydb.Compra (cod_factura, cod_medicamento, instante_compra) VALUES (2, 2, '2018-11-03 20:46:10');
INSERT INTO mydb.Compra (cod_factura, cod_medicamento, instante_compra) VALUES (3, 3, '2018-01-22 23:23:48');

COMMIT;


-- -----------------------------------------------------
-- Data for table mydb.Compra_Cliente_Credito
-- -----------------------------------------------------
START TRANSACTION;
USE mydb;
INSERT INTO mydb.Compra_Cliente_Credito (dni, cod_factura, nombre_cliente, tlf_cliente, datos_bancarios, fecha_cobro, total_gastado) VALUES ('86256734S', 0, 'Yeray Expñosito García', 345234678, 'ES2784639937163826378927', '2018-11-23', 150);
INSERT INTO mydb.Compra_Cliente_Credito (dni, cod_factura, nombre_cliente, tlf_cliente, datos_bancarios, fecha_cobro, total_gastado) VALUES ('98762436D', 1, 'Sergio Ravelo Vegino', 834762478, 'ES2362739898127619285163', '2019-01-17', 80);
INSERT INTO mydb.Compra_Cliente_Credito (dni, cod_factura, nombre_cliente, tlf_cliente, datos_bancarios, fecha_cobro, total_gastado) VALUES ('67329045H', 2, 'María Isabel Pérez Sosa', 865184766, 'ES8261563981383782643636', '2019-02-23', 230);

COMMIT;


-- -----------------------------------------------------
-- Data for table mydb.Factura
-- -----------------------------------------------------
START TRANSACTION;
USE mydb;
INSERT INTO mydb.Factura (cod_factura, cod_medicamento, cantidad_comprada) VALUES (0, 0, 2);
INSERT INTO mydb.Factura (cod_factura, cod_medicamento, cantidad_comprada) VALUES (1, 1, 1);
INSERT INTO mydb.Factura (cod_factura, cod_medicamento, cantidad_comprada) VALUES (2, 2, 3);
INSERT INTO mydb.Factura (cod_factura, cod_medicamento, cantidad_comprada) VALUES (3, 3, 3);

COMMIT;

