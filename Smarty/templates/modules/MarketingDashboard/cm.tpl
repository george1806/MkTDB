<form name="SearchView" method="POST" action="index.php">
<input type="hidden" name="module" value="{$MODULE}">
<input type="hidden" name="record" value="{if isset($ID)}{$ID}{/if}">
<input type="hidden" name="mode" value="{if isset($MODE)}{$MODE}{/if}">
<input type="hidden" name="action" value="index">
<input type="hidden" name="parenttab" value="{$CATEGORY}">
<input type="hidden" name="mytab" value="1">

<div class="slds-accordion">
    <div class="slds-accordion__section">
      <h3 class="slds-section__title">
        <button aria-controls="expando-unique-id" aria-expanded="false" class="slds-button slds-section__title-action">
          <svg class="slds-section__title-action-icon slds-button__icon slds-button__icon_left" aria-hidden="true">
            <use xlink:href="./include/LD/assets/icons/utility-sprite/svg/symbols.svg#switch" xmlns:xlink="http://www.w3.org/1999/xlink" />
          </svg>
          <span class="slds-truncate" style="float:right;color:#0073ea"  title="{$MOD.leadparams}"> {$MOD.leadparams}</span>
        </button>
      </h3>
      <div aria-hidden="true" class="slds-section__content" id="expando-unique-id">
        <p>Sample content Sample content Sample content</p>
      </div>
    </div>
    </div>