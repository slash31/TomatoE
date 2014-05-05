<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Strict//EN'
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--
Tomato GUI
Copyright (C) 2006-2010 Jonathan Zarate
http://www.polarcloud.com/tomato/
For use with Tomato Firmware only.
No part of this file may be used without permission.
-->

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta name="generator" content=
  "HTML Tidy for Linux/x86 (vers 25 March 2009), see www.w3.org" />
  <meta http-equiv='content-type' content='text/html; charset=us-ascii' />
  <meta name='robots' content='noindex,nofollow' />

  <title>[<% ident(); %>] Advanced: Routing</title>
  <link rel='stylesheet' type='text/css' href='tomato.css' /><% css(); %>

  <script type='text/javascript' src='tomato.js'></script>
  <script type='text/javascript' src='interfaces.js'></script>


/* RIP-BEGIN */
  <script type='text/javascript'>
    W('<style type=\'text\/css\'> \
      #ripint-grid .co1, \
      #ripint-grid .co2, \
      #ripint-grid .co3, \
      #ripint-grid .co4, \
      #ripint-grid .co5, \
      #ripint-grid .co6, \
      #ripint-grid .co7, \
      #ripint-grid .co8, \
      #ripint-grid .co9, \
      #ripint-grid .co10 { text-align: center; } \
      #ripint-grid .centered { text-align: center; } \
      #riprd-grid .co1, #ripfrd-grid .co4 { width: 35%; } \
      #riprd-grid .co2, #ripfrd-grid .co3 { width: 15%; } \
      #drr_dlist_cfg, #drr_addl_cfg { \
        font: 12px monospace; \
        width: 99%; \
        height: 150px; \
        overflow: scroll; \
        border: 1px solid #eee; \
        border-top: none; \
      } \
    <\/style>');
  </script>
/* RIP-END */


/* OSPF-BEGIN */
  <script type='text/javascript'>
    W('<style type=\'text\/css\'> \
      #ospfint-grid .co1, \
      #ospfint-grid .co2, \
      #ospfint-grid .co3, \
      #ospfint-grid .co4, \
      #ospfint-grid .co5, \
      #ospfint-grid .co6, \
      #ospfint-grid .co7, \
      #ospfint-grid .co8, \
      #ospfint-grid .co9, \
      #ospfint-grid .co10 { text-align: center; } \
      #ospfint-grid .centered { text-align: center; } \
      #ospfrd-grid .co1, #ospfrd-grid .co5 { width: 25%; } \
      #ospfrd-grid .co2, #ospfrd-grid .co3, #ospfrd-grid .co4 { width: 15%; } \
      #dro_ar_cfg, #dro_addl_cfg { \
        font: 12px monospace; \
        width: 99%; \
        height: 125px; \
        overflow: scroll; \
        border: 1px solid #eee; \
        border-top: none; \
      } \
    <\/style>');
  </script>
/* OSPF-END */

  <style type='text/css'>
    #ara-grid .co1, #ara-grid .co2, #ara-grid .co3 {
      width: 20%;
    }
    #ara-grid .co4 {
      width: 6%;
    }
    #ara-grid .co5 {
      width: 34%;
    }
    #ars-grid .co1, #ars-grid .co2, #ars-grid .co3  {
      width: 20%;
    }
    #ars-grid .co4 {
      width: 6%;
    }
    #ars-grid .co5 {
      width: 10%;
    }
    #ars-grid .co6 {
      width: 24%;
    }
  </style>

  <script type='text/javascript'>
    //<![CDATA[
            //      <% nvram("wk_mode,routes_static,dhcp_routes,lan_ifname,lan1_ifname,lan2_ifname,lan3_ifname,wan_ifname,emf_enable,drr_enable,drr_pwd,drr_rdst_c,drr_rdst_c_mt,drr_rdst_c_map,drr_rdst_k,drr_rdst_k_mt,drr_rdst_k_map,drr_rdst_o,drr_rdst_o_mt,drr_rdst_o_map,drr_rdst_d,drr_rdst_d_mt,drr_rdst_d_map,drr_tmr_ud,drr_tmr_to,drr_tmr_gb,drr_lan,drr_lan_psv,drr_lan_shz,drr_lan_pwd,drr_lan_md5,drr_lan_txv,drr_lan_rxv,drr_lan1,drr_lan1_psv,drr_lan1_shz,drr_lan1_pwd,drr_lan1_md5,drr_lan1_txv,drr_lan1_rxv,drr_lan2,drr_lan2_psv,drr_lan2_shz,drr_lan2_pwd,drr_lan2_md5,drr_lan2_txv,drr_lan2_rxv,drr_lan3,drr_lan3_psv,drr_lan3_shz,drr_lan3_pwd,drr_lan3_md5,drr_lan3_txv,drr_lan3_rxv,drr_wan,drr_wan_psv,drr_wan_shz,drr_wan_pwd,drr_wan_md5,drr_wan_txv,drr_wan_rxv,drr_dlist_cfg,drr_addl_cfg,dro_enable,dro_id,dro_pwd,dro_abr_type,dro_rdst_c,dro_rdst_c_mtype,dro_rdst_c_mt,dro_rdst_c_map,dro_rdst_k,dro_rdst_k_mtype,dro_rdst_k_mt,dro_rdst_k_map,dro_rdst_r,dro_rdst_r_mtype,dro_rdst_r_mt,dro_rdst_r_map,dro_rdst_d,dro_rdst_d_mtype,dro_rdst_d_mt,dro_rdst_d_map,dro_spf_del,dro_spf_hold,dro_spf_mhold,dro_rfc1583,dro_ac_bw,dro_lan,dro_lan_psv,dro_lan_ar,dro_lan_mt,dro_lan_pwd,dro_lan_md5,dro_lan_pr,dro_lan_hl,dro_lan_rt,dro_lan_dt,dro_lan1,dro_lan1_psv,dro_lan1_ar,dro_lan1_mt,dro_lan1_pwd,dro_lan1_md5,dro_lan1_pr,dro_lan1_hl,dro_lan1_rt,dro_lan1_dt,dro_lan2,dro_lan2_psv,dro_lan2_ar,dro_lan2_mt,dro_lan2_pwd,dro_lan2_md5,dro_lan2_pr,dro_lan2_hl,dro_lan2_rt,dro_lan2_dt,dro_lan3,dro_lan3_psv,dro_lan3_ar,dro_lan3_mt,dro_lan3_pwd,dro_lan3_md5,dro_lan3_pr,dro_lan3_hl,dro_lan3_rt,dro_lan3_dt,dro_wan,dro_wan_psv,dro_wan_ar,dro_wan_mt,dro_wan_pwd,dro_wan_md5,dro_wan_pr,dro_wan_hl,dro_wan_rt,dro_wan_dt,dro_ar_cfg,dro_addl_cfg"); %>

    tabs = [['rt-general','General']];
/* RIP-BEGIN */
    tabs.push(['rt-rip', 'RIP']);
/* RIP-END */
/* OSPF-BEGIN */
    tabs.push(['rt-ospf','OSPF']);
