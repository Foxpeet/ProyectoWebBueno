-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-05-2022 a las 10:46:27
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Base de datos: `mapas`
--

-- --------------------------------------------------------

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
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `mediciones`
--

INSERT INTO `mediciones` (`id`, `humedad`, `salinidad`, `temperatura`, `iluminacion`, `fecha`) VALUES
(1, 60, 60, 20, 65, '2022-05-15'),
(2, 50, 80, 30, 90, '2022-05-16');

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
(1, 'Parcela nº1', 'EBA372'),
(2, 'Parcela nº2', 'EB332E'),
(3, 'Parcela nº3', '5D52F5'),
(4, 'Parcela nº4', '58D69D'),
(6, 'Sonda nº1', 'FFFFFF'),
(7, 'Sonda nº2', 'FFFFFF'),
(8, 'Sonda nº3', 'FFFFFF'),
(9, 'Sonda nº4', 'FFFFFF'),
(10, 'Sonda nº5', 'FFFFFF'),
(11, 'Sonda nº6', 'FFFFFF'),
(12, 'Sonda nº7', 'FFFFFF'),
(13, 'Sonda nº8', 'FFFFFF'),
(14, 'Sonda nº9', 'FFFFFF');

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
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mediciones`
--
ALTER TABLE `mediciones`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `parcelas`
--
ALTER TABLE `parcelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

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
  ADD CONSTRAINT `mediciones_ibfk_1` FOREIGN KEY (`id`) REFERENCES `usuarios_parcelas` (`parcela`) ON DELETE CASCADE ON UPDATE CASCADE;

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
