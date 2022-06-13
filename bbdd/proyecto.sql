-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-06-2022 a las 15:05:32
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Base de datos: `mapas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mediciones`
--

CREATE TABLE `mediciones` (
  `id` int(11) NOT NULL,
  `humedad` int(11) NOT NULL,
  `salinidad` int(11) NOT NULL,
  `temperatura` int(11) NOT NULL,
  `iluminacion` int(11) NOT NULL,
  `sonda` int(11) NOT NULL,
  `hora` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `mediciones`
--

INSERT INTO `mediciones` (`id`, `humedad`, `salinidad`, `temperatura`, `iluminacion`, `sonda`, `hora`) VALUES
(0, 50, 82, 22, 10, 1, '03:00:00'),
(1, 60, 60, 26, 40, 1, '07:00:00'),
(2, 50, 60, 34, 80, 1, '11:00:00'),
(3, 80, 70, 27, 30, 1, '17:00:00'),
(4, 60, 47, 24, 64, 1, '23:00:00'),
(5, 32, 86, 26, 9, 2, '03:00:00'),
(6, 48, 75, 22, 25, 2, '07:00:00'),
(7, 26, 55, 26, 38, 2, '11:00:00'),
(8, 79, 57, 26, 84, 2, '17:00:00'),
(9, 48, 75, 22, 25, 2, '23:00:00'),
(10, 69, 97, 17, 6, 3, '03:00:00'),
(11, 58, 42, 19, 40, 3, '07:00:00'),
(12, 79, 32, 23, 68, 3, '11:00:00'),
(13, 56, 46, 21, 42, 3, '17:00:00'),
(14, 79, 48, 16, 27, 3, '23:00:00'),
(15, 93, 72, 13, 26, 4, '03:00:00'),
(16, 79, 64, 17, 37, 4, '07:00:00'),
(17, 59, 64, 20, 53, 4, '11:00:00'),
(18, 46, 84, 23, 84, 4, '17:00:00'),
(19, 38, 58, 21, 96, 4, '23:00:00'),
(20, 49, 67, 17, 48, 5, '03:00:00'),
(21, 76, 79, 14, 24, 5, '07:00:00'),
(22, 68, 78, 16, 32, 5, '11:00:00'),
(23, 51, 64, 24, 63, 5, '17:00:00'),
(24, 42, 53, 18, 35, 5, '23:00:00'),
(25, 79, 75, 16, 25, 6, '03:00:00'),
(26, 65, 68, 19, 37, 6, '07:00:00'),
(27, 53, 62, 20, 59, 6, '11:00:00'),
(28, 39, 62, 23, 84, 6, '17:00:00'),
(29, 53, 72, 19, 47, 6, '23:00:00'),
(30, 76, 52, 15, 24, 7, '03:00:00'),
(31, 68, 56, 16, 37, 7, '07:00:00'),
(32, 52, 58, 21, 49, 7, '11:00:00'),
(33, 42, 43, 23, 69, 7, '17:00:00'),
(34, 74, 68, 18, 36, 7, '23:00:00'),
(35, 85, 67, 17, 25, 8, '03:00:00'),
(36, 68, 43, 21, 35, 8, '07:00:00'),
(37, 54, 46, 23, 48, 8, '11:00:00'),
(38, 61, 63, 25, 79, 8, '17:00:00'),
(39, 82, 74, 19, 35, 8, '23:00:00'),
(40, 86, 84, 16, 24, 9, '03:00:00'),
(41, 73, 63, 18, 37, 9, '07:00:00'),
(42, 63, 58, 20, 47, 9, '11:00:00'),
(43, 46, 68, 26, 70, 9, '17:00:00'),
(44, 69, 68, 22, 53, 9, '23:00:00'),
(45, 86, 79, 16, 28, 10, '03:00:00'),
(46, 75, 73, 19, 36, 10, '07:00:00'),
(47, 74, 68, 21, 48, 10, '11:00:00'),
(48, 53, 63, 25, 85, 10, '17:00:00'),
(49, 75, 64, 18, 32, 10, '23:00:00'),
(50, 78, 64, 17, 21, 11, '03:00:00'),
(51, 64, 64, 19, 35, 11, '07:00:00'),
(52, 57, 62, 21, 46, 11, '11:00:00'),
(53, 54, 71, 25, 78, 11, '17:00:00'),
(54, 78, 65, 20, 41, 11, '23:00:00'),
(55, 78, 65, 20, 41, 12, '03:00:00'),
(56, 65, 64, 17, 35, 12, '07:00:00'),
(57, 74, 58, 20, 47, 12, '11:00:00'),
(58, 52, 74, 24, 76, 12, '17:00:00'),
(59, 75, 84, 19, 32, 12, '23:00:00'),
(60, 75, 84, 19, 32, 13, '03:00:00'),
(61, 83, 74, 17, 26, 13, '07:00:00'),
(62, 73, 69, 20, 42, 13, '11:00:00'),
(63, 63, 75, 24, 79, 13, '17:00:00'),
(64, 72, 63, 20, 52, 13, '23:00:00'),
(65, 84, 63, 16, 52, 14, '03:00:00'),
(66, 78, 73, 20, 32, 14, '07:00:00'),
(67, 71, 68, 21, 45, 14, '11:00:00'),
(68, 58, 63, 25, 79, 14, '17:00:00'),
(69, 94, 61, 19, 42, 14, '23:00:00');

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
(1, 'Naranjos', 'EBA372'),
(2, 'Tomates', 'EB332E'),
(3, 'Olivos', '58D69D'),
(4, 'Arroz', 'DCB434');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sondas`
--

CREATE TABLE `sondas` (
  `id` int(11) NOT NULL,
  `lat` decimal(10,7) NOT NULL,
  `lng` decimal(10,7) NOT NULL,
  `parcela` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sondas`
--

INSERT INTO `sondas` (`id`, `lat`, `lng`, `parcela`) VALUES
(1, '38.9980890', '-0.1804260', 1),
(2, '38.9977440', '-0.1803920', 1),
(3, '38.9980000', '-0.1809360', 1),
(4, '38.9971780', '-0.1781820', 2),
(5, '38.9977940', '-0.1777330', 2),
(6, '38.9980150', '-0.1784950', 2),
(7, '38.9976110', '-0.1789460', 2),
(8, '38.9921340', '-0.1731330', 3),
(9, '38.9922500', '-0.1717010', 3),
(10, '38.9913490', '-0.1714110', 3),
(11, '38.9910990', '-0.1729880', 3),
(12, '38.9897460', '-0.1744630', 4),
(13, '38.9891690', '-0.1736190', 4),
(14, '38.9902200', '-0.1753790', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `apellidos` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `rol` enum('admin','normal') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellidos`, `password`, `rol`) VALUES
(1, 'Mariano', 'Rajoy', '1234', 'admin'),
(2, 'Manolo', 'Mira', '1234', 'normal'),
(3, 'admin', '', '1234', 'normal');

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
(1, 2, 1),
(2, 2, 2),
(3, 3, 3),
(4, 3, 4);

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
(1, '38.9976300', '-0.1803620', 1),
(2, '38.9980650', '-0.1799230', 1),
(3, '38.9983260', '-0.1804090', 1),
(4, '38.9980960', '-0.1813940', 1),
(5, '38.9983908', '-0.1785001', 2),
(6, '38.9979107', '-0.1774030', 2),
(7, '38.9969825', '-0.1779657', 2),
(8, '38.9969494', '-0.1783175', 2),
(9, '38.9975874', '-0.1795887', 2),
(10, '38.9911160', '-0.1709440', 3),
(11, '38.9924650', '-0.1714120', 3),
(12, '38.9923570', '-0.1735900', 3),
(13, '38.9906890', '-0.1731820', 3),
(14, '38.9887790', '-0.1752530', 4),
(15, '38.9889210', '-0.1732470', 4),
(16, '38.9905460', '-0.1736420', 4),
(17, '38.9903780', '-0.1754920', 4);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_medicion_sonda`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_medicion_sonda` (
`idSonda` int(11)
,`lat` decimal(10,7)
,`lng` decimal(10,7)
,`humedad` int(11)
,`salinidad` int(11)
,`temperatura` int(11)
,`iluminacion` int(11)
,`hora` time
);

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
-- Estructura para la vista `vista_medicion_sonda`
--
DROP TABLE IF EXISTS `vista_medicion_sonda`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_medicion_sonda`  AS SELECT `sondas`.`id` AS `idSonda`, `sondas`.`lat` AS `lat`, `sondas`.`lng` AS `lng`, `mediciones`.`humedad` AS `humedad`, `mediciones`.`salinidad` AS `salinidad`, `mediciones`.`temperatura` AS `temperatura`, `mediciones`.`iluminacion` AS `iluminacion`, `mediciones`.`hora` AS `hora` FROM (`sondas` join `mediciones` on(`mediciones`.`sonda` = `sondas`.`id`))  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_parcelas_con_vertices`
--
DROP TABLE IF EXISTS `vista_parcelas_con_vertices`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_parcelas_con_vertices`  AS SELECT `parcelas`.`id` AS `id`, `parcelas`.`nombre` AS `nombre`, `parcelas`.`color` AS `color`, `vertices`.`lat` AS `lat`, `vertices`.`lng` AS `lng` FROM (`parcelas` join `vertices` on(`parcelas`.`id` = `vertices`.`parcela`))  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_propiedad_parcelas`
--
DROP TABLE IF EXISTS `vista_propiedad_parcelas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_propiedad_parcelas`  AS SELECT `usuarios_parcelas`.`usuario` AS `usuario`, `usuarios_parcelas`.`parcela` AS `parcela`, `parcelas`.`nombre` AS `nombre_parcela`, `parcelas`.`color` AS `color`, `usuarios`.`nombre` AS `nombre_usuario` FROM ((`usuarios_parcelas` join `parcelas` on(`parcelas`.`id` = `usuarios_parcelas`.`parcela`)) join `usuarios` on(`usuarios`.`id` = `usuarios_parcelas`.`usuario`))  ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `mediciones`
--
ALTER TABLE `mediciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_sondas_medicion` (`sonda`);

--
-- Indices de la tabla `parcelas`
--
ALTER TABLE `parcelas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sondas`
--
ALTER TABLE `sondas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_sondas_parcelas` (`parcela`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `sondas`
--
ALTER TABLE `sondas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `usuarios_parcelas`
--
ALTER TABLE `usuarios_parcelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `vertices`
--
ALTER TABLE `vertices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `mediciones`
--
ALTER TABLE `mediciones`
  ADD CONSTRAINT `fk_sondas_medicion` FOREIGN KEY (`sonda`) REFERENCES `sondas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `sondas`
--
ALTER TABLE `sondas`
  ADD CONSTRAINT `fk_sondas_parcelas` FOREIGN KEY (`parcela`) REFERENCES `parcelas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
