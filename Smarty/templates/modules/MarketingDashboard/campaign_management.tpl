<form name="SearchView" method="POST" action="index.php">
<input type="hidden" name="module" value="{$MODULE}">
<input type="hidden" name="record" value="{if isset($ID)}{$ID}{/if}">
<input type="hidden" name="mode" value="{if isset($MODE)}{$MODE}{/if}">
<input type="hidden" name="action" value="index">
<input type="hidden" name="parenttab" value="{$CATEGORY}">
<input type="hidden" name="mytab" value="1">
 {assign var=leadheadtext value=$MOD.leadparams|replace:' ':''}
<ul class="slds-accordion">

<li class="slds-accordion__list-item" onclick="accordionOpen('section_leads');">
<section id="section_leads" class="slds-accordion__section">
<div class="slds-accordion__summary">
   <h3 class="slds-accordion__summary-heading">
         <svg class="slds-accordion__summary-action-icon slds-button__icon slds-button__icon_left" aria-hidden="true">
         <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#switch" />
         </svg>
         <span style="float:right;color:#0073ea" class="slds-truncate" title="Search Leads"> {$MOD.leadparams}</span>
   </h3>
<div>
<button type="button" class="slds-button slds-button_icon slds-button_icon-border-filled slds-button_icon-x-small" aria-haspopup="true" title="Show More" onclick="accordionOpen('section_leads');">
<svg class="slds-button__icon" aria-hidden="true">
<use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#down" />
</svg>
<span class="slds-assistive-text">Show More</span>
</button>
</div>
</div>
<div aria-hidden="false" class="slds-accordion__content" id="accordion-details-01">
<!--Start Search for Leads inner data starts here-->
<div style="width:auto;display:block;" id="tbl{$leadheadtext}" >
<input type="hidden" id="showtbl{$leadheadtext}" name="showlead" value="{$showdisplead}">
<table border=0 cellspacing=0 cellpadding=0 width="100%" class="small">
<tr>
<td width="20%" class="dvtCellLabel" align=right>
{$MOD.filterlead}
</td>
   <td width="30%" align=left class="dvtCellInfo">
      <select name="selfilterlead" class="singlecombo" tabindex="30">
      {foreach key=row item=leadfilter from=$leadfilters}
         {if $row eq $indexleadfilter}
         <option value="{$row}" selected>{$leadfilter}</option>
         {else}
         <option value="{$row}">{$leadfilter}</option>
         {/if}
      {/foreach}
      </select>
   </td>
<td width="20%" class="dvtCellLabel" align=right>
{$APP.SINGLE_Campaigns}
</td>
<td width="30%" align=left class="dvtCellInfo">
<input name="campaignleadid" value="{$campaignleadid}" id="campaignleadid" type="hidden">
<input name="campaignleadid_display" id="campaignleadid_display" readonly="readonly" style="border: 1px solid rgb(186, 186, 186);" value="{$campaignleadid_display}" type="text">&nbsp;
<img src="{'select.gif'|@vtiger_imageurl:$THEME}" tabindex="20" alt="Select" title="Select" onclick='return window.open("index.php?module=Campaigns&action=Popup&html=Popup_picker&form=SearchView&popuptype=specific&forfield=campaignleadid","test","width=640,height=602,resizable=0,scrollbars=0,top=150,left=200");' style="cursor: pointer;" align="absmiddle">&nbsp;
<input src="{'clear_field.gif'|@vtiger_imageurl:$THEME}" alt="Clear" title="Clear" onclick="this.form.campaignleadid.value=''; this.form.campaignleadid_display.value=''; return false;" style="cursor: pointer;" align="absmiddle" type="image">
</td>
</tr>
<tr>
<td width="20%" class="dvtCellLabel" align=right>
{$MOD.withtask}
</td>
<td width="30%" align=left class="dvtCellInfo">
<input type=checkbox name="leadwithtask" {$leadwithtask}>
</td>
<td width="20%" class="dvtCellLabel" align=right>
{$MOD.notask}
</td>
<td width="30%" align=left class="dvtCellInfo">
<input type=checkbox name="leadnotask" {$leadnotask}>
</td>
</tr>
</table>
</div> <br/>
<!-- End of Search for Leads data ends here-->
</div>
</section>
</li>
{assign var=conheadtext value=$MOD.conparams|replace:' ':''}
<li class="slds-accordion__list-item"  onclick="accordionOpen('section_contacts');">
<section id="section_contacts" class="slds-accordion__section">
<div class="slds-accordion__summary">
<h3 class="slds-accordion__summary-heading">
<svg class="slds-accordion__summary-action-icon slds-button__icon slds-button__icon_left" aria-hidden="true">
<use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#switch" />
</svg>
<span style="float:right;color:#0073ea" class="slds-truncate" title="Accordion summary">{$MOD.conparams}</span>
</h3>
<div>
<button type="button" class="slds-button slds-button_icon slds-button_icon-border-filled slds-button_icon-x-small" aria-haspopup="true" title="Show More" onclick="accordionOpen('section_contacts');">
<svg class="slds-button__icon" aria-hidden="true">
<use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#down" />
</svg>
<span class="slds-assistive-text">Show More</span>
</button>
</div>
</div>
<div aria-hidden="true" class="slds-accordion__content" id="accordion-details-02">
<!-- the start of section_contacts content -->
   <div style="width:auto;display:block;" id="tbl{$conheadtext}" >
      <input type="hidden" id="showtbl{$conheadtext}" name="showcon" value="{$showdispcon}">
		<table border=0 cellspacing=0 cellpadding=0 width="100%" class="small">
	          <tr>
                    <td width="20%" class="dvtCellLabel" align=right>
                            {$APP.SINGLE_Accounts}
                    </td>
                    <td width="30%" align=left class="dvtCellInfo">
                    <input name="parentid" value="{$parentid}" id="parentid" type="hidden">
                    <input name="parentid_display" id="parentid_display" readonly="readonly" style="border: 1px solid rgb(186, 186, 186);" value="{$parentid_display}" type="text">&nbsp;
                    <img src="{'select.gif'|@vtiger_imageurl:$THEME}" tabindex="20" alt="Select" title="Select" onclick='return window.open("index.php?module=Accounts&action=Popup&html=Popup_picker&popuptype=specific&form=SearchView&forfield=parentid","test","width=640,height=602,resizable=0,scrollbars=0,top=150,left=200");' style="cursor: pointer;" align="absmiddle">&nbsp;
                    <input src="{'clear_field.gif'|@vtiger_imageurl:$THEME}" alt="Clear" title="Clear" onclick="this.form.parentid.value=''; this.form.parentid_display.value=''; return false;" style="cursor: pointer;" align="absmiddle" type="image">
                    </td>
                     <td width="20%" class="dvtCellLabel" align=right>
                            {$APP.SINGLE_Campaigns}
                    </td>
                    <td width="30%" align=left class="dvtCellInfo">
                    <input name="campaignid" value="{$campaignid}" id="campaignid" type="hidden">
                    <input name="campaignid_display" id="campaignid_display" readonly="readonly" style="border: 1px solid rgb(186, 186, 186);" value="{$campaignid_display}" type="text">&nbsp;
                    <img src="{'select.gif'|@vtiger_imageurl:$THEME}" tabindex="20" alt="Select" title="Select" onclick='return window.open("index.php?module=Campaigns&action=Popup&html=Popup_picker&form=SearchView&forfield=campaignid","test","width=640,height=602,resizable=0,scrollbars=0,top=150,left=200");' style="cursor: pointer;" align="absmiddle">&nbsp;
                    <input src="{'clear_field.gif'|@vtiger_imageurl:$THEME}" alt="Clear" title="Clear" onclick="this.form.campaignid.value=''; this.form.campaignid_display.value=''; return false;" style="cursor: pointer;" align="absmiddle" type="image">
                    </td> 
                  </tr>
                  <tr>
                    <td width="20%" class="dvtCellLabel" align=right>
                            {$MOD.filteracc}
                    </td>
                    <td width="30%" align=left class="dvtCellInfo">
                                <select name="selfilteracc" class="singlecombo" tabindex="30">
                                 {foreach key=row item=accfilter from=$accountfilters}
                                    {if $row eq $indexaccfilter}
                                    <option value="{$row}" selected>{$accfilter}</option>
                                    {else}
                                    <option value="{$row}">{$accfilter}</option>
                                    {/if}
                                  {/foreach}
                                   
                                </select>
                    </td>
                    <td width="20%" class="dvtCellLabel" align=right>
                            {$MOD.filtercont}
                    </td>
                    <td width="30%" align=left class="dvtCellInfo">
                        <select name="selfiltercon" class="singlecombo" tabindex="30">
                        {foreach key=row item=confilter from=$contactfilters}
                           {if $row eq $indexconfilter}
                           <option value="{$row}" selected>{$confilter}</option>
                           {else}
                           <option value="{$row}">{$confilter}</option>
                           {/if}
                        {/foreach}
                        </select>
                    </td>
                    </tr>
                    <tr>
                        <td width="20%" class="dvtCellLabel" align=right>
				{$MOD.withtask}
			</td>
			<td width="30%" align=left class="dvtCellInfo">
			<input type=checkbox name="conwithtask" {$conwithtask}>
			</td>
         <td width="20%" class="dvtCellLabel" align=right>{$MOD.notask}</td>
			<td width="30%" align=left class="dvtCellInfo">
			<input type=checkbox name="connotask" {$connotask}>
			</td>
         </tr>
         <tr>
          <td width="20%" class="dvtCellLabel" align=right>{$MOD.withmessage}</td>
			<td width="30%" align=left class="dvtCellInfo">
			<input type=checkbox name="conwithmessage" {$conwithmessage}>
			</td>
              <td width="20%" class="dvtCellLabel" align=right>{$MOD.nomessage}</td>
			<td width="30%" align=left class="dvtCellInfo">
			<input type=checkbox name="connomessage" {$connomessage}>
			</td>
       </tr>
	  </table>
	</div>
