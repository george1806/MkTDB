{*
// esto no hace falta porque se carga en el menu, lo quito para optimizar carga y mantener estilo homogéneo
<link href="include/kendoui/styles/kendo.common.min.css" rel="stylesheet"/>
<link href="include/kendoui/styles/kendo.uniform.min.css" rel="stylesheet"/>
*}
<script src="include/kendoui/jquery-1.7.2.min.js"></script>
<script src="include/kendoui/js/kendo.web.min.js"></script>
<script src="include/kendoui/js/kendo.pager.min.js"></script>
<script src="modules/MarketingDashboard/MarketingDashboard.js"></script>
{include file='Buttons_List1.tpl'}	

<div id="example2" class="k-content" style="clear:both;">
 <div id="clientsDb2" >
        <table border=0 cellspacing=0 cellpadding=0 width=95% class="small" id="grid2" >
            <thead>
            <tr>
                <th class="detailedViewHeader" data-field="entity" ><b>{$MOD.Entity|strip:''}</b></th>
                <th class="detailedViewHeader" data-field="record" ><b>{$MOD.Title|strip:''}</b></th>
                <th class="detailedViewHeader" data-field="account"><b>{$APP.Account|strip:''}</b></th>
                <th class="detailedViewHeader" data-field="email"><b>{$APP.Email|strip:''}</b></th>
            </tr>
            </thead>
            <tbody>
            {foreach item=values from=$documents}
            <tr>
                <td class="dvtCellInfo">{$values.entity|@getTranslatedString:$values.entity}</a></td>
                <td class="dvtCellInfo"><a href="index.php?module={$values.entity}&action=DetailView&record={$values.recid}">{$values.name}</a></td>
                <td class="dvtCellInfo"><a href="index.php?module=Accounts&action=DetailView&record={$values.accountid}">{$values.account}</a></td>
                <td class="dvtCellInfo">{$values.email}</a></td>
            </tr>
            {/foreach}
            </tbody>
        </table>
</div>
{literal}
<style>
  #clientsDb2 {
    width:100%;
    height: 605px;
  }
</style>
<script>
    $(document).ready(function() { 
        $("#grid2").kendoGrid({
         dataSource: {
          schema: {
                    model: {
                        fields: {
                            entity: { type: "string" },
                            record: { type: "string" },
                            account:{type:"string"},
                            email:{type:"string"}
                        }
                    }
                },
         pageSize: {/literal}{$PAGESIZE}{literal}
         },
            height: 400,
            sortable: {
            mode: "multiple",
            allowUnsort: true
            },
            scrollable: true,
            pageable: true,
            columns:[
             {field:"entity",sortable:false,filterable:true},
             {field:"record",sortable:false,filterable:true},
             {field:"account",sortable:false,filterable:true},
             {field:"email",sortable:false,filterable:true}
            ]
         });
    });
</script>
{/literal}
</div>
