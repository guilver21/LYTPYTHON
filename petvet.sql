-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-06-2024 a las 23:46:08
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
-- Base de datos: `veterinaria-petvet`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(50) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `contraseña` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `rol` enum('admin','','','') COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin-adomicilio`
--

CREATE TABLE `admin-adomicilio` (
  `id_adminAdomicilio` int(50) NOT NULL,
  `id_usurio` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `id_adomicilio` varchar(50) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin-cita`
--

CREATE TABLE `admin-cita` (
  `id_adminCita` int(50) NOT NULL,
  `id_usurio` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `id_cita` varchar(50) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin-guarderia`
--

CREATE TABLE `admin-guarderia` (
  `id_adminGuarderia` int(50) NOT NULL,
  `id_usurio` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `id_guarderia` varchar(50) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adomicilio`
--

CREATE TABLE `adomicilio` (
  `id_adomicilio` int(50) NOT NULL DEFAULT '0',
  `id_usurio` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `fecha` date NOT NULL,
  `tanda` date NOT NULL,
  `id_mascota` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `id_servicio` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `total` decimal(60,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adopcion`
--

CREATE TABLE `adopcion` (
  `id_adopcion` int(50) NOT NULL,
  `nom-animal` varchar(50) COLLATE utf32_spanish2_ci NOT NULL,
  `mascota` varchar(50) COLLATE utf32_spanish2_ci NOT NULL,
  `animal-descripcion` text COLLATE utf32_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `id_cita` int(50) NOT NULL,
  `id_usurio` varchar(50) COLLATE utf32_spanish2_ci NOT NULL,
  `fecha` date NOT NULL,
  `tanda` date NOT NULL,
  `id_mascota` varchar(50) COLLATE utf32_spanish2_ci NOT NULL,
  `id_servicio` varchar(50) COLLATE utf32_spanish2_ci NOT NULL,
  `descripcion` text COLLATE utf32_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guarderia`
--

CREATE TABLE `guarderia` (
  `id_guarderia` int(50) NOT NULL,
  `id_usurio` varchar(50) COLLATE utf32_spanish2_ci NOT NULL,
  `fecha-desde` date NOT NULL,
  `fecha-hasta` date NOT NULL,
  `id_mascota` varchar(50) COLLATE utf32_spanish2_ci NOT NULL,
  `descripcion` text COLLATE utf32_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascotas`
--

CREATE TABLE `mascotas` (
  `id_mascota` int(50) NOT NULL,
  `macota` varchar(50) COLLATE utf32_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(50) NOT NULL,
  `id_usurio` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `id_admin` varchar(50) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id_servicio` int(50) NOT NULL,
  `nom-servicio` varchar(50) COLLATE utf32_spanish2_ci NOT NULL,
  `precio-servicio` decimal(50,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(50) NOT NULL,
  `nombre` varchar(50) COLLATE utf32_spanish2_ci NOT NULL,
  `apellido` varchar(50) COLLATE utf32_spanish2_ci NOT NULL,
  `telefono` char(15) COLLATE utf32_spanish2_ci NOT NULL,
  `correo` varchar(50) COLLATE utf32_spanish2_ci NOT NULL,
  `sexo` varchar(20) COLLATE utf32_spanish2_ci NOT NULL,
  `fecha nacimiento` varchar(30) COLLATE utf32_spanish2_ci NOT NULL,
  `id_mascota` varchar(50) COLLATE utf32_spanish2_ci NOT NULL,
  `contraseña` varchar(50) COLLATE utf32_spanish2_ci NOT NULL,
  `rol` enum('usuario','','','') COLLATE utf32_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indices de la tabla `admin-adomicilio`
--
ALTER TABLE `admin-adomicilio`
  ADD PRIMARY KEY (`id_adminAdomicilio`);

--
-- Indices de la tabla `admin-cita`
--
ALTER TABLE `admin-cita`
  ADD PRIMARY KEY (`id_adminCita`);

--
-- Indices de la tabla `admin-guarderia`
--
ALTER TABLE `admin-guarderia`
  ADD PRIMARY KEY (`id_adminGuarderia`);

--
-- Indices de la tabla `adopcion`
--
ALTER TABLE `adopcion`
  ADD PRIMARY KEY (`id_adopcion`);

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id_cita`);

--
-- Indices de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD PRIMARY KEY (`id_mascota`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id_servicio`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `admin-adomicilio`
--
ALTER TABLE `admin-adomicilio`
  MODIFY `id_adminAdomicilio` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `admin-cita`
--
ALTER TABLE `admin-cita`
  MODIFY `id_adminCita` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `admin-guarderia`
--
ALTER TABLE `admin-guarderia`
  MODIFY `id_adminGuarderia` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `adopcion`
--
ALTER TABLE `adopcion`
  MODIFY `id_adopcion` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id_cita` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  MODIFY `id_mascota` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id_servicio` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(50) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