<!-- the End of section_contacts contants-->
</div>
</section>
</li>
{assign var=messageheadtext value=$MOD.messageparams|replace:' ':''}
<li class="slds-accordion__list-item" onclick="accordionOpen('section_messages');">
<section id="section_messages" class="slds-accordion__section">
<div class="slds-accordion__summary">
<h3 class="slds-accordion__summary-heading">
<svg class="slds-accordion__summary-action-icon slds-button__icon slds-button__icon_left" aria-hidden="true">
<use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#switch" />
</svg>
<span style="float:right;color:#0073ea" class="slds-truncate" title="Accordion summary">{$MOD.messageparams}</span>
</h3>
<div>
<button type="button" class="slds-button slds-button_icon slds-button_icon-border-filled slds-button_icon-x-small" aria-haspopup="true" title="Show More" onclick="accordionOpen('section_messages');">
<svg class="slds-button__icon" aria-hidden="true">
<use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#down" />
</svg>
<span class="slds-assistive-text">Show More</span>
</button>
</div>
</div>
<div aria-hidden="true" class="slds-accordion__content" id="accordion-details-03">
<!-- The start of messages -->
<div style="width:auto;display:block;" id="tbl{$messageheadtext}" >
<input type="hidden" id="showtbl{$messageheadtext}" name="showmessage" value="{$showdispmessage}">
<table border=0 cellspacing=0 cellpadding=0 width="100%" class="small">
<tr>
      <td width="20%" class="dvtCellLabel" align=right>
      {$MOD.filtermessage}
      </td>
      <td width="30%" align=left class="dvtCellInfo">
               <select name="selfiltermess" class="singlecombo" tabindex="30">
               {foreach key=row item=messfilter from=$messagefilters}
                  {if $row eq $indexmessfilter}
                  <option value="{$row}" selected>{$messfilter}</option>
                  {else}
                  <option value="{$row}">{$messfilter}</option>
                  {/if}
               {/foreach}
               </select>
      </td>
   <td width="20%" class="dvtCellLabel" align=right>
            {$APP.SINGLE_Campaigns}
   </td>
   <td width="30%" align=left class="dvtCellInfo">
   <input name="campaignmessid" value="{$campaignmessid}" id="campaignmessid" type="hidden">
   <input name="campaignmessid_display" id="campaignmessid_display" readonly="readonly" style="border: 1px solid rgb(186, 186, 186);" value="{$campaignmessid_display}" type="text">&nbsp;
   <img src="{'select.gif'|@vtiger_imageurl:$THEME}" tabindex="20" alt="Select" title="Select" onclick='return window.open("index.php?module=Campaigns&action=Popup&html=Popup_picker&form=SearchView&forfield=campaignmessid","test","width=640,height=602,resizable=0,scrollbars=0,top=150,left=200");' style="cursor: pointer;" align="absmiddle">&nbsp;
   <input src="{'clear_field.gif'|@vtiger_imageurl:$THEME}" alt="Clear" title="Clear" onclick="this.form.campaignmessid.value=''; this.form.campaignmessid_display.value=''; return false;" style="cursor: pointer;" align="absmiddle" type="image">
   </td>
</tr>
<tr>
<td width="20%" class="dvtCellLabel" align=right>{$MOD.filtercont}</td>
   <td width="30%" align=left class="dvtCellInfo">
            <select name="selfiltermesscon" class="singlecombo" tabindex="30">
            {foreach key=row item=confilter from=$contactfilters}
               {if $row eq $indexmessconfilter}
               <option value="{$row}" selected>{$confilter}</option>
               {else}
               <option value="{$row}">{$confilter}</option>
               {/if}
            {/foreach}
            </select>
   </td>
   </tr>
</table>
</div>
<!-- the End of message details -->
</div>
</section>
</li>

{assign var=taskheadtext value=$MOD.taskparams|replace:' ':''}
<li class="slds-accordion__list-item" onclick="accordionOpen('section_tasks');">
<section id="section_tasks" class="slds-accordion__section">
<div class="slds-accordion__summary">
<h3 class="slds-accordion__summary-heading">
<svg class="slds-accordion__summary-action-icon slds-button__icon slds-button__icon_left" aria-hidden="true">
<use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#switch" />
</svg>
<span style="float:right;color:#0073ea" class="slds-truncate" title="Accordion summary">{$MOD.taskparams}</span>
</h3>
<div>
<button type="button" class="slds-button slds-button_icon slds-button_icon-border-filled slds-button_icon-x-small" aria-haspopup="true" title="Show More" onclick="accordionOpen('section_tasks');">
<svg class="slds-button__icon" aria-hidden="true">
<use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#down" />
</svg>
<span class="slds-assistive-text">Show More</span>
</button>
</div>
</div>
<div aria-hidden="true" class="slds-accordion__content" id="accordion-details-03">
<!-- the start of search task inner content-->
   <div style="width:auto;display:block;" id="tbl{$taskheadtext}" >
      <input type="hidden" id="showtbl{$taskheadtext}" name="showtask" value="{$showdisptask}">
      <table border=0 cellspacing=0 cellpadding=0 width="100%" class="small">
      <tr>
       <td width="20%" class="dvtCellLabel" align=right>
            {$MOD.filtertask}
            </td>
            <td width="30%" align=left class="dvtCellInfo">
                     <select name="selfiltertask" class="singlecombo" tabindex="30">
                        {foreach key=row item=taskfilter from=$taskfilters}
                           {if $row eq $indextaskfilter}
                           <option value="{$row}" selected>{$taskfilter}</option>
                           {else}
                           <option value="{$row}">{$taskfilter}</option>
                           {/if}
                        {/foreach}
                     </select>
         </td>
         <td width="20%" class="dvtCellLabel" align=right>{$APP.SINGLE_Campaigns}</td>
         <td width="30%" align=left class="dvtCellInfo">
         <input name="campaigntaskid" value="{$campaigntaskid}" id="campaigntaskid" type="hidden">
         <input name="campaigntaskid_display" id="campaigntaskid_display" readonly="readonly" style="border: 1px solid rgb(186, 186, 186);" value="{$campaigntaskid_display}" type="text">&nbsp;
         <img src="{'select.gif'|@vtiger_imageurl:$THEME}" tabindex="20" alt="Select" title="Select" onclick='return window.open("index.php?module=Campaigns&action=Popup&html=Popup_picker&form=SearchView&forfield=campaigntaskid","test","width=640,height=602,resizable=0,scrollbars=0,top=150,left=200");' style="cursor: pointer;" align="absmiddle">&nbsp;
         <input src="{'clear_field.gif'|@vtiger_imageurl:$THEME}" alt="Clear" title="Clear" onclick="this.form.campaigntaskid.value=''; this.form.campaigntaskid_display.value=''; return false;" style="cursor: pointer;" align="absmiddle" type="image">
         </td>
      </tr>
      </table>
   </div>