/* OSPF-END */

    function tabSelect(name)
    {
      cookie.set('routing_tab', name)
      tabHigh(name);
      for (var i = 0; i < tabs.length; ++i) {
        var on = (name == tabs[i][0]);
        elem.display(tabs[i][0] + '-cnt', on);
      }
      if (i >= tabs.length) return;
    }

/* RIP-BEGIN */
    var rrd = new TomatoGrid();
    rrd.setup = function() {
      this.init('riprd-grid', '', '', [
      { type: 'text'},
      { type: 'checkbox', prefix: '<div class="centered">', suffix: '</div>' },
      { type: 'text', maxlen: 20, size: 15, prefix: '<div class="centered">', suffix: '</div>' },
      { type: 'text', maxlen: 6, size: 10, prefix: '<div class="centered">', suffix: '</div>' }]);
      this.headerSet(['Route Type', 'Redistribute', 'Metric','Route Map']);
      this.insertData(-1, ['Connected Networks',nvram.drr_rdst_c || 0, nvram.drr_rdst_c_mt || '0', nvram.drr_rdst_c_map]);
      this.insertData(-1, ['Static Routes (kernel)',nvram.drr_rdst_k || 0, nvram.drr_rdst_k_mt || '0', nvram.drr_rdst_k_map]);

/* OSPF-BEGIN */
      this.insertData(-1, ['OSPF',nvram.drr_rdst_o || 0,nvram.drr_rdst_o_mt || '0', nvram.drr_rdst_o_map]);
/* OSPF-END */
      this.insertData(-1, ['Default',nvram.drr_rdst_d || 0,nvram.drr_rdst_d_mt || '0', nvram.drr_rdst_d_map]);
      rrd.canDelete=false;
      rrd.disableEditorDelete=true;
      elem.removeClass(rrd.header.cells[rrd.sortColumn], 'sortasc', 'sortdes');
      rrd.disableNewEditor();
    }
    rrd.dataToView = function(data)
    {
      return[data[0],
            (data[1].toString() == '1') ? 'Yes' : 'No',
            data[2],
            data[3]];
    }

    rrd.dataToFieldValues = function(data)
    {
      return[data[0],
            (data[1] != 0) ? 'checked' : '',
            data[2].toString(),
            data[3].toString()];
    }

    rrd.fieldValuesToData = function(row)
    {
      var f = fields.getAll(row);
      return [f[0].value,
      f[1].checked ? 1 : 0,
      f[2].value,
      f[3].value ];
    }

    rrd.onCancel = function()
    {
      this.removeEditor();
      this.showSource();
      this.disableNewEditor(false);
      this.resetNewEditor();
    }

    rrd.onOK = function()
    {
      var i, data, view;

      if (!this.verifyFields(this.editor, false)) return;

      data = this.fieldValuesToData(this.editor);
      view = this.dataToView(data);

      this.source.setRowData(data);
      for (i = 0; i < this.source.cells.length; ++i) {
        this.source.cells[i].innerHTML = view[i];
      }

      this.removeEditor();
      this.showSource();
      this.disableNewEditor(false);

      this.resort();
      this.resetNewEditor();
    }

    rrd.verifyFields = function(row, quiet)
    {
      var ok=1;
      var f;

      f = fields.getAll(row);
      f[0].disabled=1;

      return ok;
    }

    var ri = new TomatoGrid();
    ri.setup = function()
    {
      this.init('ripint-grid', '', 4, [
      { type: 'select', options: [['0','lan'],['1','lan1'],['2','lan2'],['3','lan3'],['w','wan']], prefix: '<div class="centered">', suffix: '</div>' },
      { type: 'checkbox', prefix: '<div class="centered">', suffix: '</div>' },
      { type: 'checkbox', prefix: '<div class="centered">', suffix: '</div>' },
      { type: 'text', maxlen: 16, size: 12 },
      { type: 'checkbox', prefix: '<div class="centered">', suffix: '</div>' },
      { type: 'select', options: [['1','v1'],['2','v2'],['1 2','Both']], prefix: '<div class="centered">', suffix: '</div>' },
      { type: 'select', options: [['1','v1'],['2','v2'],['1 2','Both']], prefix: '<div class="centered">', suffix: '</div>' }] );
      this.headerSet(['Interface', 'Passive', 'Split Horizon', 'Pwd/key','MD5','Send Ver.','Receive Ver.']);

      var numBridges = 0;
      for (var i = 0 ; i <= MAX_BRIDGE_ID ; i++) {
        var j = (i == 0) ? '' : i.toString();
        if (nvram['drr_lan' + j] == 1) {
          ri.insertData(-1, [
            i.toString(),
            nvram['drr_lan' + j + '_psv'],
            nvram['drr_lan' + j + '_shz'],
            nvram['drr_lan' + j + '_pwd'],
            nvram['drr_lan' + j + '_md5'],
            nvram['drr_lan' + j + '_txv'],
            nvram['drr_lan' + j + '_rxv'],
          ] ) ;
          numBridges++;
        }
      }
      if (nvram['drr_wan'] == 1) {
        ri.insertData(-1, [
          'w',
          nvram['drr_wan_psv'],
          nvram['drr_wan_ar'],
          nvram['drr_wan_mt'],
          nvram['drr_wan_pwd'],
          nvram['drr_wan_md5'],
          nvram['drr_wan_pr'],
          nvram['drr_wan_hl'],
          nvram['drr_wan_rt'],
          nvram['drr_wan_dt'],
        ] ) ;
      }
      ri.canDelete = false;
      ri.sort(0);
      elem.removeClass(ri.header.cells[ri.sortColumn], 'sortasc', 'sortdes');
      ri.showNewEditor();
      ri.resetNewEditor();
    }

    ri.dataToView = function(data)
    {
      var ifdsp='';
      var sv,rv = '';
      if (data[0] == 'w') {
        ifdsp='wan';
      } else {
        ifdsp=(data[0] == '0') ? 'lan' : 'lan' + data[0];
      }
      if (data[5].toString() == '1') {
        sv = '<small><i>v1 only</i></small>'
      } else if (data[5].toString() == '2') {
        sv = '<small><i>v2 only</i></small>'
      } else {
        sv = '<small><i>both</i></small>'
      }
      if (data[6].toString() == '1') {
        rv = '<small><i>v1 only</i></small>'
      } else if (data[6].toString() == '2') {
        rv = '<small><i>v2 only</i></small>'
      } else {
        rv = '<small><i>both</i></small>'
      }
      return [ifdsp,
        (data[1].toString() == '1') ? '<small><i>Yes</i></small>' : '<small><i>No</i></small>',
        (data[2].toString() == '1') ? '<small><i>Yes</i></small>' : '<small><i>No</i></small>',
        data[3],
        (data[4].toString() == '1') ? '<small><i>Yes</i></small>' : '<small><i>No</i></small>',
        sv, 
        rv
      ];
    }

    ri.dataToFieldValues = function (data)
    {
        return [data[0],
        (data[1] != 0) ? 'checked' : '',
        (data[2] != 0) ? 'checked' : '',
        data[3].toString(),
        (data[4].toString() == '1') ? 'checked' : '',
        data[5].toString(),
        data[6].toString()
        ];
    }

    ri.fieldValuesToData = function(row)
    {
      var f = fields.getAll(row);
      return [f[0].value,
      f[1].checked ? 1 : 0,
      f[2].checked ? 1 : 0,
      f[3].value,
      f[4].checked ? 1 : 0,
      f[5].value,
      f[6].value ];
    }

    ri.resetNewEditor = function()
    {
      var f = fields.getAll(this.newEditor);
      f[0].selectedIndex=0;
      var t = MAX_BRIDGE_ID;
      f[0].options.length = 0;
      for(var j = 0; j <= t; j++) {
        var i = (j == 0) ? '' : j.toString();
        if ( (nvram['lan' + i + '_ifname'].length > 0) && (this.countBridge(j) == 0) ) {
          var option = new Option('lan' + j,j);
          f[0].add(option);
        }
      }
      if ( (nvram['wan_ifname'].length > 0) && (this.countBridge('w') == 0) ) {
        var option = new Option('wan','w');
        f[0].add(option);
      }
      if (f[0].options.length > 0) {
        f[1].checked = 0;
        f[2].checked = 1;
        f[3].value = '';
        f[4].checked = 0;
        f[5].value = '2';
        f[6].value = '2';
      } else {
        f[1].checked = 0;
        f[2].checked = 0;
        f[3].value = '';
        f[4].checked = 0;
        f[5].value = '';
        f[6].value = '';
        this.disableNewEditor(true);
      }
      ferror.clearAll(fields.getAll(this.newEditor));
    }

    ri.onCancel = function()
    {
      this.removeEditor();
      this.showSource();
      this.disableNewEditor(false);
      this.resetNewEditor();
    }

    ri.onOK = function()
    {
      var i, data, view;

      if (!this.verifyFields(this.editor, false)) return;

      data = this.fieldValuesToData(this.editor);
      view = this.dataToView(data);

      this.source.setRowData(data);
      for (i = 0; i < this.source.cells.length; ++i) {
        this.source.cells[i].innerHTML = view[i];
      }

      this.removeEditor();
      this.showSource();
      this.disableNewEditor(false);

      this.resort();
      this.resetNewEditor();
    }

    ri.onAdd = function()
    {
      var data;

      this.moving = null;
      this.rpHide();

      if (!this.verifyFields(this.newEditor, false)) return;

      data = this.fieldValuesToData(this.newEditor);
      this.insertData(-1, data);

      this.disableNewEditor(false);
      this.resetNewEditor();

      this.resort();
    }

    ri.onDelete = function()
    {
      this.removeEditor();
      elem.remove(this.source);
      this.source = null;
      this.disableNewEditor(false);

      this.resetNewEditor();
    }

    ri.countElem = function(f, v)
    {
      var data = this.getAllData();
      var total = 0;
      for (var i = 0; i < data.length; ++i) {
        total += (data[i][f] == v) ? 1 : 0;
      }
      return total;
    }

    ri.countBridge = function (v) {
      return this.countElem(0,v);
    }

    ri.verifyFields = function(row, quiet)
    {
      var ok=1;
      var f;
      f = fields.getAll(row);
      var s = f[0].value;
      var t = MAX_BRIDGE_ID;
      f[0].options.length = 0;
      for(var j = 0; j <= t; j++) {
        var i = (j == 0) ? '' : j.toString();
        if (nvram['lan' + i + '_ifname'].length > 0) {
          var option = new Option('lan' + j,j);
          f[0].add(option);
        }
      }
      if (nvram['wan_ifname'].length > 0) {
        var option = new Option('wan','w');
        f[0].add(option);
      }
      for(var j=0; j<= f[0].options.length - 1 ; j++) {
        var i = f[0].options[j].value;
        f[0].options[j].disabled = (this.countBridge(i) > 0);
        if (f[0].options[j].value == s) f[0].selectedIndex = j;
      }
      if(this.countBridge(f[0].value) > 0) {
        ferror.set(f[0], 'Cannot add another entry for this interface', quiet);
        ok = 0;
      } else {
        ferror.clear(f[0]);
      }

        if (f[2].value == '') {
          ferror.set(f[2], 'You must enter a value for the Area parameter.', quiet);
          ok = 0;
        } else {
          ferror.clear(f[2]);
        }

      return ok;

    }

