-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-10-2023 a las 00:56:00
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

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
(1, 1, 1, '2023-10-09 21:44:46', 'administrador quitó 2 producto(s) del inventario', 'Ajuste de inventario.', 2),
(3, 44, 1, '2023-10-09 21:52:29', 'administrador agregó 1 producto(s) al inventario', 'H-0002', 1),
(4, 45, 1, '2023-10-09 22:11:10', 'administrador agregó 1 producto(s) al inventario', 'H-0003', 1),
(5, 45, 1, '2023-10-09 22:11:45', 'administrador agregó 1 producto(s) al inventario', 'Ajuste de inventario', 1),
(6, 47, 1, '2023-10-09 22:15:34', 'administrador agregó 1 producto(s) al inventario', 'H-0004', 1),
(7, 48, 1, '2023-10-09 22:17:29', 'administrador agregó 2 producto(s) al inventario', 'H-0005', 2),
(8, 49, 1, '2023-10-09 22:19:07', 'administrador agregó 2 producto(s) al inventario', 'H-0006', 2),
(9, 50, 1, '2023-10-09 22:20:17', 'administrador agregó 10 producto(s) al inventario', 'H-0007', 10),
(10, 51, 1, '2023-10-09 22:24:12', 'administrador agregó 2 producto(s) al inventario', 'H-0008', 2),
(11, 53, 1, '2023-10-09 22:25:33', 'administrador agregó 2 producto(s) al inventario', 'H-0009', 2),
(12, 54, 1, '2023-10-09 22:27:10', 'administrador agregó 4 producto(s) al inventario', 'H-0010', 4),
(13, 55, 1, '2023-10-09 23:11:39', 'administrador agregó 1 producto(s) al inventario', 'H-0011', 1),
(14, 56, 1, '2023-10-09 23:17:36', 'administrador agregó 1 producto(s) al inventario', 'H-0012', 1),
(15, 57, 1, '2023-10-09 23:18:58', 'administrador agregó 1 producto(s) al inventario', 'H-0013', 1),
(16, 58, 1, '2023-10-09 23:20:24', 'administrador agregó 1 producto(s) al inventario', 'H-0014', 1),
(17, 59, 1, '2023-10-09 23:46:06', 'administrador agregó 2 producto(s) al inventario', 'H-0015', 2),
(18, 60, 1, '2023-10-09 23:51:26', 'administrador agregó 4 producto(s) al inventario', 'H-0016', 4),
(19, 61, 1, '2023-10-09 23:54:14', 'administrador agregó 4 producto(s) al inventario', 'H-0017', 4),
(20, 63, 1, '2023-10-09 23:57:57', 'administrador agregó 4 producto(s) al inventario', 'H-0018', 4),
(21, 64, 1, '2023-10-10 00:04:28', 'administrador agregó 9 producto(s) al inventario', 'H-0019', 9),
(22, 63, 1, '2023-10-10 00:04:53', 'administrador agregó 7 producto(s) al inventario', 'Ajuste de inventario', 7),
(23, 65, 1, '2023-10-10 00:09:14', 'administrador agregó 2 producto(s) al inventario', 'H-0020', 2),
(24, 67, 1, '2023-10-10 00:11:18', 'administrador agregó 2 producto(s) al inventario', 'H-0021', 2),
(25, 70, 1, '2023-10-10 00:15:18', 'administrador agregó 2 producto(s) al inventario', 'H-0022', 2),
(26, 71, 1, '2023-10-10 00:16:38', 'administrador agregó 3 producto(s) al inventario', 'H-0023', 3),
(27, 72, 1, '2023-10-10 00:18:39', 'administrador agregó 3 producto(s) al inventario', 'H-0024', 3),
(28, 74, 1, '2023-10-10 00:20:51', 'administrador agregó 5 producto(s) al inventario', 'H-0025', 5),
(29, 75, 1, '2023-10-10 00:32:26', 'administrador agregó 0 producto(s) al inventario', 'H-0026', 0),
(30, 76, 1, '2023-10-10 00:32:47', 'administrador agregó 0 producto(s) al inventario', 'H-0027', 0),
(31, 77, 1, '2023-10-10 00:33:08', 'administrador agregó 0 producto(s) al inventario', 'H-0028', 0),
(32, 80, 1, '2023-10-10 00:34:02', 'administrador agregó 0 producto(s) al inventario', 'H-0029', 0),
(33, 81, 1, '2023-10-10 00:34:52', 'administrador agregó 0 producto(s) al inventario', 'H-0030', 0),
(34, 82, 1, '2023-10-10 00:38:38', 'administrador agregó 20 producto(s) al inventario', 'H-0031', 20),
(35, 83, 1, '2023-10-10 00:40:18', 'administrador agregó 15 producto(s) al inventario', 'H-0032', 15),
(36, 84, 1, '2023-10-10 00:41:20', 'administrador agregó 9 producto(s) al inventario', 'H-0033', 9),
(37, 86, 1, '2023-10-10 00:42:36', 'administrador agregó 10 producto(s) al inventario', 'H-0034', 10),
(38, 87, 1, '2023-10-10 00:47:59', 'administrador agregó 5 producto(s) al inventario', 'H-0035', 5),
(39, 88, 1, '2023-10-10 00:49:01', 'administrador agregó 5 producto(s) al inventario', 'H-0036', 5),
(40, 89, 1, '2023-10-10 00:50:15', 'administrador agregó 10 producto(s) al inventario', 'H-0037', 10),
(41, 91, 1, '2023-10-10 00:52:52', 'administrador agregó 4 producto(s) al inventario', 'H-0038', 4);

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
  `precio_producto_dolares` decimal(11,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `url_imagen` varchar(100) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id_producto`, `codigo_producto`, `nombre_producto`, `descripcion`, `date_added`, `precio_producto`, `precio_producto_dolares`, `stock`, `url_imagen`, `id_categoria`, `id_proveedor`) VALUES
(1, 'H-0001', 'Avellanador', '82˚ 1/4\"', '2023-09-30 05:05:39', 150.00, 0.00, 6, 'img/avellanador1_4.jpg', 1, 2),
(44, 'H-0002', 'Avellanador', '1/2\" 3FLT 82', '2023-10-09 21:52:29', 1.00, 1.00, 1, 'img/652459c468854_IMG_20231009_134859_398[1].jpg', 1, 2),
(45, 'H-0003', 'Boquilla', 'ER-32', '2023-10-09 22:11:10', 1.00, 1.00, 2, 'img/65245e5e4adc8_IMG_20231009_135742_685[1].jpg', 1, 2),
(47, 'H-0004', 'Cortador 211-270', '3/4 4FL SQ EM', '2023-10-09 22:15:34', 1.00, 1.00, 1, 'img/65245f668b348_IMG_20231009_140439_159.jpg', 1, 2),
(48, 'H-0005', 'Cortador Carbice AADF \"KENNAMETAL\"', '3/8 x 3/8 x 1 x 3 ', '2023-10-09 22:17:29', 1.00, 1.00, 2, 'img/65245fd9ed077_IMG_20231009_135542_237.jpg', 1, 2),
(49, 'H-0006', 'Cortador SA-1FM', '1/4 CYL', '2023-10-09 22:19:07', 1.00, 1.00, 2, 'img/CORTADOR.jpg', 1, 2),
(50, 'H-0007', 'Cuchilla', 'E100 P7ACERO Y ALUMINIO ', '2023-10-09 22:20:17', 1.00, 1.00, 10, 'img/652460811aecd_IMG_20231009_140404_883.jpg', 1, 2),
(51, 'H-0008', 'Fresa de carburo de tungsteno clave 125', '12,7 x 22,2 x 6,4 mm(1/2x7/8x1/4\") ', '2023-10-09 22:24:12', 1.00, 1.00, 2, 'img/FRESA.jpg', 1, 2),
(53, 'H-0009', 'Fresa de carburo de tungsteno', 'SH-5', '2023-10-09 22:25:33', 1.00, 1.00, 2, 'img/652461bd30ddf_IMG_20231009_140548_946.jpg', 1, 2),
(54, 'H-0010', 'Punta cortador para dremel', 'SC-42 Double cut burr', '2023-10-09 22:27:10', 1.00, 1.00, 4, 'img/6524621ebb627_IMG_20231009_140321_551.jpg', 1, 2),
(55, 'H-0011', 'Tarraja', '1\" M6X1', '2023-10-09 23:11:39', 1.00, 1.00, 1, 'img/65246c8bd5430_IMG_20231009_140019_434.jpg', 1, 2),
(56, 'H-0012', 'Tarraja', '1\" M5X.8', '2023-10-09 23:17:36', 1.00, 1.00, 1, 'img/65246df03f3d9_IMG_20231009_140039_500.jpg', 1, 2),
(57, 'H-0013', 'Tarraja', '1\" M4X7', '2023-10-09 23:18:58', 1.00, 1.00, 1, 'img/65246e42c629b_IMG_20231009_140058_020.jpg', 1, 2),
(58, 'H-0014', 'Tarraja', '1\" M3X.5', '2023-10-09 23:20:24', 1.00, 1.00, 1, 'img/65246e9854526_IMG_20231009_140118_450.jpg', 1, 2),
(59, 'H-0015', 'Machuelo Hy-Pro Helicoidal', '5303F 1/8 - 40 2B 3FL SEMICONICO\r\nMarca: OSG ROYCO', '2023-10-09 23:46:06', 1.00, 1.00, 2, 'img/6524749e3ac94_IMG_20231009_152944_130.jpg', 1, 2),
(60, 'H-0016', 'Machuelo OSG ROYCO', '5303F 1/8 - 40 2B 3FL SEMICONICO', '2023-10-09 23:51:26', 1.00, 1.00, 4, 'img/652475de427e8_IMG_20231009_153018_560.jpg', 1, 2),
(61, 'H-0017', 'Machuelo OSG ROYCO', '5303F 3/16-24 2B 4FL SEMICONICO', '2023-10-09 23:54:14', 1.00, 1.00, 4, 'img/65247686b6266_IMG_20231009_152858_760.jpg', 1, 2),
(63, 'H-0018', 'Machuelo OSG ROYCO', '142 M3X0.5 D3 2S/P PLUG', '2023-10-09 23:57:57', 1.00, 1.00, 11, 'img/6524776535649_IMG_20231009_152807_827.jpg', 1, 2),
(64, 'H-0019', 'Machuelo OSG ROYCO', '5305N 10-24 2B 4FL SEMICONICO', '2023-10-10 00:04:28', 1.00, 1.00, 9, 'img/652478ecd5372_IMG_20231009_152338_555.jpg', 1, 2),
(65, 'H-0020', 'Machuelo OSG ROYCO', '5301N 10-24 2B 2S/P SEMICONICO', '2023-10-10 00:09:14', 1.00, 1.00, 2, 'img/65247a0aa1a16_IMG_20231009_152338_555.jpg', 1, 2),
(67, 'H-0021', 'Machuelo OSG ROYCO', '5303F 1/4-20 2B 4FL SEMICONICO', '2023-10-10 00:11:18', 1.00, 1.00, 2, 'img/65247a86be014_IMG_20231009_152858_760.jpg', 1, 2),
(70, 'H-0022', 'Machuelo OSG ROYCO', '5303F 3/8-16 2B 4FL SEMICONICO', '2023-10-10 00:15:18', 1.00, 1.00, 2, 'img/65247b763dce8_IMG_20231009_152442_711.jpg', 1, 2),
(71, 'H-0023', 'Machuelo OSG ROYCO', 'M5X0.8 6H', '2023-10-10 00:16:38', 1.00, 1.00, 3, 'img/65247bc62733f_IMG_20231009_152701_683.jpg', 1, 2),
(72, 'H-0024', 'Machuelo OSG ROYCO', 'M6 X1 6H', '2023-10-10 00:18:39', 1.00, 1.00, 3, 'img/65247c3f9dfa5_IMG_20231009_152645_816.jpg', 1, 2),
(74, 'H-0025', 'Machuelo OSG ROYCO', 'M4 X 0.7 6H', '2023-10-10 00:20:51', 1.00, 1.00, 5, 'img/65247cc3dc7f0_IMG_20231009_152544_434.jpg', 1, 2),
(75, 'H-0026', 'Cortador', 'R1.5X6X4X50L', '2023-10-10 00:32:26', 1.00, 1.00, 0, 'img/65247f7a95089_IMG-20231009-WA0001.jpg', 1, 2),
(76, 'H-0027', 'Cortador', 'R1.0X4X4X50L', '2023-10-10 00:32:47', 1.00, 1.00, 0, 'img/65247f8f4de19_IMG-20231009-WA0001.jpg', 1, 2),
(77, 'H-0028', 'Cortador', 'R0.75X3X4X50L', '2023-10-10 00:33:08', 1.00, 1.00, 0, 'img/65247fa445d75_IMG-20231009-WA0001.jpg', 1, 2),
(80, 'H-0029', 'Cortador', 'R2.0X8X4X50L', '2023-10-10 00:34:02', 1.00, 1.00, 0, 'img/65247fda7de63_IMG-20231009-WA0001.jpg', 1, 2),
(81, 'H-0030', 'Cortador', 'R0.5X2X4X50L', '2023-10-10 00:34:52', 1.00, 1.00, 0, 'img/6524800c28db9_IMG-20231009-WA0001.jpg', 1, 2),
(82, 'H-0031', 'Inserto', 'DFT05T308HP / KC7140 / 1804829', '2023-10-10 00:38:38', 1.00, 1.00, 20, 'img/652480ee9141e_IMG_20231009_161518_511.jpg', 1, 2),
(83, 'H-0032', 'Inserto', 'KC410M / 2984054', '2023-10-10 00:40:18', 1.00, 1.00, 15, 'img/652481525eae6_IMG_20231009_161612_513.jpg', 1, 2),
(84, 'H-0033', 'Inserto', 'NT2R / KCU10 / 4175911', '2023-10-10 00:41:20', 1.00, 1.00, 9, 'img/652481907eff1_IMG_20231009_161713_523.jpg', 1, 2),
(86, 'H-0034', 'Inserto', 'NT3RK / KC5025 / 1795787', '2023-10-10 00:42:36', 1.00, 1.00, 10, 'img/652481dc39e07_IMG_20231009_161307_339.jpg', 1, 2),
(87, 'H-0035', 'Inserto', 'NG2031RK / KC5025', '2023-10-10 00:47:59', 1.00, 1.00, 5, 'img/6524831fba5b4_IMG_20231009_164537_426.jpg', 1, 2),
(88, 'H-0036', 'Inserto', 'CNMG090308MP / CNMG322MP / KC5010', '2023-10-10 00:49:01', 1.00, 1.00, 5, 'img/6524835def208_IMG_20231009_161822_013.jpg', 1, 2),
(89, 'H-0037', 'Inserto', 'A4G0205M02U02GMN / KC5025', '2023-10-10 00:50:15', 1.00, 1.00, 10, 'img/652483a716952_IMG_20231009_161742_020.jpg', 1, 2),
(91, 'H-0038', 'Inserto', 'NT3R / KC5010', '2023-10-10 00:52:52', 1.00, 1.00, 4, 'img/652484445d5e1_IMG_20231009_165123_369.jpg', 1, 2);

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
  MODIFY `id_historial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de la tabla `orden_de_compra`
--
ALTER TABLE `orden_de_compra`
  MODIFY `id_orden_compra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

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
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users-permisos` FOREIGN KEY (`id_permisos`) REFERENCES `permisos` (`id_permisos`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
