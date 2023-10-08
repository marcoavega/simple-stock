-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-10-2023 a las 20:59:16
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `simple-stock`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(255) NOT NULL,
  `descripcion_categoria` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre_categoria`, `descripcion_categoria`, `date_added`) VALUES
(1, 'Herramientas', 'Herramientas para las áreas.', '2023-10-03 17:43:44'),
(2, 'Insumos', 'Insumos consumibles.', '2023-10-03 17:47:01'),
(3, 'Materiales', 'Material para las áreas.', '2023-10-03 17:47:26'),
(4, 'Piezas articulador', 'Piezas de articulador provenientes de maquinado terminadas.', '2023-10-03 17:48:28'),
(5, 'Producto terminado.', 'Articulo completo.', '2023-10-03 17:49:17'),
(6, 'Papelería', 'Insumos de papelería.', '2023-10-03 17:49:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_ordenes_de_compra`
--

CREATE TABLE `detalles_ordenes_de_compra` (
  `id_detalle_orden_compra` int(11) NOT NULL,
  `id_orden_compra` int(11) NOT NULL,
  `nombre_producto` varchar(100) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` double(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

CREATE TABLE `historial` (
  `id_historial` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `nota` varchar(255) NOT NULL,
  `referencia` varchar(100) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `historial`
--

INSERT INTO `historial` (`id_historial`, `id_producto`, `user_id`, `fecha`, `nota`, `referencia`, `cantidad`) VALUES
(1, 1, 1, '2023-09-30 05:05:39', 'Obed agregó 5 producto(s) al inventario', 'zxc', 5),
(2, 1, 1, '2023-10-04 03:04:36', ' agregó 1 producto(s) al inventario', 'uno', 1),
(3, 1, 1, '2023-10-04 03:09:25', 'admin agregó 1 producto(s) al inventario', 'uno', 1),
(31, 37, 1, '2023-10-04 08:59:07', 'admin agregó 789 producto(s) al inventario', 'jhjhg', 789),
(32, 37, 1, '2023-10-05 04:08:34', 'admin agregó 2 producto(s) al inventario', 'dos', 2),
(33, 37, 1, '2023-10-05 04:27:40', 'admin agregó 2 producto(s) al inventario', 'dos', 2),
(35, 37, 1, '2023-10-05 04:36:45', 'admin quitó 1 producto(s) del inventario', 'uno', 1),
(36, 37, 1, '2023-10-05 04:36:55', 'admin agregó 1 producto(s) al inventario', '1', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `monedas`
--

CREATE TABLE `monedas` (
  `id_moneda` int(11) NOT NULL,
  `nombre_moneda` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `monedas`
--

INSERT INTO `monedas` (`id_moneda`, `nombre_moneda`) VALUES
(1, 'Peso'),
(2, 'Dólar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_de_compra`
--

CREATE TABLE `orden_de_compra` (
  `id_orden_compra` int(11) NOT NULL,
  `numero_orden` varchar(100) NOT NULL,
  `fecha_compra` date NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `status_factura` enum('Factura pagada','Factura no pagada','','') NOT NULL DEFAULT 'Factura no pagada'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id_permisos` int(11) NOT NULL,
  `nombre_permiso` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id_permisos`, `nombre_permiso`) VALUES
(1, 'administrador'),
(2, 'usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id_producto` int(11) NOT NULL,
  `codigo_producto` char(20) NOT NULL,
  `nombre_producto` char(255) NOT NULL,
  `descripcion` text NOT NULL,
  `date_added` datetime NOT NULL,
  `precio_producto` double(11,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `url_imagen` varchar(100) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id_producto`, `codigo_producto`, `nombre_producto`, `descripcion`, `date_added`, `precio_producto`, `stock`, `url_imagen`, `id_categoria`, `id_proveedor`) VALUES
(1, 'AV-002', 'Avellanador', 'medidas', '2023-09-30 05:05:39', 150.00, 8, 'img/avellanador1_4.jpg', 1, 1),
(37, 'jhjhgjk14', 'fdghd14', 'dfghdg14', '2023-10-04 08:59:07', 20.00, 791, 'img/651d0d3bdf058_76046f6aec7b911eca7a55b7b8ffc8679ec143b73530221b606fa1a91d07ff1a.jpg', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id_proveedor` int(11) NOT NULL,
  `nombre_proveedor` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id_proveedor`, `nombre_proveedor`) VALUES
(1, 'MAPI'),
(2, 'HIGHER-TOOLS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_de_cambio`
--

CREATE TABLE `tipo_de_cambio` (
  `id_tipo_cambio` int(11) NOT NULL,
  `id_moneda_origen` int(11) NOT NULL,
  `id_moneda_destino` int(11) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_de_cambio`
--

INSERT INTO `tipo_de_cambio` (`id_tipo_cambio`, `id_moneda_origen`, `id_moneda_destino`, `valor`, `fecha`) VALUES
(1, 1, 2, 18.50, '2023-10-08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL COMMENT 'auto incrementing user_id of each user, unique index',
  `user_name` varchar(64) NOT NULL COMMENT 'user''s name, unique',
  `user_password_hash` varchar(255) NOT NULL COMMENT 'user''s password in salted and hashed format',
  `id_permisos` int(11) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='user data';

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_password_hash`, `id_permisos`, `date_added`) VALUES
(1, 'administrador', '$2y$10$UDPSZSDbQ9BP.oi3uAdcYuN/fMguULJ.LrlNexhO1c7M9LFNYl2LO', 1, '2016-12-19 15:06:00'),
(6, 'usuario', '$2y$10$9PCVb7K/w5IsaApS6g.hTO/Z.guVJ3DipV98LFs0IVQvMydqvz/di', 2, '2023-10-07 09:11:23');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `detalles_ordenes_de_compra`
--
ALTER TABLE `detalles_ordenes_de_compra`
  ADD PRIMARY KEY (`id_detalle_orden_compra`),
  ADD KEY `detalle-orden` (`id_orden_compra`);

--
-- Indices de la tabla `historial`
--
ALTER TABLE `historial`
  ADD PRIMARY KEY (`id_historial`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `monedas`
--
ALTER TABLE `monedas`
  ADD PRIMARY KEY (`id_moneda`);

--
-- Indices de la tabla `orden_de_compra`
--
ALTER TABLE `orden_de_compra`
  ADD PRIMARY KEY (`id_orden_compra`),
  ADD KEY `id_proveedor` (`id_proveedor`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id_permisos`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_producto`),
  ADD UNIQUE KEY `codigo_producto` (`codigo_producto`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `id_categoria_2` (`id_categoria`),
  ADD KEY `id_proveedor` (`id_proveedor`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Indices de la tabla `tipo_de_cambio`
--
ALTER TABLE `tipo_de_cambio`
  ADD PRIMARY KEY (`id_tipo_cambio`),
  ADD KEY `id_moneda_origen` (`id_moneda_origen`,`id_moneda_destino`),
  ADD KEY `cambio-moneda2` (`id_moneda_destino`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_name` (`user_name`),
  ADD KEY `id_permisos` (`id_permisos`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `detalles_ordenes_de_compra`
--
ALTER TABLE `detalles_ordenes_de_compra`
  MODIFY `id_detalle_orden_compra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historial`
--
ALTER TABLE `historial`
  MODIFY `id_historial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `monedas`
--
ALTER TABLE `monedas`
  MODIFY `id_moneda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `orden_de_compra`
--
ALTER TABLE `orden_de_compra`
  MODIFY `id_orden_compra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `tipo_de_cambio`
--
ALTER TABLE `tipo_de_cambio`
  MODIFY `id_tipo_cambio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'auto incrementing user_id of each user, unique index', AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalles_ordenes_de_compra`
--
ALTER TABLE `detalles_ordenes_de_compra`
  ADD CONSTRAINT `detalle-orden` FOREIGN KEY (`id_orden_compra`) REFERENCES `orden_de_compra` (`id_orden_compra`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `historial`
--
ALTER TABLE `historial`
  ADD CONSTRAINT `fk_id_producto` FOREIGN KEY (`id_producto`) REFERENCES `products` (`id_producto`) ON DELETE CASCADE,
  ADD CONSTRAINT `historial_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `orden_de_compra`
--
ALTER TABLE `orden_de_compra`
  ADD CONSTRAINT `orden-provedores` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `productos-categorias` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `productos-provedores` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tipo_de_cambio`
--
ALTER TABLE `tipo_de_cambio`
  ADD CONSTRAINT `cambio-moneda` FOREIGN KEY (`id_moneda_origen`) REFERENCES `monedas` (`id_moneda`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cambio-moneda2` FOREIGN KEY (`id_moneda_destino`) REFERENCES `monedas` (`id_moneda`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users-permisos` FOREIGN KEY (`id_permisos`) REFERENCES `permisos` (`id_permisos`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