/* RIP-END */



/* OSPF-BEGIN */
    var ord = new TomatoGrid();
    ord.setup = function() {
      this.init('ospfrd-grid', '', '', [
      { type: 'text'},
      { type: 'checkbox', prefix: '<div class="centered">', suffix: '</div>' },
      { type: 'select', options: [[1, 'E1'],[2, 'E2']], prefix: '<div class="centered">', suffix: '</div>' },
      { type: 'text', maxlen: 20, size: 15, prefix: '<div class="centered">', suffix: '</div>' },
      { type: 'text', maxlen: 6, size: 10, prefix: '<div class="centered">', suffix: '</div>' }]);
      this.headerSet(['Route Type', 'Redistribute', 'Metric Type', 'Metric','Route Map']);
      this.insertData(-1, ['Connected Networks',nvram.dro_rdst_c || 0,nvram.dro_rdst_c_mtype || 2,nvram.dro_rdst_c_mt || '0', nvram.dro_rdst_c_map]);
      this.insertData(-1, ['Static Routes (kernel)',nvram.dro_rdst_k || 0,nvram.dro_rdst_k_mtype || 2,nvram.dro_rdst_k_mt || '0', nvram.dro_rdst_k_map]);

/* RIP-BEGIN */
      this.insertData(-1, ['RIP',nvram.dro_rdst_r || 0,nvram.dro_rdst_r_mtype || 2,nvram.dro_rdst_r_mt || '0', nvram.dro_rdst_r_map]);
/* RIP-END */
      this.insertData(-1, ['Default',nvram.dro_rdst_d || 0,nvram.dro_rdst_d_mtype || 2,nvram.dro_rdst_d_mt || '0', nvram.dro_rdst_d_map]);
      ord.canDelete=false;
      ord.disableEditorDelete=true;
      elem.removeClass(ord.header.cells[ord.sortColumn], 'sortasc', 'sortdes');
      ord.disableNewEditor();
    }

    ord.dataToView = function(data)
    {
      return[data[0],
            (data[1].toString() == '1') ? 'Yes' : 'No',
            (data[2].toString() == '1') ? 'E1' : 'E2',
            data[3],
            data[4]];
    }

    ord.dataToFieldValues = function(data)
    {
      return[data[0],
            (data[1] != 0) ? 'checked' : '',
            data[2].toString(),
            data[3].toString(),
            data[4].toString()];
    }

    ord.fieldValuesToData = function(row)
    {
      var f = fields.getAll(row);
      return [f[0].value,
      f[1].checked ? 1 : 0,
      f[2].value,
      f[3].value,
      f[4].value ];
    }

    ord.onCancel = function()
    {
      this.removeEditor();
      this.showSource();
      this.disableNewEditor(false);
      this.resetNewEditor();
    }

    ord.onOK = function()
    {
      var i, data, view;

      if (!this.verifyFields(this.editor, false)) return;

      data = this.fieldValuesToData(this.editor);
      view = this.dataToView(data);

      this.source.setRowData(data);
      for (i = 0; i < this.source.cells.length; ++i) {
        this.source.cells[i].innerHTML = view[i];
      }

      this.removeEditor();
      this.showSource();
      this.disableNewEditor(false);

      this.resort();
      this.resetNewEditor();
    }

    ord.verifyFields = function(row, quiet)
    {
      var ok=1;
      var f;

      f = fields.getAll(row);
      f[0].disabled=1;

      return ok;
    }

    var oi = new TomatoGrid();
    oi.setup = function()
    {
      this.init('ospfint-grid', '', 4, [
      { type: 'select', options: [['0','lan'],['1','lan1'],['2','lan2'],['3','lan3'],['w','wan']], prefix: '<div class="centered">', suffix: '</div>' },
      { type: 'checkbox', prefix: '<div class="centered">', suffix: '</div>' },
      { type: 'text', maxlen: 12, size: 12 },
      { type: 'text', maxlen: 6, size: 5 },
      { type: 'text', maxlen: 32, size: 12 },
      { type: 'checkbox', prefix: '<div class="centered">', suffix: '</div>' },
      { type: 'text', maxlen: 3, size: 3 },
      { type: 'text', maxlen: 6, size: 4 },
      { type: 'text', maxlen: 6, size: 4 },
      { type: 'text', maxlen: 6, size: 4 }] );
      this.headerSet(['Interface', 'Passive', 'Area', 'Metric', 'Pwd/key','MD5','Priority','Hello Int','Retr. Int', 'Dead Timer']);

      var numBridges = 0;
      for (var i = 0 ; i <= MAX_BRIDGE_ID ; i++) {
        var j = (i == 0) ? '' : i.toString();
        if (nvram['dro_lan' + j] == 1) {
          oi.insertData(-1, [
            i.toString(),
            nvram['dro_lan' + j + '_psv'],
            nvram['dro_lan' + j + '_ar'],
            nvram['dro_lan' + j + '_mt'],
            nvram['dro_lan' + j + '_pwd'],
            nvram['dro_lan' + j + '_md5'],
            nvram['dro_lan' + j + '_pr'],
            nvram['dro_lan' + j + '_hl'],
            nvram['dro_lan' + j + '_rt'],
            nvram['dro_lan' + j + '_dt'],
          ] ) ;
          numBridges++;
        }
      }
      if (nvram['dro_wan'] == 1) {
        oi.insertData(-1, [
          'w',
          nvram['dro_wan_psv'],
          nvram['dro_wan_ar'],
          nvram['dro_wan_mt'],
          nvram['dro_wan_pwd'],
          nvram['dro_wan_md5'],
          nvram['dro_wan_pr'],
          nvram['dro_wan_hl'],
          nvram['dro_wan_rt'],
          nvram['dro_wan_dt'],
        ] ) ;
      }
      oi.canDelete = false;
      oi.sort(0);
      elem.removeClass(oi.header.cells[oi.sortColumn], 'sortasc', 'sortdes');
      oi.showNewEditor();
      oi.resetNewEditor();
    }

    oi.dataToView = function(data)
    {
    var ifdsp='';
        if (data[0] == 'w') {
          ifdsp='wan';
        } else {
          ifdsp=(data[0] == '0') ? 'lan' : 'lan' + data[0];
        }
        return [ifdsp,
          (data[1].toString() == '1') ? '<small><i>Yes</i></small>' : '<small><i>No</i></small>',
          data[2],
          data[3],
          data[4],
          (data[5].toString() == '1') ? '<small><i>Yes</i></small>' : '<small><i>No</i></small>',
          data[6],
          data[7],
          data[8],
          data[9],
        ];
    }

    oi.dataToFieldValues = function (data)
    {
        return [data[0],
        (data[1] != 0) ? 'checked' : '',
        data[2].toString(),
        data[3].toString(),
        data[4].toString(),
        (data[5].toString() == '1') ? 'checked' : '',
        data[6].toString(),
        data[7].toString(),
        data[8].toString(),
        data[9].toString() ];
    }

    oi.fieldValuesToData = function(row)
    {
      var f = fields.getAll(row);
      return [f[0].value,
      f[1].checked ? 1 : 0,
      f[2].value,
      f[3].value,
      f[4].value,
      f[5].checked ? 1 : 0,
      f[6].value,
      f[7].value,
      f[8].value,
      f[9].value ];
    }

    oi.resetNewEditor = function()
    {
      var f = fields.getAll(this.newEditor);
      f[0].selectedIndex=0;
      var t = MAX_BRIDGE_ID;
      f[0].options.length = 0;
      for(var j = 0; j <= t; j++) {
        var i = (j == 0) ? '' : j.toString();
        if ( (nvram['lan' + i + '_ifname'].length > 0) && (this.countBridge(j) == 0) ) {
          var option = new Option('lan' + j,j);
          f[0].add(option);
        }
      }
      if ( (nvram['wan_ifname'].length > 0) && (this.countBridge('w') == 0) ) {
        var option = new Option('wan','w');
        f[0].add(option);
      }
      if (f[0].options.length > 0) {
        f[1].checked = 0;
        f[2].value = '';
        f[3].value = '100';
        f[4].value = '';
        f[5].checked = 0;
        f[6].value = '1';
        f[7].value = '10';
        f[8].value = '5';
        f[9].value = '30';
      } else {
        f[1].checked = 0;
        f[2].value = '';
        f[3].value = '';
        f[4].value = '';
        f[5].checked = 0;
        f[6].value = '';
        f[7].value = '';
        f[8].value = '';
        f[9].value = '';
        this.disableNewEditor(true);
      }
      ferror.clearAll(fields.getAll(this.newEditor));
    }

    oi.onCancel = function()
    {
      this.removeEditor();
      this.showSource();
      this.disableNewEditor(false);
      this.resetNewEditor();
    }

    oi.onOK = function()
    {
      var i, data, view;

      if (!this.verifyFields(this.editor, false)) return;

      data = this.fieldValuesToData(this.editor);
      view = this.dataToView(data);

      this.source.setRowData(data);
      for (i = 0; i < this.source.cells.length; ++i) {
        this.source.cells[i].innerHTML = view[i];
      }

      this.removeEditor();
      this.showSource();
      this.disableNewEditor(false);

      this.resort();
      this.resetNewEditor();
    }

    oi.onAdd = function()
    {
      var data;

      this.moving = null;
      this.rpHide();

      if (!this.verifyFields(this.newEditor, false)) return;

      data = this.fieldValuesToData(this.newEditor);
      this.insertData(-1, data);

      this.disableNewEditor(false);
      this.resetNewEditor();

      this.resort();
    }

    oi.onDelete = function()
    {
      this.removeEditor();
      elem.remove(this.source);
      this.source = null;
      this.disableNewEditor(false);

      this.resetNewEditor();
    }

    oi.countElem = function(f, v)
    {
      var data = this.getAllData();
      var total = 0;
      for (var i = 0; i < data.length; ++i) {
        total += (data[i][f] == v) ? 1 : 0;
      }
      return total;
    }

    oi.countBridge = function (v) {
      return this.countElem(0,v);
    }

    oi.verifyFields = function(row, quiet)
    {
      var ok=1;
      var f;
      f = fields.getAll(row);
      var s = f[0].value;
      var t = MAX_BRIDGE_ID;
      f[0].options.length = 0;
      for(var j = 0; j <= t; j++) {
        var i = (j == 0) ? '' : j.toString();
        if (nvram['lan' + i + '_ifname'].length > 0) {
          var option = new Option('lan' + j,j);
          f[0].add(option);
        }
      }
      if (nvram['wan_ifname'].length > 0) {
        var option = new Option('wan','w');
        f[0].add(option);
      }
      for(var j=0; j<= f[0].options.length - 1 ; j++) {
        var i = f[0].options[j].value;
        f[0].options[j].disabled = (this.countBridge(i) > 0);
        if (f[0].options[j].value == s) f[0].selectedIndex = j;
      }
      if(this.countBridge(f[0].value) > 0) {
        ferror.set(f[0], 'Cannot add another entry for this interface', quiet);
        ok = 0;
      } else {
        ferror.clear(f[0]);
      }

        if (f[2].value == '') {
          ferror.set(f[2], 'You must enter a value for the Area parameter.', quiet);
          ok = 0;
        } else {
          ferror.clear(f[2]);
        }
        if (f[3].value == '') f[3].value = '100';
        if (f[6].value == '') f[6].value = '1';
        if (f[7].value == '') f[7].value = '10';
        if (f[8].value == '') f[8].value = '5';
        if (f[9].value == '') f[9].value = '30';


      return ok;

    }

