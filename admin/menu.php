<?php
use XoopsModules\Tadtools\TadMod;
$TadMod = new TadMod(basename(__DIR__));
$TadMod->add_adm_menu(_MI_TADEQUIPMENT_ADMENU1, 'admin/main.php', 'images/admin/button.png');
$adminmenu = $TadMod->get_adm_menu();
