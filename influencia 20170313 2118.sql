-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.7.13-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema prueba
--

CREATE DATABASE IF NOT EXISTS prueba;
USE prueba;

--
-- Temporary table structure for view `persona_reunion`
--
DROP TABLE IF EXISTS `persona_reunion`;
DROP VIEW IF EXISTS `persona_reunion`;
CREATE TABLE `persona_reunion` (
  `persona` bigint(10) unsigned,
  `conteo` bigint(21),
  `grupos` text
);

--
-- Definition of table `influencias`
--

DROP TABLE IF EXISTS `influencias`;
CREATE TABLE `influencias` (
  `equipo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `estocolmo` int(10) unsigned NOT NULL,
  `londres` int(10) unsigned NOT NULL,
  PRIMARY KEY (`equipo`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `influencias`
--

/*!40000 ALTER TABLE `influencias` DISABLE KEYS */;
INSERT INTO `influencias` (`equipo`,`estocolmo`,`londres`) VALUES 
 (12,1009,2000),
 (13,1009,2001),
 (14,1002,2002),
 (15,1003,2002);
/*!40000 ALTER TABLE `influencias` ENABLE KEYS */;


--
-- Definition of view `persona_reunion`
--

DROP TABLE IF EXISTS `persona_reunion`;
DROP VIEW IF EXISTS `persona_reunion`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `persona_reunion` AS select if((`londres`.`conteo` > `estocolmo`.`conteo`),`londres`.`persona`,`estocolmo`.`persona`) AS `persona`,if((`londres`.`conteo` > `estocolmo`.`conteo`),`londres`.`conteo`,`estocolmo`.`conteo`) AS `conteo`,group_concat(`londres`.`equipo` separator ' - ') AS `grupos` from ((select `prueba`.`influencias`.`equipo` AS `equipo`,`prueba`.`influencias`.`londres` AS `persona`,(select count(`i`.`londres`) AS `conteo` from `prueba`.`influencias` `i` where (`i`.`londres` = `prueba`.`influencias`.`londres`)) AS `conteo` from `prueba`.`influencias`) `londres` join (select `prueba`.`influencias`.`equipo` AS `equipo`,`prueba`.`influencias`.`estocolmo` AS `persona`,(select count(`i`.`estocolmo`) AS `conteo` from `prueba`.`influencias` `i` where (`i`.`estocolmo` = `prueba`.`influencias`.`estocolmo`)) AS `conteo` from `prueba`.`influencias`) `estocolmo`) where (`londres`.`equipo` = `estocolmo`.`equipo`) group by `persona`;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
