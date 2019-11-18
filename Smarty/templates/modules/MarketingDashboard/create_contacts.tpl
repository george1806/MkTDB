<div id="view" class="workflows-list">
    <datatable url="index.php?module=MarketingDashboard&action=MarketingDashboardAjax&file=getJSON&mktdbtab=2" template="create_contact_search_row_template">
        <header>
            <ul class="slds-accordion">
                {assign var=accheadtext value=$MOD.accparams|replace:' ':''}
                <li class="slds-accordion__list-item" onclick="accordionOpen('section_searchaccounts');">
                    <section id="section_searchaccounts" class="slds-accordion__section">
                        <div class="slds-accordion__summary">
                            <h3 class="slds-accordion__summary-heading">
                            <svg class="slds-accordion__summary-action-icon slds-button__icon slds-button__icon_left" aria-hidden="true">
                            <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#switch" />
                            </svg>
                            <span style="float:right;color:#0073ea" class="slds-truncate" title="Accordion summary">{$MOD.accparams}</span>
                            </h3>
                            <div>
                                <button type="button" class="slds-button slds-button_icon slds-button_icon-border-filled slds-button_icon-x-small" aria-haspopup="true" title="Show More" onclick="accordionOpen('section_searchaccounts');">
                                    <svg class="slds-button__icon" aria-hidden="true">
                                        <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#down" />
                                    </svg>
                                    <span class="slds-assistive-text">Show More</span>
                                </button>
                            </div>
                        </div>
                        <div aria-hidden="true" class="slds-accordion__content" id="accordion-details-03">
                            <!-- the start of search Accounts inner content-->
                            <div style="width:auto;display:block;" id="tbl{$accheadtext}">
                                <input type="hidden" id="showtbl{$accheadtext}" name="showacc" value="{$showdispacc}">
                                <div class="slds-grid slds-gutters">
                                        <div class="slds-col">{$MOD.filteracc}&nbsp;
                                            <select name="selfilteracc1" id="selfilteracc1" class="singlecombo" tabindex="30">
                                                {foreach key=row item=accfilter from=$accountfilters} {if $row eq $indexaccfilter1}
                                                <option value="{$row}" selected>{$accfilter}</option>
                                                {else}
                                                <option value="{$row}">{$accfilter}</option>
                                                {/if} {/foreach}
                                            </select>
                                        </div>
                                        <div class="slds-col">{$MOD.filtercont}&nbsp;
                                            <select name="selfilteraccountcon" id="selfilteraccountcon" class="singlecombo" tabindex="30">
                                                {foreach key=row item=confilter from=$contactfilters} {if $row eq $indexaccountconfilter}
                                                <option value="{$row}" selected>{$confilter}</option>
                                                {else}
                                                <option value="{$row}">{$confilter}</option>
                                                {/if} {/foreach}
                                            </select>
                                        </div>
                                    </div>
                                  <div> <br/>
                                  <div class="slds-grid slds-gutters">
                                        <div class="slds-col">{$MOD.nocontacts}
                                            <input type=checkbox name="nocontacts" {$nocontacts}>
                                        </div>
                                        <div class="slds-col">{$MOD.withcontacts}
                                            <input type=checkbox name="withcontacts" {$withcontacts}>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- the End of search Accounts inner content-->
                        </div>
                    </section>
                </li>

                {assign var=con1headtext value=$MOD.conparams|replace:' ':''}
                <li class="slds-accordion__list-item" onclick="accordionOpen('section_searchcontacts');">
                    <section id="section_searchcontacts" class="slds-accordion__section">
                        <div class="slds-accordion__summary">
                            <h3 class="slds-accordion__summary-heading">
                            <svg class="slds-accordion__summary-action-icon slds-button__icon slds-button__icon_left" aria-hidden="true">
                            <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#switch" />
                            </svg>
                            <span style="float:right;color:#0073ea" class="slds-truncate" title="Accordion summary">{$MOD.conparams}</span>
                            </h3>
                            <div>
                                <button type="button" class="slds-button slds-button_icon slds-button_icon-border-filled slds-button_icon-x-small" aria-haspopup="true" title="Show More" onclick="accordionOpen('section_searchcontacts');">
                                    <svg class="slds-button__icon" aria-hidden="true">
                                        <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="include/LD/assets/icons/utility-sprite/svg/symbols.svg#down" />
                                    </svg>
                                    <span class="slds-assistive-text">Show More</span>
                                </button>
                            </div>
                        </div>
                        <div aria-hidden="true" class="slds-accordion__content" id="accordion-details-03">
                            <!-- the start of search contacts inner content-->
                            <div style="width:auto;display:block;" id="tbl1{$con1headtext}" class="slds-grid slds-gutters">
                                <input type="hidden" id="showtbl1{$con1headtext}" name="showcon1" value="{$showdispcon1}">
                                    <div class="slds-grid slds-gutters">
                                        <div class="slds-col">{$MOD.filtercont}&nbsp;
                                            <select name="selfiltercon1" id="selfiltercon1" class="singlecombo" tabindex="30">
                                                {foreach key=row item=confilter from=$contactfilters} {if $row eq $indexconfilter1}
                                                <option value="{$row}" selected>{$confilter}</option>
                                                {else}
                                                <option value="{$row}">{$confilter}</option>
                                                {/if} {/foreach}
                                            </select>
                                        </div>
                                        <div class="slds-col"> {$MOD.filteracc}&nbsp;
                                            <select name="selfilteracccon1" id="selfilteracccon1" class="singlecombo" tabindex="30">
                                                {foreach key=row item=accfilter from=$accountfilters} {if $row eq $indexfilterconacc1}
                                                <option value="{$row}" selected>{$accfilter}</option>
                                                {else}
                                                <option value="{$row}">{$accfilter}</option>
                                                {/if} {/foreach}
                                            </select>
                                        </div>
                                    </div>
                            </div>
                            <br>
                            <!-- the End of search contacts inner content-->
                        </div>
                    </section>
                </li>
                {* <div align="center">
                    <input title="{$APP.LBL_SEARCH_BUTTON_TITLE}" accessKey="{$APP.LBL_SEARCH_BUTTON_KEY}" class="slds-button slds-button_neutral searchbutton" type="submit" name="button" value=" {$APP.LBL_SEARCH_BUTTON_LABEL}  " id="searchbutton1">
                </div>*}
                <ul>
        </header>
        <footer>
            <pagination limit={$PAGINATION_LIMIT} outer></pagination>
        </footer>
        <table class="rptTable">
            <tr>
                {foreach key=dtkey item=dtheader from=$LIST_HEADER}
                <th pid="{$dtkey}" class="rptCellLabel">{$dtheader}</th>
                {/foreach}
            </tr>
        </table>
    </datatable>