/* OSPF-END */

    // <% activeroutes(); %>
    var ara = new TomatoGrid();
    ara.setup = function()
    {
      var i, a;
      this.init('ara-grid', 'sort');
      this.headerSet(['Destination', 'Gateway / Next Hop', 'Subnet Mask', 'Metric', 'Interface']);
      for (i = 0; i < activeroutes.length; ++i) {
        a = activeroutes[i];
        if (a[0] == nvram.lan_ifname) a[0] += ' (LAN)';
          else if (a[0] == nvram.lan1_ifname) a[0] += ' (LAN1)';
          else if (a[0] == nvram.lan2_ifname) a[0] += ' (LAN2)';
          else if (a[0] == nvram.lan3_ifname) a[0] += ' (LAN3)';
          else if (a[0] == nvram.wan_iface) a[0] += ' (WAN)';
          else if (a[0] == nvram.wan_ifname) a[0] += ' (MAN)';
        this.insertData(-1, [a[1],a[2],a[3],a[4],a[0]]);
      }
    }


    var ars = new TomatoGrid();
    ars.verifyFields = function(row, quiet)
    {
      var f = fields.getAll(row);
      f[5].value = f[5].value.replace('>', '_');
      return v_ip(f[0], quiet) && v_ip(f[1], quiet) && v_netmask(f[2], quiet) && v_range(f[3], quiet, 0, 10) && v_nodelim(f[5], quiet, 'Description');
    }


    ars.setup = function()
    {
      this.init('ars-grid', '', 20, [
      { type: 'text', maxlen: 15 }, { type: 'text', maxlen: 15 }, { type: 'text', maxlen: 15 },
      { type: 'text', maxlen: 3 }, { type: 'select', options: [['LAN','LAN'],['LAN1','LAN1'],['LAN2','LAN2'],['LAN3','LAN3'],['WAN','WAN'],['MAN','MAN']] }, { type: 'text', maxlen: 32 }]);
      this.headerSet(['Destination', 'Gateway', 'Subnet Mask', 'Metric', 'Interface', 'Description']);
      var routes = nvram.routes_static.split('>');
      for (var i = 0; i < routes.length; ++i) {
        var r;
        if (r = routes[i].match(/^(.+)<(.+)<(.+)<(\d+)<(LAN|LAN1|LAN2|LAN3|WAN|MAN)<(.*)$/)) {
          this.insertData(-1, [r[1], r[2], r[3], r[4], r[5],r[6]]);
        }
      }
      this.showNewEditor();
      this.resetNewEditor();
    }


    ars.resetNewEditor = function()
    {
      var i, e;
      e = fields.getAll(this.newEditor);
      if(nvram.lan_ifname.length < 1)
        e[4].options[0].disabled=true;
      else
        e[4].options[0].disabled=false;
      if(nvram.lan1_ifname.length < 1)
        e[4].options[1].disabled=true;
      else
        e[4].options[1].disabled=false;
      if(nvram.lan2_ifname.length < 1)
        e[4].options[2].disabled=true;
      else
        e[4].options[2].disabled=false;
      if(nvram.lan3_ifname.length < 1)
        e[4].options[3].disabled=true;
      else
        e[4].options[3].disabled=false;
      e[4].options[4].disabled=true;
      e[4].options[5].disabled=true;
      ferror.clearAll(e);
      for (i = 0; i < e.length; ++i) {
        var f = e[i];
        if (f.selectedIndex) f.selectedIndex = 0;
        else f.value = '';
      }
      try { if (e.length) e[0].focus(); } catch (er) { }
    }


    function verifyFields(focused, quiet)
    {
      // need to add some interface element disable/enable logic
      return 1;
    }

    function save()
    {
      if (ars.isEditing() || ord.isEditing() || oi.isEditing()) return;
      var fom = E('_fom');
      var arsdata = ars.getAllData();
      var r = [];
      for (var i = 0; i < arsdata.length; ++i) r.push(arsdata[i].join('<'));
      fom.routes_static.value = r.join('>');
/* RIP-BEGIN */
      fom.drr_enable.value = E('_f_drr_enable').checked ? '1' : '0';


      var rrdata = rrd.getAllData();

      for (var i = 0; i < rrdata.length; ++i)
      {
        var routeType = '';
        switch(rrdata[i][0])
        {
        case 'Connected Networks':
          routeType = 'c';
          break;
        case 'Static Routes (kernel)':
          routeType = 'k';
          break;
        case 'OSPF':
          routeType = 'o';
          break;
        case 'Default':
          routeType = 'd';
          break;
        }
        fom['drr_rdst_' + routeType].value = rrdata[i][1];
        fom['drr_rdst_' + routeType + '_mt'].value = rrdata[i][2];
        fom['drr_rdst_' + routeType + '_map'].value = rrdata[i][3];
      }

      ridata = ri.getAllData();
      for (var i = 0; i < ridata.length; ++i)
      {
        if (ridata[i][0] == 'w') {
          fom['drr_wan'].value = 1;
          fom['drr_wan_psv'].value = ridata[i][1];
          fom['drr_wan_shz'].value = ridata[i][2];
          fom['spf_wan_pwd'].value = ridata[i][3];
          fom['spf_wan_md5'].value = ridata[i][4];
          fom['spf_wan_txv'].value = ridata[i][5];
          fom['spf_wan_rxv'].value = ridata[i][6];
        } else {
          var j = (parseInt(ridata[i][0]) == 0) ? '' : ridata[i][0].toString();
          fom['drr_lan' + j].value = 1;
          fom['drr_lan' + j + '_psv'].value = ridata[i][1];
          fom['drr_lan' + j + '_shz'].value = ridata[i][2];
          fom['drr_lan' + j + '_pwd'].value = ridata[i][3];
          fom['drr_lan' + j + '_md5'].value = ridata[i][4];
          fom['drr_lan' + j + '_txv'].value = ridata[i][5];
          fom['drr_lan' + j + '_rxv'].value = ridata[i][6];
        }
      }
/* RIP-END */

/* OSPF-BEGIN */



      fom.dro_enable.value = E('_f_dro_enable').checked ? '1' : '0';
      fom.dro_rfc1583.value = E('_f_dro_rfc1583').checked ? '1' : '0';
      var ordata = ord.getAllData();

      for (var i = 0; i < ordata.length; ++i)
      {
        var routeType = '';
        switch(ordata[i][0])
        {
        case 'Connected Networks':
          routeType = 'c';
          break;
        case 'Static Routes (kernel)':
          routeType = 'k';
          break;
        case 'RIP':
          routeType = 'r';
          break;
        case 'Default':
          routeType = 'd';
          break;
        }
        fom['dro_rdst_' + routeType].value = ordata[i][1];
        fom['dro_rdst_'  + routeType + '_mtype'].value = ordata[i][2];
        fom['dro_rdst_' + routeType + '_mt'].value = ordata[i][3];
        fom['dro_rdst_' + routeType + '_map'].value = ordata[i][4];
      }

      oidata = oi.getAllData();
      for (var i = 0; i < oidata.length; ++i)
      {
        if (oidata[i][0] == 'w') {
          fom['dro_wan'].value = 1;
          fom['dro_wan_psv'].value = oidata[i][1];
          fom['dro_wan_ar'].value = oidata[i][2];
          fom['dro_wan_mt'].value = oidata[i][3];
          fom['dro_wan_pwd'].value = oidata[i][4];
          fom['dro_wan_md5'].value = oidata[i][5];
          fom['dro_wan_pr'].value = oidata[i][6];
          fom['dro_wan_hl'].value = oidata[i][7];
          fom['dro_wan_rt'].value = oidata[i][8];
          fom['dro_wan_dt'].value = oidata[i][9];
        } else {
          var j = (parseInt(oidata[i][0]) == 0) ? '' : oidata[i][0].toString();
          fom['dro_lan' + j].value = 1;
          fom['dro_lan' + j + '_psv'].value = oidata[i][1];
          fom['dro_lan' + j + '_ar'].value = oidata[i][2];
          fom['dro_lan' + j + '_mt'].value = oidata[i][3];
          fom['dro_lan' + j + '_pwd'].value = oidata[i][4];
          fom['dro_lan' + j + '_md5'].value = oidata[i][5];
          fom['dro_lan' + j + '_pr'].value = oidata[i][6];
          fom['dro_lan' + j + '_hl'].value = oidata[i][7];
          fom['dro_lan' + j + '_rt'].value = oidata[i][8];
          fom['dro_lan' + j + '_dt'].value = oidata[i][9];
        }
      }

/* OSPF-END */

      fom.dhcp_routes.value = E('_f_dhcp_routes').checked ? '1' : '0';
      fom._service.value = (fom.dhcp_routes.value != nvram.dhcp_routes) ? 'wan-restart' : 'routing-restart';

/* EMF-BEGIN */
      fom.emf_enable.value = E('_f_emf').checked ? 1 : 0;
      if (fom.emf_enable.value != nvram.emf_enable) fom._service.value = '*';
/* EMF-END */
      form.submit(fom, 1);
    }


    function submit_complete()
    {
      reloadPage();
    }


    function initTables()
    {
/* RIP-BEGIN */
      rrd.setup();
      rrd.recolor();
      ri.setup();
      ri.recolor();
/* RIP-END */
/* OSPF-BEGIN */
      ord.setup();
      oi.setup();
      ord.recolor();
      oi.recolor();
/* OSPF-END */
      ara.setup();
      ars.setup();
      ara.recolor();
      ars.recolor();
    }


    function earlyInit()
    {
      tabSelect(cookie.get('routing_tab') || 'rt-general');
    }

    //]]>
  </script>