<!-- the End of serch task inner content-->
</div>
</section>
</li>
{assign var=potentialheadtext value=$MOD.potentialparams|replace:' ':''}
<li class="slds-accordion__list-item" onclick="accordionOpen('section_potential');">
<section id="section_potential" class="slds-accordion__section">
   <div class="slds-accordion__summary">
   <h3 class="slds-accordion__summary-heading">
   <svg class="slds-accordion__summary-action-icon slds-button__icon slds-button__icon_left" aria-hidden="true">
   <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#switch" />
   </svg>
   <span style="float:right;color:#0073ea" class="slds-truncate" title="Accordion summary">{$MOD.potentialparams}</span>
   </h3>
   <div>
   <button type="button" class="slds-button slds-button_icon slds-button_icon-border-filled slds-button_icon-x-small" aria-haspopup="true" title="Show More" onclick="accordionOpen('section_potential');">
   <svg class="slds-button__icon" aria-hidden="true">
   <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#down" />
   </svg>
   <span class="slds-assistive-text">Show More</span>
   </button>
   </div>
</div>
<div aria-hidden="true" class="slds-accordion__content" id="accordion-details-03">
<!-- the start of search Potential inner content-->
<div style="width:auto;display:block;" id="tbl{$potentialheadtext}" >
<input type="hidden" id="showtbl{$potentialheadtext}" name="showpotential" value="{$showdisppotential}">
   <table border=0 cellspacing=0 cellpadding=0 width="100%" class="small">
   <tr>
         <td width="20%" class="dvtCellLabel" align=right>
         {$MOD.filterpotential}
         </td>
         <td width="30%" align=left class="dvtCellInfo">
            <select name="selfilterpot" class="singlecombo" tabindex="30">
               {foreach key=row item=potfilter from=$potentialfilters}
                  {if $row eq $indexpotfilter}
                  <option value="{$row}" selected>{$potfilter}</option>
                  {else}
                  <option value="{$row}">{$potfilter}</option>
                  {/if}
               {/foreach}
            </select>
       </td>
      <td width="20%" class="dvtCellLabel" align=right>{$APP.SINGLE_Campaigns}</td>
      <td width="30%" align=left class="dvtCellInfo">
      <input name="campaignpotid" value="{$campaignpotid}" id="campaignpotid" type="hidden">
      <input name="campaignpotid_display" id="campaignpotid_display" readonly="readonly" style="border: 1px solid rgb(186, 186, 186);" value="{$campaignpotid_display}" type="text">&nbsp;
      <img src="{'select.gif'|@vtiger_imageurl:$THEME}" tabindex="20" alt="Select" title="Select" onclick='return window.open("index.php?module=Campaigns&action=Popup&html=Popup_picker&form=SearchView&forfield=campaignpotid","test","width=640,height=602,resizable=0,scrollbars=0,top=150,left=200");' style="cursor: pointer;" align="absmiddle">&nbsp;
      <input src="{'clear_field.gif'|@vtiger_imageurl:$THEME}" alt="Clear" title="Clear" onclick="this.form.campaignpotid.value=''; this.form.campaignpotid_display.value=''; return false;" style="cursor: pointer;" align="absmiddle" type="image">
      </td>
   </tr>
   </table>
</div>
<!-- the End of search Potential task inner content-->
</div>
</section>
</li>

{assign var=accountheadtext value=16}
<li class="slds-accordion__list-item" onclick="accordionOpen('section_accounts');">
<section id="section_accounts" class="slds-accordion__section">
   <div class="slds-accordion__summary">
   <h3 class="slds-accordion__summary-heading">
   <svg class="slds-accordion__summary-action-icon slds-button__icon slds-button__icon_left" aria-hidden="true">
   <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#switch" />
   </svg>
   <span style="float:right;color:#0073ea" class="slds-truncate" title="Accordion summary">{$MOD.accparams}</span>
   </h3>
   <div>
   <button type="button" class="slds-button slds-button_icon slds-button_icon-border-filled slds-button_icon-x-small" aria-haspopup="true" title="Show More" onclick="accordionOpen('section_accounts');">
   <svg class="slds-button__icon" aria-hidden="true">
   <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#down" />
   </svg>
   <span class="slds-assistive-text">Show More</span>
   </button>
   </div>
</div>
<div aria-hidden="true" class="slds-accordion__content" id="accordion-details-03">
<!-- the start of search Accounts inner content-->
<div style="width:auto;display:block;" id="tbl{$accountheadtext}" >
<input type="hidden" id="showtbl{$accountheadtext}" name="showaccount" value="{$showdispaccount}">
   <table border=0 cellspacing=0 cellpadding=0 width="100%" class="small">
   <tr>
         <td width="20%" class="dvtCellLabel" align=right>
         {$MOD.filteracc}
         </td>
         <td width="30%" align=left class="dvtCellInfo">
                  <select name="accountselfilteracc" class="singlecombo" tabindex="30">
                     {foreach key=row item=accfilter from=$accountfilters}
                        {if $row eq $accountindexfilteracc}
                        <option value="{$row}" selected>{$accfilter}</option>
                        {else}
                        <option value="{$row}">{$accfilter}</option>
                        {/if}
                     {/foreach}
                  </select>
         </td>
         <td width="20%" class="dvtCellLabel" align=right>
               {$MOD.filtercont}
      </td>
      <td width="30%" align=left class="dvtCellInfo">
         <select name="accountselfiltercon" class="singlecombo" tabindex="30">
         {foreach key=row item=confilter from=$contactfilters}
            {if $row eq $accountindexfiltercon}
            <option value="{$row}" selected>{$confilter}</option>
            {else}
            <option value="{$row}">{$confilter}</option>
            {/if}
         {/foreach}
         </select>
      </td>
      </tr>
      <tr>
         <td width="20%" class="dvtCellLabel" align=right>
         {$MOD.filterpotential}
         </td>
         <td width="30%" align=left class="dvtCellInfo">
            <select name="accountselfilterpot" class="singlecombo" tabindex="30">
               {foreach key=row item=potfilter from=$potentialfilters}
                  {if $row eq $accountindexfilterpot}
                  <option value="{$row}" selected>{$potfilter}</option>
                  {else}
                  <option value="{$row}">{$potfilter}</option>
                  {/if}
               {/foreach}
            </select>
         </td>
         <td width="20%" class="dvtCellLabel" align=right>
         {$MOD.filtertask}
         </td>
         <td width="30%" align=left class="dvtCellInfo">
            <select name="accountselfiltertask" class="singlecombo" tabindex="30">
               {foreach key=row item=taskfilter from=$taskfilters}
                  {if $row eq $accountindexfiltertask}
                  <option value="{$row}" selected>{$taskfilter}</option>
                  {else}
                  <option value="{$row}">{$taskfilter}</option>
                  {/if}
               {/foreach}
            </select>
         </td>
         </tr>
         <tr>
   <td width="20%" class="dvtCellLabel" align=right>{$MOD.withtask}</td>
   <td width="30%" align=left class="dvtCellInfo">
   <input type=checkbox name="accwithtask" {$accwithtask}>
   </td>
    <td width="20%" class="dvtCellLabel" align=right>
   {$MOD.notask}
   </td>
   <td width="30%" align=left class="dvtCellInfo">
   <input type=checkbox name="accnotask" {$accnotask}>
   </td>
   </tr>
   <tr>
   <td width="20%" class="dvtCellLabel" align=right>{$MOD.withmessage}</td>
   <td width="30%" align=left class="dvtCellInfo">
   <input type=checkbox name="accwithmessage" {$accwithmessage}>
   </td>
   <td width="20%" class="dvtCellLabel" align=right>{$MOD.nomessage}</td>
   <td width="30%" align=left class="dvtCellInfo">
   <input type=checkbox name="accnomessage" {$accnomessage}>
   </td>
      </tr>
      <tr>
      <td width="20%" class="dvtCellLabel" align=right>{$APP.SINGLE_Campaigns}</td>
      <td width="30%" align=left class="dvtCellInfo">
      <input name="campaignaccid" value="{$campaignaccid}" id="campaignaccid" type="hidden">
      <input name="campaignaccid_display" id="campaignaccid_display" readonly="readonly" style="border: 1px solid rgb(186, 186, 186);" value="{$campaignaccid_display}" type="text">&nbsp;
      <img src="{'select.gif'|@vtiger_imageurl:$THEME}" tabindex="20" alt="Select" title="Select" onclick='return window.open("index.php?module=Campaigns&action=Popup&html=Popup_picker&form=SearchView&forfield=campaignaccid&popuptype=specific","test","width=640,height=602,resizable=0,scrollbars=0,top=150,left=200");' style="cursor: pointer;" align="absmiddle">&nbsp;
      <input src="{'clear_field.gif'|@vtiger_imageurl:$THEME}" alt="Clear" title="Clear" onclick="this.form.campaignaccid.value=''; this.form.campaignaccid_display.value=''; return false;" style="cursor: pointer;" align="absmiddle" type="image">
      </td>
      </tr>
