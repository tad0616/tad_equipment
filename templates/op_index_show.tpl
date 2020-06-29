<{$toolbar}>

<h1 class="my"><{$tad_equipment.title}></h1>

<div class="row">
    <div class="col-sm-2">
        <{$tad_equipment.equipment_id_file}>
    </div>
    <div class="col-sm-10">
        <div class="alert alert-info"><{$tad_equipment.description|nl2br}></div>
    </div>
</div>

<div class="quantity bg-info white" data-toggle="tooltip" title="原本數量">
    <div><{$tad_equipment.quantity}></div>
</div>
<div class="quantity">
-
</div>
<div class="quantity bg-warning" data-toggle="tooltip" title="借出數量">
    <div><{$borrow.quantity|intval}></div>
</div>
<div class="quantity">
=
</div>
<div class="quantity bg-success white" data-toggle="tooltip" title="可借數量">
    <div><{$tad_equipment.quantity-$borrow.quantity}></div>
</div>


<h2 class="my">借用表單</h2>
<{$tad_equipment_records_form}>

<h2 class="my">借用紀錄</h2>
<{if $tad_equipment_records}>
    <{$tad_equipment_records_index}>
<{else}>
    <div class="alert alert-warning" role="alert">
        <h4 class="alert-heading">尚無任何借用紀錄</h4>
    </div>
<{/if}>