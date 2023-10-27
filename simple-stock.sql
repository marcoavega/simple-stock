-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-10-2023 a las 00:47:14
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
(4, 'Piezas articulador sin pintar', 'Piezas de articulador provenientes de maquinado terminadas sin pintar.', '2023-10-03 17:48:28'),
(5, 'Articulador CPI', 'Articulador completo.', '2023-10-03 17:49:17'),
(6, 'Papelería', 'Insumos de papelería.', '2023-10-03 17:49:52'),
(7, 'Materia prima maquinado articulador', 'Materiales utilizados en el área de maquinado.', '2023-10-12 18:31:04'),
(8, 'Piezas articulador pintadas.', 'Piezas de articulador pintadas.', '2023-10-13 22:38:14'),
(9, 'Articulador Análogo', 'Articulador Análogo completo.', '2023-10-13 22:40:01');

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
(42, 130, 1, '2023-10-12 19:39:07', 'administrador quitó 1 producto(s) del inventario', 'se entrego 1 a Jonathan.', 1),
(43, 137, 1, '2023-10-19 21:04:40', 'administrador quitó 1 producto(s) del inventario', 'Alejandro hdz. solicito 1 pza.', 1),
(44, 101, 1, '2023-10-20 18:18:17', 'administrador quitó 1 producto(s) del inventario', 'pidió Abraham 1 pza', 1),
(45, 141, 1, '2023-10-24 18:52:33', 'administrador quitó 1 producto(s) del inventario', 'Se entrego 1 par: Abraham', 1),
(46, 110, 1, '2023-10-27 00:51:49', 'administrador quitó 1 producto(s) del inventario', 'se entrego 1 a Abraham.', 1);

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
(91, 'H-0038', 'Inserto', 'NT3R / KC5010', '2023-10-10 00:52:52', 1.00, 1.00, 4, 'img/652484445d5e1_IMG_20231009_165123_369.jpg', 1, 2),
(92, 'H-0039', 'Broca para metal', '10.00 MM', '2023-10-10 18:11:10', 1.00, 1.00, 7, 'img/6525779ebfad1_IMG_20231010_100001_599.jpg', 1, 2),
(93, 'H-0040', 'Broca para metal', '17/64\"', '2023-10-10 18:14:21', 1.00, 1.00, 2, 'img/6525785db67f9_IMG_20231010_100116_298.jpg', 1, 2),
(94, 'H-0041', 'Broca para metal', '1/4\"', '2023-10-10 18:16:15', 1.00, 1.00, 2, 'img/652578cf4aa14_IMG_20231010_100201_147.jpg', 1, 2),
(95, 'H-0042', 'Broca para metal', '6.35 MM', '2023-10-10 18:17:30', 1.00, 1.00, 2, 'img/6525791b1534f_IMG_20231010_100354_485.jpg', 1, 2),
(96, 'H-0043', 'Broca para metal', '1/2\"', '2023-10-10 18:19:53', 1.00, 1.00, 2, 'img/652579aa0c56d_IMG_20231010_100433_527.jpg', 1, 2),
(97, 'H-0044', 'Broca para metal', '3/8\" HSS', '2023-10-10 18:21:01', 1.00, 1.00, 2, 'img/652579edc8504_IMG_20231010_100541_401.jpg', 1, 2),
(98, 'H-0045', 'Broca para concreto', '3/8\" (10)', '2023-10-10 18:22:00', 1.00, 1.00, 1, 'img/65257a28469e7_IMG_20231010_100557_681.jpg', 1, 2),
(99, 'H-0046', 'Broca para metal', '9/16\"', '2023-10-10 18:29:41', 1.00, 1.00, 1, 'img/65257bf5b93cc_IMG_20231010_102027_731.jpg', 1, 2),
(100, 'H-0047', 'Broca para metal', '31/64\"', '2023-10-10 18:30:54', 1.00, 1.00, 1, 'img/65257c3e19dfe_IMG_20231010_102050_437.jpg', 1, 2),
(101, 'H-0048', 'Broca para metal', '7/16\"', '2023-10-10 18:33:02', 1.00, 1.00, 4, 'img/65257cbf1b672_IMG_20231010_102116_322.jpg', 1, 2),
(102, 'H-0049', 'Broca para metal CLEVELAND', '1/8\" ', '2023-10-10 18:34:44', 1.00, 1.00, 15, 'img/65257d245682b_IMG_20231010_102147_476.jpg', 1, 2),
(103, 'H-0050', 'Broca para metal', '2.50 MM 0.0984\"', '2023-10-10 18:35:56', 1.00, 1.00, 5, 'img/65257d6c28af3_IMG_20231010_102225_747.jpg', 1, 2),
(104, 'H-0051', 'Broca para metal', '15/64\"', '2023-10-10 18:37:06', 1.00, 1.00, 5, 'img/65257db2b948b_IMG_20231010_102246_630.jpg', 1, 2),
(105, 'H-0052', 'Broca para metal', '7/64\" 0.1094\"', '2023-10-10 18:39:47', 1.00, 1.00, 14, 'img/65257e53c347f_IMG_20231010_102607_366.jpg', 1, 2),
(106, 'H-0053', 'Broca para metal', '3/32\"', '2023-10-10 18:41:00', 1.00, 1.00, 4, 'img/65257e9c98e90_IMG_20231010_102330_517.jpg', 1, 2),
(107, 'H-0054', 'Broca para metal', '3/16\"', '2023-10-10 18:42:00', 1.00, 1.00, 4, 'img/65257ed86fba6_IMG_20231010_102408_714.jpg', 1, 2),
(109, 'H-0055', 'Broca para metal', '4.00 MM', '2023-10-10 18:44:43', 1.00, 1.00, 5, 'img/65257f7bdf85b_IMG_20231010_102424_168.jpg', 1, 2),
(110, 'H-0056', 'Broca para metal', '11/64\" 0.1719\"', '2023-10-10 18:45:49', 1.00, 1.00, 9, 'img/65257fbd8eebc_IMG_20231010_102534_809.jpg', 1, 2),
(111, 'H-0057', 'Broca para metal', '9/64\" 0.01406\"', '2023-10-10 18:46:59', 1.00, 1.00, 10, 'img/65258003de85c_IMG_20231010_102552_755.jpg', 1, 2),
(112, 'H-0058', 'Broca para metal', '1/8\"', '2023-10-10 18:48:04', 1.00, 1.00, 8, 'img/65258044d9a12_IMG_20231010_102623_674.jpg', 1, 2),
(114, 'H-0059', 'Broca para metal', '5/32\" 0.1562\"', '2023-10-10 18:50:35', 1.00, 1.00, 7, 'img/652580db7f955_IMG_20231010_102641_410.jpg', 1, 2),
(115, 'H-0060', 'Broca para metal', '5/64\" 0.0781\"', '2023-10-10 18:54:08', 1.00, 1.00, 13, 'img/652581b01de30_IMG_20231010_102650_179.jpg', 1, 2),
(116, 'H-0061', 'Broca para metal', '27  0.1440\"  ', '2023-10-10 18:55:27', 1.00, 1.00, 4, 'img/652581ffc15c7_IMG_20231010_102659_658.jpg', 1, 2),
(117, 'H-0062', 'Broca para concreto', '5/8\"', '2023-10-10 19:01:07', 1.00, 1.00, 1, 'img/65258353be987_IMG_20231010_105534_251.jpg', 1, 2),
(118, 'H-0063', 'Broca para metal', '5/16\"', '2023-10-10 19:02:25', 1.00, 1.00, 5, 'img/652583a12c1bc_IMG_20231010_105604_565.jpg', 1, 2),
(119, 'H-0064', 'Broca para metal', '13/64', '2023-10-10 19:03:35', 1.00, 1.00, 11, 'img/652583e7491b3_IMG_20231010_105626_665.jpg', 1, 2),
(120, 'H-0065', 'Broca para metal', '7/8\"', '2023-10-10 19:04:47', 1.00, 1.00, 1, 'img/6525842fa53a5_IMG_20231010_105659_302.jpg', 1, 2),
(121, 'H-0066', 'Broca para metal', '3/4\"', '2023-10-10 19:05:36', 1.00, 1.00, 1, 'img/652584603c277_IMG_20231010_105722_077.jpg', 1, 2),
(122, 'H-0067', 'Broca para metal', '12.50 MM', '2023-10-10 19:06:41', 1.00, 1.00, 5, 'img/652584a152913_IMG_20231010_105753_757.jpg', 1, 2),
(123, 'H-0068', 'Pernos para torno', '5/16\"', '2023-10-10 19:23:41', 1.00, 1.00, 14, 'img/6525889da04c5_IMG_20231010_111900_825.jpg', 1, 2),
(124, 'H-0069', 'Rima CLEVELAND', '3/8\"', '2023-10-10 19:25:29', 1.00, 1.00, 2, 'img/65258909e297e_IMG_20231010_111931_604.jpg', 1, 2),
(125, 'H-0070', 'Rima Fenes', '3/8\"', '2023-10-10 19:26:42', 1.00, 1.00, 1, 'img/65258952c5e06_IMG_20231010_112035_863.jpg', 1, 2),
(126, 'H-0071', 'Rima Fenes', '1/2\"', '2023-10-10 19:27:53', 1.00, 1.00, 1, 'img/65258999e1c99_IMG_20231010_112058_508.jpg', 1, 2),
(127, 'H-0072', 'Pistola de silicón', 'Grande', '2023-10-10 19:45:02', 1.00, 1.00, 1, 'img/65258d9f1b792_IMG_20231010_113034_246.jpg', 1, 2),
(128, 'I-0001', 'Barras de silicón', '1/2\"', '2023-10-10 19:46:26', 1.00, 1.00, 34, 'img/65258df2a32fc_IMG_20231010_113138_143.jpg', 2, 2),
(129, 'I-0002', 'Lentes  de seguridad FOY', 'Ambar', '2023-10-10 19:47:46', 1.00, 1.00, 16, 'img/65258e42dfb13_IMG_20231010_113233_881.jpg', 2, 2),
(130, 'I-0003', 'Lentes de seguridad PRETUL', 'Transparentes', '2023-10-10 19:49:17', 1.00, 1.00, 2, 'img/65258e9d97d1d_IMG_20231010_113315_252.jpg', 2, 2),
(131, 'I-0004', 'Lentes de seguridad FOY', 'Transparentes', '2023-10-10 19:53:49', 1.00, 1.00, 1, 'img/65258faddecd5_IMG_20231010_113429_054.jpg', 2, 2),
(132, 'I-0005', 'Plasti acero', '25 ml', '2023-10-10 20:00:31', 1.00, 1.00, 1, 'img/6525913f69a16_IMG_20231010_113453_281.jpg', 2, 2),
(133, 'I-0006', 'Cinta sella roscas', '1/2\" X 7 m', '2023-10-10 20:03:55', 1.00, 1.00, 10, 'img/6525920b640f5_IMG_20231010_113514_174.jpg', 2, 2),
(134, 'I-0007', 'Disco de lija', 'Grano 120 fino 5\"', '2023-10-10 20:09:02', 1.00, 1.00, 13, 'img/6525933e1bb8b_IMG_20231010_113546_500.jpg', 2, 2),
(136, 'I-0008', 'Disco de lija', 'Grano 80 medio 5\"', '2023-10-10 20:11:36', 1.00, 1.00, 11, 'img/652593d8eea6c_IMG_20231010_113617_638.jpg', 2, 2),
(137, 'I-0009', 'Cinta de montaje doble cara', '19 mm X 5 m', '2023-10-10 20:13:24', 1.00, 1.00, 4, 'img/6525944472efc_IMG_20231010_113631_678.jpg', 2, 2),
(138, 'I-0010', 'Cinta masking', '18 mm X 50 m', '2023-10-10 20:14:34', 1.00, 1.00, 1, 'img/6525948a58bdf_IMG_20231010_113650_761.jpg', 2, 2),
(139, 'I-0011', 'Pistola de silicón', 'Chica', '2023-10-10 20:15:30', 1.00, 1.00, 1, 'img/652594c2942b8_IMG_20231010_113711_071.jpg', 2, 2),
(140, 'I-0012', 'Tapones auditivos con triple barrera', '25 db', '2023-10-10 20:16:47', 1.00, 1.00, 9, 'img/6525951016b48_IMG_20231010_113734_333.jpg', 2, 2),
(141, 'I-0013', 'Guantes de nitrilo', 'Grandes', '2023-10-10 20:17:52', 1.00, 1.00, 3, 'img/652595508a04e_IMG_20231010_113750_383.jpg', 2, 2),
(143, 'I-0014', 'Guantes de carnaza', 'Unitalla (trabajo ligero)', '2023-10-10 20:19:54', 1.00, 1.00, 2, 'img/652595ca65d46_IMG_20231010_113804_572.jpg', 2, 2),
(144, 'I-0015', 'Portalámpara para tubo flourescente', 'FA8', '2023-10-10 20:21:09', 1.00, 1.00, 2, 'img/65259615af253_IMG_20231010_113819_730.jpg', 2, 2),
(145, 'I-0016', 'Manguera para aire tipo resorte', '7.6 m', '2023-10-10 20:22:59', 1.00, 1.00, 2, 'img/652596833170a_IMG_20231010_115933_963.jpg', 2, 2),
(146, 'I-0017', 'Fumigador doméstico', '1 LT.', '2023-10-10 20:24:07', 1.00, 1.00, 1, 'img/652596c7cc55c_IMG_20231010_120000_943.jpg', 2, 2),
(147, 'H-0073', 'Martillo de hojalatero', '11 OZ.', '2023-10-10 20:25:58', 1.00, 1.00, 1, 'img/65259736a23ab_IMG_20231010_120022_666.jpg', 1, 2),
(148, 'H-0074', 'Mango para martillo', 'Mango', '2023-10-10 20:29:34', 1.00, 1.00, 2, 'img/6525980f04ad2_IMG_20231010_120039_303.jpg', 1, 2),
(149, 'H-0075', 'Maceta de goma', '606', '2023-10-10 20:35:12', 1.00, 1.00, 1, 'img/65259960a900f_IMG_20231010_120105_237.jpg', 1, 2),
(150, 'H-0076', 'Maceta de goma', '808', '2023-10-10 20:36:05', 1.00, 1.00, 1, 'img/65259995d501c_IMG_20231010_120116_822.jpg', 1, 2),
(151, 'H-0077', 'Extensión eléctrica de uso rudo', '16 AWG X 6 MTS', '2023-10-10 20:38:28', 1.00, 1.00, 6, 'img/65259a2423a75_IMG_20231010_120145_934.jpg', 1, 2),
(152, 'H-0078', 'Cautín Weller', '221-NM-146', '2023-10-10 20:47:33', 1.00, 1.00, 1, 'img/65259c45890f4_IMG_20231010_120456_039.jpg', 1, 2),
(153, 'H-0079', 'Puntas para multimetro', 'Fluke', '2023-10-10 20:54:18', 1.00, 1.00, 1, 'img/65259ddad49cb_IMG_20231010_120509_094.jpg', 1, 2),
(154, 'H-0080', 'Punta para cautín', 'CT5A7MX', '2023-10-10 20:58:46', 1.00, 1.00, 6, 'img/65259ee66b32b_IMG_20231010_120636_659.jpg', 1, 2),
(155, 'H-0081', 'Punta para cautín', 'PTA7MX', '2023-10-10 21:01:05', 1.00, 1.00, 1, 'img/65259f71740bd_IMG_20231010_120624_780.jpg', 1, 2),
(156, 'H-0082', 'Resistencia', 'HEW60PMX', '2023-10-10 21:02:34', 1.00, 1.00, 3, 'img/65259fcaca494_IMG_20231010_120721_513.jpg', 1, 2),
(158, 'I-0018', 'Disco', '40 grano, 115mm, 22mm', '2023-10-10 21:36:01', 1.00, 1.00, 2, 'img/6525a7a179664_IMG_20231010_120346_523.jpg', 2, 2),
(162, 'I-0019', 'Esponja para cautín', 'Esponja', '2023-10-10 22:08:06', 1.00, 1.00, 4, 'img/6525af2672d9e_IMG_20231010_120529_238.jpg', 2, 2),
(163, 'I-0020', 'Rollo de lija N. 100', '1 1/2\" X 148 Ft.', '2023-10-10 22:12:08', 1.00, 1.00, 1, 'img/6525b0191cc09_IMG_20231010_122251_179.jpg', 2, 2),
(164, 'I-0021', 'Rollo de lija grano 120', '38 mm X 45 m', '2023-10-10 22:13:34', 1.00, 1.00, 1, 'img/6525b06eba83a_IMG_20231010_122323_456.jpg', 2, 2),
(165, 'I-0022', 'Mini cepillo de alambre', 'Surtido', '2023-10-10 22:15:54', 1.00, 1.00, 10, 'img/6525b0fa58367_IMG_20231010_122411_264.jpg', 2, 2),
(166, 'H-0083', 'Navaja retráctil', '18 mm', '2023-10-10 22:18:25', 1.00, 1.00, 2, 'img/6525b1918b595_IMG_20231010_122514_553.jpg', 1, 2),
(167, 'H-0084', 'Navaja retráctil', 'Pequeña', '2023-10-10 22:20:33', 1.00, 1.00, 1, 'img/6525b2121263e_IMG_20231010_122537_660.jpg', 1, 2),
(168, 'I-0023', 'Repuesto para navajas', 'Repuesto', '2023-10-10 22:23:34', 1.00, 1.00, 8, 'img/6525b2c625380_IMG_20231010_122544_491.jpg', 2, 2),
(170, 'H-0085', 'Cuchilla para linóleo', '7\"', '2023-10-10 22:25:51', 1.00, 1.00, 1, 'img/6525b34f832e0_IMG_20231010_122619_684.jpg', 1, 2),
(171, 'I-0024', 'Pila alcalina', 'A76/LR44', '2023-10-10 22:28:26', 1.00, 1.00, 2, 'img/6525b3ea55aef_IMG_20231010_135502_790.jpg', 2, 2),
(175, 'H-0086', 'Lima redonda bastarda', '10\"', '2023-10-10 22:50:00', 1.00, 1.00, 1, 'img/6525b8f888bd8_IMG_20231010_140631_205.jpg', 1, 2),
(178, 'H-0087', 'Maneral tipo garrote', '5/32\" a 3/4\"', '2023-10-10 23:02:50', 1.00, 1.00, 1, 'img/6525bbfaa970d_IMG_20231010_140616_249.jpg', 1, 2),
(179, 'H-0088', 'Lima bastarda de media caña escofina', '4\"', '2023-10-10 23:16:28', 1.00, 1.00, 1, 'img/6525bf2c397c0_IMG_20231010_140059_679.jpg', 1, 2),
(180, 'H-0089', 'Lima triangular de uso regular', '5\"', '2023-10-10 23:18:59', 1.00, 1.00, 1, 'img/6525bfc39a576_IMG_20231010_140110_037.jpg', 1, 1),
(181, 'H-0090', 'Lima plana', '5\"', '2023-10-10 23:23:47', 1.00, 1.00, 1, 'img/6525c0e41ba0b_IMG_20231010_140231_563.jpg', 1, 2),
(182, 'H-0091', 'Bomba desoldadora', 'Extractor', '2023-10-10 23:25:18', 1.00, 1.00, 1, 'img/6525c13eddb97_IMG_20231010_140308_697.jpg', 1, 2),
(183, 'H-0092', 'Maneral ajustable', '1/16\" X 1/4\"', '2023-10-10 23:27:46', 1.00, 1.00, 1, 'img/6525c1d3111fa_IMG_20231010_140321_313.jpg', 1, 2),
(184, 'H-0093', 'Lima bastarda de media caña', '5\"', '2023-10-10 23:30:01', 1.00, 1.00, 1, 'img/6525c259c5ab7_IMG_20231010_140403_929.jpg', 1, 2),
(185, 'H-0094', 'Broca para concreto', '1/4\" X 12', '2023-10-10 23:32:19', 1.00, 1.00, 1, 'img/6525c2e3e549b_IMG_20231010_140424_912.jpg', 1, 2),
(186, 'H-0095', 'Segueta', 'Diente fino', '2023-10-10 23:34:38', 1.00, 1.00, 1, 'img/6525c36f1b8b4_IMG_20231010_140447_425.jpg', 1, 2),
(187, 'H-0096', 'Broca para concreto', 'Longitud 12\"', '2023-10-10 23:36:42', 1.00, 1.00, 1, 'img/6525c3eab5029_IMG_20231010_140603_518.jpg', 1, 2),
(188, 'H-0097', 'Maneral tipo garrote', '5/32\" X 3/4\"', '2023-10-10 23:38:50', 1.00, 1.00, 1, 'img/6525c46a46249_IMG_20231010_140616_249.jpg', 1, 2),
(189, 'H-0098', 'Tijera', '8\"', '2023-10-10 23:41:52', 1.00, 1.00, 1, 'img/6525c520ab147_IMG_20231010_152301_159.jpg', 1, 2),
(190, 'I-0025', 'Rueda flap con vástago grano 80', 'Ø 2\"', '2023-10-10 23:45:32', 1.00, 1.00, 1, 'img/6525c5fd16336_IMG_20231010_152326_826.jpg', 1, 2),
(191, 'I-0026', 'Rueda flap con vástago grano 120', 'Ø 2\"', '2023-10-10 23:47:11', 1.00, 1.00, 1, 'img/6525c65f73832_IMG_20231010_152326_826.jpg', 2, 2),
(192, 'I-0027', 'Cuchillas de repuesto para cortador de tubo', '18 mm', '2023-10-10 23:54:50', 1.00, 1.00, 1, 'img/6525c82ab8050_IMG_20231010_152338_762.jpg', 2, 2),
(193, 'H-0099', 'Destornillador de caja', '3/8\" X 3\"', '2023-10-10 23:59:33', 1.00, 1.00, 2, 'img/6525c945b5da9_IMG_20231010_152358_564.jpg', 1, 2),
(194, 'H-0100', 'Desarmador Comfort Grip', '75 mm x 3\"', '2023-10-11 00:03:47', 1.00, 1.00, 3, 'img/6525ca43c0e7c_IMG_20231010_152435_828.jpg', 1, 2),
(195, 'H-0101', 'Desarmador Screwdriver', '7\"', '2023-10-11 00:10:14', 1.00, 1.00, 1, 'img/6525cbc6b03b5_IMG_20231010_152502_653.jpg', 1, 2),
(196, 'H-0102', 'Desarmador Phillips', 'PH0 x 4\"', '2023-10-11 00:12:22', 1.00, 1.00, 2, 'img/6525cc468391d_IMG_20231010_152543_607.jpg', 1, 2),
(197, 'H-0103', 'Desarmador de cruz', '1/4\" x 4', '2023-10-11 00:14:46', 1.00, 1.00, 1, 'img/6525ccd6a8bec_IMG_20231010_152631_435.jpg', 1, 2),
(198, 'H-0104', 'Dado corto', '9/16\"', '2023-10-11 00:16:52', 1.00, 1.00, 1, 'img/6525cd5485220_IMG_20231010_152650_260.jpg', 1, 2),
(199, 'H-0105', 'Desarmador', 'Plano', '2023-10-11 00:18:15', 1.00, 1.00, 1, 'img/6525cda71bafc_IMG_20231010_152722_888.jpg', 1, 2),
(200, 'H-0106', 'Punzón para barrenar', '3/8\"', '2023-10-11 00:26:36', 1.00, 1.00, 2, 'img/6525cf9cb1b93_IMG_20231010_152809_144.jpg', 1, 2),
(201, 'H-0107', 'Punzón', '5/16\" X 1/8\"', '2023-10-11 00:27:28', 1.00, 1.00, 3, 'img/6525cfd0b2658_IMG_20231010_152923_737.jpg', 1, 2),
(202, 'H-0108', 'Destornillador de caja', '7 mm', '2023-10-11 00:29:20', 1.00, 1.00, 1, 'img/6525d0405cc72_IMG_20231010_152942_826.jpg', 1, 2),
(203, 'H-0109', 'llave ajustable', '6\" marca: FOY', '2023-10-13 00:35:39', 1.00, 1.00, 1, 'img/652874bb6fa72_IMG_20231010_154434_712.jpg', 1, 2),
(204, 'H-0110', 'Llave de presión', '10\"', '2023-10-13 00:37:15', 1.00, 1.00, 1, 'img/6528751b2fbb0_IMG_20231010_154521_868.jpg', 1, 2),
(205, 'H-0111', 'pinzas para anillos de retención.', 'desde 65mm hasta 12mm', '2023-10-13 00:39:04', 1.00, 1.00, 1, 'img/6528758810807_IMG_20231010_154539_966.jpg', 1, 2),
(206, 'H-0112', 'Pinzas de presión', 'Tipo prensa', '2023-10-13 00:41:10', 1.00, 1.00, 1, 'img/65287606afac3_IMG_20231010_154605_145.jpg', 1, 2),
(208, 'H-0113', 'pinzas de punta', 'medianas', '2023-10-13 00:43:52', 1.00, 1.00, 1, 'img/652876a891028_IMG_20231010_154616_619.jpg', 1, 2),
(209, 'H-0114', 'Pinzas para anillo de retención', 'de 90grados', '2023-10-13 00:45:16', 1.00, 1.00, 1, 'img/652876fc979d2_IMG_20231010_154629_828.jpg', 1, 2),
(210, 'H-0115', 'Matraca', '3/8\"', '2023-10-13 00:46:51', 1.00, 1.00, 1, 'img/6528775b9ea45_IMG_20231010_154639_333.jpg', 1, 2),
(211, 'H-0116', 'juego de llaves Allen tipo navaja', 'estándar', '2023-10-13 00:50:00', 1.00, 1.00, 1, 'img/6528781895bd7_IMG_20231010_154720_527.jpg', 1, 2),
(212, 'H-0117', 'llave combinada.', '3/8\" X 16cm', '2023-10-13 22:46:54', 1.00, 1.00, 2, 'img/6529acbf18aa1_IMG_20231010_154821_267.jpg', 1, 2),
(213, 'H-0118', 'Llave combinada', '9/16\"', '2023-10-13 23:40:10', 1.00, 1.00, 1, 'img/6529b93ac3c8c_IMG_20231010_155051_770.jpg', 1, 2),
(214, 'H-0119', 'Dado Corto 9/16\"', '9/16\" marca SURTEK', '2023-10-20 23:39:59', 30.00, 1.40, 1, 'img/6532f3afa9ab7_IMG_20231020_153551_656_hdr.jpg', 1, 2),
(216, 'I-0028', 'Brocha 1\"', '1\" Marca Comex', '2023-10-20 23:46:41', 1.00, 1.00, 1, 'img/6532f541a667b_IMG_20231020_153607_481_hdr.jpg', 2, 2),
(218, 'H-0120', 'Llave Mixta 1/2\"', '1/2\" Marca Urrea', '2023-10-23 23:47:57', 1.00, 1.00, 2, 'img/6536ea0dc3f5e_IMG_20231010_155121_905.jpg', 1, 2),
(219, 'H-0121', 'Llave Mixta 3/8\"', '3/8\" Marca Urrea', '2023-10-23 23:50:05', 1.00, 1.00, 2, 'img/6536ea8d57ef4_IMG_20231010_155144_754.jpg', 1, 2),
(220, 'H-0122', 'Llave Allen 3/16\"', 'Llave Allen 3/16\"', '2023-10-23 23:54:41', 1.00, 1.00, 3, 'img/6536eba15e073_IMG_20231010_155208_965.jpg', 1, 2),
(221, 'H-0123', 'Llave Allen 3.0mm', 'Llave Allen 3.0mm', '2023-10-23 23:56:49', 1.00, 1.00, 6, 'img/6536ec2182e0e_IMG_20231010_155230_884.jpg', 1, 2),
(222, 'H-0124', 'Llave Allen 5/32\"', 'Llave Allen 5/32\"', '2023-10-23 23:58:12', 1.00, 1.00, 1, 'img/6536ec7417827_IMG_20231010_155305_259.jpg', 1, 2),
(223, 'H-0125', 'Llave Allen 5/64\"', 'Llave Allen 5/64\"', '2023-10-23 23:59:25', 1.00, 1.00, 13, 'img/6536ecbd71cce_IMG_20231010_155322_039.jpg', 1, 2),
(224, 'H-0126', 'Llave Allen 1/8\"', 'Llave Allen 1/8\"', '2023-10-24 00:00:52', 1.00, 1.00, 9, 'img/6536ed14c3b40_IMG_20231010_155448_355.jpg', 1, 2),
(225, 'H-0127', 'Llave Allen tipo T 3/32\"', 'Llave Allen tipo T 3/32\"', '2023-10-24 00:02:19', 1.00, 1.00, 4, 'img/6536ed6bb7880_IMG_20231010_155505_574.jpg', 1, 2),
(226, 'H-0128', 'Llave Allen Tipo T 1/8\"', 'Llave Allen Tipo T 1/8\" ', '2023-10-24 00:07:30', 1.00, 1.00, 4, 'img/6536eea290400_IMG_20231010_155516_199.jpg', 1, 2),
(227, 'H-0129', 'Maneral ajustable tipo T 1/2\"', 'Maneral ajustable tipo T 1/2\" marca truper', '2023-10-24 00:11:46', 1.00, 1.00, 2, 'img/6536efa239bbb_IMG_20231010_155708_862.jpg', 1, 2),
(228, 'H-0130', 'Maneral Tipo T ajustable 3/16\"', 'Maneral Tipo T ajustable 3/16\" marca Surtek', '2023-10-24 00:13:18', 1.00, 1.00, 2, 'img/6536effe5e1b3_IMG_20231010_155730_317.jpg', 1, 2),
(229, 'H-0131', 'Manera Tipo T ajustable 1/4\"', 'Manera Tipo T ajustable 1/4\" marca truper', '2023-10-24 00:14:50', 1.00, 1.00, 1, 'img/6536f05aef38d_IMG_20231010_155813_643.jpg', 1, 2),
(230, 'H-0132', 'Broquero 1/2\"', 'Broquero 1/2\" marca truper', '2023-10-24 00:16:16', 1.00, 1.00, 1, 'img/6536f0b0bc6f6_IMG_20231010_155800_670.jpg', 1, 2),
(232, 'I-0029', 'Cople Rápido Macho', 'Cople Rápido Macho', '2023-10-24 00:22:15', 1.00, 1.00, 4, 'img/6536f2171b4fa_IMG_20231010_155836_005.jpg', 2, 2),
(233, 'I-0030', 'Cople rápido hembra', 'Cople rápido hembra surtek', '2023-10-24 00:24:07', 1.00, 1.00, 2, 'img/6536f287a1b0f_IMG_20231010_155848_071.jpg', 2, 2),
(234, 'I-0031', 'Cople rápido hembra', 'Cople rápido hembra marca truper', '2023-10-24 00:25:02', 1.00, 1.00, 1, 'img/6536f2bec2c4d_IMG_20231010_155903_289.jpg', 2, 2),
(235, 'H-0133', 'Flexometro 5m x 16\"', 'Flexometro 5m x 16\" truper', '2023-10-24 00:27:25', 1.00, 1.00, 2, 'img/6536f34d60237_IMG_20231010_155922_495.jpg', 1, 2),
(236, 'I-0032', 'Pila 2016 de 3V', 'Pila 2016 de 3V marca steren', '2023-10-24 00:32:10', 1.00, 1.00, 11, 'img/6536f46a4b3ac_IMG_20231010_160102_979.jpg', 2, 2),
(238, 'I-0033', 'Pila AA 1.5V', 'Pila AA 1.5V marca RadioShack', '2023-10-24 00:40:13', 1.00, 1.00, 6, 'img/6536f64d64536_IMG_20231010_160316_111.jpg', 1, 2),
(239, 'I-0034', 'Pila AAA', 'Pila AAA marca duracel', '2023-10-24 00:41:51', 1.00, 1.00, 6, 'img/6536f6af551d7_IMG_20231010_160547_272.jpg', 2, 2),
(240, 'I-0035', 'Pila 9V', 'Pila 9V marca Duracell', '2023-10-24 00:44:06', 1.00, 1.00, 1, 'img/6536f736d0c06_IMG_20231010_160446_493.jpg', 2, 2),
(241, 'I-0036', 'Gas butano', 'Gas butano Pretul', '2023-10-24 00:44:58', 1.00, 1.00, 2, 'img/6536f76a9dc4b_IMG_20231010_160737_064.jpg', 2, 2),
(242, 'I-0037', 'WD40', 'WD40', '2023-10-24 00:45:40', 1.00, 1.00, 1, 'img/6536f79498c77_IMG_20231010_160757_880.jpg', 2, 2),
(243, 'MPM-001', 'Barra redonda INOX 1/8\" X 1.20cm', 'Barra redonda INOX 1/8\" X 1.20cm', '2023-10-24 00:47:32', 80.00, 4.00, 5, 'img/6536f804ad445_IMG-20231016-WA0001.jpg', 7, 1),
(245, 'MARC001-5B S/P', 'Tornillo mesa incisal', 'Tornillo mesa incisal sin pintar', '2023-10-26 23:17:43', 20.00, 1.00, 3, 'img/653ad8eb74bfc_IMG_20231010_16081.jpg', 4, 3),
(246, 'I-0038', 'Bolsas para basura.', 'Bolsas para basura, para desperdicio de maquinado.', '2023-10-26 23:23:55', 50.00, 2.50, 10, 'img/653ad8eb74bfc_IMG_20231010_160813_434.jpg', 2, 4),
(247, 'MARC001-5Ñ S/P', 'Cóndilo', 'Cóndilo sin pulir.', '2023-10-26 23:28:40', 20.00, 1.00, 16, 'img/653ada08abb5c_condilo.jpg', 4, 3),
(248, 'MARC001-4J S/P', 'Tornillo para elastómero', 'Tornillo para elastómero sin pulir.', '2023-10-26 23:47:28', 20.00, 1.00, 4, 'img/653ade70bc6c0_dhjasdkjadljAFKADADKADLKahjkdahdkahd12651.jpg', 4, 3),
(253, 'H-0134', 'Boquilla ER25 1/2\"', 'ER25 1/2\"', '2023-10-28 00:38:15', 532.50, 294.00, 2, 'img/20231027_162509.jpg', 1, 2),
(254, 'H-0135', 'Cortado 5/8\" HSS', '5/8\" HSS', '2023-10-28 00:40:13', 1032.40, 56.00, 1, 'img/20231027_162528.jpg', 1, 2),
(255, 'H-0136', 'Broca 28', 'Broca 28', '2023-10-28 00:41:24', 50.75, 2.75, 3, 'img/20231027_162546.jpg', 1, 2),
(256, 'H-0137', 'Broca 29', 'Broca 29', '2023-10-28 00:42:13', 50.75, 2.75, 3, 'img/20231027_162601.jpg', 1, 2),
(257, 'H-0138', 'Broca 30', 'Broca 30', '2023-10-28 00:42:54', 50.75, 2.75, 3, 'img/20231027_162608.jpg', 1, 2);

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
(2, 'HIGHER-TOOLS'),
(3, 'MAQUINADOS'),
(4, 'COMPRAS FUERA.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad_medida`
--

CREATE TABLE `unidad_medida` (
  `id_unidad_medida` int(10) NOT NULL,
  `nombre_unidad_medida` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `unidad_medida`
--

INSERT INTO `unidad_medida` (`id_unidad_medida`, `nombre_unidad_medida`) VALUES
(1, 'pieza'),
(2, 'metro'),
(3, 'pulgada'),
(4, 'kilo');

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
-- Indices de la tabla `unidad_medida`
--
ALTER TABLE `unidad_medida`
  ADD PRIMARY KEY (`id_unidad_medida`);

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
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `detalles_ordenes_de_compra`
--
ALTER TABLE `detalles_ordenes_de_compra`
  MODIFY `id_detalle_orden_compra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historial`
--
ALTER TABLE `historial`
  MODIFY `id_historial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `orden_de_compra`
--
ALTER TABLE `orden_de_compra`
  MODIFY `id_orden_compra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=258;

--
-- AUTO_INCREMENT de la tabla `unidad_medida`
--
ALTER TABLE `unidad_medida`
  MODIFY `id_unidad_medida` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