</div>
<!-- Table Row Template -->
<table id="create_contact_search_row_template" hidden>
	<tr>
		{foreach key=dtkey item=dtheader from=$LIST_FIELDS}
			<td v="{$dtkey}" class="rptData"></td>
		{/foreach}
	</tr>
</table>
<script type="text/javascript">
{literal}
//{* Handle Action from the Table *}
Template.define('create_contact_search_row_template', {});
DataTable.onRedraw(document.getElementsByTagName('datatable')[0], function (data) {});
{/literal}
Pagination._config.langFirst = "{$APP.LNK_LIST_START}";
Pagination._config.langLast = "{$APP.LNK_LIST_END}";
Pagination._config.langPrevious = "< {$APP.LNK_LIST_PREVIOUS}";
Pagination._config.langNext = "{$APP.LNK_LIST_NEXT} >";
{literal}
Pagination._config.langStats = "{from}-{to} {/literal}{$APP.LBL_LIST_OF}{literal} {total} ({/literal}{$APP.Page}{literal} {currentPage} {/literal}{$APP.LBL_LIST_OF}{literal} {lastPage})";
DataTableConfig.loadingImg = 'themes/images/loading.svg';

DataTableConfig.searchInputName = 'selfilteracc1';
DataTableConfig.searchInputName = 'selfilteraccountcon';

DataTableConfig.searchInputName = 'selfiltercon1';
DataTableConfig.searchInputName = 'selfilteracccon1';
</script>
{/literal}