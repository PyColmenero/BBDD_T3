-- File name: C:\Users\pycol\Documents\linuxt3.sql
-- Created by yo


--
-- Table structure for table `Seguros`
--

CREATE TABLE `Seguros` (
  `idSeguro` INT NOT NULL  AUTO_INCREMENT,
  `precioSeguro` INT NULL DEFAULT NULL,
  `cubrimientoSeguro` TEXT NULL,
  PRIMARY KEY (`idSeguro` ASC)
) DEFAULT CHARSET=utf8 ENGINE=InnoDB;

--
-- Table structure for table `Clientes`
--

CREATE TABLE `Clientes` (
  `idCliente` INT NOT NULL  AUTO_INCREMENT,
  `nombreCliente` VARCHAR(45) NULL DEFAULT NULL,
  `apellido1Cliente` VARCHAR(45) NULL DEFAULT NULL,
  `apellido2Cliente` VARCHAR(45) NULL DEFAULT NULL,
  `dniCliente` INT NULL DEFAULT NULL,
  `tlfCliente` INT NULL DEFAULT NULL,
  `mailCliente` VARCHAR(145) NULL DEFAULT NULL,
  `domicilioCliente` VARCHAR(145) NULL DEFAULT NULL,
  PRIMARY KEY (`idCliente` ASC)
) DEFAULT CHARSET=utf8 ENGINE=InnoDB;

--
-- Table structure for table `Empleados`
--

CREATE TABLE `Empleados` (
  `idEmpleado` INT NOT NULL  AUTO_INCREMENT,
  `nombreEmpleado` VARCHAR(45) NULL DEFAULT NULL,
  `apellido1Empleado` VARCHAR(45) NULL DEFAULT NULL,
  `apellido2Empleado` VARCHAR(45) NULL DEFAULT NULL,
  `dniEmpleado` VARCHAR(9) NULL DEFAULT NULL,
  `tlfEmpleado` VARCHAR(9) NULL DEFAULT NULL,
  `mailEmpleado` TEXT NULL,
  `domicilioEmpleado` TEXT NULL,
  `idJefeFK` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idEmpleado` ASC)
) DEFAULT CHARSET=utf8 ENGINE=InnoDB;

--
-- Table structure for table `SegurosVoluntarios`
--

CREATE TABLE `SegurosVoluntarios` (
  `idSeguroVoluntario` INT NOT NULL,
  `duracionSeguroVoluntario` INT NULL DEFAULT NULL,
  `idSeguroFK` INT NULL DEFAULT NULL,
  `idEmpleadoFK` INT NULL DEFAULT NULL,
  `idClienteFK` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idSeguroVoluntario` ASC),
  CONSTRAINT `FK_SegurosVoluntarios_Seguros` FOREIGN KEY (`idSeguroFK`) REFERENCES `Seguros` (`idSeguro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SegurosVoluntarios_Empleados` FOREIGN KEY (`idEmpleadoFK`) REFERENCES `Empleados` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SegurosVoluntarios_Clientes` FOREIGN KEY (`idClienteFK`) REFERENCES `Clientes` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) DEFAULT CHARSET=utf8 ENGINE=InnoDB;

--
-- Table structure for table `SegurosObligatorios`
--

CREATE TABLE `SegurosObligatorios` (
  `idSeguroObligatorio` INT NOT NULL  AUTO_INCREMENT,
  `requisitosSeguroObligatorio` TEXT NULL,
  `idSeguroFK` INT NULL DEFAULT NULL,
  `idClienteFK` INT NULL DEFAULT NULL,
  `idEmpleadoFK` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idSeguroObligatorio` ASC),
  CONSTRAINT `FK_Seguros_Voluntarios_Seguros` FOREIGN KEY (`idSeguroFK`) REFERENCES `Seguros` (`idSeguro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Seguros_Voluntarios_Clientes` FOREIGN KEY (`idClienteFK`) REFERENCES `Clientes` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Seguros_Voluntarios_Empleados` FOREIGN KEY (`idEmpleadoFK`) REFERENCES `Empleados` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION
) DEFAULT CHARSET=utf8 ENGINE=InnoDB;
