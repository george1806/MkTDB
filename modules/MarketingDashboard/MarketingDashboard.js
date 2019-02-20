$.getScript("index.php?module=MarketingDashboard&action=MarketingDashboardAjax&file=getjslanguage", function(){});

function updateGridSelectAllCheckbox() {
	var index = (mktdb_selectedtab == 1 ? '' : mktdb_selectedtab);
	var all_state=false;
	var groupElements = document.getElementsByName('selected_id'+index);
	for (var i=0;i<groupElements.length;i++) {
        if(groupElements[i].disabled)
        	var state=true;
        else
        	var state=groupElements[i].checked;
		if (state == false) {
			all_state=false;
			break;
		}
	}
	jQuery('#selectall'+index).prop('checked', all_state);
}

function check_object(sel_id,index,groupParentElementId) {
	$.ajax({
		  url: "index.php?module=MarketingDashboard&action=MarketingDashboardAjax&file=crudSelected&exec=Update&mktdbtab="+index+"&selid="+sel_id.checked+"&crmid="+$(sel_id).val(),
		  context: document.body
		}).done(function() {
			$.ajax({
				  url: "index.php?module=MarketingDashboard&action=MarketingDashboardAjax&file=crudSelected&exec=AreAllSelected&mktdbtab="+index,
				  context: document.body
				}).done(function(response) {
					var rsp = $.parseJSON(response);
			    	if (rsp.allselected) {
			    		document.getElementById("chooseAllBtn"+index).value = vtmkt_arr.UNSELECTALL;
			    		document.getElementById("selectallrecords"+index).value = 1;
			    	} else {
			    		document.getElementById("chooseAllBtn"+index).value = vtmkt_arr.SELECTALL;
			    		document.getElementById("selectallrecords"+index).value = 0;
			    	}
				});
	      });
	updateGridSelectAllCheckbox();
}

function toggleSelectAllGrid(state,relCheckName,index) {
    var obj = document.getElementsByName(relCheckName);
	if (obj) {
		var chkdvals = '';
        for (var i=0;i<obj.length;i++) {
            if(!obj[i].disabled){
            	obj[i].checked=state;
            	//check_object(obj[i],index);
            	chkdvals = chkdvals + obj[i].value + ',';
            }
        }
        jQuery.ajax({
  		  url: "index.php?module=MarketingDashboard&action=MarketingDashboardAjax&file=crudSelected&exec=Update&mktdbtab="+mktdb_selectedtab+"&selid="+(state ? '1' : '0')+"&crmid="+chkdvals.replace(/(^,)|(,$)/g, ''),
		  context: document.body
        });
    }
}

function toggleSelectAllEntries_ListView(index){
	var state = document.getElementById("selectallrecords"+index).value;
	var newstate = 0;
	if (state == 0) {
		//select
		document.getElementById("chooseAllBtn"+index).value = vtmkt_arr.UNSELECTALL;
		document.getElementById("selectallrecords"+index).value = 1;
		newstate = 1;
	} else {
		//unselect
		document.getElementById("chooseAllBtn"+index).value = vtmkt_arr.SELECTALL;
		document.getElementById("selectallrecords"+index).value = 0;
		newstate = 0;
	}
    jQuery.ajax({
  	  url: "index.php?module=MarketingDashboard&action=MarketingDashboardAjax&file=crudSelected&exec=UpdateAll&mktdbtab="+mktdb_selectedtab+"&selid="+newstate,
  	  context: document.body
      }).done(function() {
    	  switch (mktdb_selectedtab) {
    	    case "1":
    	    	dsMDCampaignResults.read();
    	      break;
    	    case "2":
    	    	dsMDContactResults.read();
      	      break;
    	    case "3":
    	    	dsMDAssignResults.read();
      	      break;
    	  }
      });
}

function showHideStatus(sId,anchorImgId,flag) {
	oObj = eval(document.getElementById(sId));
	if(oObj.style.display == 'block')
	{
		oObj.style.display = 'none';
                $("#"+anchorImgId).removeClass("ui-icon-triangle-1-s");
		$("#"+anchorImgId).addClass("ui-icon-triangle-1-e");
                if(flag==1)
		document.getElementById("show"+sId).value="none";
	}
	else
	{
		oObj.style.display = 'block';
                $("#"+anchorImgId).removeClass("ui-icon-triangle-1-e");
		$("#"+anchorImgId).addClass("ui-icon-triangle-1-s");
                if(flag==1)
		document.getElementById("show"+sId).value="block";
	}
}