</table>
</div>
<!-- the End of search Accounts inner content-->
</div>
</section>
</li>
{assign var=segmentheadtext value='SubsList'|@getTranslatedString:'SubsList'|replace:' ':''}
<li class="slds-accordion__list-item" onclick="accordionOpen('section_segments');">
<section id="section_segments" class="slds-accordion__section">
   <div class="slds-accordion__summary">
   <h3 class="slds-accordion__summary-heading">
   <svg class="slds-accordion__summary-action-icon slds-button__icon slds-button__icon_left" aria-hidden="true">
   <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#switch" />
   </svg>
   <span style="float:right;color:#0073ea" class="slds-truncate" title="Accordion summary">{'SubsList'|@getTranslatedString:'SubsList'}</span>
   </h3>
   <div>
   <button type="button" class="slds-button slds-button_icon slds-button_icon-border-filled slds-button_icon-x-small" aria-haspopup="true" title="Show More" onclick="accordionOpen('section_segments');">
   <svg class="slds-button__icon" aria-hidden="true">
   <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#down" />
   </svg>
   <span class="slds-assistive-text">Show More</span>
   </button>
   </div>
</div>
<div aria-hidden="true" class="slds-accordion__content" id="accordion-details-03">
<!-- the start of segment list inner content-->
<div style="width:auto;display:block;" id="tbl{$segmentheadtext}" >
   <input type="hidden" id="showtbl{$segmentheadtext}" name="showsegment" value="{$showdispsegment}">
   <table border=0 cellspacing=0 cellpadding=0 width="100%" class="small">
      <tr>
         <td width="20%" class="dvtCellLabel" align=right>
            {$MOD.Filter} {'SubsList'|@getTranslatedString:'SubsList'}
         </td>
         <td width="30%" align=left class="dvtCellInfo">
            <select name="selfilterseg" class="singlecombo" tabindex="30">
               {foreach key=row item=segfilter from=$segmentfilters}
                  {if $row eq $indexsegfilter}
                  <option value="{$row}" selected>{$segfilter}</option>
                  {else}
                  <option value="{$row}">{$segfilter}</option>
                  {/if}
               {/foreach}
            </select>
         </td>
         <td width="20%" class="dvtCellLabel" align=right>{'SINGLE_SubsList'|@getTranslatedString:'SubsList'}</td>
         <td width="30%" align=left class="dvtCellInfo">
            <input name="segmentid" value="{$segmentid}" id="segmentid" type="hidden">
            <input name="segmentid_display" id="segmentid_display"
            readonly="readonly" style="border: 1px solid rgb(186, 186, 186);" value="{$segmentid_display}" type="text">&nbsp;
            <img src="{'select.gif'|@vtiger_imageurl:$THEME}" tabindex="20"
            alt="Select" title="Select" onclick='return window.open("index.php?module=SubsList&action=Popup&html=Popup_picker&form=SearchView&forfield=segmentid","test","width=640,height=602,resizable=0,scrollbars=0,top=150,left=200");' style="cursor: pointer;" align="absmiddle">&nbsp;
            <input src="{'clear_field.gif'|@vtiger_imageurl:$THEME}" alt="Clear" title="Clear" onclick="this.form.segmentid.value=''; this.form.segmentid_display.value=''; return false;" style="cursor: pointer;" align="absmiddle" type="image">
         </td>
      </tr>
   </table>
</div>
<!-- the End of search segment list inner content-->
</div>
</section>
</li>

{assign var=segmentheadtext value=$MOD.taglistparams|replace:' ':''}
<li class="slds-accordion__list-item" onclick="accordionOpen('section_tags');">
<section id="section_tags" class="slds-accordion__section">
   <div class="slds-accordion__summary">
   <h3 class="slds-accordion__summary-heading">
   <svg class="slds-accordion__summary-action-icon slds-button__icon slds-button__icon_left" aria-hidden="true">
   <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#switch" />
   </svg>
   <span style="float:right;color:#0073ea" class="slds-truncate" title="Accordion summary">{$MOD.taglistparams}</span>
   </h3>
   <div>
   <button type="button" class="slds-button slds-button_icon slds-button_icon-border-filled slds-button_icon-x-small" aria-haspopup="true" title="Show More" onclick="accordionOpen('section_tags');">
   <svg class="slds-button__icon" aria-hidden="true">
   <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#down" />
   </svg>
   <span class="slds-assistive-text">Show More</span>
   </button>
   </div>
</div>
<div aria-hidden="true" class="slds-accordion__content" id="accordion-details-03">
<!-- the start of Tags inner content-->
	<div style="width:auto;display:block;" id="tbl{$segmentheadtext}" >
		<input type="hidden" id="showtbl{$segmentheadtext}" name="showtags" value="{$showdisptags}">
		<table border=0 cellspacing=0 cellpadding=0 width="100%" class="small">
			<tr>
				<td width="20%" class="dvtCellLabel" align=right>
					{$MOD.hastag}
				</td>
				<td width="30%" align=left class="dvtCellInfo">
					<select name="hastags[]" class="kendomultiselect" multiple tabindex="30">
						{foreach key=row item=tag from=$taglist}
                     {if $hastags|is_array && $row|in_array:$hastags}
                     <option value="{$row}" selected>{$tag}</option>
                     {else}
                     <option value="{$row}">{$tag}</option>
                     {/if}
						{/foreach}
					</select>
				</td>
				<td width="20%" class="dvtCellLabel" align=right>{$MOD.doesnothavetag}</td>
				<td width="30%" align=left class="dvtCellInfo">
					<select name="doesnothavetags[]" class="kendomultiselect" multiple tabindex="30">
						{foreach key=row item=tag from=$taglist}
                     {if $doesnothavetags|is_array && $row|in_array:$doesnothavetags}
                     <option value="{$row}" selected>{$tag}</option>
                     {else}
                     <option value="{$row}">{$tag}</option>
                     {/if}
						{/foreach}
					</select>
				</td>
			</tr>
		</table>
	</div>
<br>
<!-- the End of Tags content-->
</div>
</section>
</li>
<div align="center">
<input title="{$APP.LBL_SEARCH_BUTTON_TITLE}" accessKey="{$APP.LBL_SEARCH_BUTTON_KEY}" class="slds-button slds-button_brand searchbutton" type="submit" name="button" value="  {$APP.LBL_SEARCH_BUTTON_LABEL}  " onclick="returnCMData(event)" id="cmsearchbutton">
</div>
</form>
<!-- the end of first  form-->
<form name="EditView" method="POST" action="index.php">
<input type="hidden" name="module" value="{$MODULE}">
<input type="hidden" name="record" value="{if isset($ID)}{$ID}{/if}">
<input type="hidden" name="mode" value="{if isset($MODE)}{$MODE}{/if}">
<input type="hidden" name="action" value="convert">
<input type="hidden" name="convertto" value="po">
<input type="hidden" name="parenttab" value="{$CATEGORY}">
<input type="hidden" name="selectallrecords" id="selectallrecords" value="0">
<input type="hidden" name="mytab" value="1">

<br><br><br>
<input class="slds-button slds-button_brand" type="button" id="chooseAllBtn" value="{'Select all records'|@getTranslatedString:'MarketingDashboard'}" onclick="toggleSelectAllEntries_ListView('');" {if $hideSelectAll eq 'true'} style="display:none"{/if}/>
<div class="k-content" style="clear:both;">

