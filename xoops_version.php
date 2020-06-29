<?php
use XoopsModules\Tadtools\TadMod;
$TadMod = new TadMod(basename(__DIR__));

$TadMod->setup('器材借用', '1.0', '2020/06/24', 'tad0616@gmail.com', 'Tad');
$TadMod->add_config('borrow_group', '可借用群組', '', 'group_multi', 'array', [1, 2]);
// $TadMod->add_blocks('data_list', '區塊標題', '', ['顯示資料數' => 10]);

$lang = $TadMod->get_lang('mi');
foreach ($lang as $const_arr) {
    foreach ($const_arr as $const => $value) {
        define($const, $value);
    }
}
$modversion = $TadMod->xoops_version();
