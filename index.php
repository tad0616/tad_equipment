<?php
use XoopsModules\Tadtools\TadModData;
use XoopsModules\Tadtools\Utility;
require_once "header.php";

$Model = new TadModData('tad_equipment');
$clean = $Model->clean();
$Model->disable('equipment_id', ['index', 'show']);
$Model->replace('enable', ['1' => _YES, '0' => _NO]);
$Model->set_file('equipment_id', '', '', '', '', '.jpg,.png,.gif');
$Model->set_func('create', false);

$Records = new TadModData('tad_equipment_records');
$Records->set_func('create', false);
$Records->disable(['return_date', 'return_quantity', 'return_note'], ['create']);
$Records->set_require(['borrow_reason', 'expected_return_time', 'borrow_date']);

switch ($op) {
    // case "create":
    //     $Model->create();
    //     break;

    case "edit":
        $Records->edit($clean['id']);
        break;

    case "show":
        $Model->show($clean['equipment_id']);

        $equipment = $Model->find(['equipment_id' => $clean['equipment_id']]);
        $borrow = $Records->select('sum(`borrow_quantity`)-sum(`return_quantity`) as quantity', ['equipment_id' => $clean['equipment_id']], true, 'borrow');
        $left_quantity = $equipment['quantity'] - $borrow['quantity'];
        $Records->set_require('borrow_quantity', ['custom' => 'integer', 'min' => 1, 'max' => $left_quantity]);

        $Records->set_hidden('equipment_id', $clean['equipment_id']);
        $Records->set_submit('op', 'store', '確定借用', 'fa-check-circle', ['class' => 'btn btn-primary']);
        $Records->create();

        $Records->uid_name();
        $Records->disable(['id', 'equipment_id'], ['index']);
        $Records->set_func('destroy', false);
        $Records->index();
        break;

    case "update":
        $Records->update($clean['id']);
        header("location:{$self}?op=show&equipment_id={$clean['equipment_id']}");
        exit;

    // case "store":
    //     $equipment_id = $Records->store();
    //     header("location:{$self}?op=show&equipment_id=$equipment_id");
    //     exit;

    case "destroy":
        $Model->destroy($clean['equipment_id']);
        header("location:{$self}");
        exit;

    default:
        $borrow = $Records->select('equipment_id, sum(`borrow_quantity`)-sum(`return_quantity`) as out_quantity', null, false, 'equipment_id');
        $Model->disable('description', ['index']);
        $Model->add_button('我要借', '', ['op' => 'show', 'equipment_id'], ['class' => 'btn btn-sm btn-primary'], ['index'], [2]);
        $Model->set_link('title', '', ['op' => 'show', 'equipment_id'], '_self');
        $Model->set_attr('title_td', ['class' => 'm']);
        $arr = $Model->index($borrow);
        // Utility::dd($arr);
        break;
}
require_once "footer.php";