{* <div id="grid_campaign">

</div> *}
{* the starting of Table Data*}
<table aria-multiselectable="true" class="slds-table slds-table_bordered slds-table_fixed-layout slds-table_resizable-cols" role="grid">
    <thead>
        <tr class="slds-line-height_reset">
            <th class="slds-text-align_right" scope="col" style="width: 3.25rem;">
                <span id="column-group-header" class="slds-assistive-text">Choose a row</span>
                <div class="slds-th__action slds-th__action_form">
                    <div class="slds-checkbox">
                        <input type="checkbox" name="options" id="checkbox-5" tabindex="-1" aria-labelledby="check-select-all-label column-group-header" value="checkbox-5" />
                        <label class="slds-checkbox__label" for="checkbox-5" id="check-select-all-label">
                            <span class="slds-checkbox_faux"></span>
                            <span class="slds-form-element__label slds-assistive-text">Select All</span>
                        </label>
                    </div>
                </div>
            </th>
            <th aria-label="Name" aria-sort="none" class="slds-is-resizable slds-is-sortable" scope="col">
                <a class="slds-th__action slds-text-link_reset" href="javascript:void(0);" role="button" tabindex="-1">
                    <span class="slds-assistive-text">Sort by: </span>
                    <div class="slds-grid slds-grid_vertical-align-center slds-has-flexi-truncate">
                        <span class="slds-truncate" title="modrel">modrel</span>
                        <span class="slds-icon_container slds-icon-utility-arrowdown">
                        <svg class="slds-icon slds-icon-text-default slds-is-sortable__icon " aria-hidden="true">
                        <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="/assets/icons/utility-sprite/svg/symbols.svg#arrowdown" />
                        </svg>
                        </span>
                    </div>
                </a>
                <div class="slds-resizable">
                    <input aria-label="Name column width" class="slds-resizable__input slds-assistive-text" id="cell-resize-handle-8" max="1000" min="20" tabindex="-1" type="range" />
                    <span class="slds-resizable__handle">
                     <span class="slds-resizable__divider"></span>
                    </span>
                </div>
            </th>
            <th aria-label="Account Name" aria-sort="none" class="slds-is-resizable slds-is-sortable" scope="col">
                <a class="slds-th__action slds-text-link_reset" href="javascript:void(0);" role="button" tabindex="-1">
                    <span class="slds-assistive-text">Sort by: </span>
                    <div class="slds-grid slds-grid_vertical-align-center slds-has-flexi-truncate">
                        <span class="slds-truncate" title="Title">Title</span>
                        <span class="slds-icon_container slds-icon-utility-arrowdown">
                        <svg class="slds-icon slds-icon-text-default slds-is-sortable__icon " aria-hidden="true">
                        <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="/assets/icons/utility-sprite/svg/symbols.svg#arrowdown" />
                        </svg>
                        </span>
                    </div>
                </a>
                <div class="slds-resizable">
                    <input aria-label="Account Name column width" class="slds-resizable__input slds-assistive-text" id="cell-resize-handle-9" max="1000" min="20" tabindex="-1" type="range" />
                    <span class="slds-resizable__handle">
                     <span class="slds-resizable__divider"></span>
                    </span>
                </div>
            </th>
            <th aria-label="Close Date" aria-sort="none" class="slds-is-resizable slds-is-sortable" scope="col">
                <a class="slds-th__action slds-text-link_reset" href="javascript:void(0);" role="button" tabindex="-1">
                    <span class="slds-assistive-text">Sort by: </span>
                    <div class="slds-grid slds-grid_vertical-align-center slds-has-flexi-truncate">
                        <span class="slds-truncate" title="Organizations">Organizations</span>
                        <span class="slds-icon_container slds-icon-utility-arrowdown">
                        <svg class="slds-icon slds-icon-text-default slds-is-sortable__icon " aria-hidden="true">
                        <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="/assets/icons/utility-sprite/svg/symbols.svg#arrowdown" />
                        </svg>
                        </span>
                    </div>
                </a>
                <div class="slds-resizable">
                    <input aria-label="Close Date column width" class="slds-resizable__input slds-assistive-text" id="cell-resize-handle-10" max="1000" min="20" tabindex="-1" type="range" />
                    <span class="slds-resizable__handle">
                     <span class="slds-resizable__divider"></span>
                    </span>
                </div>
            </th>
            <th aria-label="Stage" aria-sort="none" class="slds-is-resizable slds-is-sortable" scope="col">
                <a class="slds-th__action slds-text-link_reset" href="javascript:void(0);" role="button" tabindex="-1">
                    <span class="slds-assistive-text">Sort by: </span>
                    <div class="slds-grid slds-grid_vertical-align-center slds-has-flexi-truncate">
                        <span class="slds-truncate" title="City">City</span>
                        <span class="slds-icon_container slds-icon-utility-arrowdown">
                        <svg class="slds-icon slds-icon-text-default slds-is-sortable__icon " aria-hidden="true">
                        <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="/assets/icons/utility-sprite/svg/symbols.svg#arrowdown" />
                        </svg>
                        </span>
                    </div>
                </a>
                <div class="slds-resizable">
                    <input aria-label="Stage column width" class="slds-resizable__input slds-assistive-text" id="cell-resize-handle-11" max="1000" min="20" tabindex="-1" type="range" />
                    <span class="slds-resizable__handle">
                     <span class="slds-resizable__divider"></span>
                    </span>
                </div>
            </th>
            <th aria-label="Confidence" aria-sort="none" class="slds-is-resizable slds-is-sortable" scope="col">
                <a class="slds-th__action slds-text-link_reset" href="javascript:void(0);" role="button" tabindex="-1">
                    <span class="slds-assistive-text">Sort by: </span>
                    <div class="slds-grid slds-grid_vertical-align-center slds-has-flexi-truncate">
                        <span class="slds-truncate" title="Region">Region</span>
                        <span class="slds-icon_container slds-icon-utility-arrowdown">
                        <svg class="slds-icon slds-icon-text-default slds-is-sortable__icon " aria-hidden="true">
                        <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="/assets/icons/utility-sprite/svg/symbols.svg#arrowdown" />
                        </svg>
                        </span>
                    </div>
                </a>
                <div class="slds-resizable">
                    <input aria-label="Confidence column width" class="slds-resizable__input slds-assistive-text" id="cell-resize-handle-12" max="1000" min="20" tabindex="-1" type="range" />
                    <span class="slds-resizable__handle">
                     <span class="slds-resizable__divider"></span>
                    </span>
                </div>
            </th>
            <th aria-label="Contact" aria-sort="none" class="slds-is-resizable slds-is-sortable" scope="col">
                <a class="slds-th__action slds-text-link_reset" href="javascript:void(0);" role="button" tabindex="-1">
                    <span class="slds-assistive-text">Sort by: </span>
                    <div class="slds-grid slds-grid_vertical-align-center slds-has-flexi-truncate">
                        <span class="slds-truncate" title="User">User</span>
                        <span class="slds-icon_container slds-icon-utility-arrowdown">
                  <svg class="slds-icon slds-icon-text-default slds-is-sortable__icon " aria-hidden="true">
                  <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="/assets/icons/utility-sprite/svg/symbols.svg#arrowdown" />
                  </svg>
                  </span>
                    </div>
                </a>
                <div class="slds-resizable">
                    <input aria-label="Contact column width" class="slds-resizable__input slds-assistive-text" id="cell-resize-handle-14" max="1000" min="20" tabindex="-1" type="range" />
                    <span class="slds-resizable__handle">
                     <span class="slds-resizable__divider"></span>
                    </span>
                </div>
            </th>
            <th class="" scope="col" style="width: 3.25rem;">
                <div class="slds-truncate slds-assistive-text" title="Actions">Actions</div>
            </th>
        </tr>
    </thead>
    <tbody>
        <tr aria-selected="false" class="slds-hint-parent">
            <td class="slds-text-align_right" role="gridcell">
            <div class="slds-checkbox">
               <input type="checkbox" name="options" id="checkbox-01" tabindex="-1" aria-labelledby="check-button-label-01 column-group-header" value="checkbox-01" />
               <label class="slds-checkbox__label" for="checkbox-01" id="check-button-label-01">
                  <span class="slds-checkbox_faux"></span>
                  <span class="slds-form-element__label slds-assistive-text">Select item</span>
               </label>
            </div>
            </td>
            <th scope="row">
                <div class="slds-truncate" title="Acme - 200 Widgets"><a href="javascript:void(0);" tabindex="-1">Acme - 200 Widgets</a></div>
            </th>
            <td role="gridcell">
                <div class="slds-truncate" title="Acme">Acme</div>
            </td>
            <td role="gridcell">
                <div class="slds-truncate" title="1/31/15">1/31/15</div>
            </td>
            <td role="gridcell">
                <div class="slds-truncate" title="Prospecting">Prospecting</div>
            </td>
            <td role="gridcell">
                <div class="slds-truncate" title="60%">60%</div>
            </td>
            <td role="gridcell">
                <div class="slds-truncate" title="$5,000,000">$5,000,000</div>
            </td>
        </tr>
    </tbody>