</head>

<body>
  <form id='_fom' method='post' action='../tomato.cgi'>
    <table id='container' cellspacing="0">
      <tr>
        <td colspan="2" id='header'>
          <div class='title'>
            Tomato
          </div>

          <div class='version'>
            Version <% version(); %> 
          </div>
        </td>
      </tr>

      <tr id='body'>
        <td id='navi'>
          <script type='text/javascript'>
            //<![CDATA[
              navi()
            //]]>
          </script>
        </td>

        <td id='content'>
          <div id='ident'>
            <% ident(); %>
          </div>
          <input type='hidden' name='_nextpage' value='advanced-routing.asp'>
          <input type='hidden' name='_service' value='routing-restart'>

          <input type='hidden' name='routes_static'>
          <input type='hidden' name='dhcp_routes'>
          <input type='hidden' name='emf_enable'>


          <script type='text/javascript'>
/* RIP-BEGIN */
            W('<input type=\'hidden\' name=\'drr_enable\'>');
            for (var i = 0 ; i <= MAX_BRIDGE_ID ; i++) {
              var j = (i == 0) ? '' : i.toString();
              W('<input type=\'hidden\' id=\'drr_lan' + j + '\' name=\'drr_lan' + j + '\' value=\'0\'>');
              W('<input type=\'hidden\' id=\'drr_lan' + j + '_psv\' name=\'drr_lan' + j + '_psv\' value=\'0\'>');
              W('<input type=\'hidden\' id=\'drr_lan' + j + '_shz\' name=\'drr_lan' + j + '_shz\' value=\'1\'>');
              W('<input type=\'hidden\' id=\'drr_lan' + j + '_pwd\' name=\'drr_lan' + j + '_pwd\'>');
              W('<input type=\'hidden\' id=\'drr_lan' + j + '_md5\' name=\'drr_lan' + j + '_md5\' value=\'0\'>');
              W('<input type=\'hidden\' id=\'drr_lan' + j + '_txv\' name=\'drr_lan' + j + '_txv\' value=\'2\'>');
              W('<input type=\'hidden\' id=\'drr_lan' + j + '_rxv\' name=\'drr_lan' + j + '_rxv\' value=\'2\'>');
            }
            W('<input type=\'hidden\' id=\'drr_wan\' name=\'dro_wan\' value=\'0\'>');
            W('<input type=\'hidden\' id=\'drr_wan_psv\' name=\'drr_wan_psv\' value=\'0\'>');
            W('<input type=\'hidden\' id=\'drr_wan_shz\' name=\'drr_wan_shz\' value=\'1\'>');
            W('<input type=\'hidden\' id=\'drr_wan_pwd\' name=\'drr_wan_pwd\'>');
            W('<input type=\'hidden\' id=\'drr_wan_md5\' name=\'drr_wan_md5\' value=\'0\'>');
            W('<input type=\'hidden\' id=\'drr_wan_txv\' name=\'drr_wan_txv\' value=\'2\'>');
            W('<input type=\'hidden\' id=\'drr_wan_rxv\' name=\'drr_wan_rxv\' value=\'2\'>');

            W('<input type=\'hidden\' id=\'drr_rdst_c\' name=\'drr_rdst_c\'>');
            W('<input type=\'hidden\' id=\'drr_rdst_c_mt\' name=\'drr_rdst_c_mt\'>');
            W('<input type=\'hidden\' id=\'drr_rdst_c_map\' name=\'drr_rdst_c_map\'>');
            W('<input type=\'hidden\' id=\'drr_rdst_k\' name=\'drr_rdst_k\'>');
            W('<input type=\'hidden\' id=\'drr_rdst_k_mt\' name=\'drr_rdst_k_mt\'>');
            W('<input type=\'hidden\' id=\'drr_rdst_k_map\' name=\'drr_rdst_k_map\'>');
