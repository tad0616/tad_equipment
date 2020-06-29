<?php
use XoopsModules\Tadtools\TadModData;
use XoopsModules\Tadtools\Utility;
require_once "header.php";

$Model = new TadModData('tad_equipment');
$clean = $Model->clean();
$Model->use_radio('enable', [1 => _YES, 0 => _NO], 1);
$Model->set_file('equipment_id', 'small', '', '', '', '.jpg,.png,.gif');

switch ($op) {
    case "create":
        $Model->create();
        break;

    case "edit":
        $Model->edit($clean['equipment_id']);
        break;

    case "show":
        $Model->show($clean['equipment_id']);
        break;

    case "update":
        $Model->update($clean['equipment_id']);
        header("location:{$self}");
        exit;

    case "store":
        $Model->store();
        header("location:{$self}");
        exit;

    case "destroy":
        $Model->destroy($clean['equipment_id']);
        header("location:{$self}");
        exit;

    default:
        $Model->disable('description', ['index']);
        $Model->set_link('title', '', ['op' => 'show', 'equipment_id'], '_self');
        $Model->set_attr('title_td', ['class' => 'm']);
        $Model->index();
        break;
}
require_once "footer.php";
