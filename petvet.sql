-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-07-2024 a las 22:17:57
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `petvet`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
  `id-admin` int(50) NOT NULL,
  `id-domicilio` int(50) NOT NULL,
  `id-guarderia` int(50) NOT NULL,
  `id-citas` int(50) NOT NULL,
  `id-adopcion` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adopcion`
--

CREATE TABLE `adopcion` (
  `id-adopcion` int(50) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(120) COLLATE utf8_spanish_ci NOT NULL,
  `edad` float NOT NULL,
  `sexo` varchar(15) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `id-citas` int(50) NOT NULL,
  `id-usuario` int(50) NOT NULL,
  `fecha` date NOT NULL,
  `id-mascota` int(50) NOT NULL,
  `tanda` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `id-servicio` int(50) NOT NULL,
  `descripcion` varchar(200) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `domicilio`
--

CREATE TABLE `domicilio` (
  `id-domicilio` int(50) NOT NULL,
  `id-usuario` int(50) NOT NULL,
  `fecha` date NOT NULL,
  `direccion` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `tanda` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `id-mascota` int(50) NOT NULL,
  `id-vacuna` int(50) NOT NULL,
  `id-servicio` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guarderia`
--

CREATE TABLE `guarderia` (
  `id-guaderia` int(50) NOT NULL,
  `id-usuario` int(50) NOT NULL,
  `id-servicio` int(50) NOT NULL,
  `desde` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `hasta` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `id-mascota` int(50) NOT NULL,
  `descripcion` varchar(200) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascota`
--

CREATE TABLE `mascota` (
  `id-mascota` int(50) NOT NULL,
  `tipo-mascota` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id-rol` int(50) NOT NULL,
  `id-usuario` int(50) NOT NULL,
  `id-admin` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `id-servicios` int(50) NOT NULL,
  `servicio` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `precio` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id-usuario` int(50) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `fecha-nacimiento` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `sexo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `id-mascota` int(50) NOT NULL,
  `correo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `contraña` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `foto-perfil` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vacuna`
--

CREATE TABLE `vacuna` (
  `id-vacuna` int(50) NOT NULL,
  `vacuna` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `precio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id-admin`),
  ADD KEY `id-domicilio` (`id-domicilio`),
  ADD KEY `id-guarderia` (`id-guarderia`),
  ADD KEY `id-citas` (`id-citas`),
  ADD KEY `id-adopcion` (`id-adopcion`);

--
-- Indices de la tabla `adopcion`
--
ALTER TABLE `adopcion`
  ADD PRIMARY KEY (`id-adopcion`);

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id-citas`),
  ADD KEY `id-usuario` (`id-usuario`),
  ADD KEY `id-mascota` (`id-mascota`),
  ADD KEY `id-servicio` (`id-servicio`);

--
-- Indices de la tabla `domicilio`
--
ALTER TABLE `domicilio`
  ADD PRIMARY KEY (`id-domicilio`),
  ADD KEY `id-servicio` (`id-servicio`),
  ADD KEY `id-vacuna` (`id-vacuna`),
  ADD KEY `id-mascota` (`id-mascota`),
  ADD KEY `id-usuario` (`id-usuario`);

--
-- Indices de la tabla `guarderia`
--
ALTER TABLE `guarderia`
  ADD PRIMARY KEY (`id-guaderia`),
  ADD KEY `id-mascota` (`id-mascota`),
  ADD KEY `id-servicio` (`id-servicio`),
  ADD KEY `id-usuario` (`id-usuario`);

--
-- Indices de la tabla `mascota`
--
ALTER TABLE `mascota`
  ADD PRIMARY KEY (`id-mascota`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id-rol`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`id-servicios`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id-usuario`),
  ADD KEY `id-mascota` (`id-mascota`);

--
-- Indices de la tabla `vacuna`
--
ALTER TABLE `vacuna`
  ADD PRIMARY KEY (`id-vacuna`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin`
--
ALTER TABLE `admin`
  MODIFY `id-admin` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `adopcion`
--
ALTER TABLE `adopcion`
  MODIFY `id-adopcion` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id-citas` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `domicilio`
--
ALTER TABLE `domicilio`
  MODIFY `id-domicilio` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `guarderia`
--
ALTER TABLE `guarderia`
  MODIFY `id-guaderia` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mascota`
--
ALTER TABLE `mascota`
  MODIFY `id-mascota` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id-rol` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `id-servicios` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id-usuario` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `vacuna`
--
ALTER TABLE `vacuna`
  MODIFY `id-vacuna` int(50) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`id-citas`) REFERENCES `citas` (`id-citas`),
  ADD CONSTRAINT `admin_ibfk_2` FOREIGN KEY (`id-domicilio`) REFERENCES `domicilio` (`id-domicilio`),
  ADD CONSTRAINT `admin_ibfk_3` FOREIGN KEY (`id-guarderia`) REFERENCES `guarderia` (`id-guaderia`),
  ADD CONSTRAINT `admin_ibfk_4` FOREIGN KEY (`id-adopcion`) REFERENCES `adopcion` (`id-adopcion`);

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`id-servicio`) REFERENCES `servicio` (`id-servicios`),
  ADD CONSTRAINT `citas_ibfk_3` FOREIGN KEY (`id-usuario`) REFERENCES `usuario` (`id-usuario`),
  ADD CONSTRAINT `citas_ibfk_4` FOREIGN KEY (`id-mascota`) REFERENCES `mascota` (`id-mascota`);

--
-- Filtros para la tabla `domicilio`
--
ALTER TABLE `domicilio`
  ADD CONSTRAINT `domicilio_ibfk_1` FOREIGN KEY (`id-usuario`) REFERENCES `usuario` (`id-usuario`),
  ADD CONSTRAINT `domicilio_ibfk_2` FOREIGN KEY (`id-vacuna`) REFERENCES `vacuna` (`id-vacuna`),
  ADD CONSTRAINT `domicilio_ibfk_3` FOREIGN KEY (`id-servicio`) REFERENCES `servicio` (`id-servicios`),
  ADD CONSTRAINT `domicilio_ibfk_4` FOREIGN KEY (`id-mascota`) REFERENCES `mascota` (`id-mascota`);

--
-- Filtros para la tabla `guarderia`
--
ALTER TABLE `guarderia`
  ADD CONSTRAINT `guarderia_ibfk_1` FOREIGN KEY (`id-usuario`) REFERENCES `usuario` (`id-usuario`),
  ADD CONSTRAINT `guarderia_ibfk_2` FOREIGN KEY (`id-servicio`) REFERENCES `servicio` (`id-servicios`),
  ADD CONSTRAINT `guarderia_ibfk_3` FOREIGN KEY (`id-mascota`) REFERENCES `mascota` (`id-mascota`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id-mascota`) REFERENCES `mascota` (`id-mascota`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