/* OSPF-BEGIN */
            W('<input type=\'hidden\' id=\'drr_rdst_ospf\' name=\'drr_rdst_o\'>');
            W('<input type=\'hidden\' id=\'drr_rdst_dro_mt\' name=\'drr_rdst_o_mt\'>');
            W('<input type=\'hidden\' id=\'drr_rdst_dro_map\' name=\'drr_rdst_o_map\'>');
/* OSPF-END */
            W('<input type=\'hidden\' id=\'drr_rdst_d\' name=\'drr_rdst_d\'>');
            W('<input type=\'hidden\' id=\'drr_rdst_d_mt\' name=\'drr_rdst_d_mt\'>');
            W('<input type=\'hidden\' id=\'drr_rdst_d_map\' name=\'drr_rdst_d_map\'>');

/* RIP-END */

/* OSPF-BEGIN */
            W('<input type=\'hidden\' name=\'dro_enable\'>');
            W('<input type=\'hidden\' name=\'dro_rfc1583\'>');
            for (var i = 0 ; i <= MAX_BRIDGE_ID ; i++) {
              var j = (i == 0) ? '' : i.toString();
              W('<input type=\'hidden\' id=\'dro_lan' + j + '\' name=\'dro_lan' + j + '\' value=\'0\'>');
              W('<input type=\'hidden\' id=\'dro_lan' + j + '_psv\' name=\'dro_lan' + j + '_psv\' value=\'0\'>');
              W('<input type=\'hidden\' id=\'dro_lan' + j + '_ar\' name=\'dro_lan' + j + '_ar\'>');
              W('<input type=\'hidden\' id=\'dro_lan' + j + '_mt\' name=\'dro_lan' + j + '_mt\' value=\'100\'>');
              W('<input type=\'hidden\' id=\'dro_lan' + j + '_pwd\' name=\'dro_lan' + j + '_pwd\'>');
              W('<input type=\'hidden\' id=\'dro_lan' + j + '_md5\' name=\'dro_lan' + j + '_md5\' value=\'0\'>');
              W('<input type=\'hidden\' id=\'dro_lan' + j + '_pr\' name=\'dro_lan' + j + '_pr\' value=\'1\'>');
              W('<input type=\'hidden\' id=\'dro_lan' + j + '_hl\' name=\'dro_lan' + j + '_hl\' value=\'10\'>');
              W('<input type=\'hidden\' id=\'dro_lan' + j + '_rt\' name=\'dro_lan' + j + '_rt\' value=\'5\'>');
              W('<input type=\'hidden\' id=\'dro_lan' + j + '_dt\' name=\'dro_lan' + j + '_dt\' value=\'30\'>');
            }
            W('<input type=\'hidden\' id=\'dro_wan\' name=\'dro_wan\' value=\'0\'>');
            W('<input type=\'hidden\' id=\'dro_wan_psv\' name=\'dro_wan_psv\' value=\'0\'>');
            W('<input type=\'hidden\' id=\'dro_wan_ar\' name=\'dro_wan_ar\'>');
            W('<input type=\'hidden\' id=\'dro_wan_mt\' name=\'dro_wan_mt\' value=\'100\'>');
            W('<input type=\'hidden\' id=\'dro_wan_pwd\' name=\'dro_wan_pwd\'>');
            W('<input type=\'hidden\' id=\'dro_wan_md5\' name=\'dro_wan_md5\' value=\'0\'>');
            W('<input type=\'hidden\' id=\'dro_wan_pr\' name=\'dro_wan_pr\' value=\'1\'>');
            W('<input type=\'hidden\' id=\'dro_wan_hl\' name=\'dro_wan_hl\' value=\'10\'>');
            W('<input type=\'hidden\' id=\'dro_wan_rt\' name=\'dro_wan_rt\' value=\'5\'>');
            W('<input type=\'hidden\' id=\'dro_wan_dt\' name=\'dro_wan_dt\' value=\'30\'>');

            W('<input type=\'hidden\' id=\'dro_rdst_c\' name=\'dro_rdst_c\'>');
            W('<input type=\'hidden\' id=\'dro_rdst_c_mtype\' name=\'dro_rdst_c_mtype\'>');
            W('<input type=\'hidden\' id=\'dro_rdst_c_mt\' name=\'dro_rdst_c_mt\'>');
            W('<input type=\'hidden\' id=\'dro_rdst_c_map\' name=\'dro_rdst_c_map\'>');
            W('<input type=\'hidden\' id=\'dro_rdst_k\' name=\'dro_rdst_k\'>');
            W('<input type=\'hidden\' id=\'dro_rdst_k_mtype\' name=\'dro_rdst_k_mtype\'>');
            W('<input type=\'hidden\' id=\'dro_rdst_k_mt\' name=\'dro_rdst_k_mt\'>');
            W('<input type=\'hidden\' id=\'dro_rdst_k_map\' name=\'dro_rdst_k_map\'>');