function oneSelected(formName) {
    jQuery.ajax({
      url: "index.php?module=MarketingDashboard&action=MarketingDashboardAjax&file=crudSelected&mktdbtab="+mktdb_selectedtab+"&exec=OneSelected",
      context: document.body
    }).done(function(response) {
    	var rsp = $.parseJSON(response);
    	if (rsp.oneselected) {
    		var form = document.forms[formName];
    		if (!form) return false;
    		form.submit();
    	} else {
    		$.alert(vtmkt_arr.SELECTONE);
    	}
    });
	return false;
}

function updateContacts() {
    jQuery.ajax({
        url: "index.php?module=MarketingDashboard&action=MarketingDashboardAjax&file=crudSelected&exec=AtLeastOneEntity&mktdbtab="+mktdb_selectedtab,
        data: { entities: "'a','c','l','m'" },
        context: document.body
      }).done(function(response) {
      	var rsp = $.parseJSON(response);
      	if (rsp.oneselected) {
      	  var campaignid=document.getElementById('stcampaignid').value;
					var sequencerId = $( "#stsequencerid" ).val(),
					plannedactionId = $( "#stplannedactionid" ).val(),
					subslistId = $( "#stsubslistid" ).val();
					addtag = $( "#add_tag" ).val();
					removetag = $( "#remove_tag").val();
      	  if(campaignid>0 || sequencerId > 0 || plannedactionId > 0 || subslistId > 0 || addtag != '' || removetag != '') {
      	    $.post('index.php', {
      	    	module:'MarketingDashboard',
      	    	action:'MarketingDashboardAjax',
      	    	file:'updateContacts',
      	    	ajax:'true',
      	    	campid:campaignid,
							sequencer_id: sequencerId,
							plannedaction_id: plannedactionId,
							subslist_id: subslistId,
							add_tag: addtag,
							remove_tag: removetag
      	    },
      	    function(result){
							$("#showsms").css({backgroundColor: '#9FDAEE', border: '1px solid #2BB0D7',width:'80%', 'margin-top': '15px;'});
							$("#showsms").html('<br>'+vtmkt_arr.Linked2Campaign+"<br><br>");
      	    });
      	  } else {
      		$.alert(vtmkt_arr.SELECTCAMPAIGN);
      	  }
      	} else {
      		$.alert(vtmkt_arr.SELECTACCOUNTCONTACT);
      	}
      });
    return false;
}

function change_assign(){
    var user_val=$("#assignto_account").val();
    var related_mod=$("#relatedmodules").val();
    if(user_val==0 && related_mod==null){
       $.alert(vtmkt_arr.CHOOSEPARAM);
       $("#accordion3").accordion('activate', 0);
       return false;
    }
	jQuery.ajax({
        url: "index.php?module=MarketingDashboard&action=MarketingDashboardAjax&file=crudSelected&exec=AtLeastOneEntity&mktdbtab="+mktdb_selectedtab,
        data: { entities: "'a'" },
        context: document.body
      }).done(function(response) {
      	var rsp = $.parseJSON(response);
      	if (rsp.oneselected) {
    		var form = document.forms['InvoiceLines3'];
    		if (!form) return false;
    		form.submit();
      	} else {
      		$.alert(vtmkt_arr.SELECTONEACCOUNT);
      	}
      });
    return false;
}

