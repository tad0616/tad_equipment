CREATE TABLE `tad_equipment` (
  `equipment_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'equipment number',
  `title` varchar(255) NOT NULL COMMENT 'device name',
  `description` text NOT NULL COMMENT 'Device description',
  `quantity` smallint(5) unsigned NOT NULL COMMENT 'Number of devices',
  `enable` enum('1','0') NOT NULL COMMENT 'Is it possible to borrow',
  PRIMARY KEY (`equipment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `tad_equipment_records` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'borrow number',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'borrower',
  `equipment_id` smallint(5) unsigned NOT NULL COMMENT 'borrow equipment',
  `borrow_date` datetime NOT NULL COMMENT 'borrow date',
  `borrow_quantity` smallint(6) NOT NULL COMMENT 'borrow quantity',
  `borrow_reason` varchar(255) DEFAULT NULL COMMENT 'purpose description',
  `expected_return_time` datetime DEFAULT NULL COMMENT 'Expected return time',
  `return_date` datetime DEFAULT NULL COMMENT 'Return date',
  `return_quantity` smallint(6) DEFAULT NULL COMMENT 'Return quantity',
  `return_note` text COMMENT 'Return note',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `tad_equipment_files_center` (
  `files_sn` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'file serial number',
  `col_name` varchar(255) NOT NULL default '' COMMENT 'Column name',
  `col_sn` smallint(5) unsigned NOT NULL default 0 COMMENT 'Column number',
  `sort` smallint(5) unsigned NOT NULL default 0 COMMENT 'sort',
  `kind` enum('img','file') NOT NULL default 'img' COMMENT 'file type',
  `file_name` varchar(255) NOT NULL default '' COMMENT 'file name',
  `file_type` varchar(255) NOT NULL default '' COMMENT 'file type',
  `file_size` int(10) unsigned NOT NULL default 0 COMMENT 'file size',
  `description` text NOT NULL COMMENT 'file description',
  `counter` mediumint(8) unsigned NOT NULL default 0 COMMENT 'Number of downloads',
  `original_filename` varchar(255) NOT NULL default '' COMMENT 'filename',
  `hash_filename` varchar(255) NOT NULL default '' COMMENT 'encrypted file name',
  `sub_dir` varchar(255) NOT NULL default '' COMMENT 'File subpath',
  `upload_date` datetime NOT NULL COMMENT 'Upload time',
  `uid` mediumint(8) unsigned NOT NULL default 0 COMMENT 'Uploaded by',
  `tag` varchar(255) NOT NULL default '' COMMENT 'Note',
PRIMARY KEY (`files_sn`)
) ENGINE=MyISAM;
