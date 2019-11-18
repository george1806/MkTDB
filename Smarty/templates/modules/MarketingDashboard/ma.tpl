<form name="EditView3" method="POST" action="index.php">
<input type="hidden" name="module" value="{$MODULE}">
<input type="hidden" name="record" value="{if isset($ID)}{$ID}{/if}">
<input type="hidden" name="mode" value="{if isset($MODE)}{$MODE}{/if}">
<input type="hidden" name="action" value="index">
<input type="hidden" name="parenttab" value="{$CATEGORY}">
<input type="hidden" name="mytab" value="3">

<ul class="slds-accordion">
<li class="slds-accordion__list-item" onclick="accordionOpen('section_srchaccounts');">
<section id="section_srchaccounts" class="slds-accordion__section">
   <div class="slds-accordion__summary">
   <h3 class="slds-accordion__summary-heading">
   <svg class="slds-accordion__summary-action-icon slds-button__icon slds-button__icon_left" aria-hidden="true">
   <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#switch" />
   </svg>
   <span style="float:right;color:#0073ea" class="slds-truncate" title="Accordion summary">{$MOD.accparams}</span>
   </h3>
   <div>
   <button type="button" class="slds-button slds-button_icon slds-button_icon-border-filled slds-button_icon-x-small" aria-haspopup="true" title="Show More" onclick="accordionOpen('section_srchaccounts');">
   <svg class="slds-button__icon" aria-hidden="true">
   <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#down" />
   </svg>
   <span class="slds-assistive-text">Show More</span>
   </button>
   </div>
</div>
<div aria-hidden="true" class="slds-accordion__content" id="accordion-details-03">
<!-- the start of search Accounts inner content-->
    <div style="width:auto;display:block;" id="tbl31" >
        <input type="hidden" id="showtbl31" name="show31" value="{$show31}">
        <table border=0 cellspacing=0 cellpadding=0 width="100%" class="small">
                <tr>
                <td width="20%" class="dvtCellLabel" align=right>{$MOD.filteracc}</td>
                <td width="30%" align=left class="dvtCellInfo">
                    <select name="selfilteracc2" class="singlecombo" tabindex="30">
                        {foreach key=row item=accfilter from=$accountfilters}
                            {if $row eq $indexaccfilter2}
                            <option value="{$row}" selected>{$accfilter}</option>
                            {else}
                            <option value="{$row}">{$accfilter}</option>
                            {/if}
                        {/foreach}
                    </select>
                </td>
                <td width="20%" class="dvtCellLabel" align=right>
        </td>
        <td width="30%" class="dvtCellInfo" align=left>
                    </td>
                </tr>
            </table>
    </div>
<!-- the End of search Accounts inner content-->
</div>
</section>
</li>

<li class="slds-accordion__list-item" onclick="accordionOpen('section_contparams');">
<section id="section_contparams" class="slds-accordion__section">
   <div class="slds-accordion__summary">
   <h3 class="slds-accordion__summary-heading">
   <svg class="slds-accordion__summary-action-icon slds-button__icon slds-button__icon_left" aria-hidden="true">
   <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#switch" />
   </svg>
   <span style="float:right;color:#0073ea" class="slds-truncate" title="Accordion summary">{$MOD.conparams}</span>
   </h3>
   <div>
   <button type="button" class="slds-button slds-button_icon slds-button_icon-border-filled slds-button_icon-x-small" aria-haspopup="true" title="Show More" onclick="accordionOpen('section_contparams');">
   <svg class="slds-button__icon" aria-hidden="true">
   <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#down" />
   </svg>
   <span class="slds-assistive-text">Show More</span>
   </button>
   </div>
</div>
<div aria-hidden="true" class="slds-accordion__content" id="accordion-details-03">
<!-- the start of contact Params inner content-->
    <div style="width:auto;display:block;" id="tbl32" >
        <input type="hidden" id="showtbl32" name="show32" value="{$show32}">
        <table border=0 cellspacing=0 cellpadding=0 width="100%" class="small">
            <tr>
                <td width="20%" class="dvtCellLabel" align=right>{$MOD.filtercont}</td>
                <td width="30%" align=left class="dvtCellInfo">
                    <select name="selfiltercon2" class="singlecombo" tabindex="30">
                        {foreach key=row item=confilter from=$contactfilters}
                            {if $row eq $indexconfilter2}
                            <option value="{$row}" selected>{$confilter}</option>
                            {else}
                            <option value="{$row}">{$confilter}</option>
                            {/if}
                        {/foreach}
                    </select>
                </td>
                <td width="20%" class="dvtCellLabel" align=right></td>
                <td width="30%" class="dvtCellInfo" align=left></td>
            </tr>
        </table>
    </div>
