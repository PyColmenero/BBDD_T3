-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2021 at 12:15 PM
-- Server version: 8.0.23
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `seguros_php`
--

-- --------------------------------------------------------

--
-- Table structure for table `clientes`
--

CREATE TABLE `clientes` (
  `idCliente` int NOT NULL,
  `nombreCliente` varchar(45) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `apellido1Cliente` varchar(45) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `apellido2Cliente` varchar(45) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `dniCliente` varchar(9) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `tlfCliente` varchar(9) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `mailCliente` varchar(150) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `domicilioCliente` varchar(150) COLLATE utf8mb4_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Dumping data for table `clientes`
--

INSERT INTO `clientes` (`idCliente`, `nombreCliente`, `apellido1Cliente`, `apellido2Cliente`, `dniCliente`, `tlfCliente`, `mailCliente`, `domicilioCliente`) VALUES
(1, 'María', 'Xin', 'Gil', '38572947K', '682658299', 'mariaxinxin@gmail.com', 'Pizzeria Santa Clara'),
(2, 'Victor', 'Rosado', 'Hoyos', '88472947F', '682749299', 'avemaria22@gmail.com', 'Calle San Pedro');

-- --------------------------------------------------------

--
-- Table structure for table `empleados`
--

CREATE TABLE `empleados` (
  `idEmpleado` int NOT NULL,
  `nombreEmpleado` varchar(45) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `apellido1Empleado` varchar(45) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `apellido2Empleado` varchar(45) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `dniEmpleado` varchar(9) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `tlfEmpleado` int DEFAULT NULL,
  `mailEmpleado` varchar(255) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `domicilioEmpleado` varchar(255) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `idJefeFK` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Dumping data for table `empleados`
--

INSERT INTO `empleados` (`idEmpleado`, `nombreEmpleado`, `apellido1Empleado`, `apellido2Empleado`, `dniEmpleado`, `tlfEmpleado`, `mailEmpleado`, `domicilioEmpleado`, `idJefeFK`) VALUES
(1, 'Lucas', 'Don Aire', 'Chamorro', '38497555R', 954732839, 'lucasin@gmail.com', 'Av. Pueblo Saharaui, 7A, 7B, 41008 Sevilla', 2),
(2, 'Alba', 'Romero', 'Aguilar', '36475829O', 946233990, 'studiumnostudium@gmail.com', 'Rambla de Espinar nº892', 1);

-- --------------------------------------------------------

--
-- Table structure for table `seguros`
--

CREATE TABLE `seguros` (
  `idSeguro` int NOT NULL,
  `precioSeguro` int DEFAULT NULL,
  `cubrimientoSeguro` varchar(255) COLLATE utf8mb4_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Dumping data for table `seguros`
--

INSERT INTO `seguros` (`idSeguro`, `precioSeguro`, `cubrimientoSeguro`) VALUES
(1, 370, 'Choques por exceso de velocidad'),
(2, 720000, 'todooOoOooOo');

-- --------------------------------------------------------

--
-- Table structure for table `seguros_obligatorios`
--

CREATE TABLE `seguros_obligatorios` (
  `idSeguroObligatorio` int NOT NULL,
  `requisitosSeguroObligatorio` varchar(255) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `idSeguroFK` int DEFAULT NULL,
  `idClienteFK` int DEFAULT NULL,
  `idEmpleadoFK` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Dumping data for table `seguros_obligatorios`
--

INSERT INTO `seguros_obligatorios` (`idSeguroObligatorio`, `requisitosSeguroObligatorio`, `idSeguroFK`, `idClienteFK`, `idEmpleadoFK`) VALUES
(1, 'Tener 3 piernas', 17, 1580, 2),
(2, 'parar balas con los ojos', 12, 902, 91);

-- --------------------------------------------------------

--
-- Table structure for table `seguros_voluntarios`
--

CREATE TABLE `seguros_voluntarios` (
  `idSeguroVoluntario` int NOT NULL,
  `duracionSeguroVoluntario` int DEFAULT NULL,
  `idSeguroFK` int DEFAULT NULL,
  `idEmpleadoFK` int DEFAULT NULL,
  `idClienteFK` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Dumping data for table `seguros_voluntarios`
--

INSERT INTO `seguros_voluntarios` (`idSeguroVoluntario`, `duracionSeguroVoluntario`, `idSeguroFK`, `idEmpleadoFK`, `idClienteFK`) VALUES
(1, 12, 27, 93, 26),
(2, 36, 38, 190, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indexes for table `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`idEmpleado`);

--
-- Indexes for table `seguros`
--
ALTER TABLE `seguros`
  ADD PRIMARY KEY (`idSeguro`);

--
-- Indexes for table `seguros_obligatorios`
--
ALTER TABLE `seguros_obligatorios`
  ADD PRIMARY KEY (`idSeguroObligatorio`);

--
-- Indexes for table `seguros_voluntarios`
--
ALTER TABLE `seguros_voluntarios`
  ADD PRIMARY KEY (`idSeguroVoluntario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idCliente` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `empleados`
--
ALTER TABLE `empleados`
  MODIFY `idEmpleado` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `seguros`
--
ALTER TABLE `seguros`
  MODIFY `idSeguro` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `seguros_obligatorios`
--
ALTER TABLE `seguros_obligatorios`
  MODIFY `idSeguroObligatorio` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `seguros_voluntarios`
--
ALTER TABLE `seguros_voluntarios`
  MODIFY `idSeguroVoluntario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