/* RIP-BEGIN */
            W('<input type=\'hidden\' id=\'dro_rdst_r\' name=\'dro_rdst_r\'>');
            W('<input type=\'hidden\' id=\'dro_rdst_r_mtype\' name=\'dro_rdst_r_mtype\'>');
            W('<input type=\'hidden\' id=\'dro_rdst_r_mt\' name=\'dro_rdst_r_mt\'>');
            W('<input type=\'hidden\' id=\'dro_rdst_r_map\' name=\'dro_rdst_r_map\'>');
/* RIP-END */
            W('<input type=\'hidden\' id=\'dro_rdst_d\' name=\'dro_rdst_d\'>');
            W('<input type=\'hidden\' id=\'dro_rdst_d_mtype\' name=\'dro_rdst_d_mtype\'>');
            W('<input type=\'hidden\' id=\'dro_rdst_d_mt\' name=\'dro_rdst_d_mt\'>');
            W('<input type=\'hidden\' id=\'dro_rdst_d_map\' name=\'dro_rdst_d_map\'>');
/* OSPF-END */

          </script>

          <script type='text/javascript'>
            //<![CDATA[
              tabCreate.apply(this, tabs);
              wrap = cookie.get('scripts_wrap') || 0;
              y = Math.floor(docu.getViewSize().height * 0.75);
              s = 'height:' + ((y > 950) ? y : 950) + 'px;display:none;margin-top:20px';
              // -------- BEGIN GENERAL TAB -----------
              t = "rt-general";
              W('<div id="' + t + '-cnt"' + ' style="' + s + '">');
              W('<div class="section-title">Current Routing Table<\/div>');
              W('<div class="section">');
              W('<table class="tomato-grid" id="ara-grid"><\/table>');
              W('<\/div>');
              W('<div class="section-title">Static Routing Table<\/div>');
              W('<div class="section">');
              W('<table class="tomato-grid" id="ars-grid"><\/table>');
              W('</div>');
              W('<div class="section-title">Miscellaneous<\/div>');
              W('<div class="section">');
              W("<script type='text\/javascript'>");
              W("createFieldTable('', [");
              W("{ title: 'Mode', name: 'wk_mode', type: 'select', options: [['gateway','Gateway'],['router','Router']], value: nvram.wk_mode },");
              W("{ title: 'DHCP Routes', name: 'f_dhcp_routes', type: 'checkbox', value: nvram.dhcp_routes != 0 },");