<!-- the End of contact Params inner content-->
</div>
</section>
</li>
</ul>
<br>
<div align="center">
<input title="{$APP.LBL_SEARCH_BUTTON_TITLE}" accessKey="{$APP.LBL_SEARCH_BUTTON_KEY}" class="slds-button slds-button_neutral" type="submit" name="button" value="  {$APP.LBL_SEARCH_BUTTON_LABEL}  " id="searchbutton3">
</div>
</form>

<form name="InvoiceLines3" method="POST" action="index.php">
<input type="hidden" name="module" value="{$MODULE}">
<input type="hidden" name="record" value="{if isset($ID)}{$ID}{/if}">
<input type="hidden" name="mode" value="{if isset($MODE)}{$MODE}{/if}">
<input type="hidden" name="action" value="convert">
<input type="hidden" name="convertto" value="contacts">
<input type="hidden" name="parenttab" value="{$CATEGORY}">
<input type="hidden" name="selectallrecords3" id="selectallrecords3"  value="0">
<input type="hidden" name="mytab" value="3">
<br><br>
<input class="slds-button slds-button_brand" type="button" id="chooseAllBtn3" value="{'Select all records'|@getTranslatedString:'MarketingDashboard'}" onclick="toggleSelectAllEntries_ListView('3');" {if $hideSelectAll3 eq 'true'} style="display:none"{/if}/>
<div class="k-content" style="clear:both;">
<div id="massive_assign"></div>
{literal}
<script>
var dsMDAssignResults = new kendo.data.DataSource({
    transport: {
            read:  {
                url: crudServiceBaseUrl + "&exec=List&mktdbtab=3",
                dataType: "json"
            },
            update: {
                url: crudServiceBaseUrl + "&exec=Update&mktdbtab=3",
                dataType: "json"
            },
            destroy: {
                url: crudServiceBaseUrl + "&exec=Destroy&mktdbtab=3",
                dataType: "json"
            },
        },
    pageSize: {/literal}{$PAGESIZE}{literal},
    pageable: true,
    serverPaging: true,
    serverSorting: true,
    serverFiltering: true,
    schema: {
        model: {
            fields: {/literal}{$fields3}{literal}
        },
        data: "results",
        total: "total"
    },
    group: {/literal}{$groups3}{literal}
});

$(document).ready(function() {
  $("#massive_assign").kendoGrid({
    dataSource: dsMDAssignResults,
    height: 400,
    sortable: {
    mode: "multiple",
    allowUnsort: true
    },
    groupable:true,
    scrollable: true,
    selectable: "row",
    pageable: true,
    dataBound: updateGridSelectAllCheckbox,
    filterable: false,
    sortable: false,
    columns:{/literal}{$columns3}{literal}
    });
});
</script>
{/literal}
</div>
<ul class="slds-accordion">

<li class="slds-accordion__list-item" onclick="accordionOpen('section_reassignparms');">
<section id="section_reassignparms" class="slds-accordion__section">
   <div class="slds-accordion__summary">
   <h3 class="slds-accordion__summary-heading">
   <svg class="slds-accordion__summary-action-icon slds-button__icon slds-button__icon_left" aria-hidden="true">
   <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#switch" />
   </svg>
   <span style="float:right;color:#0073ea" class="slds-truncate" title="Accordion summary">{'REASSIGNPARAMS'|@getTranslatedString:'MarketingDashboard'}</span>
   </h3>
   <div>
   <button type="button" class="slds-button slds-button_icon slds-button_icon-border-filled slds-button_icon-x-small" aria-haspopup="true" title="Show More" onclick="accordionOpen('section_reassignparms');">
   <svg class="slds-button__icon" aria-hidden="true">
   <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#down" />
   </svg>
   <span class="slds-assistive-text">Show More</span>
   </button>
   </div>
</div>
<div aria-hidden="true" class="slds-accordion__content" id="accordion-details-03">
<!-- the start of Reassign Params inner content-->
 <div>
     <table border=0 cellspacing=0 cellpadding=0 width="100%" class="small">
      <tr>
        <td width="20%" class="dvtCellLabel" align=right>
            {$MOD.AssignInvoiceTo}
	</td>
        <td width="30%" align=left class="dvtCellInfo">
            <select name="assignto_account" id="assignto_account" class="singlecombo" tabindex="10">
            {foreach key=key_one item=arr from=$ASSIGNEDTO_ACCOUNTS}
                    {foreach key=sel_value item=value from=$arr}
                    <option value="{$key_one}" {$value}>{$sel_value}</option>
                    {/foreach}
            {/foreach}
            </select>
        </td>
        <td width="20%" class="dvtCellLabel" align=right>
        {$MOD.relatedmodules}
        </td>
        <td width="30%" align=left class="dvtCellInfo">
            <select name="relatedmodules[]" id="relatedmodules" multiple>
                {foreach key=key_one item=arr from=$RELATED_MODULES}
                    {foreach key=sel_value item=value from=$arr}
                    <option value="{$key_one}" {$value}>{$sel_value|@getTranslatedString:$sel_value}</option>
                    {/foreach}
            {/foreach}
            </select>
        </td>
   </tr>
 </table>
