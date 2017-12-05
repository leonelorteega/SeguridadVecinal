-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-11-2015 a las 00:05:08
-- Versión del servidor: 5.6.26
-- Versión de PHP: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema_alerta`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alerta`
--

CREATE TABLE IF NOT EXISTS `alerta` (
  `ale_id` int(10) unsigned NOT NULL,
  `ale_mensaje` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ale_tipo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ale_direccion` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `zona_barrio` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `usuario` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `alerta`
--

INSERT INTO `alerta` (`ale_id`, `ale_mensaje`, `ale_tipo`, `ale_direccion`, `zona_barrio`, `usuario`) VALUES
(1, 'hola como estas ??¿', 'Medica', 'Rodolfo Iselin 1570', 'Martin Guemes', 'Juan Gabriel');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `blog`
--

CREATE TABLE IF NOT EXISTS `blog` (
  `id` int(10) unsigned NOT NULL,
  `titulo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8_unicode_ci NOT NULL,
  `src` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `href` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ide_usuario` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `blog`
--

INSERT INTO `blog` (`id`, `titulo`, `descripcion`, `src`, `href`, `ide_usuario`) VALUES
(1, 'Boostrap', 'En ocasiones puede ser útil mostrar un botón con el aspecto de haber sido presionado, es decir, con un color de borde y un color de fondo un poco más oscuro y una sombra que imite la presión del botón. Los elementos <button> consiguen este efecto mediante la pseudo-clase :active y los elementos <a> mediante la clase .active.', '', '', 0),
(2, 'Boostrap', 'En ocasiones puede ser útil mostrar un botón con el aspecto de haber sido presionado, es decir, con un color de borde y un color de fondo un poco más oscuro y una sombra que imite la presión del botón. Los elementos &lt;button&gt; consiguen este efecto mediante la pseudo-clase :active y los elementos &lt;a&gt; mediante la clase .active.', 'directorio/images/9269-bootstrap.png', 'https://www.facebook.com/gabbi.caceres.7', 1),
(3, 'Holaaaaa', 'asjajdjasdjkasjkdjkasdjkjkas', 'directorio/images/3448-Jellyfish.jpg', 'https://www.facebook.com/', 8),
(4, 'robo en barrio', 'ocurrio en la mañana a primera hora en las inmediaciones del barrio.', 'directorio/images/8681-506c610e43dcc_565_319!.jpg', 'https://www.facebook.com/gabbi.caceres.7', 10),
(5, 'hola', 'klasjdlsjljdkajdaskl', 'directorio/images/4382-', '', 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descripcion`
--

CREATE TABLE IF NOT EXISTS `descripcion` (
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(40) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `numero` varchar(50) NOT NULL,
  `nac_fecha` varchar(5) NOT NULL,
  `nac_mes` varchar(20) NOT NULL,
  `dia` varchar(2) NOT NULL,
  `nota` varchar(250) NOT NULL,
  `ide_usuario` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2015_06_21_042518_create_blog_table_', 1),
('2015_06_21_042518_create_usuario_table', 1),
('2015_06_27_023303_create_alerta_table', 1),
('2015_06_27_023806_create_tipo_alerta_table', 1),
('2015_06_27_023806_create_zona_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reminders`
--

CREATE TABLE IF NOT EXISTS `password_reminders` (
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `password_reminders`
--

INSERT INTO `password_reminders` (`type`, `email`, `token`, `created_at`) VALUES
('user', 'juanjosecastellano8@gmail.com', '715edc0970671db5a591059e95e014944378453b', '2015-11-18 08:40:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_alerta`
--

CREATE TABLE IF NOT EXISTS `tipo_alerta` (
  `tipo_id` int(10) unsigned NOT NULL,
  `ale_tipo` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tipo_alerta`
--

INSERT INTO `tipo_alerta` (`tipo_id`, `ale_tipo`) VALUES
(1, 'Seguridad'),
(2, 'Medica'),
(3, 'Accidente'),
(4, 'Otras');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(10) unsigned NOT NULL,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `apellido` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `celular` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `direccion` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `zona_barrio` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `usuario` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `update_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `apellido`, `celular`, `direccion`, `zona_barrio`, `usuario`, `email`, `password`, `remember_token`, `update_at`, `active`) VALUES
(8, 'Juan', 'Castellano', '2625503710', 'Iselin 1500', 'Martin Guemes', 'jjkcastellano', 'juanjosecastellano8@gmail.com', '$2y$10$JciddyBsGzk1/WDJiZPoxuYPFEQ9IbRK1mS9P/KFuNKpRMvZKM05C', '68R2ufjSH8L5lapsKid0PHXybpZK0trBGbtIXLZVAux1SxoDyYGRT99VOTVT', '0000-00-00 00:00:00', 1),
(9, 'Juan', 'Castellano', '12342343223', 'martin ggasdas', '1212123213', 'Juan Castellano', 'juanjosecastellano811@gmail.com', '$2y$10$KamjNkj4zyhuKHoY/1qSluWwB2mdX3.n3tTum4N74XK3JqDRX8exy', '', '0000-00-00 00:00:00', 0),
(12, 'Juan Gabriel', 'Caceres Velasco', '2604061093', 'Rodolfo Iselin 1570', 'Martin Guemes', 'gabbi', 'gabi.carp26@gmail.com', '$2y$10$mrhEeERmZQtnc8teSwkUkOM/RWGFsVERNt5va9xA9KquuiJmHintu', 'nZwIdmWpZrxIhZ06JaZKO3nItrXMR3zM0TgtFoxpqLsHiLSe4Q884j0ZFR4H', '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zona`
--

CREATE TABLE IF NOT EXISTS `zona` (
  `zona_id` int(10) unsigned NOT NULL,
  `zona_barrio` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `zona`
--

INSERT INTO `zona` (`zona_id`, `zona_barrio`) VALUES
(1, 'Martin Guemes'),
(2, 'Salto de las Rosas'),
(3, 'Catamarca'),
(4, 'Docente'),
(5, 'Centro'),
(6, 'Ansa');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alerta`
--
ALTER TABLE `alerta`
  ADD PRIMARY KEY (`ale_id`);

--
-- Indices de la tabla `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `descripcion`
--
ALTER TABLE `descripcion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_reminders`
--
ALTER TABLE `password_reminders`
  ADD KEY `password_reminders_type_index` (`type`),
  ADD KEY `password_reminders_email_index` (`email`),
  ADD KEY `password_reminders_token_index` (`token`);

--
-- Indices de la tabla `tipo_alerta`
--
ALTER TABLE `tipo_alerta`
  ADD PRIMARY KEY (`tipo_id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `zona`
--
ALTER TABLE `zona`
  ADD PRIMARY KEY (`zona_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alerta`
--
ALTER TABLE `alerta`
  MODIFY `ale_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `descripcion`
--
ALTER TABLE `descripcion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tipo_alerta`
--
ALTER TABLE `tipo_alerta`
  MODIFY `tipo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `zona`
--
ALTER TABLE `zona`
  MODIFY `zona_id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
