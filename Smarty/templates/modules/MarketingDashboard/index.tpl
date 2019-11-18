<link href="include/kendoui/styles/kendo.common.min.css" rel="stylesheet"/>
<link href="include/kendoui/styles/kendo.uniform.min.css" rel="stylesheet"/>
<script src="include/kendoui/jquery-1.7.2.min.js"></script>
<script src="include/kendoui/js/kendo.web.min.js"></script>
<script src="include/kendoui/js/kendo.pager.min.js"></script>

<!-- BunnyJs Script Files -->
<link rel="stylesheet" href="include/bunnyjs/css/svg-icons.css">
<script src="include/bunnyjs/utils-dom.min.js"></script>
<script src="include/bunnyjs/ajax.min.js"></script>
<script src="include/bunnyjs/template.min.js"></script>
<script src="include/bunnyjs/pagination.min.js"></script>
<script src="include/bunnyjs/url.min.js"></script>
<script src="include/bunnyjs/utils-svg.min.js"></script>
<script src="include/bunnyjs/spinner.min.js"></script>
<script src="include/bunnyjs/datatable.min.js"></script>
<script src="include/bunnyjs/datatable.icons.min.js"></script>
<script src="include/bunnyjs/element.min.js"></script>
<script src="include/bunnyjs/datatable.scrolltop.min.js"></script>
<!-- BunnyJs Script Files -->

<script src="modules/MarketingDashboard/MarketingDashboard.js"></script>
<link rel="stylesheet" type="text/css" href="modules/MarketingDashboard/styles/jquery-ui-1.9.2.custom.css" />
<script type="text/javascript" src="modules/MarketingDashboard/js/jquery-ui-1.9.2.custom.js"></script>
<script type="text/javascript" src="modules/MarketingDashboard/js/jquery-multiselect.js"></script>
<script type="text/javascript" src="modules/MarketingDashboard/js/jquery-multiselect-filter.js"></script>
<link rel="stylesheet" type="text/css" href="modules/MarketingDashboard/styles/jquery-multiselect.css"/>
<link rel="stylesheet" type="text/css" href="modules/MarketingDashboard/styles/jquery-multiselect-filter.css"/>
<script type="text/javascript">
{literal}
$(function(){
  $('#tabs').tabs({
	  activate: function( event, ui ) {
		mktdb_selectedtab = ui.newPanel[0].id.substring(5);
	    if (mktdb_selectedtab==1) 
	    	dsMDCampaignResults.read();
	    else if (mktdb_selectedtab==2)
	    	dsMDContactResults.read();
        else
            dsMDAssignResults.read();
	   },
  });
  $(".searchbutton").button();
  $(".convertbutton").button();
  $("#relatedmodules").multiselect().multiselectfilter();
  $("#accordion,#accordion3").accordion({ clearStyle: true },{ active: false });
  $(".singlecombo").multiselect({
   multiple: false,
   header: false,
   noneSelectedText: "{/literal}{'Select an Option'|@getTranslatedString:'MarketingDashboard'}{literal}",
   selectedList: 1
});
	$(".kendomultiselect").kendoMultiSelect();
$(".datepicker").datepicker({ changeMonth: true ,changeYear: true,dateFormat:{/literal}"{$dateFormat}"{literal}});
var x = "{/literal}{'QContinue'|@getTranslatedString:'MarketingDashboard'}{literal}";
$('#convertmessage').click(function() {
    $('<div>' + x + '</div>').dialog({
        resizable: false,
        buttons: {
        	"{/literal}{'LBL_YES'|@getTranslatedString}{literal}": function() {
               if(message()){
              document.EditView.convertto.value='message';
               document.EditView.submit();
               }
                $(this).dialog("close");
            },
            "{/literal}{'LBL_NO'|@getTranslatedString}{literal}": function() {
                $(this).dialog("close");
            }
        }
    });
}); 
});

function showUrlInDialog(url){
  var tag = $("<div></div>");
  $.ajax({
    url: url,
    success: function(data) {
      tag.html(data).dialog({width:$(window).width()*0.8,height:$(window).height()*0.8,modal: true}).dialog('open');
    }
  });
}
$.extend({ alert: function (message, title) {
  $("<div></div>").dialog( {
    buttons: { "Ok": function () { $(this).dialog("close"); } },
    close: function (event, ui) { $(this).remove(); },
    resizable: false,
    title: "{/literal}{'Checking parameters'|@getTranslatedString:'MarketingDashboard'}{literal}",
    modal: true
  }).text(message);
}
});
{/literal}
</script>
{literal}
<!-- overriding the pre-defined #company to avoid clash with vtiger_field in the view -->
<style type='text/css'>
#company {
	height: auto;
	width: 90%;
}
.slds-truncate{
    cursor: pointer;
    font-family: Arial, Helvetica, sans-serif;
    font-size: 12px;
}
</style>
{/literal}

{include file='Buttons_List1.tpl'}
<br><br>
<script type="text/javascript">
var mktdb_selectedtab = {$mytab|default:1};
{literal}
$(function(){
     $('#tabs') .tabs( "select" , mktdb_selectedtab-1)
});
{/literal}
</script>
<div id="tabs" style="padding:20px; width:95%">
  <ul>
    <li><a href="#tabs-1">{$MOD.convert_entities}</a></li>
    <li><a href="#tabs-2">{$MOD.create_contacts}</a></li>
    <li><a href="#tabs-3">{$MOD.manage_assign}</a></li>
    <li><a href="index.php?module=MarketingDashboard&action=MarketingDashboardAjax&file=batch_status">{$MOD.CRONJOB}</a></li>
  </ul>
    <div id="tabs-1">
        {include file='modules/MarketingDashboard/campaign_management.tpl'}
    </div>
    <div id="tabs-2">
        {include file='modules/MarketingDashboard/create_contacts.tpl'}
    </div>
    <div id="tabs-3">
        {include file='modules/MarketingDashboard/massive_assign.tpl'}
    </div>
 </div>

<script>
function accordionOpen(section2open) {
	var sections = document.querySelectorAll('.slds-accordion__section');
	for (var sec=0; sec<sections.length; sec++) {
		sections[sec].classList.remove('slds-is-open');
	}
	document.getElementById(section2open).classList.add('slds-is-open');
	return false;
}
</script>