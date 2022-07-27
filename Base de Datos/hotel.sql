-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-07-2022 a las 03:06:00
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hotel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cancelacion`
--

CREATE TABLE `cancelacion` (
  `id` int(11) NOT NULL,
  `fechaCancelacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `cancelacion`:
--

--
-- Volcado de datos para la tabla `cancelacion`
--

INSERT INTO `cancelacion` (`id`, `fechaCancelacion`) VALUES
(1, '2022-06-21 16:57:23'),
(2, '2022-07-22 16:57:23'),
(3, '2022-07-23 16:57:23'),
(4, '2022-07-24 16:57:23'),
(5, '2022-07-25 16:57:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consumo`
--

CREATE TABLE `consumo` (
  `id` int(11) NOT NULL,
  `cantidadComida` varchar(25) NOT NULL,
  `precio` decimal(9,2) NOT NULL,
  `TotalApagar` decimal(9,2) NOT NULL,
  `idServicio` int(11) NOT NULL,
  `idReserva` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `consumo`:
--   `idServicio`
--       `servicio` -> `id`
--   `idReserva`
--       `reservacion` -> `id`
--

--
-- Volcado de datos para la tabla `consumo`
--

INSERT INTO `consumo` (`id`, `cantidadComida`, `precio`, `TotalApagar`, `idServicio`, `idReserva`) VALUES
(1, 'Dos Hamburguesas', '95.00', '220.00', 8, 54),
(2, '1 Pizza', '200.00', '260.00', 10, 53),
(3, '3 Ensaladas italianas', '80.00', '300.00', 9, 52),
(4, 'Tres Huevos Divorciados', '75.00', '350.00', 8, 51),
(5, 'Una ensalada de frutas', '40.00', '150.00', 7, 50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id` int(11) NOT NULL,
  `nombre` varchar(15) NOT NULL,
  `apellidoPaterno` varchar(15) NOT NULL,
  `apellidoMaterno` varchar(15) NOT NULL,
  `edad` int(11) NOT NULL,
  `domicilio` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `contraseña` varchar(15) NOT NULL,
  `fechaInicio` datetime NOT NULL,
  `fechaTermino` datetime NOT NULL,
  `idPuesto` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `empleado`:
--   `idPuesto`
--       `puesto` -> `id`
--

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id`, `nombre`, `apellidoPaterno`, `apellidoMaterno`, `edad`, `domicilio`, `email`, `contraseña`, `fechaInicio`, `fechaTermino`, `idPuesto`) VALUES
(1, 'Mauricio', 'Hernandez', 'Gallegos', 50, 'Gran mayor, fracc. la estrella No. 255', 'gerente_mau@gmail.com', 'posadaLafuent', '2016-06-01 17:29:07', '2023-07-31 17:29:07', 2),
(2, 'Orlando', 'Barrios', 'Olmedo', 45, 'Fracc. Lopez Portillo, Calle anita brener 10', 'ba_orla@gmail,com', 'chefbenja45', '2020-06-30 17:31:49', '2022-09-29 17:31:49', 4),
(3, 'Cesar', 'Gallardo', 'Luevano', 30, 'col. Nueva España, calle. Fray Juan de Zumarraga 1', 'cesar_12@gmail.com', 'cesard.lo23', '2019-07-30 17:31:49', '2023-07-25 17:31:49', 3),
(4, 'Mario', 'Vargas', 'Oropeza', 60, 'fracc. el cobano, calle nuria 255', 'vargas_oro@gmail.com', 'oropeza145', '2017-07-04 17:31:49', '2022-07-27 00:29:07', 5),
(5, 'Jorge', 'Mayagoitia', 'Solis', 20, 'Col. España, Madrid 504', 'jorge_elcurioso@gmail.com', 'elcurioso58', '2022-03-15 17:31:50', '2022-09-15 17:31:50', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estacionamiento`
--

CREATE TABLE `estacionamiento` (
  `id` int(11) NOT NULL,
  `fechaEntrada` datetime NOT NULL,
  `fechaSalida` datetime NOT NULL,
  `idReserva` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `estacionamiento`:
--   `idReserva`
--       `reservacion` -> `id`
--

--
-- Volcado de datos para la tabla `estacionamiento`
--

INSERT INTO `estacionamiento` (`id`, `fechaEntrada`, `fechaSalida`, `idReserva`) VALUES
(1, '2022-08-14 02:31:48', '2022-08-15 02:31:48', 51),
(2, '2022-07-27 02:31:48', '2022-07-28 02:31:48', 53),
(3, '2022-09-28 02:31:48', '2022-09-29 02:31:48', 52),
(4, '2022-08-28 02:31:48', '2022-08-29 02:31:48', 54),
(5, '2022-12-15 02:31:48', '2022-12-16 02:31:48', 50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadodelahabitacion`
--

CREATE TABLE `estadodelahabitacion` (
  `idEstadoH` int(11) NOT NULL,
  `descripcion` varchar(25) NOT NULL,
  `idHabitacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `estadodelahabitacion`:
--   `idHabitacion`
--       `habitacion` -> `id`
--

--
-- Volcado de datos para la tabla `estadodelahabitacion`
--

INSERT INTO `estadodelahabitacion` (`idEstadoH`, `descripcion`, `idHabitacion`) VALUES
(30, 'Desocupada_Limpia', 5),
(31, 'Desocupada_Limpia', 4),
(32, 'Desocupada_Sucia', 3),
(33, 'Ocupada_Sucia', 2),
(34, 'Ocupada_Limpia', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitacion`
--

CREATE TABLE `habitacion` (
  `id` int(11) NOT NULL,
  `numeroHabitacion` int(11) NOT NULL,
  `cantidadCamas` int(11) NOT NULL,
  `idHotel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `habitacion`:
--   `idHotel`
--       `hotel` -> `id`
--

--
-- Volcado de datos para la tabla `habitacion`
--

INSERT INTO `habitacion` (`id`, `numeroHabitacion`, `cantidadCamas`, `idHotel`) VALUES
(1, 10, 1, 14),
(2, 15, 1, 13),
(3, 22, 2, 12),
(4, 14, 2, 11),
(5, 5, 1, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hotel`
--

CREATE TABLE `hotel` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `domicilio` varchar(50) NOT NULL,
  `codigoPostal` varchar(10) NOT NULL,
  `numeroTelefonico` varchar(10) NOT NULL,
  `idEmpleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `hotel`:
--   `idEmpleado`
--       `empleado` -> `id`
--

--
-- Volcado de datos para la tabla `hotel`
--

INSERT INTO `hotel` (`id`, `nombre`, `descripcion`, `domicilio`, `codigoPostal`, `numeroTelefonico`, `idEmpleado`) VALUES
(10, 'Hotel Posada La fuente', 'Hotel de tres estrellas con el mejor servicio', 'Av. Convención de 1914 Pte', '202020', '4491225846', 3),
(11, 'Hotel Posada La fuente', 'Hotel de tres estrellas con el mejor servicio', 'Av. Convención de 1914 Pte', '202020', '4491225846', 5),
(12, 'Hotel Posada La fuente', 'Hotel de tres estrellas con el mejor servicio', 'Av. Convención de 1914 Pte', '202020', '4491225846', 1),
(13, 'Hotel Posada La fuente', 'Hotel de tres estrellas con el mejor servicio', 'Av. Convención de 1914 Pte', '202020', '4491225846', 4),
(14, 'Hotel Posada La fuente', 'Hotel de tres estrellas con el mejor servicio', 'Av. Convención de 1914 Pte', '202020', '4491225846', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `huesped`
--

CREATE TABLE `huesped` (
  `id` int(11) NOT NULL,
  `nombre` varchar(15) NOT NULL,
  `apellidoPaterno` varchar(15) NOT NULL,
  `apellidoMaterno` varchar(15) NOT NULL,
  `edad` tinyint(4) NOT NULL,
  `ciudad` varchar(15) NOT NULL,
  `email` varchar(30) NOT NULL,
  `contraseña` varchar(15) NOT NULL,
  `numeroTelefonico` varchar(10) NOT NULL,
  `numeroPersonas` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `huesped`:
--

--
-- Volcado de datos para la tabla `huesped`
--

INSERT INTO `huesped` (`id`, `nombre`, `apellidoPaterno`, `apellidoMaterno`, `edad`, `ciudad`, `email`, `contraseña`, `numeroTelefonico`, `numeroPersonas`) VALUES
(1, 'Gloria', 'Perez ', 'Lopez', 25, 'Yucatan', 'Glo02@gmail.com', 'gloriaLop02', '9991234567', 1),
(2, 'Alfredo', 'Medina', 'Gallardo', 22, 'Aguascalientes', 'alfre_1@gmail.com', '784medina', '4495872564', 3),
(3, 'Aaron', 'Diaz', 'Garcia', 25, 'Tlaxcala', 'aro_n@gmail.com', 'michis008', '5990236661', 2),
(4, 'Carlos Alberto', 'Pinales', 'Sandoval', 19, 'Queretaro', 'pina_car@gmail.com', 'pinalesCarlos.0', '5553697845', 1),
(5, 'Juan Ricardo', 'Diaz', 'Mota', 18, 'Aguascalientes', 'juan_in@gmail.com', 'mota235', '4435530798', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puesto`
--

CREATE TABLE `puesto` (
  `id` tinyint(4) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `idRol` tinyint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `puesto`:
--   `idRol`
--       `rol` -> `id`
--

--
-- Volcado de datos para la tabla `puesto`
--

INSERT INTO `puesto` (`id`, `descripcion`, `idRol`) VALUES
(1, 'Empleado encargado de recibir a los clientes', 5),
(2, 'Gerente del hotel', 4),
(3, 'Empleado de preparar los platillos', 2),
(4, 'Empleado de los Cocineros', 1),
(5, 'Empleado encargado de limpiar', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservacion`
--

CREATE TABLE `reservacion` (
  `id` int(11) NOT NULL,
  `idHuesped` int(11) NOT NULL,
  `idCancelacion` int(11) NOT NULL,
  `idFolio` int(11) NOT NULL,
  `idTipoHabitacion` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `reservacion`:
--   `idCancelacion`
--       `cancelacion` -> `id`
--   `idFolio`
--       `ticket` -> `Folio`
--   `idHuesped`
--       `huesped` -> `id`
--   `idTipoHabitacion`
--       `tipohabitacion` -> `id`
--

--
-- Volcado de datos para la tabla `reservacion`
--

INSERT INTO `reservacion` (`id`, `idHuesped`, `idCancelacion`, `idFolio`, `idTipoHabitacion`) VALUES
(50, 1, 1, 5, 22),
(51, 2, 2, 2, 11),
(52, 3, 3, 3, 21),
(53, 4, 4, 4, 21),
(54, 5, 5, 1, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id` tinyint(4) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `rol`:
--

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `descripcion`) VALUES
(1, 'Chef '),
(2, 'Cocinero '),
(3, 'Limpieza'),
(4, 'Administrador '),
(5, 'Recepcionista');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `precio` decimal(9,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `servicio`:
--

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`id`, `descripcion`, `precio`) VALUES
(6, 'Viaje por el centro historico de aguascalientes', '100.00'),
(7, 'Bufet Completo de comida', '450.00'),
(8, 'bebidas alcoholicas', '30.00'),
(9, 'Comida a la habitacion ', '25.00'),
(10, 'Aparcamiento extra de automovil ', '80.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ticket`
--

CREATE TABLE `ticket` (
  `Folio` int(11) NOT NULL,
  `numHabitacion` int(11) NOT NULL,
  `fechaPago` datetime NOT NULL,
  `noches` tinyint(4) NOT NULL,
  `precio` decimal(9,2) NOT NULL,
  `precioTotal` decimal(9,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `ticket`:
--

--
-- Volcado de datos para la tabla `ticket`
--

INSERT INTO `ticket` (`Folio`, `numHabitacion`, `fechaPago`, `noches`, `precio`, `precioTotal`) VALUES
(1, 1, '2022-06-29 15:55:07', 2, '800.00', '950.00'),
(2, 3, '2022-06-23 15:55:07', 1, '480.00', '480.00'),
(3, 2, '2022-06-20 15:56:18', 1, '480.00', '480.00'),
(4, 45, '2022-06-01 15:56:18', 1, '480.00', '180.00'),
(5, 20, '2022-06-06 15:56:18', 3, '1200.00', '1200.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipohabitacion`
--

CREATE TABLE `tipohabitacion` (
  `id` smallint(6) NOT NULL,
  `descripcion` varchar(65) NOT NULL,
  `idHabitacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- RELACIONES PARA LA TABLA `tipohabitacion`:
--   `idHabitacion`
--       `habitacion` -> `id`
--

--
-- Volcado de datos para la tabla `tipohabitacion`
--

INSERT INTO `tipohabitacion` (`id`, `descripcion`, `idHabitacion`) VALUES
(11, 'Habitacion Estandar, La cual incluye una sola cama', 2),
(12, 'Habitacion estandar, La cual incluye dos camas', 3),
(21, 'Habitacion ejecutiva, la cual incluye una sola cama', 4),
(22, 'Habitacion ejecutiva, La cual cuenta con dos camas', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cancelacion`
--
ALTER TABLE `cancelacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `consumo`
--
ALTER TABLE `consumo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_COMSUMO_SERVICIO` (`idServicio`),
  ADD KEY `FK_CONSUMO_RESERVA` (`idReserva`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_EMPLEADO_PUESTO` (`idPuesto`);

--
-- Indices de la tabla `estacionamiento`
--
ALTER TABLE `estacionamiento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_ESTACIONAMIENTO_RESERVA` (`idReserva`);

--
-- Indices de la tabla `estadodelahabitacion`
--
ALTER TABLE `estadodelahabitacion`
  ADD PRIMARY KEY (`idEstadoH`),
  ADD KEY `FK_ESTADO_HABITACION` (`idHabitacion`);

--
-- Indices de la tabla `habitacion`
--
ALTER TABLE `habitacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_HABITACION_HOTEL` (`idHotel`);

--
-- Indices de la tabla `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_HOTEL_EMPLEADO` (`idEmpleado`);

--
-- Indices de la tabla `huesped`
--
ALTER TABLE `huesped`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `puesto`
--
ALTER TABLE `puesto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_PUESTO_ROL` (`idRol`);

--
-- Indices de la tabla `reservacion`
--
ALTER TABLE `reservacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_RESERVACION_HUESPED` (`idHuesped`),
  ADD KEY `FK_RESERVACION_CANCELACION` (`idCancelacion`),
  ADD KEY `FK_RESERVACION_FOLIO` (`idFolio`),
  ADD KEY `FK_RESERVACION_TIPOH` (`idTipoHabitacion`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`Folio`);

--
-- Indices de la tabla `tipohabitacion`
--
ALTER TABLE `tipohabitacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_TH_HABITACION` (`idHabitacion`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `consumo`
--
ALTER TABLE `consumo`
  ADD CONSTRAINT `FK_COMSUMO_SERVICIO` FOREIGN KEY (`idServicio`) REFERENCES `servicio` (`id`),
  ADD CONSTRAINT `FK_CONSUMO_RESERVA` FOREIGN KEY (`idReserva`) REFERENCES `reservacion` (`id`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `FK_EMPLEADO_PUESTO` FOREIGN KEY (`idPuesto`) REFERENCES `puesto` (`id`);

--
-- Filtros para la tabla `estacionamiento`
--
ALTER TABLE `estacionamiento`
  ADD CONSTRAINT `FK_ESTACIONAMIENTO_RESERVA` FOREIGN KEY (`idReserva`) REFERENCES `reservacion` (`id`);

--
-- Filtros para la tabla `estadodelahabitacion`
--
ALTER TABLE `estadodelahabitacion`
  ADD CONSTRAINT `FK_ESTADO_HABITACION` FOREIGN KEY (`idHabitacion`) REFERENCES `habitacion` (`id`);

--
-- Filtros para la tabla `habitacion`
--
ALTER TABLE `habitacion`
  ADD CONSTRAINT `FK_HABITACION_HOTEL` FOREIGN KEY (`idHotel`) REFERENCES `hotel` (`id`);

--
-- Filtros para la tabla `hotel`
--
ALTER TABLE `hotel`
  ADD CONSTRAINT `FK_HOTEL_EMPLEADO` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`id`);

--
-- Filtros para la tabla `puesto`
--
ALTER TABLE `puesto`
  ADD CONSTRAINT `FK_PUESTO_ROL` FOREIGN KEY (`idRol`) REFERENCES `rol` (`id`);

--
-- Filtros para la tabla `reservacion`
--
ALTER TABLE `reservacion`
  ADD CONSTRAINT `FK_RESERVACION_CANCELACION` FOREIGN KEY (`idCancelacion`) REFERENCES `cancelacion` (`id`),
  ADD CONSTRAINT `FK_RESERVACION_FOLIO` FOREIGN KEY (`idFolio`) REFERENCES `ticket` (`Folio`),
  ADD CONSTRAINT `FK_RESERVACION_HUESPED` FOREIGN KEY (`idHuesped`) REFERENCES `huesped` (`id`),
  ADD CONSTRAINT `FK_RESERVACION_TIPOH` FOREIGN KEY (`idTipoHabitacion`) REFERENCES `tipohabitacion` (`id`);

--
-- Filtros para la tabla `tipohabitacion`
--
ALTER TABLE `tipohabitacion`
  ADD CONSTRAINT `FK_TH_HABITACION` FOREIGN KEY (`idHabitacion`) REFERENCES `habitacion` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
