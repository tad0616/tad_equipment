<?php
use XoopsModules\Tadtools\TadMod;

if (!class_exists('XoopsModules\Tadtools\Utility')) {
    require XOOPS_ROOT_PATH . '/modules/tadtools/preloads/autoloader.php';
}

$TadMod = new TadMod(basename(__DIR__));

$TadMod->setup(_MI_TADEQUIPMENT_NAME, '1.0', '2020/06/24', 'tad0616@gmail.com', 'Tad');
$TadMod->add_config('borrow_group', _MI_TADEQUIPMENT_BORROWABLE_GROUPS, '', 'group_multi', 'array', [1, 2]);
//$TadMod->add_blocks('data_list', _MI_TADEQUIPMENT_BLOCK_TITLE, '', [_MI_TADEQUIPMENT_BLOCK_NUMBER_DISPLAYED => 10]);

$lang = $TadMod->get_lang('mi');
foreach ($lang as $const_arr) {
    foreach ($const_arr as $const => $value) {
        define($const, $value);
    }
}
$modversion = $TadMod->xoops_version();
