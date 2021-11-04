-- Listage de la structure de la table gta_serveur. gta_police_stockage
DROP TABLE IF EXISTS `gta_police_stockage`;
CREATE TABLE IF NOT EXISTS `gta_police_stockage` (
  `argent` int(11) unsigned DEFAULT 0,
  `argent_sale` int(11) unsigned DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `gta_police_stockage` (`argent`, `argent_sale`) VALUES
	(0, 0);

/*!40000 ALTER TABLE `gta_metiers` DISABLE KEYS */;
INSERT INTO `gta_metiers` (`metiers`, `salaire`, `emploi`) VALUES
  ('NYPD', 750, 'priver');
/*!40000 ALTER TABLE `gta_metiers` ENABLE KEYS */;