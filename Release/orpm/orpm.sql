-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.14 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             8.1.0.4545
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table real estate1.applications_leases
CREATE TABLE IF NOT EXISTS `applications_leases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tenants` int(10) unsigned DEFAULT NULL,
  `property` int(10) unsigned DEFAULT NULL,
  `unit` int(10) unsigned DEFAULT NULL,
  `type` varchar(40) NOT NULL DEFAULT 'Fixed',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `recurring_charges_frequency` varchar(40) DEFAULT NULL,
  `next_due_date` date DEFAULT NULL,
  `rent` varchar(40) DEFAULT NULL,
  `security_deposit` decimal(15,0) DEFAULT NULL,
  `security_deposit_date` date DEFAULT NULL,
  `status` varchar(40) NOT NULL DEFAULT 'Application',
  `notes` text,
  `agreement` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tenants` (`tenants`),
  KEY `property` (`property`),
  KEY `unit` (`unit`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table real estate1.applications_leases: ~2 rows (approximately)
/*!40000 ALTER TABLE `applications_leases` DISABLE KEYS */;
INSERT INTO `applications_leases` (`id`, `tenants`, `property`, `unit`, `type`, `start_date`, `end_date`, `recurring_charges_frequency`, `next_due_date`, `rent`, `security_deposit`, `security_deposit_date`, `status`, `notes`, `agreement`) VALUES
	(1, 1, 1, 1, 'At-will', '2014-04-01', '2015-04-01', 'monthly', '2014-05-01', '700', 1400, '2014-03-03', 'Application', '<br>', '1'),
	(2, 3, 2, 2, 'Fixed', '2014-05-01', '2016-04-30', 'monthly', '2014-06-01', '800', 1600, '2014-03-01', 'Lease', '<br>', '1'),
	(3, 2, 2, 6, 'Fixed', '2014-04-01', '2016-03-31', 'monthly', '2014-05-01', '900', 1800, '2014-03-01', 'Lease', '<br>', '1');
/*!40000 ALTER TABLE `applications_leases` ENABLE KEYS */;


-- Dumping structure for table real estate1.employment_and_income_history
CREATE TABLE IF NOT EXISTS `employment_and_income_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tenant` int(10) unsigned DEFAULT NULL,
  `employer_name` varchar(15) DEFAULT NULL,
  `city` varchar(15) DEFAULT NULL,
  `employer_phone` varchar(15) DEFAULT NULL,
  `employed_from` date DEFAULT NULL,
  `employed_till` date DEFAULT NULL,
  `monthly_gross_pay` decimal(6,2) DEFAULT NULL,
  `occupation` varchar(40) DEFAULT NULL,
  `additional_income_2nd_job` varchar(40) DEFAULT NULL,
  `assets` varchar(15) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  KEY `tenant` (`tenant`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table real estate1.employment_and_income_history: ~0 rows (approximately)
/*!40000 ALTER TABLE `employment_and_income_history` DISABLE KEYS */;
INSERT INTO `employment_and_income_history` (`id`, `tenant`, `employer_name`, `city`, `employer_phone`, `employed_from`, `employed_till`, `monthly_gross_pay`, `occupation`, `additional_income_2nd_job`, `assets`, `notes`) VALUES
	(1, 1, 'Anderson Lopez', 'New Yourk', '4989582423', '2012-12-01', '2014-01-31', 5000.00, 'database developer', 'None', 'None ', '<br>');
/*!40000 ALTER TABLE `employment_and_income_history` ENABLE KEYS */;


-- Dumping structure for table real estate1.membership_grouppermissions
CREATE TABLE IF NOT EXISTS `membership_grouppermissions` (
  `permissionID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupID` int(11) DEFAULT NULL,
  `tableName` varchar(100) DEFAULT NULL,
  `allowInsert` tinyint(4) DEFAULT NULL,
  `allowView` tinyint(4) NOT NULL DEFAULT '0',
  `allowEdit` tinyint(4) NOT NULL DEFAULT '0',
  `allowDelete` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`permissionID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table real estate1.membership_grouppermissions: ~8 rows (approximately)
