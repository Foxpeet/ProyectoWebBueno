-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 02-05-2022 a las 12:07:04
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mapas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parcelas`
--

CREATE TABLE `parcelas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `color` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `parcelas`
--

INSERT INTO `parcelas` (`id`, `nombre`, `color`) VALUES
(1, 'Parcela nº1', 'FF8000'),
(2, 'Parcela nº2', 'F44336'),
(3, 'Parcela nº3', '2196F3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `rol` enum('admin','normal') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `password`, `rol`) VALUES
(1, 'propietario 1', '1234', 'normal'),
(2, 'propietario 2', '1234', 'normal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_parcelas`
--

CREATE TABLE `usuarios_parcelas` (
  `id` int(11) NOT NULL,
  `usuario` int(11) NOT NULL,
  `parcela` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios_parcelas`
--

INSERT INTO `usuarios_parcelas` (`id`, `usuario`, `parcela`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 1),
(4, 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vertices`
--

CREATE TABLE `vertices` (
  `id` int(11) NOT NULL,
  `lat` decimal(10,7) NOT NULL,
  `lng` decimal(10,7) NOT NULL,
  `parcela` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `vertices`
--

INSERT INTO `vertices` (`id`, `lat`, `lng`, `parcela`) VALUES
(1, '38.9981639', '-0.1720151', 1),
(2, '38.9979802', '-0.1715208', 1),
(3, '38.9965934', '-0.1721850', 1),
(4, '38.9969109', '-0.1729598', 1),
(5, '38.9983908', '-0.1785001', 2),
(6, '38.9979107', '-0.1774030', 2),
(7, '38.9969825', '-0.1779657', 2),
(8, '38.9969494', '-0.1783175', 2),
(9, '38.9975874', '-0.1795887', 2),
(10, '38.9924270', '-0.1713474', 3),
(11, '38.9927512', '-0.1694416', 3),
(12, '38.9915003', '-0.1684759', 3),
(13, '38.9910870', '-0.1709218', 3);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_parcelas_con_vertices`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_parcelas_con_vertices` (
`id` int(11)
,`nombre` varchar(60)
,`color` varchar(6)
,`lat` decimal(10,7)
,`lng` decimal(10,7)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_propiedad_parcelas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_propiedad_parcelas` (
`usuario` int(11)
,`parcela` int(11)
,`nombre_parcela` varchar(60)
,`color` varchar(6)
,`nombre_usuario` varchar(60)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_parcelas_con_vertices`
--
DROP TABLE IF EXISTS `vista_parcelas_con_vertices`;

CREATE VIEW `vista_parcelas_con_vertices`  AS SELECT `parcelas`.`id` AS `id`, `parcelas`.`nombre` AS `nombre`, `parcelas`.`color` AS `color`, `vertices`.`lat` AS `lat`, `vertices`.`lng` AS `lng` FROM (`parcelas` join `vertices` on(`parcelas`.`id` = `vertices`.`parcela`))  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_propiedad_parcelas`
--
DROP TABLE IF EXISTS `vista_propiedad_parcelas`;

CREATE VIEW `vista_propiedad_parcelas`  AS SELECT `usuarios_parcelas`.`usuario` AS `usuario`, `usuarios_parcelas`.`parcela` AS `parcela`, `parcelas`.`nombre` AS `nombre_parcela`, `parcelas`.`color` AS `color`, `usuarios`.`nombre` AS `nombre_usuario` FROM ((`usuarios_parcelas` join `parcelas` on(`parcelas`.`id` = `usuarios_parcelas`.`parcela`)) join `usuarios` on(`usuarios`.`id` = `usuarios_parcelas`.`usuario`))  ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `parcelas`
--
ALTER TABLE `parcelas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios_parcelas`
--
ALTER TABLE `usuarios_parcelas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_usuario_parcela_usuario` (`usuario`),
  ADD KEY `fk_usuario_parcela_parcela` (`parcela`);

--
-- Indices de la tabla `vertices`
--
ALTER TABLE `vertices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_vertice_parcela` (`parcela`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `parcelas`
--
ALTER TABLE `parcelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios_parcelas`
--
ALTER TABLE `usuarios_parcelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `vertices`
--
ALTER TABLE `vertices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `usuarios_parcelas`
--
ALTER TABLE `usuarios_parcelas`
  ADD CONSTRAINT `fk_usuario_parcela_parcela` FOREIGN KEY (`parcela`) REFERENCES `parcelas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_usuario_parcela_usuario` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `vertices`
--
ALTER TABLE `vertices`
  ADD CONSTRAINT `fk_vertice_parcela` FOREIGN KEY (`parcela`) REFERENCES `parcelas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