<div align="center">
<br>
<input title="{$MOD.REASSIGN}" accessKey="V" class="slds-button slds-button_neutral" type="submit" name="button" id="reassign" value="  {$MOD.REASSIGN}  " onclick="this.form.convertto.value='reassign';return change_assign();">
</div>
</div>
<!-- the End of Reassign Params inner content-->
</div>
</section>
</li>
<li class="slds-accordion__list-item" onclick="accordionOpen('section_moveonparams');">
<section id="section_moveonparams" class="slds-accordion__section">
   <div class="slds-accordion__summary">
   <h3 class="slds-accordion__summary-heading">
   <svg class="slds-accordion__summary-action-icon slds-button__icon slds-button__icon_left" aria-hidden="true">
   <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#switch" />
   </svg>
   <span style="float:right;color:#0073ea" class="slds-truncate" title="Accordion summary">{'MOVEONPARAM'|@getTranslatedString:'MarketingDashboard'}</span>
   </h3>
   <div>
   <button type="button" class="slds-button slds-button_icon slds-button_icon-border-filled slds-button_icon-x-small" aria-haspopup="true" title="Show More" onclick="accordionOpen('section_moveonparams');">
   <svg class="slds-button__icon" aria-hidden="true">
   <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#down" />
   </svg>
   <span class="slds-assistive-text">Show More</span>
   </button>
   </div>
</div>
<div aria-hidden="true" class="slds-accordion__content" id="accordion-details-03">
<!-- the start of Move On Params inner content-->
<div>
<center><div id="load"></div></center>
  <table border=0 cellspacing=0 cellpadding=0 width="100%" class="small">
  <tr>
  <td width="20%" class="dvtCellLabel" align=right>{$MOD.module_from}</td>
    <td width="30%" align=left class="dvtCellInfo">
            <select name="modulefrom" id="modulefrom" class="singlecombo" tabindex="10" onchange="findfields(this.id,this.value,1);">
                {foreach key=modid item=modname from=$modulearray}
                <option value={$modid}>{$modname}</option>
                {/foreach}
            </select>
    </td>
    <td width="20%" class="dvtCellLabel" align=right>{$MOD.module_to}</td>
    <td width="30%" align=left class="dvtCellInfo">
        <select name="moduleto" id="moduleto" class="singlecombo" tabindex="10" onchange="findfields(this.id,this.value,0);">
                {foreach key=key_one item=arr from=$RELATED_MODULES}
                    {foreach key=sel_value item=value from=$arr}
                        {if $sel_value!='ModComments'}
                        <option value="{$key_one}">{$sel_value|@getTranslatedString:$sel_value}</option>
                        {/if}
                    {/foreach}
            {/foreach}
        </select>
    </td>
    </tr>
    <tr>
    <td width="20%" class="dvtCellLabel" align=right>{$MOD.field_from}</td>
    <td width="30%" align=left class="dvtCellInfo">
        <select name="modulefromfields" id="modulefromfields" class="singlecombo" tabindex="10">
           {foreach key=fldname item=fldlabel from=$allfields}
             <option value={$fldname}>{$fldlabel}</option>
           {/foreach}
        </select>
    </td>
    <td width="20%" class="dvtCellLabel" align=right>{$MOD.field_to}</td>
    <td width="30%" align=left class="dvtCellInfo">
        <select name="moduletofields" id="moduletofields" class="singlecombo" tabindex="10">
          {foreach key=fldname item=fldlabel from=$relatedfields}
          <option value={$fldname}>{$fldlabel}</option>
          {/foreach}
        </select>
    </td>
   </tr>
</tr>
</table>
<div align="center">
<br>
<input title="{$MOD.MOVEON}" accessKey="V" class="sdls-button convertbutton" type="submit" name="button" id="moveon" value="  {$MOD.MOVEON}  " onclick="this.form.convertto.value='moveon'; return movefieldsbetweenentities();">
</div>
</div>
<!-- the End of Move On Params inner content-->
</div>
</section>
</li>
</ul>
</form>