/*!40000 ALTER TABLE `membership_grouppermissions` DISABLE KEYS */;
INSERT INTO `membership_grouppermissions` (`permissionID`, `groupID`, `tableName`, `allowInsert`, `allowView`, `allowEdit`, `allowDelete`) VALUES
	(1, 2, 'properties', 1, 3, 3, 3),
	(2, 2, 'tenants', 1, 3, 3, 3),
	(3, 2, 'residence_and_rental_history', 1, 3, 3, 3),
	(4, 2, 'employment_and_income_history', 1, 3, 3, 3),
	(5, 2, 'references', 1, 3, 3, 3),
	(6, 2, 'applications_leases', 1, 3, 3, 3),
	(7, 2, 'rental_owners', 1, 3, 3, 3),
	(8, 2, 'units', 1, 3, 3, 3);
/*!40000 ALTER TABLE `membership_grouppermissions` ENABLE KEYS */;


-- Dumping structure for table real estate1.membership_groups
CREATE TABLE IF NOT EXISTS `membership_groups` (
  `groupID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `description` text,
  `allowSignup` tinyint(4) DEFAULT NULL,
  `needsApproval` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`groupID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table real estate1.membership_groups: ~2 rows (approximately)
/*!40000 ALTER TABLE `membership_groups` DISABLE KEYS */;
INSERT INTO `membership_groups` (`groupID`, `name`, `description`, `allowSignup`, `needsApproval`) VALUES
	(1, 'anonymous', 'Anonymous group created automatically on 2014-03-02', 0, 0),
	(2, 'Admins', 'Admin group created automatically on 2014-03-02', 0, 1);
/*!40000 ALTER TABLE `membership_groups` ENABLE KEYS */;


-- Dumping structure for table real estate1.membership_userpermissions
CREATE TABLE IF NOT EXISTS `membership_userpermissions` (
  `permissionID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `memberID` varchar(20) NOT NULL,
  `tableName` varchar(100) DEFAULT NULL,
  `allowInsert` tinyint(4) DEFAULT NULL,
  `allowView` tinyint(4) NOT NULL DEFAULT '0',
  `allowEdit` tinyint(4) NOT NULL DEFAULT '0',
  `allowDelete` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`permissionID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table real estate1.membership_userpermissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `membership_userpermissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `membership_userpermissions` ENABLE KEYS */;


-- Dumping structure for table real estate1.membership_userrecords
CREATE TABLE IF NOT EXISTS `membership_userrecords` (
  `recID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tableName` varchar(100) DEFAULT NULL,
  `pkValue` varchar(255) DEFAULT NULL,
  `memberID` varchar(20) DEFAULT NULL,
  `dateAdded` bigint(20) unsigned DEFAULT NULL,
  `dateUpdated` bigint(20) unsigned DEFAULT NULL,
  `groupID` int(11) DEFAULT NULL,
  PRIMARY KEY (`recID`),
  UNIQUE KEY `tableName_pkValue` (`tableName`,`pkValue`),
  KEY `pkValue` (`pkValue`),
  KEY `tableName` (`tableName`),
  KEY `memberID` (`memberID`),
  KEY `groupID` (`groupID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- Dumping data for table real estate1.membership_userrecords: ~21 rows (approximately)
/*!40000 ALTER TABLE `membership_userrecords` DISABLE KEYS */;
INSERT INTO `membership_userrecords` (`recID`, `tableName`, `pkValue`, `memberID`, `dateAdded`, `dateUpdated`, `groupID`) VALUES
	(1, 'properties', '1', 'admin', 1393843137, 1394147394, 2),
	(2, 'units', '1', 'admin', 1393843789, 1394911614, 2),
	(3, 'tenants', '1', 'admin', 1393844798, 1394960353, 2),
	(4, 'rental_owners', '1', 'admin', 1393846290, 1393856771, 2),
	(5, 'applications_leases', '1', 'admin', 1393848200, 1393864879, 2),
	(6, 'rental_owners', '2', 'admin', 1393856740, 1394057220, 2),
	(7, 'rental_owners', '3', 'admin', 1393857025, 1393857025, 2),
	(8, 'rental_owners', '4', 'admin', 1393857684, 1393857684, 2),
	(9, 'properties', '2', 'admin', 1393857823, 1394030122, 2),
	(10, 'tenants', '2', 'admin', 1393858854, 1394911359, 2),
	(11, 'residence_and_rental_history', '1', 'admin', 1393861754, 1393862012, 2),
	(12, 'tenants', '3', 'admin', 1393875226, 1394129997, 2),
	(13, 'properties', '3', 'admin', 1393876112, 1394029775, 2),
	(14, 'units', '2', 'admin', 1393876763, 1394029854, 2),
	(15, 'units', '3', 'admin', 1393877017, 1394909693, 2),
	(16, 'units', '4', 'admin', 1393877351, 1394029928, 2),
	(17, 'units', '5', 'admin', 1393877912, 1394029969, 2),
	(18, 'applications_leases', '2', 'admin', 1393879015, 1393926335, 2),
	(19, 'references', '1', 'admin', 1393944974, 1393944974, 2),
	(20, 'employment_and_income_history', '1', 'admin', 1393945579, 1394056818, 2),
	(21, 'residence_and_rental_history', '2', 'admin', 1393945950, 1393946305, 2),
	(22, 'units', '6', 'admin', 1394051821, 1394974614, 2),
	(23, 'applications_leases', '3', 'admin', 1394911300, 1394974602, 2);
/*!40000 ALTER TABLE `membership_userrecords` ENABLE KEYS */;


-- Dumping structure for table real estate1.membership_users
CREATE TABLE IF NOT EXISTS `membership_users` (
  `memberID` varchar(20) NOT NULL,
  `passMD5` varchar(40) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `signupDate` date DEFAULT NULL,
  `groupID` int(10) unsigned DEFAULT NULL,
  `isBanned` tinyint(4) DEFAULT NULL,
  `isApproved` tinyint(4) DEFAULT NULL,
  `custom1` text,
  `custom2` text,
  `custom3` text,
  `custom4` text,
  `comments` text,
  `pass_reset_key` varchar(100) DEFAULT NULL,
  `pass_reset_expiry` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`memberID`),
  KEY `groupID` (`groupID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table real estate1.membership_users: ~2 rows (approximately)
/*!40000 ALTER TABLE `membership_users` DISABLE KEYS */;
INSERT INTO `membership_users` (`memberID`, `passMD5`, `email`, `signupDate`, `groupID`, `isBanned`, `isApproved`, `custom1`, `custom2`, `custom3`, `custom4`, `comments`, `pass_reset_key`, `pass_reset_expiry`) VALUES
	('admin', '12b6cdb18079f4940890c1d3ff44a221', 'support@bigprof.com', '2014-03-02', 2, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2014-03-02', NULL, NULL),
	('guest', NULL, NULL, '2014-03-02', 1, 0, 1, NULL, NULL, NULL, NULL, 'Anonymous member created automatically on 2014-03-02', NULL, NULL);
/*!40000 ALTER TABLE `membership_users` ENABLE KEYS */;


-- Dumping structure for table real estate1.properties
CREATE TABLE IF NOT EXISTS `properties` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `property_name` varchar(15) NOT NULL,
  `unit` varchar(40) DEFAULT NULL,
  `type` varchar(40) NOT NULL,
  `number_of_units` decimal(15,0) DEFAULT NULL,
  `owner` int(10) unsigned DEFAULT NULL,
  `operating_account` varchar(40) NOT NULL,
  `property_reserve` decimal(15,0) DEFAULT NULL,
  `rental_amount` decimal(6,2) DEFAULT NULL,
  `deposit_amount` decimal(6,2) DEFAULT NULL,
  `lease_term` varchar(15) DEFAULT NULL,
  `country` varchar(40) DEFAULT NULL,
  `street` varchar(40) DEFAULT NULL,
  `City` varchar(40) DEFAULT NULL,
  `State` varchar(40) DEFAULT NULL,
  `ZIP` decimal(15,0) DEFAULT NULL,
  `photo` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table real estate1.properties: ~3 rows (approximately)
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` (`id`, `property_name`, `unit`, `type`, `number_of_units`, `owner`, `operating_account`, `property_reserve`, `rental_amount`, `deposit_amount`, `lease_term`, `country`, `street`, `City`, `State`, `ZIP`, `photo`) VALUES
	(1, 'Appartment', '218 W', 'Residential', 1, 1, 'Operating bank account', 1000, 700.00, 1400.00, NULL, 'United States', '795 E DRAGRAM', 'TUCSON', 'AZ', 85705, '57549900_1394029329.jpg'),
	(2, 'House', '592', 'Residential', 1, 4, 'Operating bank account', 2000, 1000.00, 2500.00, NULL, 'United States', '421 E DRACHMAN', 'TUCSON', 'AZ', 7598, '51585300_1394030122.jpg'),
	(3, 'House', '123 ', 'Residential', 4, 3, 'Security deposit bank account', 16000, 1000.00, 2000.00, NULL, 'United States', 'FLOYLSTONE AVE', 'SEATTLE ', 'WA', 42525, '36299700_1394029775.jpg');
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;


-- Dumping structure for table real estate1.references
CREATE TABLE IF NOT EXISTS `references` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tenant` int(10) unsigned DEFAULT NULL,
  `reference_first_name_1` varchar(15) DEFAULT NULL,
  `reference_last_name_1` varchar(15) DEFAULT NULL,
  `phone_1` varchar(15) DEFAULT NULL,
  `first_name_2` varchar(15) DEFAULT NULL,
  `last_name_2` varchar(15) DEFAULT NULL,
  `phone_2` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tenant` (`tenant`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table real estate1.references: ~0 rows (approximately)
/*!40000 ALTER TABLE `references` DISABLE KEYS */;
INSERT INTO `references` (`id`, `tenant`, `reference_first_name_1`, `reference_last_name_1`, `phone_1`, `first_name_2`, `last_name_2`, `phone_2`) VALUES
	(1, 1, 'Oliver', 'Thomson', '34567893', 'David ', 'Hopkins ', '34125574');
/*!40000 ALTER TABLE `references` ENABLE KEYS */;


-- Dumping structure for table real estate1.rental_owners
CREATE TABLE IF NOT EXISTS `rental_owners` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(40) DEFAULT NULL,
  `last_name` varchar(40) DEFAULT NULL,
  `company_name` varchar(40) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `primary_email` varchar(40) DEFAULT NULL,
  `alternate_email` varchar(40) DEFAULT NULL,
  `phone` varchar(40) DEFAULT NULL,
  `country` varchar(40) DEFAULT NULL,
  `street` varchar(40) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `state` varchar(40) DEFAULT NULL,
  `zip` decimal(15,0) DEFAULT NULL,
  `comments` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table real estate1.rental_owners: ~3 rows (approximately)
/*!40000 ALTER TABLE `rental_owners` DISABLE KEYS */;
INSERT INTO `rental_owners` (`id`, `first_name`, `last_name`, `company_name`, `date_of_birth`, `primary_email`, `alternate_email`, `phone`, `country`, `street`, `city`, `state`, `zip`, `comments`) VALUES
	(1, 'Marry', 'Miller ', 'SMALLSYS INC', '1969-03-12', 'marrymiller@she.com', 'mmiller@we.com', '3456789012', 'United States', '795 E DRAGRAM', 'TUCSON', 'AZ', 85705, '<br>'),
	(2, 'Anthony', 'White', 'JOHN GULLIBLE', '1969-03-12', 'anthonywhite@he.com', 'antonwhite@he.com', '7665342187', 'United States', '200 E MAIN ST', 'PHOENIX', 'AZ', 8512, '<br>'),
	(3, 'Suzan', 'Edward', 'MARY ROE', '1976-07-16', 'suzanedward@she.com', 'suzan89@she.com', '3452877690', 'United States', '799 E DRAGRAM SUITE 5A   ', 'TUCSON', 'AZ', 8570, '<br>'),
	(4, 'John', 'Smith', 'MEGASYSTEMS INC', '1964-09-16', 'johnsmith@he.com', 'jsmith@megasystems.com', '2345678912', 'United States', '300 BOYLSTON AVE E', 'SEATTLE', 'WA', 98102, '<br>');
/*!40000 ALTER TABLE `rental_owners` ENABLE KEYS */;


-- Dumping structure for table real estate1.residence_and_rental_history
CREATE TABLE IF NOT EXISTS `residence_and_rental_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tenant` int(10) unsigned DEFAULT NULL,
  `address` varchar(40) DEFAULT NULL,
  `landlord_or_manager_name` varchar(15) DEFAULT NULL,
  `landlord_or_manager_phone` varchar(15) DEFAULT NULL,
  `monthly_rent` decimal(6,2) DEFAULT NULL,
  `date_of_residency_from` date DEFAULT NULL,
  `date_of_residency_to` date DEFAULT NULL,
  `reason_for_leaving` varchar(40) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  KEY `tenant` (`tenant`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table real estate1.residence_and_rental_history: ~2 rows (approximately)
/*!40000 ALTER TABLE `residence_and_rental_history` DISABLE KEYS */;
INSERT INTO `residence_and_rental_history` (`id`, `tenant`, `address`, `landlord_or_manager_name`, `landlord_or_manager_phone`, `monthly_rent`, `date_of_residency_from`, `date_of_residency_to`, `reason_for_leaving`, `notes`) VALUES
	(1, 2, '100', 'Mark Peterson', '8293457927', 700.00, '2012-04-01', '2014-03-31', 'better job opportunity', '<br>'),
	(2, 1, 'Jersey City, New York', 'Fritz Wold', '45266542', 3000.00, '2009-07-01', '2014-01-31', 'Moving to Tucson ', '<br>');
/*!40000 ALTER TABLE `residence_and_rental_history` ENABLE KEYS */;


-- Dumping structure for table real estate1.tenants
CREATE TABLE IF NOT EXISTS `tenants` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(15) DEFAULT NULL,
  `last_name` varchar(15) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `driver_license_number` varchar(15) DEFAULT NULL,
  `driver_license_state` varchar(15) DEFAULT NULL,
  `total_number_of_occupants` varchar(15) DEFAULT NULL,
  `unit_or_address_applying_for` varchar(40) DEFAULT NULL,
  `requested_lease_term` varchar(15) DEFAULT NULL,
  `status` varchar(40) NOT NULL DEFAULT 'Applicant',
  `emergency_contact` varchar(100) DEFAULT NULL,
  `co_signer_details` varchar(100) DEFAULT NULL,
  `notes` text,
  `photo` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `property_or_address_applying_for` (`unit_or_address_applying_for`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table real estate1.tenants: ~3 rows (approximately)
/*!40000 ALTER TABLE `tenants` DISABLE KEYS */;
INSERT INTO `tenants` (`id`, `first_name`, `last_name`, `email`, `phone`, `birth_date`, `driver_license_number`, `driver_license_state`, `total_number_of_occupants`, `unit_or_address_applying_for`, `requested_lease_term`, `status`, `emergency_contact`, `co_signer_details`, `notes`, `photo`) VALUES
	(1, 'Nancy', 'Walker', 'nancywalker@she.com', '9876543210', '1973-03-01', '34267789', 'CA', '5', '1', NULL, 'Applicant', 'Name: Carola Paul\r\ne-mail: carolapaul@she.com\r\nPhone:1348973884\r\nAddress: POB 65502\r\nTUCSON AZ 85728', 'Name: John Steve \r\ne-mail: johnsteve@he.com\r\nPhone:48245543\r\nAddress: 300 BOYLSTON AVE E\r\nSEATTLE WA', '<br>', '87076300_1394033914.jpg'),
	(2, 'Olivia', 'Medison', 'oliviamedison@she.com', '8998435325', '1980-01-23', '76895432', 'GU', '3', '2', NULL, 'Applicant', 'Name: Nim Jackson\r\nemail: nimjackson@she.com', 'Name: Nim Jackson\r\nemail: nimjackson@she.com', '<br>', NULL),
	(3, 'Elisabeth', 'Ban', 'elisabethban@live.com', '2098435890', '1985-07-20', '76589965', 'GU', '6', '2', NULL, 'Tenant', NULL, NULL, '<br>', NULL);
/*!40000 ALTER TABLE `tenants` ENABLE KEYS */;


-- Dumping structure for table real estate1.units
CREATE TABLE IF NOT EXISTS `units` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `property` int(10) unsigned DEFAULT NULL,
  `unit_number` varchar(40) DEFAULT NULL,
  `size` decimal(15,0) DEFAULT NULL,
  `market_rent` decimal(15,0) DEFAULT NULL,
  `country` varchar(40) DEFAULT NULL,
  `street` varchar(40) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `state` varchar(40) DEFAULT NULL,
  `postal_code` varchar(40) DEFAULT NULL,
  `bedrooms` varchar(40) DEFAULT NULL,
  `bath` decimal(15,0) DEFAULT NULL,
  `description` text,
  `features` text,
  `status` varchar(40) NOT NULL,
  `photo` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `property` (`property`),
  KEY `unit_number` (`unit_number`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table real estate1.units: ~5 rows (approximately)
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
INSERT INTO `units` (`id`, `property`, `unit_number`, `size`, `market_rent`, `country`, `street`, `city`, `state`, `postal_code`, `bedrooms`, `bath`, `description`, `features`, `status`, `photo`) VALUES
	(1, 1, '218 W', 500, NULL, '1', '1', '1', '1', '1', '6', 5, '<br>', 'Cable ready,  Micorwave, Hardwood floors,  High speed internet, Air conditioning, Balcony, Garage parking', 'Unlisted', '57612900_1394032522.jpg'),
	(2, 3, 'Apartment 123 A', 500, NULL, '3', '3', '3', '3', '3', '5', 4, '<br>', 'Cable ready,  Micorwave, Hardwood floors,  High speed internet, Air conditioning, Refrigerator, Dishwasher, Walk-in closets, Balcony, Garage parking, Fenced yard,  Heat - oil', 'Listed', '85754400_1394029854.jpg'),
	(3, 3, 'Apartment 123 B', 350, NULL, '3', '3', '3', '3', '3', '3', 4, '<br>', 'Cable ready,  Micorwave, Hardwood floors,  High speed internet, Air conditioning, Refrigerator, Dishwasher, Walk-in closets, Garage parking, Heat - electric', 'Unlisted', '02044100_1394029888.jpg'),
	(4, 3, 'Apartment 123 C', 350, NULL, '3', '3', '3', '3', '3', '3', 4, '<br>', 'Cable ready,  Micorwave, Hardwood floors,  High speed internet, Air conditioning, Refrigerator, Dishwasher, Garage parking', 'Unlisted', '02472900_1394029928.jpg'),
	(5, 3, 'Apartment 123 D', 500, NULL, '3', '3', '3', '3', '3', '4', 5, '<br>', 'Cable ready,  Micorwave, Hardwood floors,  High speed internet, Air conditioning, Refrigerator, Dishwasher, Walk-in closets, Garage parking', 'Occupied', '10707800_1394029969.jpg'),
	(6, 2, '592', 900, NULL, '2', '2', '2', '2', '2', '4', 4, '<br>', 'Cable ready, Hardwood floors,  High speed internet, Air conditioning, Walk-in closets, Balcony, Garage parking, Laundry room / hookups', 'Listed', '07998200_1394052186.jpg');
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
