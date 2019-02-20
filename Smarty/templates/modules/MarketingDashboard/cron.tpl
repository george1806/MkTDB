<div class="k-content">
<div id="fileslist"></div>
{literal}
<script>
$(document).ready(function() {

$("#fileslist").kendoGrid({
    dataSource: {
     data:{/literal}{$allfiles}{literal},
    schema: {
            model: {
                fields:{/literal}{$fieldsfile}{literal}
            }
        },
    pageSize: {/literal}{$PAGESIZE}{literal},
    group: {/literal}{$groupfile}{literal},
    aggregate: {/literal}{$aggregatefile}{literal}
    },
    height: 300,
    sortable: {
    mode: "multiple",
    allowUnsort: true
    },
    groupable:false,
    scrollable: true,
    selectable: "multiple",
    pageable: true,
    filterable: true,
    sortable:false,
    columns:[
    {field:"filename",title:"{/literal}{'Filename'|@getTranslatedString:'MarketingDashboard'}{literal}"},
    { command: [{ text: "{/literal}{'Run'|@getTranslatedString:'MarketingDashboard'}{literal}", click: execscript,name:"run-script" },{ text: "{/literal}{'Delete'|@getTranslatedString:'MarketingDashboard'}{literal}", click: deletescript,name:"delete-script" }], title: "{/literal}{'Actions'|@getTranslatedString:'MarketingDashboard'}{literal}" , width: "170px"}]
    });
 function execscript(e) {
        kendo.ui.progress($("#fileslist"), true);
        var dataItem = this.dataItem($(e.currentTarget).closest("tr"));
        scriptname=dataItem.filename;
        $.ajax({
        type: "POST",
        url:  "index.php",
        data: "module=MarketingDashboard&action=MarketingDashboardAjax&ajax=true&file=run&scriptname="+scriptname,
        success:
        function(result){
            kendo.ui.progress($("#fileslist"), hide);
            $("#tabs").tabs({select:3});
        }
        });
   }
       function deletescript(e) {
        kendo.ui.progress($("#fileslist"), true);
        var dataItem = this.dataItem($(e.currentTarget).closest("tr"));
        scriptname=dataItem.filename;
        $.ajax({
        type: "POST",
        url:  "index.php",
        data: "module=MarketingDashboard&action=MarketingDashboardAjax&ajax=true&file=remove&scriptname="+scriptname,
        success:
        function(result){
        kendo.ui.progress($("#fileslist"), hide);
        $("#tabs").tabs({select:3});
        }
        });
   }
});
</script>
{/literal}
</div>
<br><br>
{'Last results'|@getTranslatedString:'MarketingDashboard'}:
<div class="k-content">
<div id="lastresults"></div>
{literal}
<script>
$(document).ready(function() {
$("#lastresults").kendoGrid({
    dataSource: {
     data:{/literal}{$lastinfo}{literal},
    schema: {
            model: {
                fields:{/literal}{$lastfields}{literal}
            }
        },
    pageSize: {/literal}{$PAGESIZE}{literal},
    group: {/literal}{$lastgroups}{literal},
    aggregate: {/literal}{$lastaggregates}{literal}
    },
    height: 300,
    sortable: {
    mode: "multiple",
    allowUnsort: true
    },
    groupable:false,
    scrollable: true,
    selectable: "multiple",
    pageable: true,
    filterable: true,
    sortable:false,
    columns:{/literal}{$lastcolumns}{literal} 
    });
});
</script>
{/literal}
</div>
