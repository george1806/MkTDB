<?php
/*************************************************************************************************
 * Copyright 2012-2013 OpenCubed  --  This file is a part of vtMktDashboard.
* You can copy, adapt and distribute the work under the "Attribution-NonCommercial-ShareAlike"
* Vizsage Public License (the "License"). You may not use this file except in compliance with the
* License. Roughly speaking, non-commercial users may share and modify this code, but must give credit
* and share improvements. However, for proper details please read the full License, available at
* http://vizsage.com/license/Vizsage-License-BY-NC-SA.html and the handy reference for understanding
* the full license at http://vizsage.com/license/Vizsage-Deed-BY-NC-SA.html. Unless required by
* applicable law or agreed to in writing, any software distributed under the License is distributed
* on an  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and limitations under the
* License terms of Creative Commons Attribution-NonCommercial-ShareAlike 3.0 (the License).
*************************************************************************************************
*  Module       : MarketingDashboard
*  Version      : 1.9
*  Author       : OpenCubed
*************************************************************************************************/

require_once('include/utils/CommonUtils.php');
require_once('data/CRMEntity.php');
include_once("modules/Emails/mail.php");
include_once("modules/MarketingDashboard/sendEmail.php");
require_once('config.inc.php');
require_once('modules/MarketingDashboard/BatchManager.php');

global $app_strings,$default_theme,$default_charset,$root_directory;
global $current_user,$currentModule,$adb,$log,$sendgrid_server;
$mytab=vtlib_purify($_REQUEST['mytab']);

switch ($mytab) {
	case 1:
		$objdate=new DateTimeField($_REQUEST['due_date']);
		$mydate=$objdate->getDBInsertDateValue();
		//if (isset($_REQUEST['title']) and  isset($_REQUEST['due_date']) and isset($_REQUEST['selvisit']) and isset($_REQUEST['selevent']) and isset($_REQUEST['assignto']) and isset($_REQUEST['selstate'])) { 
		 $params = array($_REQUEST['title'],$mydate,$_REQUEST['selvisit'],$_REQUEST['selevent'],$_REQUEST['assignto'],$_REQUEST['due_time'],$_REQUEST['desc_name'],$_REQUEST['selstate'],$_REQUEST['descr'],0,$_REQUEST['emailtemplateid'],'','',$_REQUEST['document_id'],$_REQUEST['gendoctemplate']);
		 $adb->pquery('update entityconverter set title=?,duedate=?,status=?,event=?,assignto=?,duetime=?,description=?,taskstate=?,descrname=?,assigncontact=?,emailtemplate=?,assignaccount=?,relatedmodules=?,document_id=?,gendoctemplate=?',$params);
		//}
		break;
	case 2:
		$objdate=new DateTimeField(NULL);
		$mydate=$objdate->getDBInsertDateValue();
		$params = array(0,$mydate,'','',0,'','','','',$_REQUEST['assignto_contact'],'','','','','');
		$adb->pquery('update entityconverter set title=?,duedate=?,status=?,event=?,assignto=?,duetime=?,description=?,taskstate=?,descrname=?,assigncontact=?,emailtemplate=?,assignaccount=?,relatedmodules=?,document_id=?,gendoctemplate=?',$params);
		break;
	case 3:
		$myaction = $_REQUEST['convertto'];
		$modulefrom = $_REQUEST['modulefrom'];
		$moduleto = $_REQUEST['moduleto'];
		$modulefromfields = $_REQUEST['modulefromfields'];
		$moduletofields = $_REQUEST['moduletofields'];
		$objdate=new DateTimeField(NULL);
		$mydate=$objdate->getDBInsertDateValue();
		$selectedmodules=implode(":::",$_REQUEST['relatedmodules']);
		$params = array(0,$mydate,'','',0,'','','','','','',$_REQUEST['assignto_account'],$selectedmodules,'','');
		$adb->pquery('update entityconverter set title=?,duedate=?,status=?,event=?,assignto=?,duetime=?,description=?,taskstate=?,descrname=?,assigncontact=?,emailtemplate=?,assignaccount=?,relatedmodules=?,document_id=?,gendoctemplate=?',$params);
		break;
}
$params=$adb->query('select * from entityconverter');
$title=$adb->query_result($params,0,'title');
$due_date=$adb->query_result($params,0,'duedate');
$visit=$adb->query_result($params,0,'status');
$event=$adb->query_result($params,0,'event');
$assignto=$adb->query_result($params,0,'assignto');
$due_time=$adb->query_result($params,0,'duetime');
$desc_name=html_entity_decode($adb->query_result($params,0,'description'), ENT_QUOTES, $default_charset);
$taskstate=$adb->query_result($params,0,'taskstate');
$descr=html_entity_decode($adb->query_result($params,0,'descrname'), ENT_QUOTES, $default_charset);
$assigntocontacts=$adb->query_result($params,0,'assigncontact');
$assigntoaccounts=$adb->query_result($params,0,'assignaccount');
$emailtemplates=$adb->query_result($params,0,'emailtemplate');
$relatedmodules=explode(":::",$adb->query_result($params,0,'relatedmodules'));
$documents_id=$adb->query_result($params,0,'document_id');
$gendoctemplates=$adb->query_result($params,0,'gendoctemplate');

// Form variables
$convertto = $_REQUEST['convertto'];
if ($convertto == "po") {
	$convertto = "Potentials";
} elseif ($convertto == "task") {
	$convertto = "Task";
} else {
	$convertto = "Messages";
}
$campaignconvert = $_REQUEST['campaignconvert'];
$selvisit = $_REQUEST['selvisit'];
$contactid = $_REQUEST['contactid'];
$emailtemplateid = $_REQUEST['emailtemplateid'];
$document_id = $_REQUEST['document_id'];
$gendoctemplate = $_REQUEST['gendoctemplate'];
$mailtofield_leads = $_REQUEST['mailtofield_leads'];
$mailtofield_contacts = $_REQUEST['mailtofield_contacts'];
$mailtofield_accounts = $_REQUEST['mailtofield_accounts'];
//

$data = compact('title', 'due_date', 'visit', 'event', 'assignto', 'due_time', 'desc_name', 'taskstate', 'descr',
 'assigntocontacts', 'assigntoaccounts', 'emailtemplates', 'relatedmodules', 'convertto', 'campaignconvert',
 'selvisit', 'contactid', 'emailtemplateid','document_id','gendoctemplate','myaction','modulefrom','moduleto',
 'modulefromfields','moduletofields','mailtofield_leads','mailtofield_contacts','mailtofield_accounts');

$BatchManager = BatchManager::getInstance();

switch ($mytab) {
	case 1:
	  $BatchManager->addJob('CampaignBatchJob', $data);
		break;
	case 2:
	  $BatchManager->addJob('CreateContactsBatchJob', $data);
		break;
	case 3:
	  $BatchManager->addJob('AssignmentBatchJob', $data);
		break;
}
?>
<script>
location.href = "index.php?module=MarketingDashboard&action=index&mytab=4";
</script>