</table>
<br/>
{* The and of Table Data *}

{literal}
<script>
var crudServiceBaseUrl = "index.php?module=MarketingDashboard&action=MarketingDashboardAjax&file=crudSelected&exec=List&mktdbtab=1";
function returnCMData(e) {
   e.preventDefault();
   alert('clicked');
		jQuery.ajax({
			method: 'GET',
			url: crudServiceBaseUrl
		}).done(function (response) {
         console.log(response);
		});
}


$(document).ready(function() {
  $("#grid_campaign").kendoGrid({
    dataSource: dsMDCampaignResults,
    height: 400,
    sortable: {
	    mode: "multiple",
	    allowUnsort: true
    },
    groupable:true,
    scrollable: true,
    selectable: "row",
    change: function (e) {
    	  //var selectedCells = this.select();
    	  //selectedCells.find('input[type="checkbox"]').click();
    	},
    dataBound: updateGridSelectAllCheckbox,
    pageable: true,
    filterable: false,
    sortable:false,
    columns:{/literal}{$columns}{literal} 
    });
});
</script>
{/literal}
</div>

<li class="slds-accordion__list-item" onclick="accordionOpen('section_generalparms');">
<section id="section_generalparms" class="slds-accordion__section">
   <div class="slds-accordion__summary">
   <h3 class="slds-accordion__summary-heading">
   <svg class="slds-accordion__summary-action-icon slds-button__icon slds-button__icon_left" aria-hidden="true">
   <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#switch" />
   </svg>
   <span style="float:right;color:#0073ea" class="slds-truncate" title="Accordion summary">{'generalparams'|@getTranslatedString:'MarketingDashboard'}</span>
   </h3>
   <div>
   <button type="button" class="slds-button slds-button_icon slds-button_icon-border-filled slds-button_icon-x-small" aria-haspopup="true" title="Show More" onclick="accordionOpen('section_generalparms');">
   <svg class="slds-button__icon" aria-hidden="true">
   <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#down" />
   </svg>
   <span class="slds-assistive-text">Show More</span>
   </button>
   </div>
</div>
<!-- the start of general params inner content-->
<div aria-hidden="true" class="slds-accordion__content" id="accordion-details-03">
   <div>
    <table border=0 cellspacing=0 cellpadding=0 width="100%" class="small">
    <tr>
			<td width="10%"  align=right class="dvInnerHeader">{$MOD.reference}
			</td>
			<td width="20%" align=left class="dvInnerHeader">
				<select name="title" class="singlecombo" tabindex="30">
					<option value="0" {$selentityname}>{$MOD.entityname}</option>
					<option value="1" {$selfixname}>{$MOD.fixname}</option>
               <option value="2" {$seldescname}>{$MOD.mytitle}</option>
               <option value="3" {$seldescentity}>{$MOD.descname}</option>
               <option value="4" {$seldescaccount}>{$MOD.descaccname}</option>
				</select>
               <input name="desc_name" tabindex="" style="border:1px solid #bababa;" size="20" maxlength="50" type="text" value="{$desc_name_val}">
			</td>
			<td width="10%" class="dvInnerHeader" align=right>
			{$MOD.LBL_DATE}
			</td>
			<td width="20%" align=left class="dvInnerHeader">
				<input name="due_date" tabindex="15" id="jscal_field_due_date" type="text" style="border:1px solid #bababa;" size="11" maxlength="10" value="{$due_date_val}" class="datepicker">
            <input name="due_time" tabindex="" style="border:1px solid #bababa;" size="5" maxlength="5" type="text" value="{$due_time_val}">
				<br><font size=1><em old="(yyyy-mm-dd)">({$dateStr})</em></font>
			</td>
         <td width="10%" class="dvInnerHeader" align=right>
			  {$MOD.AssignInvoiceTo}
			</td>
			<td width="20%" align=left class="dvInnerHeader">
				<select name="assignto" class="singlecombo" tabindex="10">
				{foreach key=key_one item=arr from=$ASSIGNEDTO_ARRAY}
					{foreach key=sel_value item=value from=$arr}
						<option value="{$key_one}" {$value}>{$sel_value}</option>
					{/foreach}
				{/foreach}
				</select>
			</td>
         </tr>
         <tr>
         <td width="10%" class="dvInnerHeader" align=right>{$MOD.description}</td>
         <td width="20%" align=left class="dvInnerHeader">
				<input type="text" name="descr" value="{$descrname_val}">
			</td>
         <td width="10%" class="dvInnerHeader" align=right>
         {'Campaign'|@getTranslatedString:'Campaign'}
			</td>
         <td width="20%" align=left class="dvInnerHeader">
         <input name="campaignconvert" id="campaignconvert" type="hidden" value="{if isset($campaignconvert)}{$campaignconvert}{/if}">
         <input name="campaignconvert_display" id="campaignconvert_display" readonly="readonly" style="border: 1px solid rgb(186, 186, 186);" type="text" value="{if isset($campaignconvert_display)}{$campaignconvert_display}{/if}">&nbsp;
         <img src="{'select.gif'|@vtiger_imageurl:$THEME}" tabindex="20" alt="Select" title="Select" onclick='return window.open("index.php?module=Campaigns&action=Popup&popuptype=specific&html=Popup_picker&form=EditView&forfield=campaignconvert","test","width=640,height=602,resizable=0,scrollbars=0,top=150,left=200");' style="cursor: pointer;" align="absmiddle">
         </td>
         <td width="10%" class="dvInnerHeader" align=right></td>
         <td width="20%" align=left class="dvInnerHeader"></td>
               </tr>
                  <tr>
                    <td width="10%" class="dvInnerHeader" align=right>
                       {'mailto_field_leads'|@getTranslatedString:$MODULE}
                      </td>
                      <td width="20%" align=left class="dvInnerHeader">
                        <select name="mailtofield_leads" class="singlecombo" tabindex="30">
                        {foreach key=row item=mail_field_lead from=$mail_field_leads}
                           {if $row eq $dflt_mail_field_lead}
                           <option value="{$row}" selected>{$mail_field_lead}</option>
                           {else}
                           <option value="{$row}">{$mail_field_lead}</option>
                           {/if}
                        {/foreach}
                        </select>
                    </td>
                    <td width="10%" class="dvInnerHeader" align=right>
                       {'mailto_field_contacts'|@getTranslatedString:$MODULE}
                    </td>
                    <td width="20%" align=left class="dvInnerHeader">
                        <select name="mailtofield_contacts" class="singlecombo" tabindex="30">
                        {foreach key=row item=mail_field_contact from=$mail_field_contacts}
                           {if $row eq $dflt_mail_field_contact}
                           <option value="{$row}" selected>{$mail_field_contact}</option>
                           {else}
                           <option value="{$row}">{$mail_field_contact}</option>
                           {/if}
                           {/foreach}
                        </select>
                    </td>
                    <td width="10%" class="dvInnerHeader" align=right>
                       {'mailto_field_accounts'|@getTranslatedString:$MODULE}
                    </td>
                    <td width="20%" align=left class="dvInnerHeader">
                        <select name="mailtofield_accounts" class="singlecombo" tabindex="30">
                        {foreach key=row item=mail_field_account from=$mail_field_accounts}
                           {if $row eq $dflt_mail_field_account}
                           <option value="{$row}" selected>{$mail_field_account}</option>
                           {else}
                           <option value="{$row}">{$mail_field_account}</option>
                           {/if}
                        {/foreach}
                        </select>
                    </td>
                  </tr>
          </table>
   </div>
<!-- the End of general params task inner content-->
</div>
<script>
       var documents ='{literal}[{\"groupid\":\"1\",\"columnname\":\"vtiger_notes:template:template:Documents_Template:C\",\"comparator\":\"e\",\"value\":\"0\",\"columncondition\":\"\"}]{/literal}&advft_criteria_groups={literal}[null,{\"groupcondition\":\"\"}]{/literal}';
       var templates ='{literal}[{\"groupid\":\"1\",\"columnname\":\"vtiger_notes:template:template:Documents_Template:C\",\"comparator\":\"e\",\"value\":\"1\",\"columncondition\":\"\"}]{/literal}&advft_criteria_groups={literal}[null,{\"groupcondition\":\"\"}]{/literal}';