/* EMF-BEGIN */
              W("{ title: 'Efficient Multicast Forwarding', name: 'f_emf', type: 'checkbox', value: nvram.emf_enable != 0 },");
/* EMF-END */
              W("]);");
              W('<\/script>');
              W('<\/div>');
              W('<\/div>');
              W('<\/div>');
              // -------- END GENERAL TAB -----------

/* RIP-BEGIN */
              // -------- BEGIN RIP TAB -----------
              t = "rt-rip";
              W('<div id="' + t + '-cnt"' + ' style="' + s + '">');
              W('<div class=\'section-title\'>RIP Configuration<\/div>');
              W('<div class=\'section\'>');
              W("<script type='text\/javascript'>");
              W("createFieldTable('', [");
              W('{ title: \'Enable RIP Routing\', name: \'f_drr_enable\', type: \'checkbox\', value: nvram.drr_enable != 0},');
              W('{ title: \'RIP CLI Password\', name: \'drr_pwd\', type: \'text\', maxlen: 16, size: 30, value: nvram.drr_pwd},');
              W('{ title: \'Timers:\', multi: [');
              W('{ prefix: \'Update&nbsp;\', name: \'drr_tmr_ud\', type: \'text\', size: 5, value: nvram.drr_tmr_ud || \'30\' },');
              W('{ prefix: \'&nbsp;&nbsp; Timeout&nbsp;\', name: \'drr_tmr_to\', type: \'text\', size: 5, value: nvram.drr_tmr_to || \'180\' },');
              W('{ prefix: \'&nbsp;&nbsp;Garbage&nbsp;\', name: \'drr_tmr_gb\', type: \'text\', size: 5, value: nvram.drr_tmr_gb || \'120\' } ] },');
              W(']);');
              W('<\/script>');
              W('<\/div>');
              W('<div class="section-title">Route Redistribution</div>');
              W('<div class="section">');
              W('<table class="tomato-grid" id="riprd-grid"><\/table>');
              W('<\/div>');
              W('<div class="section-title">Interfaces</div>');
              W('<div class="section">');
              W('<table class="tomato-grid" id="ripint-grid"><\/table>');
              W('<\/div>'); 
              W('<div class="section-title">Distribute-List/Offset-List/Neighbor Directives</div>');
              W('<textarea class=\'rt-text\', name=\'drr_dlist_cfg\', id=\'drr_dlist_cfg\', wrap=\'off\'>' + nvram.drr_dlist_cfg + '<\/textarea>');
              W('<div class="section-title">Access-list/Route-map/Filter-list Entries</div>');
              W('<textarea class=\'rt-text\', name=\'drr_addl_cfg\', id=\'drr_addl_cfg\', wrap=\'off\'>' + nvram.drr_addl_cfg + '<\/textarea>');
              W('<\/div>');
              W('<\/div>');
              // -------- END RIP TAB -----------
/* RIP-END */

/* OSPF-BEGIN */
              // -------- BEGIN OSPF TAB -----------
              t = "rt-ospf";
              W('<div id="' + t + '-cnt"' + ' style="' + s + '">');
              W('<div class="section-title">OSPF Configuration<\/div>');
              W('<div class="section">');
              W('<script type=\'text\/javascript\'>');
              W('createFieldTable(\'\', [');
              W('{ title: \'Enable OSPF Routing\', name: \'f_dro_enable\', type: \'checkbox\', value: nvram.dro_enable != 0},');
              W('{ title: \'OSPF Router ID\', name: \'dro_id\', type: \'text\', value: nvram.dro_id},');
              W('{ title: \'OSPF CLI Password\', name: \'dro_pwd\', type: \'text\', maxlen: 64, size: 50, value: nvram.dro_pwd},');
              W('{ title: \'RFC 1583 Compatible\', name: \'f_dro_rfc1583\', type: \'checkbox\', value: nvram.dro_rfc1583 != 0},');
              W('{ title: \'Auto-cost Bandwidth\', name: \'dro_ac_bw\', type: \'text\', value: nvram.dro_ac_bw || \'100\'},');
              W('{ title: \'ABR Type\', name: \'dro_abr_type\', type: \'select\', options: \
                [[\'cisco\',\'Cisco\'],[\'ibm\',\'IBM\'],[\'shortcut\',\'Shortcut\'],[\'standard\',\'Standard\']], \
                value: nvram.dro_abr_type || \'cisco\' },');
              W('{ title: \'SPF Timers:\', multi: [');
              W('{ prefix: \'Delay&nbsp;\', name: \'dro_spf_del\', type: \'text\', size: 6, value: nvram.dro_spf_del || \'200\' },');
              W('{ prefix: \'&nbsp;&nbsp;Hold Time&nbsp;\', name: \'dro_spf_hold\', type: \'text\', size: 6, value: nvram.dro_spf_hold || \'400\' },');
              W('{ prefix: \'&nbsp;&nbsp;Max Hold Time&nbsp;\', name: \'dro_spf_mhold\', type: \'text\', size: 6, value: nvram.dro_spf_mhold || \'10000\'} ] },');
              W(']);');
              W('<\/script>');
              W('<\/div>');
              W('<div class="section-title">Route Redistribution</div>');
              W('<div class="section">');
              W('<table class="tomato-grid" id="ospfrd-grid"><\/table>');
              W('<\/div>');
              W('<div class="section-title">Interfaces</div>');
              W('<div class="section">');
              W('<table class="tomato-grid" id="ospfint-grid"><\/table>');
              W('<\/div>');
              W('<div class="section-title">Area Configuration Directives</div>');
              W('<textarea class=\'rt-text\', name=\'dro_ar_cfg\', id=\'dro_ar_cfg\', wrap=\'off\'>' + nvram.dro_ar_cfg + '<\/textarea>');
              W('<div class="section-title">Access-list/Route-map/Filter-list Entries</div>');
              W('<textarea class=\'rt-text\', name=\'dro_addl_cfg\', id=\'dro_addl_cfg\', wrap=\'off\'>' + nvram.dro_addl_cfg + '<\/textarea>');
              W('<\/div>');
              W('<\/div>');
              // -------- END OSPF TAB -----------
/* OSPF-END */

              initTables();
            //]]>
</script><script type='text/javascript'>//alert('hello')</script><script type='text/javascript'>
          </script>
        </td>
      </tr>

      <tr>
        <td id='footer' colspan="2"><span id='footer-msg'></span> <input type='button' value='Save' id='save-button' onclick='save()' /> <input type='button' value='Cancel' id='cancel-button' onclick='reloadPage();' /></td>
      </tr>
    </table>
  </form>
  <script type='text/javascript'>
    //<![CDATA[
      earlyInit();
      verifyFields(null,1);
    //]]>
  </script>
</body>

</html>
