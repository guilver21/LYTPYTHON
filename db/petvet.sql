-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-08-2024 a las 06:39:29
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
  `id_admin` int(50) NOT NULL,
  `id_domicilio` int(50) NOT NULL,
  `id_citas` int(50) NOT NULL,
  `id_guarderia` int(50) NOT NULL,
  `id_adopcion` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adopcion`
--

CREATE TABLE `adopcion` (
  `id_adopcion` int(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(120) NOT NULL,
  `edad` int(2) NOT NULL,
  `sexo` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `id_citas` int(50) NOT NULL,
  `id_usuario` int(50) NOT NULL,
  `fecha` date NOT NULL,
  `tanda` varchar(15) NOT NULL,
  `id_mascota` int(50) NOT NULL,
  `id_servicio` int(50) NOT NULL,
  `descripcion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `domicilio`
--

CREATE TABLE `domicilio` (
  `id_adomicilio` int(50) NOT NULL,
  `id_usuario` int(50) NOT NULL,
  `fecha` date NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `tanda` varchar(15) NOT NULL,
  `id_mascota` int(50) NOT NULL,
  `id_vacuna` int(50) NOT NULL,
  `id_servicio` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guarderia`
--

CREATE TABLE `guarderia` (
  `id_guaderia` int(50) NOT NULL,
  `id_usuario` int(50) NOT NULL,
  `id_servicio` int(50) NOT NULL,
  `desde` varchar(15) NOT NULL,
  `hasta` varchar(15) NOT NULL,
  `id_mascota` int(50) NOT NULL,
  `descripcion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascota`
--

CREATE TABLE `mascota` (
  `id_mascota` int(11) NOT NULL,
  `tipoMascota` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `mascota`
--

INSERT INTO `mascota` (`id_mascota`, `tipoMascota`) VALUES
(8, 'perro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` int(50) NOT NULL,
  `id_usuario` int(50) NOT NULL,
  `id_admin` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `id_servicios` int(50) NOT NULL,
  `servicio` varchar(50) NOT NULL,
  `precio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `fecha-nacimiento` varchar(15) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `sexo` varchar(50) NOT NULL,
  `id_mascota` int(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `contraseña` varchar(50) NOT NULL,
  `verificar_contraseña` varchar(50) NOT NULL,
  `foto-perfil` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `apellido`, `fecha-nacimiento`, `telefono`, `sexo`, `id_mascota`, `correo`, `contraseña`, `verificar_contraseña`, `foto-perfil`) VALUES
(4, 'Tiara', 'Peña', '2004-11-12', '8298427894', 'femenino', 8, 'tiara12p@gmail.com', '123', '123', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vacuna`
--

CREATE TABLE `vacuna` (
  `id_vacuna` int(50) NOT NULL,
  `vacuna` varchar(50) NOT NULL,
  `precio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`),
  ADD KEY `id_domicilio` (`id_domicilio`,`id_citas`,`id_guarderia`,`id_adopcion`),
  ADD KEY `id_citas` (`id_citas`),
  ADD KEY `id_adopcion` (`id_adopcion`),
  ADD KEY `id_guarderia` (`id_guarderia`);

--
-- Indices de la tabla `adopcion`
--
ALTER TABLE `adopcion`
  ADD PRIMARY KEY (`id_adopcion`);

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id_citas`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_mascota` (`id_mascota`),
  ADD KEY `id_tanda` (`id_servicio`);

--
-- Indices de la tabla `domicilio`
--
ALTER TABLE `domicilio`
  ADD PRIMARY KEY (`id_adomicilio`),
  ADD KEY `id_usuario` (`id_usuario`,`id_mascota`,`id_vacuna`,`id_servicio`),
  ADD KEY `id_vacuna` (`id_vacuna`),
  ADD KEY `id_servicio` (`id_servicio`),
  ADD KEY `id_mascota` (`id_mascota`);

--
-- Indices de la tabla `guarderia`
--
ALTER TABLE `guarderia`
  ADD PRIMARY KEY (`id_guaderia`),
  ADD KEY `id_usuario` (`id_usuario`,`id_servicio`,`id_mascota`),
  ADD KEY `id_servicio` (`id_servicio`),
  ADD KEY `id_mascota` (`id_mascota`);

--
-- Indices de la tabla `mascota`
--
ALTER TABLE `mascota`
  ADD PRIMARY KEY (`id_mascota`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`),
  ADD KEY `id_usuario` (`id_usuario`,`id_admin`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`id_servicios`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_mascota` (`id_mascota`);

--
-- Indices de la tabla `vacuna`
--
ALTER TABLE `vacuna`
  ADD PRIMARY KEY (`id_vacuna`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `adopcion`
--
ALTER TABLE `adopcion`
  MODIFY `id_adopcion` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id_citas` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `domicilio`
--
ALTER TABLE `domicilio`
  MODIFY `id_adomicilio` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `guarderia`
--
ALTER TABLE `guarderia`
  MODIFY `id_guaderia` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mascota`
--
ALTER TABLE `mascota`
  MODIFY `id_mascota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `id_servicios` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `vacuna`
--
ALTER TABLE `vacuna`
  MODIFY `id_vacuna` int(50) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`id_citas`) REFERENCES `citas` (`id_citas`),
  ADD CONSTRAINT `admin_ibfk_2` FOREIGN KEY (`id_domicilio`) REFERENCES `domicilio` (`id_adomicilio`),
  ADD CONSTRAINT `admin_ibfk_3` FOREIGN KEY (`id_adopcion`) REFERENCES `adopcion` (`id_adopcion`),
  ADD CONSTRAINT `admin_ibfk_4` FOREIGN KEY (`id_guarderia`) REFERENCES `guarderia` (`id_guaderia`);

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`id_mascota`) REFERENCES `mascota` (`id_mascota`),
  ADD CONSTRAINT `citas_ibfk_3` FOREIGN KEY (`id_servicio`) REFERENCES `servicio` (`id_servicios`);

--
-- Filtros para la tabla `domicilio`
--
ALTER TABLE `domicilio`
  ADD CONSTRAINT `domicilio_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `domicilio_ibfk_2` FOREIGN KEY (`id_vacuna`) REFERENCES `vacuna` (`id_vacuna`),
  ADD CONSTRAINT `domicilio_ibfk_3` FOREIGN KEY (`id_servicio`) REFERENCES `servicio` (`id_servicios`),
  ADD CONSTRAINT `domicilio_ibfk_4` FOREIGN KEY (`id_mascota`) REFERENCES `mascota` (`id_mascota`);

--
-- Filtros para la tabla `guarderia`
--
ALTER TABLE `guarderia`
  ADD CONSTRAINT `guarderia_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `guarderia_ibfk_2` FOREIGN KEY (`id_servicio`) REFERENCES `servicio` (`id_servicios`),
  ADD CONSTRAINT `guarderia_ibfk_3` FOREIGN KEY (`id_mascota`) REFERENCES `mascota` (`id_mascota`);

--
-- Filtros para la tabla `rol`
--
ALTER TABLE `rol`
  ADD CONSTRAINT `rol_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_mascota`) REFERENCES `mascota` (`id_mascota`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
