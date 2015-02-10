-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-02-2015 a las 02:02:10
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `planillas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bancos`
--

CREATE TABLE IF NOT EXISTS `bancos` (
  `id_banco` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_banco` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_banco`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

CREATE TABLE IF NOT EXISTS `cargos` (
  `id_cargo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cargo` varchar(100) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_cargo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `cargos`
--

INSERT INTO `cargos` (`id_cargo`, `nombre_cargo`, `descripcion`, `fecha_creacion`, `id_usuario`) VALUES
(1, 'ASISTENTE CONTABLE', '0001', '2015-01-01 00:00:00', 1),
(2, 'AYUDANTE GENERAL', '0002', '2015-01-01 00:00:00', 1),
(3, 'ASISTENTE ADMINISTRATIVA', '0003', '2015-01-01 00:00:00', 1),
(4, 'OFICINISTA', '0004', '2015-01-01 00:00:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas_banco_empleados`
--

CREATE TABLE IF NOT EXISTS `cuentas_banco_empleados` (
  `id_cuenta_banco_empleado` int(11) NOT NULL AUTO_INCREMENT,
  `id_empleado` int(11) DEFAULT NULL,
  `numero_empleado` int(11) DEFAULT NULL,
  `numero_cuenta` varchar(100) DEFAULT NULL,
  `id_tipo_cuenta` int(11) DEFAULT NULL,
  `nombre_tipo_cuenta` varchar(100) DEFAULT NULL,
  `tipo_tranferencia` varchar(100) DEFAULT NULL,
  `id_banco` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_cuenta_banco_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE IF NOT EXISTS `departamentos` (
  `id_departamento` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_departamento` varchar(100) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_departamento`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`id_departamento`, `nombre_departamento`, `descripcion`, `fecha_creacion`, `id_usuario`) VALUES
(1, 'ADMINISTRACION', '0001', '2015-01-01 00:00:00', 1),
(2, 'PLANTA DE SACRIFICIO', '0002', '2015-01-01 00:00:00', 1),
(3, 'CADASA', '0003', '2015-01-01 00:00:00', 1),
(4, 'MARGARITA', '0004', '2015-01-01 00:00:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descuentos_ingresos`
--

CREATE TABLE IF NOT EXISTS `descuentos_ingresos` (
  `id_descuento_ingreso` int(11) NOT NULL AUTO_INCREMENT,
  `cod_descuento_ingreso` int(11) DEFAULT NULL,
  `nombre_descuento_ingreso` varchar(100) DEFAULT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `numero_cuenta` varchar(100) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_descuento_ingreso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descuentos_ingresos_empleados`
--

CREATE TABLE IF NOT EXISTS `descuentos_ingresos_empleados` (
  `id_descuento_ingreso_empleado` int(11) NOT NULL AUTO_INCREMENT,
  `numero_cliente` varchar(100) DEFAULT NULL,
  `numero_cuenta` varchar(100) DEFAULT NULL,
  `id_empleado` int(11) DEFAULT NULL,
  `numero_empleado` varchar(100) DEFAULT NULL,
  `cod_ingreso_descuento` varchar(100) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `monto_mes` varchar(100) DEFAULT NULL,
  `monto_periodo` varchar(100) DEFAULT NULL,
  `afecta_diciembre` varchar(100) DEFAULT NULL,
  `prioridad` varchar(100) DEFAULT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `frecuencia` varchar(100) DEFAULT NULL,
  `monto_urgente` varchar(100) DEFAULT NULL,
  `referencia` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_descuento_ingreso_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dias_feriados`
--

CREATE TABLE IF NOT EXISTS `dias_feriados` (
  `id_dia_feriado` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_dia_feriado` datetime DEFAULT NULL,
  `celebracion` varchar(100) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_dia_feriado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE IF NOT EXISTS `empleados` (
  `id_empleado` int(11) NOT NULL AUTO_INCREMENT,
  `numero_empleado` varchar(100) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `cedula` varchar(100) DEFAULT NULL,
  `fecha_nacimiento` datetime DEFAULT NULL,
  `seguro_social` varchar(100) DEFAULT NULL,
  `tipo_sangre` varchar(100) DEFAULT NULL,
  `id_estado_empleado` int(11) DEFAULT NULL,
  `id_genero` int(11) DEFAULT NULL,
  `id_estado_civil` int(11) DEFAULT NULL,
  `id_nacionalidad` int(11) DEFAULT NULL,
  `sindicato` int(11) DEFAULT NULL,
  `fecha_venc_carnet` datetime DEFAULT NULL,
  `clave_renta` varchar(100) DEFAULT NULL,
  `forma_pago` varchar(100) DEFAULT NULL,
  `salario` varchar(100) DEFAULT NULL,
  `rata_x_hora` varchar(100) DEFAULT NULL,
  `horas_x_periodo` varchar(100) DEFAULT NULL,
  `fecha_ingreso` datetime DEFAULT NULL,
  `fecha_prox_vacaciones` datetime DEFAULT NULL,
  `fecha_venc_contrato` datetime DEFAULT NULL,
  `pago_efectivo` int(11) DEFAULT NULL,
  `frecuencia_pago` varchar(100) DEFAULT NULL,
  `isr_gasto` int(11) DEFAULT NULL,
  `fecha_terminacion` datetime DEFAULT NULL,
  `id_cargo` int(11) DEFAULT NULL,
  `id_seccion` int(11) DEFAULT NULL,
  `id_empresa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_empleado`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id_empleado`, `numero_empleado`, `nombre`, `apellido`, `cedula`, `fecha_nacimiento`, `seguro_social`, `tipo_sangre`, `id_estado_empleado`, `id_genero`, `id_estado_civil`, `id_nacionalidad`, `sindicato`, `fecha_venc_carnet`, `clave_renta`, `forma_pago`, `salario`, `rata_x_hora`, `horas_x_periodo`, `fecha_ingreso`, `fecha_prox_vacaciones`, `fecha_venc_contrato`, `pago_efectivo`, `frecuencia_pago`, `isr_gasto`, `fecha_terminacion`, `id_cargo`, `id_seccion`, `id_empresa`) VALUES
(2, '0001', 'LEROY', 'BEST GUERRA', '8-761-721', '2015-01-01 00:00:00', '8761721', '', 2, 1, 1, 1, 0, '2015-01-31 00:00:00', 'A-0', 'F', '300', '3.00', '100', '2015-01-29 00:00:00', '2015-01-01 00:00:00', '2015-01-31 00:00:00', 0, 'Q', 1, '2015-01-01 00:00:00', 1, 4, 1),
(3, '0001', 'wewewe', 'qeqweqwe', '8-761-721', '2015-01-28 00:00:00', '8761721', '', 1, 1, 1, 1, 1, '2015-01-05 00:00:00', 'd', 'd', '100', '1.00', '100', '2015-01-27 00:00:00', '2015-01-27 00:00:00', '2015-01-06 00:00:00', 1, 'd', 1, '2015-01-26 00:00:00', 2, 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE IF NOT EXISTS `empresas` (
  `id_empresa` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_empresa` varchar(100) DEFAULT NULL,
  `representante_legal` varchar(100) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `apartado_postal` varchar(100) DEFAULT NULL,
  `comentario` varchar(100) DEFAULT NULL,
  `telefono_1` varchar(100) DEFAULT NULL,
  `telefono_2` varchar(100) DEFAULT NULL,
  `codigo_actividad` int(1) DEFAULT NULL,
  `anno_proceso` varchar(100) DEFAULT NULL,
  `mes_proceso` varchar(100) DEFAULT NULL,
  `clave_acceso` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_empresa`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`id_empresa`, `nombre_empresa`, `representante_legal`, `direccion`, `apartado_postal`, `comentario`, `telefono_1`, `telefono_2`, `codigo_actividad`, `anno_proceso`, `mes_proceso`, `clave_acceso`) VALUES
(1, 'CAISA', '', '', '', '', '', NULL, 1, NULL, NULL, NULL),
(2, 'PICSA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'VELKARI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'AGUACATE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'SMARTS PORK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'IRBRO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'RIAJO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'empresa3', 'leroy', 'chorrera', 'panama', 'testtest', '2883311', NULL, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados_civiles`
--

CREATE TABLE IF NOT EXISTS `estados_civiles` (
  `id_estado_civil` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_estado_civil` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_estado_civil`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `estados_civiles`
--

INSERT INTO `estados_civiles` (`id_estado_civil`, `nombre_estado_civil`) VALUES
(1, 'SOLTERO'),
(2, 'CASADO'),
(3, 'UNIDO'),
(4, 'DIVORCIADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados_empleados`
--

CREATE TABLE IF NOT EXISTS `estados_empleados` (
  `id_estado_empleado` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_estado_empleado` varchar(100) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_estado_empleado`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `estados_empleados`
--

INSERT INTO `estados_empleados` (`id_estado_empleado`, `nombre_estado_empleado`, `descripcion`, `fecha_creacion`, `id_usuario`) VALUES
(1, 'ACTIVO', NULL, '2015-01-01 00:00:00', 1),
(2, 'CESADO', NULL, '2015-01-01 00:00:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados_usuarios`
--

CREATE TABLE IF NOT EXISTS `estados_usuarios` (
  `id_estado_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_estado_usuario` varchar(100) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_estado_usuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `estados_usuarios`
--

INSERT INTO `estados_usuarios` (`id_estado_usuario`, `nombre_estado_usuario`, `descripcion`, `fecha_creacion`, `id_usuario`) VALUES
(1, 'ACTIVO', NULL, '2015-01-01 00:00:00', 1),
(2, 'INACTIVO', NULL, '2015-01-01 00:00:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formas_de_pago`
--

CREATE TABLE IF NOT EXISTS `formas_de_pago` (
  `id_forma_pago` int(11) NOT NULL AUTO_INCREMENT,
  `forma_pago` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_forma_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generos`
--

CREATE TABLE IF NOT EXISTS `generos` (
  `id_genero` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_genero` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_genero`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `generos`
--

INSERT INTO `generos` (`id_genero`, `nombre_genero`) VALUES
(1, 'MASCULINO'),
(2, 'FEMENINO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `impuestos_rentas_empleados`
--

CREATE TABLE IF NOT EXISTS `impuestos_rentas_empleados` (
  `id_impuesto_renta_empleado` int(11) NOT NULL AUTO_INCREMENT,
  `id_empleado` int(11) DEFAULT NULL,
  `numero_empleado` int(11) DEFAULT NULL,
  `porcentaje_renta` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_impuesto_renta_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jornadas`
--

CREATE TABLE IF NOT EXISTS `jornadas` (
  `id_jornada` int(11) NOT NULL AUTO_INCREMENT,
  `id_turno` int(11) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `hora_inicia` varchar(100) DEFAULT NULL,
  `hora_termina` varchar(100) DEFAULT NULL,
  `total_horas` varchar(100) DEFAULT NULL,
  `paga` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_jornada`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jornadas_empleados`
--

CREATE TABLE IF NOT EXISTS `jornadas_empleados` (
  `id_jornada_empleado` int(11) NOT NULL AUTO_INCREMENT,
  `id_empleado` int(11) DEFAULT NULL,
  `numero_empleado` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `dia` varchar(100) DEFAULT NULL,
  `laboro` varchar(100) DEFAULT NULL,
  `ausencia` varchar(100) DEFAULT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `id_jornada` int(11) DEFAULT NULL,
  `com` varchar(100) DEFAULT NULL,
  `hora_entra` varchar(100) DEFAULT NULL,
  `hora_sale` varchar(100) DEFAULT NULL,
  `horas_regulares` varchar(100) DEFAULT NULL,
  `horas_extras` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_jornada_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nacionalidades`
--

CREATE TABLE IF NOT EXISTS `nacionalidades` (
  `id_nacionalidad` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_pais` varchar(100) DEFAULT NULL,
  `nacionalidad` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_nacionalidad`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `nacionalidades`
--

INSERT INTO `nacionalidades` (`id_nacionalidad`, `nombre_pais`, `nacionalidad`) VALUES
(1, 'PANAMA', 'PANAME&Ntilde;A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paises`
--

CREATE TABLE IF NOT EXISTS `paises` (
  `id_pais` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_pais` varchar(100) DEFAULT NULL,
  `nacionalidad` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_pais`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `paises`
--

INSERT INTO `paises` (`id_pais`, `nombre_pais`, `nacionalidad`) VALUES
(1, 'PANAMA', 'PANAME&Ntilde;A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodos`
--

CREATE TABLE IF NOT EXISTS `periodos` (
  `id_periodo` int(11) NOT NULL AUTO_INCREMENT,
  `anno_fiscal` varchar(100) DEFAULT NULL,
  `frecuencia_pago` varchar(100) DEFAULT NULL,
  `numero_periodo` int(11) DEFAULT NULL,
  `fecha_pago` datetime DEFAULT NULL,
  `fecha_desde` datetime DEFAULT NULL,
  `fecha_hasta` datetime DEFAULT NULL,
  `secuencia_mensual` varchar(100) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_periodo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(100) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre_rol`, `descripcion`, `fecha_creacion`, `id_usuario`) VALUES
(1, 'Super Administrador', NULL, '2015-01-01 00:00:00', 1),
(2, 'Administrador', NULL, '2015-01-01 00:00:00', 1),
(3, 'Usuario', NULL, '2015-01-01 00:00:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secciones`
--

CREATE TABLE IF NOT EXISTS `secciones` (
  `id_seccion` int(11) NOT NULL AUTO_INCREMENT,
  `id_departamento` int(11) DEFAULT NULL,
  `nombre_seccion` varchar(100) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_seccion`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `secciones`
--

INSERT INTO `secciones` (`id_seccion`, `id_departamento`, `nombre_seccion`, `descripcion`, `fecha_creacion`, `id_usuario`) VALUES
(1, 1, 'ADMINISTRACION', '0001', '2015-01-01 00:00:00', 1),
(2, 2, 'PRODUCION', '0002', '2015-01-01 00:00:00', 1),
(3, 2, 'SEGURIDAD', '0003', '2015-01-01 00:00:00', 1),
(4, 2, 'MANTENIMIENTO', '0004', '2015-01-01 00:00:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_sangres`
--

CREATE TABLE IF NOT EXISTS `tipos_sangres` (
  `id_tipo_sangre` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_sangre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_sangre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turnos`
--

CREATE TABLE IF NOT EXISTS `turnos` (
  `id_turno` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `tipo_sangre` varchar(100) DEFAULT NULL,
  `Hora_inicio` varchar(100) DEFAULT NULL,
  `Hora_final` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_turno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `id_rol` int(11) DEFAULT NULL,
  `id_estado_usuario` int(11) DEFAULT NULL,
  `nombre_usuario` varchar(100) DEFAULT NULL,
  `pwd` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `id_rol`, `id_estado_usuario`, `nombre_usuario`, `pwd`) VALUES
(1, 2, 1, 'Usuario2', '123'),
(2, 1, 1, 'Usuario1', '123'),
(3, 3, 1, 'Usuario3', '123'),
(4, 3, 2, 'usuario4', '123');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
