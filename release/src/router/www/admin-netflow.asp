<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.0//EN'>
<!--
	Tomato GUI
	Copyright (C) 2007-2011 Shibby
	http://openlinksys.info
	For use with Tomato Firmware only.
	No part of this file may be used without permission.

	Adapted for NetFlow Configuration by Aaron Finney 2013.
-->
<html>
<head>
<meta http-equiv='content-type' content='text/html;charset=utf-8'>
<meta name='robots' content='noindex,nofollow'>
<title>[<% ident(); %>] Admin: NetFlow</title>
<link rel='stylesheet' type='text/css' href='tomato.css'>
<link rel='stylesheet' type='text/css' href='color.css'>
<script type='text/javascript' src='tomato.js'></script>
<style type='text/css'>
textarea {
 width: 98%;
 height: 15em;
}
</style>
<script type='text/javascript'>
//	<% nvram("nflow_enable,nflow_ver,nflow_dst,nflow_saddr,nflow_args"); %>

function verifyFields(focused, quiet)
{
	var ok = 1;

	var a = E('_f_nflow_enable').checked;

	E('_nflow_ver').disabled = !a;
	E('_nflow_dst').disabled = !a;
	E('_nflow_saddr').disabled = !a;
	E('_nflow_args').disabled = !a;

	return ok;
}

function save()
{
  if (verifyFields(null, 0)==0) return;
  var fom = E('_fom');
  fom.nflow_enable.value = E('_f_nflow_enable').checked ? 1 : 0;

  if (fom.nflow_enable.value == 0) {
  	fom._service.value = 'netflow-stop';
  }
  else {
  	fom._service.value = 'netflow-restart,firewall-restart'; 
  }
  form.submit('_fom', 1);
}

function init()
{
}
</script>
</head>

<body onLoad="init()">
<table id='container' cellspacing=0>
<tr><td colspan=2 id='header'>
<div class='title'>Tomato</div>
<div class='version'>Version <% version(); %></div>
</td></tr>
<tr id='body'><td id='navi'><script type='text/javascript'>navi()</script></td>
<td id='content'>
<div id='ident'><% ident(); %></div>
<div class='section-title'>NetFlow Settings</div>
<div class='section' id='config-section'>
<form id='_fom' method='post' action='../tomato.cgi'>
<input type='hidden' name='_nextpage' value='admin-netflow.asp'>
<input type='hidden' name='_service' value='netflow-restart,firewall-restart'>
<input type='hidden' name='nflow_enable'>


<script type='text/javascript'>
createFieldTable('', [
	{ title: 'Enable NetFlow', name: 'f_nflow_enable', type: 'checkbox', value: nvram.nflow_enable != 0},
	{ title: 'Version', name: 'nflow_ver', type: 'select', options: [['5','5'],['7','7']], value: nvram.nflow_ver || '5'},
	null,
	{ title: 'Netflow Collector', name: 'nflow_dst', type: 'text', maxlen: 512, size: 64, value: nvram.nflow_dst || '',
			suffix: '<br><small>(format: "[IP address]:[port]")</small>' },
	{ title: 'Netflow Source Address', name: 'nflow_saddr', type: 'text', maxlen: 512, size: 64, value: nvram.nflow_saddr || '',
			suffix: '<br><small>(format: "[IP address]")</small>' },
	{ title: 'Extra Args', name: 'nflow_args', type: 'text', maxlen: 512, size: 64, value: nvram.nflow_args || '', suffix: '<br><small>(passed directly to fprobe-ulog)</small>' }
]);
</script>
</div>
</form>
</div>
</td></tr>
<tr><td id='footer' colspan=2>
 <form>
 <span id='footer-msg'></span>
 <input type='button' value='Save' id='save-button' onclick='save()'>
 <input type='button' value='Cancel' id='cancel-button' onclick='javascript:reloadPage();'>
 </form>
</div>
</td></tr>
</table>
<script type='text/javascript'>verifyFields(null, 1);</script>
</body>
</html>
