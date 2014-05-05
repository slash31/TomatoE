<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.0//EN'>
<!--
	Tomato GUI
	Copyright (C) 2006-2010 Jonathan Zarate
	http://www.polarcloud.com/tomato/

	For use with Tomato Firmware only.
	No part of this file may be used without permission.

	Created for tcpdump by Aaron Finney 2013

-->
<html>
<head>
<meta http-equiv='content-type' content='text/html;charset=utf-8'>
<meta name='robots' content='noindex,nofollow'>
<title>[<% ident(); %>] Tools: tcpdump</title>
<link rel='stylesheet' type='text/css' href='tomato.css'>
<% css(); %>
<script type='text/javascript' src='tomato.js'></script>
<script type='text/javascript' src='interfaces.js'></script>

<!-- / / / -->

<script type='text/javascript' src='debug.js'></script>

<script type='text/javascript'>
// <% nvram("lan_ifname,lan1_ifname,lan2_ifname,lan3_ifname,wan_ifname,tcpdump_on,tcpdump_file,tcpdump_int,tcpdump_dir,tcpdump_flval,tcpdump_fltype,tcpdump_numf,tcpdump_loghost"); %>


function verifyFields(focused, quiet)
{
	var flval = E('_tcpdump_flval');
	flval.value = (parseInt(flval.value) > 0) ?flval.value : '0'; 
	if (flval.value == '0')
	{
		E('_tcpdump_numf').disabled=1;
	} else {
		E('_tcpdump_numf').disabled = 0;
	} 
}

function save()
{
	var fom = E('_fom');

	if (nvram.tcpdump_on==0)
	{
		fom.tcpdump_on.value = 1;
	} else {
		fom.tcpdump_on.value = 0;
	}

	form.submit(fom, 1);
}

function submit_complete()
{
	reloadPage();
}


</script>
</head>
<body>
<form id='_fom' method='post' action='../tomato.cgi'>
<table id='container' cellspacing=0>
<tr><td colspan=2 id='header'>
	<div class='title'>Tomato</div>
	<div class='version'>Version <% version(); %></div>
</td></tr>
<tr id='body'><td id='navi'><script type='text/javascript'>navi()</script></td>
<td id='content'>
<div id='ident'><% ident(); %></div>

<!-- / / / -->

<input type='hidden' name='_nextpage' value='tools-tcpdump.asp'>
<input type='hidden' name='tcpdump_on'>
<input type='hidden' name='_service' value='tcpdump-restart'>

<div class='section-title'>Tcpdump (Wireshark Capture)</div>
<div class="section">

<script type='text/javascript'>
	var intopts = [['any','All Traffic']];
	var t = MAX_BRIDGE_ID;
	for(var j = 0; j <= t; j++) {
		var i = (j == 0) ? '' : j.toString();
		if ( (nvram['lan' + i + '_ifname'].length > 0) ) {
			intopts.push([nvram['lan' + i + '_ifname'],'LAN ' + j]);
		}
	}
	if ( (nvram['wan_ifname'].length > 0) ) {
		intopts.push([nvram['wan_ifname'],'WAN ']);
	}

	createFieldTable('', [
		{ title: 'Capture File', name: 'tcpdump_file', type: 'text', maxlength: 80, size: 50, value: nvram.tcpdump_file || '' },
		{ title: 'Interface', name: 'tcpdump_int', type: 'select', options:  intopts , value: nvram.tcpdump_int || 'any' },
		{ title: 'Traffic Direction', name: 'tcpdump_dir', type: 'select', options: [['inout','Both'],['in','Inbound Only'],['out','Outbound Only']], value: nvram.tcpdump_dir || 'inout' },
		{ title: 'Limit files to:', multi: [{ name: 'tcpdump_flval', type: 'text', maxlength: 5, size: 5, value: nvram.tcpdump_flval || 0 }, 
			{ name: 'tcpdump_fltype', type: 'select', options: [['m','MB'],['s','Seconds']], suffix: '<em>&nbsp; &nbsp; Enter 1-60000, or 0 for unlimited capture file size</em>', value: nvram.tcpdump_fltype || 'm'} ] },
		{ title: 'Max Number of Files:', name: 'tcpdump_numf', type: 'text', maxlength: 3, size: 5, suffix: '<em>&nbsp;&nbsp;Enter 0-99 for the number of capture files (enables rotation), or 0 for unlimited</em>', value: nvram.tcpdump_numf || '0' },
		{ title: 'Log Host IP', name: 'tcpdump_loghost', suffix: '<em>&nbsp;&nbsp;Don\'t log packets to this IP address</em>',type: 'text', maxlength: 15, size: 20, value: nvram.tcpdump_loghost || '' },
	] );
</script>

<BR><BR><BR><BR>
<script type='text/javascript'>
	var btnlabel = 'Start Capturing';
	if (nvram.tcpdump_on == 1) btnlabel = 'Stop Capturing';
	W('<div class=\'section\' align=\'center\'><input type=\'button\' value=\'' + btnlabel + '\'  id=\'action-button\' onclick=\'save()\' style=\'width:300px; height:60px; font-size:14px;\'>');
</script>
</div>
</div>

<!-- / / / -->

</td></tr>
<tr><td id='footer' colspan=2>
	<span id='footer-msg'></span>
</td></tr>
</table>
</form>
<script type='text/javascript'>verifyFields(null, 1);</script>
</body>
</html>

