-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-04-2015 a las 23:21:31
-- Versión del servidor: 5.6.21
-- Versión de PHP: 5.6.3


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";



--
-- Base de datos: `maquillaje`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
`id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `descripcion` varchar(150) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `nombre`, `descripcion`) VALUES
(3, 'Labiales', 'con los mejores diseños'),
(4, 'paletas de sombras', 'con la mejor pigmentación y diseños'),
(5, 'Mascarilla', 'Variedad de mascarillas para el cuidado de la piel'),
(6, 'productos para cejas', 'con la mejor calidad'),
(7, 'paletas de glitters', 'lo mejor de todo es que no necesita pegamento'),
(8, 'jabones corporales', 'luce un piel hermosa con ellos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comision`
--

CREATE TABLE IF NOT EXISTS `comision` (
`id` int(11) NOT NULL,
  `porcentaje` varchar(191) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `comision`
--

INSERT INTO `comision` (`id`, `porcentaje`, `fecha`) VALUES
(1, '0.01', '2015-04-09 05:00:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle`
--

CREATE TABLE IF NOT EXISTS `detalle` (
`id` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `id_factura` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle`
--

INSERT INTO `detalle` (`id`, `id_producto`, `cantidad`, `id_factura`) VALUES
(1, 66, 4, 1),
(6, 65, 1, 7),
(8, 68, 1, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE IF NOT EXISTS `factura` (
`id` int(11) NOT NULL,
  `id_cliente` int(11) unsigned NOT NULL,
  `id_comision` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` varchar(30) NOT NULL DEFAULT 'pendiente',
  `total` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id`, `id_cliente`, `id_comision`, `fecha`, `estado`, `total`) VALUES
(1, 1, 1, '2015-04-10 23:46:20', 'enviado', 50000),
(7, 11, 1, '2015-04-11 04:53:28', 'aprobado', 5000),
(9, 11, 1, '2015-04-14 02:57:50', 'aprobado', 45000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE IF NOT EXISTS `perfil` (
`id` int(11) unsigned NOT NULL,
  `nombre` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permiso_gestionar_usuarios` tinyint(1) DEFAULT NULL,
  `permiso_vender` tinyint(1) DEFAULT NULL,
  `permiso_gestionar_perfiles` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `perfil`
--

INSERT INTO `perfil` (`id`, `nombre`, `permiso_gestionar_usuarios`, `permiso_vender`, `permiso_gestionar_perfiles`) VALUES
(1, 'Admin', 1, 1, 1),
(2, 'Default', 0, 1, 0),
(3, 'Krusty', 1, 1, 0),
(4, 'Popeto', 1, 1, 0),
(5, 'hola mund', 1, 1, 1),
(9, 'Super Admin', 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE IF NOT EXISTS `producto` (
`id` int(11) NOT NULL,
  `usuario_username` varchar(30) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `cantidad` int(4) NOT NULL,
  `valor_unitario` int(5) NOT NULL,
  `estado` varchar(30) NOT NULL DEFAULT 'En venta',
  `url_imagen` varchar(200) NOT NULL,
  `usuario_id` varchar(191) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `usuario_username`, `categoria_id`, `nombre`, `cantidad`, `valor_unitario`, `estado`, `url_imagen`, `usuario_id`) VALUES
(65, 'camv', 7, 'sombras', 1, 45000, 'En venta', 'https://karinacosmeticos.com/mystore/item/1854/bb/paleta-ultramo-star-wars-mandalorian', NULL),
(66, 'juanTwo', 3, 'labiales', 12, 120000, 'En venta', 'https://scontent.fdgo1-1.fna.fbcdn.net/v/t39.30808-6/213373910_336600007912034_875281143016693531_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=8bfeb9&_nc_eui2=AeGqfDcodEnpusj2FrA8KF_F0HxIvzgB0JTQfEi_OAHQlOWs37OBwPxEYY_9JpIOAd5ahL64OEa6Fnu7K-JmQaHE&_nc_ohc=oNlIdn6eqjcAX_5D5C-&_nc_ht=scontent.fdgo1-1.fna&oh=00_AT8d6cbBy_MLLaQKtiQlYrfSm1TzM_Cqegbl_msDWiNPCw&oe=61E3DE11', NULL),
(67, 'juanTwo', 5, 'mascarilla', 4, 120000, 'En venta', 'https://http2.mlstatic.com/D_NQ_NP_785196-MLM46970562051_082021-O.webp', NULL),
(68, 'juanTwo', 3, 'jabon', 12, 1200, 'En venta', 'https://www.bamboocosmeticos.com/wp-content/uploads/2022/01/set-reparador-de-labios-frutal-3pz-ultramo.jpg', NULL),
(69, 'camv', 4, 'glitters', 1, 35000, 'En venta', 'https://www.bamboocosmeticos.com/wp-content/uploads/2022/01/glitter-en-hojuela-suelto-torre-12pz-iman-of-noble.jpg', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
`id` int(11) unsigned NOT NULL,
  `documento` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apellidos` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre_usuario` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_perfil` int(11) DEFAULT '2',
  `estado` int(4) DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `documento`, `nombre`, `apellidos`, `email`, `nombre_usuario`, `password`, `tipo_perfil`, `estado`) VALUES
(1, '116264525', 'Juanito', 'Velasquez', 'Velasquez94@hotmail.com', 'juanTwo', '1234asdf', 2, 1),
(5, '888834343', 'Oscar', 'Morocho', 'morocho@oscar.com', 'morochoscar', 'morocho', 2, 1),
(9, '12331231', 'Pepeto', 'pepone', 'vadfgdfgsfdg', 'popocho', 'poposito', 2, 1),
(10, '436523676', 'Barrera', 'Sebastian', 'barreroide@barrera', 'barreroide', 'barreroide', 2, 1),
(11, '12345678431', 'Carlos Andres', 'Moreno', 'camv_123@hotmail.com', 'camv', 'camv', 1, 1),
(12, '123456789', 'Viviana', 'Zuluaga', 'vazuluagab@gmail.com', 'vazb', 'vazb', 1, 1),
(13, '2345679012', 'Ana', 'Perez', 'anaperez@gmail.com', 'ana', 'ana', 2, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `uniqueNombre` (`nombre`);

--
-- Indices de la tabla `comision`
--
ALTER TABLE `comision`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle`
--
ALTER TABLE `detalle`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_id_producto` (`id_producto`), ADD KEY `fk_id_factura` (`id_factura`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_id_comision` (`id_comision`), ADD KEY `fk_id_cliente` (`id_cliente`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_categoria_id` (`categoria_id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `documento` (`documento`), ADD UNIQUE KEY `nombre_usuario` (`nombre_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `comision`
--
ALTER TABLE `comision`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `detalle`
--
ALTER TABLE `detalle`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=70;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle`
--
ALTER TABLE `detalle`
ADD CONSTRAINT `fk_id_factura` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_id_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
ADD CONSTRAINT `fk_id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_id_comision` FOREIGN KEY (`id_comision`) REFERENCES `comision` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
ADD CONSTRAINT `fk_categoria_id` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;