</script>
</section>
</li>
<li class="slds-accordion__list-item" onclick="accordionOpen('section_msg');">
<section id="section_msg" class="slds-accordion__section">
   <div class="slds-accordion__summary">
   <h3 class="slds-accordion__summary-heading">
   <svg class="slds-accordion__summary-action-icon slds-button__icon slds-button__icon_left" aria-hidden="true">
   <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#switch" />
   </svg>
   <span style="float:right;color:#0073ea" class="slds-truncate" title="Accordion summary">{'Messages'|@getTranslatedString:'Messages'}</span>
   </h3>
   <div>
   <button type="button" class="slds-button slds-button_icon slds-button_icon-border-filled slds-button_icon-x-small" aria-haspopup="true" title="Show More" onclick="accordionOpen('section_msg');">
   <svg class="slds-button__icon" aria-hidden="true">
   <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#down" />
   </svg>
   <span class="slds-assistive-text">Show More</span>
   </button>
   </div>
</div>
<div aria-hidden="true" class="slds-accordion__content" id="accordion-details-03">
<!-- the start of msg inner content-->
   <div>
      <table border=0 cellspacing=0 cellpadding=0 width="100%" class="small">
	   <tr>
        <td width="10%" class="dvInnerHeader" align=right>{$MOD.emailtemplate}</td>
			<td width="20%" align=left class="dvInnerHeader">
			<input name="emailtemplateid"  id="emailtemplateid" type="hidden" value="{$emailtemplateid}"> 
      <input name="emailtemplateid_display" id="emailtemplateid_display" readonly="readonly" style="border: 1px solid rgb(186, 186, 186);" type="text" value="{$emailtemplateid_display}">&nbsp;
      <img src="{'select.gif'|@vtiger_imageurl:$THEME}" tabindex="20" alt="Select" title="Select" onclick='return window.open("index.php?module=Actions&action=Popup&popuptype=specific&html=Popup_picker&form=EditView&forfield=emailtemplateid","test","width=640,height=602,resizable=0,scrollbars=0,top=150,left=200");' style="cursor: pointer;" align="absmiddle">
		<input type="image" src="{'clear_field.gif'|@vtiger_imageurl:$THEME}"
		alt="Clear" title="Clear" onClick="this.form.emailtemplateid.value=''; this.form.emailtemplateid_display.value=''; return false;" align="absmiddle" style='cursor:hand;cursor:pointer'>&nbsp;
		<span id='viewlink'>
			&nbsp;<a href="javascript:;" onclick="view_template()">{'View'|@getTranslatedString:'MarketingDashboard'}</a>
		</span>
		</td>
	</tr>
	<tr>
		<td class="dvInnerHeader" align=right>{'Attach Document'|@getTranslatedString:'MarketingDashboard'}</td>
		<td class="dvInnerHeader">
			<input id="document_id" name="document_id" type="hidden" value="{$document_id}">
			<input id="document_id_display" name="document_id_display" readonly type="text" style="border:1px solid #bababa;" value="{$document_id_display}">&nbsp;
			<img src="{'select.gif'|@vtiger_imageurl:$THEME}" alt="Select" title="Select"
				onclick='return window.open("index.php?module=Documents&action=Popup&popuptype=specific&html=Popup_picker&form=EditView&forfield=document_id&query=true&searchtype=advance&advft_criteria="+documents,"test","width=640,height=602,resizable=0,scrollbars=0,top=150,left=200");' align="absmiddle" style='cursor:hand;cursor:pointer'>&nbsp;
			<input type="image" src="{'clear_field.gif'|@vtiger_imageurl:$THEME}"
				alt="Clear" title="Clear" onClick="this.form.document_id.value=''; this.form.document_id_display.value=''; return false;" align="absmiddle" style='cursor:hand;cursor:pointer'>&nbsp;
				<span id='viewlink'>
					&nbsp;<a href="javascript:;" onclick="view_document('document_id')">{'View'|@getTranslatedString:'MarketingDashboard'}</a>
				</span>
		</td>
	</tr>
	<tr>
		<td class="dvInnerHeader" align=right>{'Attach Document Template'|@getTranslatedString:'MarketingDashboard'}</td>
		<td class="dvInnerHeader">
			<input id="gendoctemplate" name="gendoctemplate" type="hidden" value="{$gendoctemplate}">
			<input id="gendoctemplate_display" name="gendoctemplate_display" readonly type="text" style="border:1px solid #bababa;" value="{$gendoctemplate_display}">&nbsp;
			<img src="{'select.gif'|@vtiger_imageurl:$THEME}" alt="Select" title="Select"
				onclick='return window.open("index.php?module=Documents&action=Popup&html=Popup_picker&form=EditView&srcmodule=evvtgendoc&query=true&searchtype=advance&advft_criteria="+templates,"test","width=640,height=602,resizable=0,scrollbars=0,top=150,left=200");' align="absmiddle" style='cursor:hand;cursor:pointer'>&nbsp;
			<input type="image" src="{'clear_field.gif'|@vtiger_imageurl:$THEME}"
				alt="Clear" title="Clear" onClick="this.form.gendoctemplate.value=''; this.form.gendoctemplate_display.value=''; return false;" align="absmiddle" style='cursor:hand;cursor:pointer'>&nbsp;
			<span id='viewlink'>
				&nbsp;<a href="javascript:;" onclick="view_document('gendoctemplate')">{'View'|@getTranslatedString:'MarketingDashboard'}</a>
			</span>
		</td>
	</tr>
</table>
<div align="center">
   <br>
   <input title="{$MOD.CONVERT_MESSAGE}" accessKey="V" class="slds-button convertbutton" type="button" name="button" id="convertmessage" value="  {$MOD.CONVERT_MESSAGE}  ">
</div>
</div>
<!-- the End of msg inner content-->
</div>
</section>
</li>
{if 'Task'|vtlib_isModuleActive}
<li class="slds-accordion__list-item" onclick="accordionOpen('section_task');">
<section id="section_task" class="slds-accordion__section">
   <div class="slds-accordion__summary">
      <h3 class="slds-accordion__summary-heading">
         <svg class="slds-accordion__summary-action-icon slds-button__icon slds-button__icon_left" aria-hidden="true">
         <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#switch" />
         </svg>
         <span style="float:right;color:#0073ea" class="slds-truncate" title="Accordion summary">{'Task'|@getTranslatedString:'Task'}</span>
      </h3>
      <div>
      <button type="button" class="slds-button slds-button_icon slds-button_icon-border-filled slds-button_icon-x-small" aria-haspopup="true" title="Show More" onclick="accordionOpen('section_task');">
      <svg class="slds-button__icon" aria-hidden="true">
      <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#down" />
      </svg>
      <span class="slds-assistive-text">Show More</span>
      </button>
   </div>
</div>
<div aria-hidden="true" class="slds-accordion__content" id="accordion-details-03">
<!-- the start of TODOs inner content-->
   <div>
     <table border=0 cellspacing=0 cellpadding=0 width="100%" class="small">
      <tr>
         <td width="10%" class="dvInnerHeader" align=right>{$MOD.event}</td>
            <td width="20%" align=left class="dvInnerHeader">
               <select name="selevent" class="singlecombo" tabindex="30">
                  {foreach key=row item=event from=$eventarray}
                     {if $event eq $indexevent}
                     <option value="{$row}" selected>{$event}</option>
                     {else}
                     <option value="{$row}">{$event}</option>
                     {/if}
                  {/foreach}
               </select>
            </td>
            <td width="10%" class="dvInnerHeader" align=right>{$MOD.taskstate}</td>
            <td width="20%" align=left class="dvInnerHeader">
               <select name="selstate" class="singlecombo" tabindex="30">
                  {foreach key=row item=state from=$taskstatearray}
                     {if $state eq $selstate}
                     <option value="{$row}" selected>{$state}</option>
                     {else}
                     <option value="{$row}">{$state}</option>
                     {/if}
                  {/foreach}
               </select>
            </td>
         </tr>
      </table>
   <div align="center">
      <br><input title="{$MOD.CONVERT_TASK}" accessKey="V" class="sdls-button sdls-button-neutral convertbutton" type="submit" name="button" id="converttask" value="  {$MOD.CONVERT_TASK}  " onclick="this.form.convertto.value='task'; return task('');">
   </div>
