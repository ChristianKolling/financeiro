# ************************************************************
# Sequel Pro SQL dump
# Version 4135
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.34)
# Database: financeiro
# Generation Time: 2014-11-05 02:49:57 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table categorias
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categorias`;

CREATE TABLE `categorias` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) unsigned NOT NULL,
  `criacao` datetime NOT NULL,
  `modificacao` datetime NOT NULL,
  `categoria` varchar(500) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `fk_usuario_id_categoria` (`usuario_id`),
  CONSTRAINT `fk_usuario_id_categoria` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;

INSERT INTO `categorias` (`id`, `usuario_id`, `criacao`, `modificacao`, `categoria`)
VALUES
	(3,7,'2014-11-02 19:54:19','2014-11-02 19:54:19','Educação');

/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table contas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contas`;

CREATE TABLE `contas` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) unsigned NOT NULL,
  `criacao` date DEFAULT NULL,
  `modificacao` date DEFAULT NULL,
  `banco` varchar(500) DEFAULT NULL,
  `conta` varchar(500) DEFAULT NULL,
  `saldo` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usuario_id_conta` (`usuario_id`),
  CONSTRAINT `fk_usuario_id_conta` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `contas` WRITE;
/*!40000 ALTER TABLE `contas` DISABLE KEYS */;

INSERT INTO `contas` (`id`, `usuario_id`, `criacao`, `modificacao`, `banco`, `conta`, `saldo`)
VALUES
	(2,7,'2014-11-02','2014-11-02','Banco Exemplo 1','Conta Exemplo 1',100);

/*!40000 ALTER TABLE `contas` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table estados
# ------------------------------------------------------------

DROP TABLE IF EXISTS `estados`;

CREATE TABLE `estados` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `criacao` datetime NOT NULL,
  `modificacao` datetime NOT NULL,
  `sigla` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `estado` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `regiao` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;

INSERT INTO `estados` (`id`, `criacao`, `modificacao`, `sigla`, `estado`, `regiao`)
VALUES
	(1,'0000-00-00 00:00:00','0000-00-00 00:00:00','DF','Distrito Federal','Centro-Oeste');

/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table grupos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grupos`;

CREATE TABLE `grupos` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `criacao` date DEFAULT NULL,
  `modificacao` date DEFAULT NULL,
  `grupo` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `grupos` WRITE;
/*!40000 ALTER TABLE `grupos` DISABLE KEYS */;

INSERT INTO `grupos` (`id`, `criacao`, `modificacao`, `grupo`)
VALUES
	(1,'2014-10-10','2014-10-10','Web Designer'),
	(2,'2014-10-10','2014-10-10','Analista Desenvolvedor');

/*!40000 ALTER TABLE `grupos` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table movimentacoes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `movimentacoes`;

CREATE TABLE `movimentacoes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `criacao` datetime NOT NULL,
  `modificacao` datetime NOT NULL,
  `conta_id` int(11) unsigned NOT NULL,
  `categoria_id` int(11) unsigned DEFAULT NULL,
  `data` datetime NOT NULL,
  `historico` varchar(500) DEFAULT NULL,
  `documento` varchar(500) DEFAULT NULL,
  `valor` double NOT NULL,
  `rubrica` varchar(500) DEFAULT NULL,
  `atividade` varchar(500) DEFAULT NULL,
  `favorecido` varchar(500) DEFAULT NULL,
  `descricao` text,
  PRIMARY KEY (`id`),
  KEY `fk_usuario` (`usuario_id`),
  KEY `fk_conta_id` (`conta_id`),
  KEY `fk_categoria_id` (`categoria_id`),
  CONSTRAINT `fk_categoria_id` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_conta_id` FOREIGN KEY (`conta_id`) REFERENCES `contas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `movimentacoes` WRITE;
/*!40000 ALTER TABLE `movimentacoes` DISABLE KEYS */;

INSERT INTO `movimentacoes` (`id`, `usuario_id`, `criacao`, `modificacao`, `conta_id`, `categoria_id`, `data`, `historico`, `documento`, `valor`, `rubrica`, `atividade`, `favorecido`, `descricao`)
VALUES
	(3,7,'2014-11-04 03:29:36','2014-11-04 03:29:36',2,3,'2014-11-04 00:00:00','historico','123456',-1500,'Educação','Atividade','Loja material escolar','Descrição do álbum');

/*!40000 ALTER TABLE `movimentacoes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table municipios
# ------------------------------------------------------------

DROP TABLE IF EXISTS `municipios`;

CREATE TABLE `municipios` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `criacao` datetime NOT NULL,
  `modificacao` datetime NOT NULL,
  `municipio` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `estado_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fkEstado` (`estado_id`),
  CONSTRAINT `fk_estado_id` FOREIGN KEY (`estado_id`) REFERENCES `estados` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `municipios` WRITE;
/*!40000 ALTER TABLE `municipios` DISABLE KEYS */;

INSERT INTO `municipios` (`id`, `criacao`, `modificacao`, `municipio`, `estado_id`)
VALUES
	(1,'0000-00-00 00:00:00','0000-00-00 00:00:00','Brasília',1);

/*!40000 ALTER TABLE `municipios` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table usuarios
# ------------------------------------------------------------

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL DEFAULT '',
  `criacao` datetime NOT NULL,
  `modificacao` datetime NOT NULL,
  `sexo` char(1) NOT NULL DEFAULT '',
  `estado_id` int(11) unsigned NOT NULL,
  `municipio_id` int(11) unsigned NOT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `senha` varchar(500) NOT NULL DEFAULT '',
  `categoria` varchar(100) DEFAULT '',
  `codigo_mudanca` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `estado_id` (`estado_id`),
  KEY `fk_municipio_id` (`municipio_id`),
  CONSTRAINT `fk_municipio_id` FOREIGN KEY (`municipio_id`) REFERENCES `municipios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;

INSERT INTO `usuarios` (`id`, `nome`, `criacao`, `modificacao`, `sexo`, `estado_id`, `municipio_id`, `email`, `senha`, `categoria`, `codigo_mudanca`)
VALUES
	(7,'Usuário','2014-11-02 19:53:08','2014-11-02 19:53:33','m',1,1,'usuario@dominio.com.br','923faad9349fc086efb30c7bfe959eb6','permissao1',NULL);

/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table usuarios_grupos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `usuarios_grupos`;

CREATE TABLE `usuarios_grupos` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) unsigned DEFAULT NULL,
  `grupo_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usuario_id` (`usuario_id`),
  KEY `fk_grupo_id` (`grupo_id`),
  CONSTRAINT `fk_grupo_id` FOREIGN KEY (`grupo_id`) REFERENCES `grupos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `usuarios_grupos` WRITE;
/*!40000 ALTER TABLE `usuarios_grupos` DISABLE KEYS */;

INSERT INTO `usuarios_grupos` (`id`, `usuario_id`, `grupo_id`)
VALUES
	(1,7,1),
	(2,7,2);

/*!40000 ALTER TABLE `usuarios_grupos` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
