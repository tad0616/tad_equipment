CREATE TABLE `tad_equipment` (
  `equipment_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '設備編號',
  `title` varchar(255) NOT NULL COMMENT '設備名稱',
  `description` text NOT NULL COMMENT '設備說明',
  `quantity` smallint(5) unsigned NOT NULL COMMENT '設備數量',
  `enable` enum('1','0') NOT NULL COMMENT '是否可借',
  PRIMARY KEY (`equipment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `tad_equipment_records` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '借用編號',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '借用人',
  `equipment_id` smallint(5) unsigned NOT NULL COMMENT '借用設備',
  `borrow_date` datetime NOT NULL COMMENT '借用日期',
  `borrow_quantity` smallint(6) NOT NULL COMMENT '借用數量',
  `borrow_reason` varchar(255) DEFAULT NULL COMMENT '用途說明',
  `expected_return_time` datetime DEFAULT NULL COMMENT '預計歸還時間',
  `return_date` datetime DEFAULT NULL COMMENT '歸還日期',
  `return_quantity` smallint(6) DEFAULT NULL COMMENT '歸還數量',
  `return_note` text COMMENT '歸還備註',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `tad_equipment_files_center` (
  `files_sn` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '檔案流水號',
  `col_name` varchar(255) NOT NULL default '' COMMENT '欄位名稱',
  `col_sn` smallint(5) unsigned NOT NULL default 0 COMMENT '欄位編號',
  `sort` smallint(5) unsigned NOT NULL default 0 COMMENT '排序',
  `kind` enum('img','file') NOT NULL default 'img' COMMENT '檔案種類',
  `file_name` varchar(255) NOT NULL default '' COMMENT '檔案名稱',
  `file_type` varchar(255) NOT NULL default '' COMMENT '檔案類型',
  `file_size` int(10) unsigned NOT NULL default 0 COMMENT '檔案大小',
  `description` text NOT NULL COMMENT '檔案說明',
  `counter` mediumint(8) unsigned NOT NULL default 0 COMMENT '下載人次',
  `original_filename` varchar(255) NOT NULL default '' COMMENT '檔案名稱',
  `hash_filename` varchar(255) NOT NULL default '' COMMENT '加密檔案名稱',
  `sub_dir` varchar(255) NOT NULL default '' COMMENT '檔案子路徑',
  `upload_date` datetime NOT NULL COMMENT '上傳時間',
  `uid` mediumint(8) unsigned NOT NULL default 0 COMMENT '上傳者',
  `tag` varchar(255) NOT NULL default '' COMMENT '註記',
PRIMARY KEY (`files_sn`)
) ENGINE=MyISAM;