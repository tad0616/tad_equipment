<{$toolbar}>

<h2 class="my"><{$smarty.const._MD_TADEQUIPMENT_LIST_AVAILABLE}></h2>
<div class="row row-cols-sm-4">
    <{foreach from=$tad_equipment item=equipment}>
        <div class="col-sm-3">
            <div class="img-container" style="background: white url(<{$equipment.equipment_id_var.0.tb_path}>) no-repeat;">
                <div class="text">
                    <a href="index.php?op=show&equipment_id=<{$equipment.equipment_id}>"><{$equipment.title}></a>
                </div>
            </div>
        </div>
    <{/foreach}>
</div>