</div>
<!-- the End of TODOs inner content-->
</div>
</section>
</li>
{/if}

<li class="slds-accordion__list-item" onclick="accordionOpen('section_potentials');">
<section id="section_potentials" class="slds-accordion__section">
   <div class="slds-accordion__summary">
   <h3 class="slds-accordion__summary-heading">
   <svg class="slds-accordion__summary-action-icon slds-button__icon slds-button__icon_left" aria-hidden="true">
   <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#switch" />
   </svg>
   <span style="float:right;color:#0073ea" class="slds-truncate" title="Accordion summary">{'Potentials'|@getTranslatedString:'Potentials'}</span>
   </h3>
   <div>
   <button type="button" class="slds-button slds-button_icon slds-button_icon-border-filled slds-button_icon-x-small" aria-haspopup="true" title="Show More" onclick="accordionOpen('section_potentials');">
   <svg class="slds-button__icon" aria-hidden="true">
   <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#down" />
   </svg>
   <span class="slds-assistive-text">Show More</span>
   </button>
   </div>
</div>
<div aria-hidden="true" class="slds-accordion__content" id="accordion-details-03">
<!-- the start of Potentials inner content-->
  <div>
      <table border=0 cellspacing=0 cellpadding=0 width="100%" class="small">
      <tr>
        <td width="10%" class="dvInnerHeader" align=right>{$MOD.status}</td>
        <td width="20%" align=left class="dvInnerHeader">
                <select name="selvisit" class="singlecombo" tabindex="30">
                  {foreach key=row item=visit from=$visitarray}
                    {if $visit eq $selvisitval}
                    <option value="{$row}" selected>{$visit}</option>
                    {else}
                    <option value="{$row}">{$visit}</option>
                    {/if}
                  {/foreach}
                </select>
          </td>
        </tr>
      </table>
<div align="center">
<br>
<input title="{$MOD.CONVERT_PO}" accessKey="V" class="slds-button slds-button_outline-brand convertbutton" type="submit" name="button" id="convertpotential" value="  {$MOD.CONVERT_PO}  " onclick="this.form.convertto.value='po';return oneSelected('EditView');">
</div>
</div>
<!-- the End of Potentials inner content-->
</div>
</section>
</li>

<li class="slds-accordion__list-item" onclick="accordionOpen('section_campaign');">
<section id="section_campaign" class="slds-accordion__section">
   <div class="slds-accordion__summary">
   <h3 class="slds-accordion__summary-heading">
   <svg class="slds-accordion__summary-action-icon slds-button__icon slds-button__icon_left" aria-hidden="true">
   <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#switch" />
   </svg>
   <span style="float:right;color:#0073ea" class="slds-truncate" title="Accordion summary">{'Campaign'|@getTranslatedString:'Campaign'} /
			{'Marketing'|@getTranslatedString} /
			{'SubsList'|@getTranslatedString:'SubsList'} /
			{$MOD.taglistparams}</span>
   </h3>
   <div>
   <button type="button" class="slds-button slds-button_icon slds-button_icon-border-filled slds-button_icon-x-small" aria-haspopup="true" title="Show More" onclick="accordionOpen('section_campaign');">
   <svg class="slds-button__icon" aria-hidden="true">
   <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#down" />
   </svg>
   <span class="slds-assistive-text">Show More</span>
   </button>
   </div>
</div>
<div aria-hidden="true" class="slds-accordion__content" id="accordion-details-03">
<!-- the start of search task inner content-->
<div>
	<table style="width:100%;">
		<tr>
			<td style="text-align:right;">
            <input name="stcampaignid"  id="stcampaignid" type="hidden" value="{$stcampaignid}">
            &nbsp;{'Campaign'|@getTranslatedString:'Campaign'}&nbsp;
			</td>
			<td>
<input name="stcampaignid_display" id="stcampaignid_display" readonly="readonly" style="border: 1px solid rgb(186, 186, 186);"  type="text" value="{$stcampaignid_display}">&nbsp;
<img src="{'select.gif'|@vtiger_imageurl:$THEME}" tabindex="20" alt="Select" title="Select" onclick='return window.open("index.php?module=Campaigns&action=Popup&popuptype=specific&html=Popup_picker&form=EditView&forfield=stcampaignid","test","width=640,height=602,resizable=0,scrollbars=0,top=150,left=200");' style="cursor: pointer;" align="absmiddle">
			</td>
			<td style="text-align:right">
<input name="stplannedactionid" id="stplannedactionid" type="hidden" value="{if isset($stplannedactionid)}{$stplannedactionid}{/if}">
&nbsp;{'SINGLE_PlannedActions'|@getTranslatedString:'PlannedActions'}&nbsp;
			</td>
			<td>
<input name="stplannedactionid_display" id="stplannedactionid_display" readonly="readonly" style="border: 1px solid rgb(186, 186, 186);" type="text" value="{if isset($stplannedactionid_display)}{$stplannedactionid_display}{/if}">&nbsp;
<img src="{'select.gif'|@vtiger_imageurl:$THEME}" tabindex="20" alt="Select" title="Select" onclick='return window.open("index.php?module=PlannedActions&action=Popup&popuptype=specific&html=Popup_picker&form=EditView&forfield=stplannedactionid","test","width=640,height=602,resizable=0,scrollbars=0,top=150,left=200");' style="cursor: pointer;" align="absmiddle">
			</td>
			<td style="text-align:right">
{'LBL_ADD_TAG'|@getTranslatedString}
			</td>
			<td>
<input id="add_tag" name="add_tag" style="border: 1px solid rgb(186, 186, 186);" type="text" value="">
			</td>
		</tr>
		<tr>
			<td style="text-align:right">
<input name="stsubslistid"  id="stsubslistid" type="hidden" value="{if isset($stsubslistid)}{$stsubslistid}{/if}">
&nbsp;{'SubsList'|@getTranslatedString:'SubsList'}&nbsp;
			</td>
			<td>
<input name="stsubslistid_display" id="stsubslistid_display" readonly="readonly" style="border: 1px solid rgb(186, 186, 186);"  type="text" value="{if isset($stsubslistid_display)}{$stsubslistid_display}{/if}">&nbsp;
<img src="{'select.gif'|@vtiger_imageurl:$THEME}" tabindex="20" alt="Select" title="Select" onclick='return window.open("index.php?module=SubsList&action=Popup&popuptype=specific&html=Popup_picker&form=EditView&forfield=stsubslistid","test","width=640,height=602,resizable=0,scrollbars=0,top=150,left=200");' style="cursor: pointer;" align="absmiddle">
			</td>
			<td style="text-align:right">
<input name="stsequencerid"  id="stsequencerid" type="hidden" value="{if isset($stsequencerid)}{$stsequencerid}{/if}">
&nbsp;{'SINGLE_Sequencers'|@getTranslatedString:'Sequencers'}&nbsp;
			</td>
			<td>
<input name="stsequencerid_display" id="stsequencerid_display" readonly="readonly" style="border: 1px solid rgb(186, 186, 186);" type="text" value="{if isset($stsequencerid_display)}{$stsequencerid_display}{/if}">&nbsp;
<img src="{'select.gif'|@vtiger_imageurl:$THEME}" tabindex="20" alt="Select" title="Select" onclick='return window.open("index.php?module=Sequencers&action=Popup&popuptype=specific&html=Popup_picker&form=EditView&forfield=stsequencerid","test","width=640,height=602,resizable=0,scrollbars=0,top=150,left=200");' style="cursor: pointer;" align="absmiddle">
			</td>
			<td style="text-align:right">{'LBL_REMOVE_TAG'|@getTranslatedString}</td>
			<td>
<input id="remove_tag" name="remove_tag" style="border: 1px solid rgb(186, 186, 186);" type="text" value="">
			</td>
		</tr>
	</table>
<div align="center">
<br>
<input title="{$MOD.change}" accessKey="V" class="slds-button slds-button_brand" type="button" name="button" value="  {$MOD.change}  " onclick="updateContacts();">
</div>
<div id='showsms' display="none"></div>
</div>
<!-- the End of search task inner content-->
</div>
</section>
</li>
</form>
</ul>