function movefieldsbetweenentities() {
	var from_mod=$("#modulefrom").val();
	if (from_mod==4) 
	  myel="'c'";
	else if(from_mod==6) 
	  myel="'a'";
	jQuery.ajax({
        url: "index.php?module=MarketingDashboard&action=MarketingDashboardAjax&file=crudSelected&exec=AtLeastOneEntity&mktdbtab="+mktdb_selectedtab,
        data: { entities: "'a','c'" },
        context: document.body
      }).done(function(response) {
      	var rsp = $.parseJSON(response);
      	if (rsp.oneselected) {
      		jQuery.ajax({
      	        url: "index.php?module=MarketingDashboard&action=MarketingDashboardAjax&file=crudSelected&exec=AtLeastOneEntity&mktdbtab="+mktdb_selectedtab,
      	        data: { entities: myel },
      	        context: document.body
      	      }).done(function(response) {
      	      	var rsp = $.parseJSON(response);
      	      	if (rsp.oneselected) {
      	    		var form = document.forms['InvoiceLines3'];
      	    		if (!form) return false;
      	    		form.submit();
      	      	} else {
      	      		$.alert(vtmkt_arr.SELECTONEFROM);
      	      	}
      	      });
      	} else {
      		$.alert(vtmkt_arr.SELECTONE);
      	}
      });
    return false;
}

function findfields(fldname, moduleid, rel) {
	from_mod = $("#modulefrom").val();
	$('#load').show();
	$('#load').html('<img src="modules/MarketingDashboard/styles/images/loader.gif"><br><font color="red">' + vtmkt_arr.PLEASEWAIT + '</font>');
	var fieldname = "#" + fldname + "fields";
	$.post('index.php', {
		module : 'MarketingDashboard',
		action : 'MarketingDashboardAjax',
		file : 'findfields',
		ajax : 'true',
		id : moduleid,
		related : rel,
		origin : from_mod,
		async : false
	}, function(result) {
		var a = JSON.parse(result);
		var fieldarray = a['fields'];
		$(fieldname).empty();
		$.each(fieldarray, function(key, value) {
			$(fieldname).append("<option value='" + key + "'>" + value + "</option>");
			$(fieldname).multiselect('refresh');
		});
		if (rel == 1) {
			var modulearray = a['modules'];
			$("#moduleto").empty();
			$.each(modulearray, function(key, value) {
				$("#moduleto").append("<option value='" + key + "'>" + value + "</option>");
				$("#moduleto").multiselect('refresh');
			});
			var relfldarray = a['relatedfields'];
			$("#moduletofields").empty();
			$.each(relfldarray, function(key, value) {
				$("#moduletofields").append("<option value='" + key + "'>" + value + "</option>");
				$("#moduletofields").multiselect('refresh');
			});
		}
		$('#load').hide();
	});
}

function view_template() {
 var selectedtemplate=$("#emailtemplateid").val();
 if(selectedtemplate=="0" || selectedtemplate=="")
   $.alert(vtmkt_arr.NOACTIONSELECTED);
 else {
   window.open("index.php?module=Actions&action=DetailView&record="+selectedtemplate);
 }
}
function view_document(type) {
 var selected_docu=$("#"+type).val();
 if(selected_docu=="0" || selected_docu=="")
   $.alert(vtmkt_arr.NOACTIONSELECTED);
 else {
   window.open("index.php?module=Documents&action=DetailView&record="+selected_docu);
 }
}

function message() {
    var selectedtemplate=$("#emailtemplateid").val();
    var selected_doc=$("#document_id").val();
    var selected_odt_template=$("#gendoctemplate").val();
//    var campaignid=  $("#campaignconvert").val();
//    if (campaignid=='' || campaignid==0){
//    	$.alert(vtmkt_arr.SELECTACPC);
//        return false;
//    } else if(selectedtemplate=='' || selectedtemplate==0){
    if(selectedtemplate=='' || selectedtemplate==0){
      $.alert(vtmkt_arr.SELECTTPL);
      $("#accordion").accordion('activate', 0);
      return false;
    } else
      return true;
}

function task() {
	jQuery.ajax({
        url: "index.php?module=MarketingDashboard&action=MarketingDashboardAjax&file=crudSelected&exec=AtLeastOneEntity&mktdbtab="+mktdb_selectedtab,
        data: { entities: "'a','c','l','m','p'" },
        context: document.body
      }).done(function(response) {
      	var rsp = $.parseJSON(response);
      	if (rsp.oneselected) {
    		var form = document.forms['EditView'];
    		if (!form) return false;
    		form.submit();
      	} else {
      		$.alert(vtmkt_arr.SELECTONENOTASK);
      	}
      });
    return false;
}
