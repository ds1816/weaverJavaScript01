

<!DOCTYPE HTML>
















<html>
<head>
    <!--
    添加至init.css
    <style type="text/css">
        html{height:100%;}
    </style>
     -->
    

    

    

    
		<script type="text/javascript" src="/wui/common/jquery/jquery.min_other.js"></script>
	
    <script language="javascript" type="text/javascript" src="/FCKEditor/swfobject_wev8.js"></script>

    
    <!-- js 整合到 init_wev8.js -->
    <script type="text/javascript" src="/js/jquery.table_wev8.js"></script>
    <script language="javascript" type="text/javascript" src="/js/init_wev8.js"></script>
    <script language="javascript" src="/js/wbusb_wev8.js"></script>
    <script type="text/javascript" src="/js/jquery/plugins/client/jquery.client_wev8.js"></script>
    <script type="text/javascript" src="/js/ecology8/jNice/jNice/jquery.jNice_wev8.js"></script>
    <script type='text/javascript' src='/js/jquery-autocomplete/jquery.autocomplete_wev8.js'></script>
    <script type='text/javascript' src='/js/jquery-autocomplete/browser_wev8.js'></script>
    <script language=javascript src="/wui/theme/ecology8/jquery/js/zDialog_wev8.js"></script>
    <script type="text/javascript" src="/js/ecology8/request/hoverBtn_wev8.js"></script>
    <script type="text/javascript" src="/js/ecology8/lang/weaver_lang_7_wev8.js"></script>
    <script type="text/javascript" src="/js/messagejs/highslide/highslide-full_wev8.js"></script>
    <script type="text/javascript">
        hs.graphicsDir = '/js/messagejs/highslide/graphics/';
        hs.align = 'center';
        hs.transitions = ['expand', 'crossfade'];
        hs.outlineType = 'rounded-white';
        hs.fadeInOut = true;
    </script>
    <!-- init.css, 所有css文件都在此文件中引入 -->
    <link rel="stylesheet" href="/css/init_wev8.css" type="text/css"/>


    <script language=javascript>
        window["_jsessionid"] = "aaaKPbRCtnKN8-Q_nnhgx";

        function check_conn() {
            return confirm('网络故障或其它原因导致您连接不上服务器，请复制下重要信息稍候再提交！\r\n\r\n按【确定】继续,按【取消】停留在本页!');
        }

        function _onViewLog(operateitem, sqlwhere, id) {
            if (!sqlwhere) sqlwhere = "";
            var dialog = new window.top.Dialog();
            dialog.currentWindow = window;
            dialog.Title = "查看日志";
            var url = "/docs/tabs/DocCommonTab.jsp?_fromURL=3&operateitem=" + operateitem + "&sqlwhere=" + sqlwhere;
            if (id) {
                url = "/docs/tabs/DocCommonTab.jsp?_fromURL=3&relatedid=" + id + "&operateitem=" + operateitem + "&sqlwhere=" + sqlwhere;
                if (operateitem == 418 || operateitem == 419 || operateitem == 420) {
                    dialog.Title = "变更日志";
                }
            }
            dialog.Width = jQuery(window).width();
            dialog.Height = 610;
            dialog.Drag = true;
            dialog.checkDataChange = false;
            dialog.maxiumnable = true;
            dialog.URL = url;
            dialog.show();
        }


        function check_form(thiswins, items) {
            /* added by cyril on 2008-08-14 for td:8521 */
            var isconn = false;
            try {
                var xmlhttp;
                if (window.XMLHttpRequest) {
                    xmlhttp = new XMLHttpRequest();
                }
                else if (window.ActiveXObject) {
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                var URL = "/systeminfo/CheckConn.jsp?userid=28525&time=" + new Date() + "&f_weaver_belongto_userid=28525&f_weaver_belongto_usertype=0";
                xmlhttp.open("GET", URL, false);
                xmlhttp.send(null);
                var result = xmlhttp.status;
                if (result == 200) {
                    isconn = true;
                    var response_flag = xmlhttp.responseText;
                    if (response_flag != '0') {
                        var flag_msg = '';
                        if (response_flag == '1') {
                            var diag = new Dialog();
                            diag.Width = 300;
                            diag.Height = 180;
                            diag.ShowCloseButton = false;
                            diag.Title = "网页超时提醒";
                            //diag.InvokeElementId="pageOverlay"
                            diag.URL = "/wui/theme/ecology7/page/loginSmall.jsp?username=20180823";
                            diag.show();
                            return false;
                        }
                        else if (response_flag == '2') {
                            flag_msg = '网络故障或其它原因导致您连接不上服务器，请复制下重要信息稍候再提交！';
                        }
                        //主从帐户特殊处理 by alan for TD10156
                        if (response_flag == '3') {
                            flag_msg = '提交信息失败,该页面非当前帐号打开,请刷新页面后再提交!';

                            return false;
                        }
                        flag_msg += '\r\n\r\n按【确定】继续,按【取消】停留在本页!';
                        //alert(xmlhttp.responseText);
                        return confirm(flag_msg);
                    }
                }
                xmlhttp = null;

                //检查多行文本框 oracle下检查HTML不能超过4000个字符
                
                try {
                    var lenck = true;
                    var tempfieldvlaue = document.getElementById("htmlfieldids").value;
                    while (true) {
                        var tempfield = tempfieldvlaue.substring(0, tempfieldvlaue.indexOf(","));
                        tempfieldvlaue = tempfieldvlaue.substring(tempfieldvlaue.indexOf(",") + 1);
                        var fieldid = tempfield.substring(0, tempfield.indexOf(";"));
                        var fieldname = tempfield.substring(tempfield.indexOf(";") + 1);
                        if (fieldname == '') break;
                        if (!checkLengthOnly(fieldid, '4000', fieldname, '当前文本长度', '文本长度不能超过', '1个中文字符等于3个长度')) {
                            lenck = false;
                            break;
                        }
                    }
                    if (lenck == false) return false;
                }
                catch (e) {
                }
                
            }
            catch (e) {
                return check_conn();
            }
            if (!isconn)
                return check_conn();
            /* end by cyril on 2008-08-14 for td:8521 */

            thiswin = thiswins
            items = "," + items + ",";

            var tempfieldvlaue1 = "";
            try {
                tempfieldvlaue1 = document.getElementById("htmlfieldids").value;
            } catch (e) {
            }

            for (i = 1; i <= thiswin.length; i++) {
                tmpname = thiswin.elements[i - 1].name;
                tmpvalue = thiswin.elements[i - 1].value;
                if (tmpvalue == null) {
                    continue;
                }

                if (tmpname != "" && items.indexOf("," + tmpname + ",") != -1) {
                    var __fieldhtmltype = jQuery("input[name=" + tmpname + "]").attr("__fieldhtmltype");
                    if (__fieldhtmltype == '9') {
                        continue;
                    }


                    var href = location.href;
                    if (href && href.indexOf("Ext.jsp") != -1) {
                        window.__oriAlert__ = true;
                    }
                    if (tempfieldvlaue1.indexOf(tmpname + ";") == -1) {
                        while (tmpvalue.indexOf(" ") >= 0) {
                            tmpvalue = tmpvalue.replace(" ", "");
                        }
                        while (tmpvalue.indexOf("\r\n") >= 0) {
                            tmpvalue = tmpvalue.replace("\r\n", "");
                        }

                        if (tmpvalue == "") {
                            if (thiswin.elements[i - 1].getAttribute("temptitle") != null && thiswin.elements[i - 1].getAttribute("temptitle") != "") {
                                if (window.__oriAlert__) {
                                    window.top.Dialog.alert("\"" + thiswin.elements[i - 1].getAttribute("temptitle") + "\"" + "未填写");
                                } else {
                                    var tempElement = thiswin.elements[i - 1];
                                    //ueditor必填验证
                                    if (checkueditorContent(tempElement)) {
                                        continue;
                                    }

                                    window.top.Dialog.alert("&quot;" + thiswin.elements[i - 1].getAttribute("temptitle") + "&quot;" + "未填写", function () {
                                        formElementFocus(tempElement);
                                    });
                                }
                                return false;
                            } else {
                                if (window.__oriAlert__) {
                                    try {
                                        window.top.Dialog.alert("必要信息不完整，红色叹号为必填项！");
                                    } catch (e) {
                                        Dialog.alert("必要信息不完整，红色叹号为必填项！");
                                    }
                                } else {
                                    try {
                                        window.top.Dialog.alert("必要信息不完整，红色叹号为必填项！");
                                    } catch (e) {
                                        Dialog.alert("必要信息不完整，红色叹号为必填项！");
                                    }
                                }
                                return false;
                            }
                        }
                    } else {
                        var divttt = document.createElement("div");
                        divttt.innerHTML = tmpvalue;
                        var tmpvaluettt = jQuery.trim(jQuery(divttt).text());
                        if (tmpvaluettt == "") {
                            if (thiswin.elements[i - 1].getAttribute("temptitle") != null && thiswin.elements[i - 1].getAttribute("temptitle") != "") {
                                if (window.__oriAlert__) {
                                    window.top.Dialog.alert("\";" + thiswin.elements[i - 1].getAttribute("temptitle") + "\"" + "未填写");
                                } else {
                                    var tempElement = thiswin.elements[i - 1];

                                    //ueditor必填验证
                                    if (checkueditorContent(tempElement)) {
                                        continue;
                                    }

                                    window.top.Dialog.alert("&quot;" + thiswin.elements[i - 1].getAttribute("temptitle") + "&quot;" + "未填写", function () {
                                        formElementFocus(tempElement);
                                    });

                                }
                                return false;
                            } else {
                                if (window.__oriAlert__) {
                                    window.top.Dialog.alert("必要信息不完整，红色叹号为必填项！");
                                } else {
                                    window.top.Dialog.alert("必要信息不完整，红色叹号为必填项！");
                                }
                                return false;
                            }
                        }
                    }
                }
            }
            return true;
        }

        function isdel() {
            var str = "确定要删除吗？";
            if (!confirm(str)) {
                return false;
            }
            return true;
        }

        function issubmit() {
            var str = "确定要提交吗?";
            if (!confirm(str)) {
                return false;
            }
            return true;
        }

        ///*流程里面使用，主要是因为流程内容放到iframe里面，通过response返回的时候，要返回的到其父窗口*/
        function wfforward(wfurl) {
            parent.location.href = wfurl;
        }

        function myescapecode(str) {
            return encodeURIComponent(str);
        }
    </script>


    <meta http-equiv=Content-Type content="text/html; charset=UTF-8">
    <script language=JavaScript>
        var companyname = "安徽江淮汽车集团股份有限公司";
        var str1 = "此系统由泛微软件授权于";

        if (companyname.length > 0) {
            window.status = str1 + companyname;
        }
    </script>
    <!-- 删除 -->
</head>
</html>

<!--USB 验证 -->


<!--WUI -->

<LINK href="/js/jquery/jquery_dialog_wev8.css" type=text/css rel=STYLESHEET>
<script type="text/javascript" src="/wui/common/jquery/jquery.min_wev8.js"></script>
<script type="text/javascript" language="javascript" src="/js/jquery/jquery_dialog_wev8.js"></script>

<script src="/social/js/drageasy/drageasy.js"></script>
<script type="text/javascript" src="/social/js/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="/social/im/js/IMUtil_wev8.js"></script>

<script type="text/javascript" src="/social/js/imcarousel/imcarousel.js"></script>
<script type="text/javascript" language="javascript">
function ReloadOpenerByDialogClose() {
    document.location="/login/VerifyRtxLogin.jsp?para=42788293E7D97E991B763AC59F2DDBEA8CB2CC08EE7F840CB2BC4EE36FF810DD93F816AF2539C61CEE18B23B04F61DCB30C57DF4B32F21F24CFF501F0D9AEA96B9075A7B0700155FFBA569CDD9AFE3188EDC8651745DE5F004A9F0B106601DD5BE7ED1139AA181BE62AD2F8BFAFEFE8D";
        return;


}

function doScannerEscape(ev, obj){
	IMCarousel.doScannerEscape(ev, obj);
}

function scaleImg(obj, tag){
	IMCarousel.scaleImg(obj, tag);
}

function rotateImg(obj){
	IMCarousel.rotateImg(obj);
}

function downloadImg(obj){
	IMCarousel.downloadImg(obj);
}

function slideImg(obj, direction){
	IMCarousel.slideImg(obj, direction);
}

function showImgScanner(ev, isShow, id){
	IMCarousel.showImgScanner(ev, isShow, id);
}

function downloads(id){
	document.location.href="/weaver/weaver.file.FileDownload?fileid="+id+"&download=1";
}
</script>



<!--For wui-->


<!--For wui-->
<link type='text/css' rel='stylesheet' href='/wui/theme/ecology8/skins/default/wui_wev8.css'/>



<!-- 字体设置，win7、vista系统使用雅黑字体,其他系统使用宋体 Start -->
<!--
添加至init_wev8.css
<link type='text/css' rel='stylesheet' href='/wui/common/css/w7OVFont_wev8.css' id="FONT2SYSTEMF">
-->
<script language="javascript">
    /*
    if (jQuery.client.version< 6) {
        document.getElementById('FONT2SYSTEMF').href = "/wui/common/css/notW7AVFont_wev8.css";
    }
    */
</script>
<!-- 字体设置，win7、vista系统使用雅黑字体,其他系统使用宋体 End -->

<!-- 页面切换效果Start -->

<!-- 页面切换效果End -->


<script language="javascript">

    //------------------------------
    // the folder of current skins
    //------------------------------
    //当前使用的主题
    var GLOBAL_CURRENT_THEME = "ecology8";
    //当前主题使用的皮肤
    var GLOBAL_SKINS_FOLDER = "default";
</script>

<!--For wuiForm-->
<script type="text/javascript" src="/wui/common/jquery/plugin/wuiform/jquery.wuiform_wev8.js"></script>
<script language="javascript">
    jQuery(document).ready(function () {
        wuiform.init();
    });
</script>


























<html>
<head>
<link rel="stylesheet" type="text/css" href="/workflow/exceldesign/css/excelHtml_wev8.css" />
<link rel="stylesheet" type="text/css" href="/css/Weaver_wev8.css" />
<style>
.excelDetailOuterDiv{width:100% !important; overflow-x:auto;}
.excelOuterTable .td_etype_3 a{color:#123885 !important;}
.excelOuterTable .td_etype_3 a:hover{color:red !important;}
.mainTd_0_0 *{
font-size:14pt!important; font-family:Microsoft YaHei!important; font-weight:bold; 
}
.mainTd_0_0{
vertical-align:middle; text-align:center; word-break:break-all; word-wrap:break-word; word-break:break-word; height:30px; width:900.0px; }
.mainTd_1_0 *{
color:black!important; font-size:9pt; font-family:Microsoft YaHei; 
}
.mainTd_1_0{
background:#e7f3fc!important; vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px; width:150.0px; }
.mainTd_1_1 *{
color:black!important; font-size:9pt; font-family:Microsoft YaHei; 
}
.mainTd_1_1{
vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px; width:750.0px; }
.mainTd_2_0 *{
color:black!important; font-size:9pt; font-family:Microsoft YaHei; 
}
.mainTd_2_0{
background:#e7f3fc!important; vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px; width:150.0px; }
.mainTd_2_1 *{
color:black!important; font-size:9pt; font-family:Microsoft YaHei; 
}
.mainTd_2_1{
vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px; width:300.0px; }
.mainTd_2_2 *{
color:black!important; font-size:9pt; font-family:Microsoft YaHei; 
}
.mainTd_2_2{
background:#e7f3fc!important; vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px; width:150.0px; }
.mainTd_2_3 *{
color:black!important; font-size:9pt; font-family:Microsoft YaHei; 
}
.mainTd_2_3{
vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px; width:300.0px; }
.mainTd_3_0 *{
color:black!important; font-size:9pt; font-family:Microsoft YaHei; 
}
.mainTd_3_0{
background:#e7f3fc!important; vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px; width:150.0px; }
.mainTd_3_1 *{
color:black!important; font-size:9pt; font-family:Microsoft YaHei; 
}
.mainTd_3_1{
vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px; width:300.0px; }
.mainTd_3_2 *{
color:black!important; font-size:9pt; font-family:Microsoft YaHei; 
}
.mainTd_3_2{
background:#e7f3fc!important; vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px; width:150.0px; }
.mainTd_3_3 *{
color:black!important; font-size:9pt; font-family:Microsoft YaHei; 
}
.mainTd_3_3{
vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px; width:300.0px; }
.mainTd_10_2 *{
color:black!important; font-size:9pt; font-family:Microsoft YaHei; 
}
.mainTd_10_2{
vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px; width:450.0px; }
.mainTd_18_0 *{
color:#ff0000!important; font-size:9pt; font-family:Microsoft YaHei; 
}
.mainTd_18_0{
vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px; width:900.0px; }
.mainTd_5_0 *{
font-size:9pt; font-family:Microsoft YaHei; 
}
.mainTd_5_0{
background:#e7f3fc!important; vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px; width:150.0px; }
.mainTd_5_1 *{
font-size:9pt; font-family:Microsoft YaHei; 
}
.mainTd_5_1{
vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px; width:300.0px; }
.mainTd_5_2 *{
color:black!important; font-size:9pt; font-family:Microsoft YaHei; 
}
.mainTd_5_2{
background:#e7f3fc!important; vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px; width:150.0px; }
.mainTd_5_3 *{
color:black!important; font-size:9pt; font-family:Microsoft YaHei; 
}
.mainTd_5_3{
vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px; width:300.0px; }
.mainTd_21_0 *{
color:black!important; font-size:9pt; font-family:Microsoft YaHei; 
}
.mainTd_21_0{
background:#e7f3fc!important; vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px; width:150.0px; }
.mainTd_21_1 *{
color:black!important; font-size:9pt; font-family:Microsoft YaHei; 
}
.mainTd_21_1{
vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px; width:750.0px; }
.detail0_0_0 *{
font-size:10pt!important; font-family:Microsoft YaHei!important; font-weight:bold; 
}
.detail0_0_0{
vertical-align:middle; text-align:right; word-break:break-all; word-wrap:break-word; word-break:break-word; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; height:30px;
}
.detail0_0_3{
text-align:right; word-break:break-all; word-wrap:break-word; word-break:break-word; vertical-align:top; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; height:30px;
}
.detail0_1_0 *{
font-size:9pt; font-family:Microsoft YaHei; 
}
.detail0_1_0{
background:#e7f3fc!important; vertical-align:middle; text-align:center; word-break:break-all; word-wrap:break-word; word-break:break-word; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px;
}
.detail0_1_1 *{
font-size:9pt; font-family:Microsoft YaHei; 
}
.detail0_1_1{
background:#e7f3fc!important; vertical-align:middle; text-align:center; word-break:break-all; word-wrap:break-word; word-break:break-word; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px;
}
.detail0_1_2 *{
font-size:9pt; font-family:Microsoft YaHei; 
}
.detail0_1_2{
background:#e7f3fc!important; vertical-align:middle; text-align:center; word-break:break-all; word-wrap:break-word; word-break:break-word; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px;
}
.detail0_1_3 *{
font-size:9pt; font-family:Microsoft YaHei; 
}
.detail0_1_3{
background:#e7f3fc!important; vertical-align:middle; text-align:center; word-break:break-all; word-wrap:break-word; word-break:break-word; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px;
}
.detail0_3_0 *{
font-size:9pt; font-family:Microsoft YaHei; 
}
.detail0_3_0{
vertical-align:middle; text-align:center; word-break:break-all; word-wrap:break-word; word-break:break-word; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px;
}
.detail0_3_1 *{
font-size:9pt; font-family:Microsoft YaHei; 
}
.detail0_3_1{
vertical-align:middle; text-align:center; word-break:break-all; word-wrap:break-word; word-break:break-word; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px;
}
.detail0_3_2 *{
font-size:9pt; font-family:Microsoft YaHei; 
}
.detail0_3_2{
vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px;
}
.detail0_3_3 *{
font-size:9pt; font-family:Microsoft YaHei; 
}
.detail0_3_3{
vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px;
}
.mainTd_14_1{
vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; padding-left:4.0px; 
	border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; padding:0px !important; height:30px; width:750.0px; }
.mainTd_15_0 *{
color:black!important; font-size:9pt; font-family:Microsoft YaHei; 
}
.mainTd_15_0{
background:#e7f3fc!important; vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px; width:150.0px; }
.mainTd_15_1 *{
color:black!important; font-size:9pt; font-family:Microsoft YaHei; 
}
.mainTd_15_1{
vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px; width:300.0px; }
.mainTd_20_1 *{
color:black!important; font-size:9pt; font-family:Microsoft YaHei; 
}
.mainTd_20_1{
vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px; width:750.0px; }
.mainTd_20_0 *{
color:black!important; font-size:9pt; font-family:Microsoft YaHei; 
}
.mainTd_20_0{
background:#e7f3fc!important; vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px; width:150.0px; }
.mainTd_8_2 *{
color:black!important; font-size:9pt; font-family:Microsoft YaHei; 
}
.mainTd_8_2{
vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px; width:450.0px; }
.mainTd_8_1 *{
color:black!important; font-size:9pt; font-family:Microsoft YaHei; 
}
.mainTd_8_1{
background:#e7f3fc!important; vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px; width:300.0px; }
.mainTd_9_2 *{
color:black!important; font-size:9pt; font-family:Microsoft YaHei; 
}
.mainTd_9_2{
vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px; width:450.0px; }
.mainTd_9_1 *{
color:black!important; font-size:9pt; font-family:Microsoft YaHei; 
}
.mainTd_9_1{
background:#e7f3fc!important; vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px; width:300.0px; }
.mc_4_0 *{
color:black!important; font-size:9pt; font-family:Microsoft YaHei; 
}
.mc_4_0{
word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; vertical-align:middle; color:black!important; font-size:9pt; font-family:Microsoft YaHei; }
.mc_4_1 *{
font-size:9pt; font-family:Microsoft YaHei; 
}
.mc_4_1{
word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; vertical-align:middle; font-size:9pt; font-family:Microsoft YaHei; }
.mainTd_12_1{
vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px; width:750.0px; }
.mainTd_11_1 *{
color:black!important; font-size:9pt; font-family:Microsoft YaHei; 
}
.mainTd_11_1{
background:#e7f3fc!important; vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; padding-left:24.0px; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px; width:750.0px; }
.mainTd_19_1 *{
color:black!important; font-size:9pt; font-family:Microsoft YaHei; 
}
.mainTd_19_1{
vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px; width:750.0px; }
.mainTd_19_0 *{
color:black!important; font-size:9pt; font-family:Microsoft YaHei; 
}
.mainTd_19_0{
background:#e7f3fc!important; vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px; width:150.0px; }
.mainTd_17_1 *{
color:black!important; font-size:9pt; font-family:Microsoft YaHei; 
}
.mainTd_17_1{
vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px; width:750.0px; }
.mainTd_17_0 *{
color:black!important; font-size:9pt; font-family:Microsoft YaHei; 
}
.mainTd_17_0{
background:#e7f3fc!important; vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px; width:150.0px; }
.mainTd_16_1 *{
color:#ff0000!important; font-size:9pt; font-family:Microsoft YaHei; 
}
.mainTd_16_1{
word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; vertical-align:top; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px; width:300.0px; }
.mainTd_16_0 *{
color:#ff0000!important; font-size:9pt; font-family:Microsoft YaHei; 
}
.mainTd_16_0{
vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px; width:900.0px; }
.mainTd_22_0 *{
color:black!important; font-size:9pt; font-family:Microsoft YaHei; 
}
.mainTd_22_0{
background:#e7f3fc!important; vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px; width:150.0px; }
.mainTd_22_1 *{
color:black!important; font-size:9pt; font-family:Microsoft YaHei; 
}
.mainTd_22_1{
vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px; width:750.0px; }
.mainTd_15_2 *{
color:black!important; font-size:9pt; font-family:Microsoft YaHei; 
}
.mainTd_15_2{
background:#e7f3fc!important; vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px; width:150.0px; }
.mainTd_15_3 *{
color:black!important; font-size:9pt; font-family:Microsoft YaHei; 
}
.mainTd_15_3{
vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px; width:300.0px; }
.mainTd_6_0 *{
color:black!important; font-size:9pt; font-family:Microsoft YaHei; 
}
.mainTd_6_0{
background:#e7f3fc!important; vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px; width:150.0px; }
.mainTd_6_1 *{
color:black!important; font-size:9pt; font-family:Microsoft YaHei; 
}
.mainTd_6_1{
vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px; width:300.0px; }
.mainTd_6_2 *{
color:black!important; font-size:9pt; font-family:Microsoft YaHei; 
}
.mainTd_6_2{
background:#e7f3fc!important; vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px; width:150.0px; }
.mainTd_6_3 *{
color:black!important; font-size:9pt; font-family:Microsoft YaHei; 
}
.mainTd_6_3{
vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px; width:300.0px; }
.mainTd_8_0 *{
color:black!important; font-size:9pt; font-family:Microsoft YaHei; 
}
.mainTd_8_0{
background:#e7f3fc!important; vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px; width:150.0px; }
.mainTd_10_1 *{
color:black!important; font-size:9pt; font-family:Microsoft YaHei; 
}
.mainTd_10_1{
background:#e7f3fc!important; vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px; width:300.0px; }
.detail1_0_0 *{
font-size:10pt!important; font-family:Microsoft YaHei!important; font-weight:bold; 
}
.detail1_0_0{
vertical-align:middle; text-align:right; word-break:break-all; word-wrap:break-word; word-break:break-word; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; height:28px;
}
.detail1_1_0 *{
font-size:9pt; font-family:Microsoft YaHei; 
}
.detail1_1_0{
background:#e7f3fc!important; vertical-align:middle; text-align:center; word-break:break-all; word-wrap:break-word; word-break:break-word; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:28px;
}
.detail1_3_0 *{
font-size:9pt; font-family:Microsoft YaHei; 
}
.detail1_3_0{
background:#ffffff!important; vertical-align:middle; text-align:center; word-break:break-all; word-wrap:break-word; word-break:break-word; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:28px;
}
.detail1_0_2{
word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; vertical-align:top; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; height:28px;
}
.detail1_1_2 *{
font-size:9pt; font-family:Microsoft YaHei; 
}
.detail1_1_2{
background:#e7f3fc!important; vertical-align:middle; text-align:center; word-break:break-all; word-wrap:break-word; word-break:break-word; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:28px;
}
.detail1_3_2 *{
font-size:9pt; font-family:Microsoft YaHei; 
}
.detail1_3_2{
background:#ffffff!important; vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:28px;
}
.detail1_1_1{
background:#e7f3fc!important; vertical-align:middle; text-align:center; word-break:break-all; word-wrap:break-word; word-break:break-word; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:28px;
}
.detail1_3_1 *{
font-size:9pt; font-family:Microsoft YaHei; 
}
.detail1_3_1{
background:#ffffff!important; vertical-align:middle; text-align:center; word-break:break-all; word-wrap:break-word; word-break:break-word; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:28px;
}
.mainTd_7_0{
vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; padding:0px !important; height:30px; width:900.0px; }
.mainTd_13_1 *{
color:black!important; font-size:9pt; font-family:Microsoft YaHei; 
}
.mainTd_13_1{
background:#e7f3fc!important; vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px; width:300.0px; }
.mainTd_13_2 *{
font-size:9pt; font-family:Microsoft YaHei; 
}
.mainTd_13_2{
word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; vertical-align:top; height:30px; width:450.0px; }
.mainTd_4_0 *{
color:black!important; font-size:9pt; font-family:Microsoft YaHei; 
}
.mainTd_4_0{
background:#e7f3fc!important; vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px; width:150.0px; }
.mainTd_4_1 *{
color:black!important; font-size:9pt; font-family:Microsoft YaHei; 
}
.mainTd_4_1{
vertical-align:middle; word-break:break-all; word-wrap:break-word; word-break:break-word; text-align:left; 
	border-top-width:1px; border-top-style:solid; border-top-color:#90badd; border-left-width:1px; border-left-style:solid; border-left-color:#90badd; border-right-width:1px; border-right-style:solid; border-right-color:#90badd; border-bottom-width:1px; border-bottom-style:solid; border-bottom-color:#90badd; height:30px; width:750.0px; }
</style>

</head>
<body>
<script type="text/javascript" src="/workflow/exceldesign/js/fieldAttrOperate_wev8.js"></script>
<script type="text/javascript" src="/workflow/exceldesign/js/formcalculate_wev8.js"></script>
<script type="text/javascript" src="/workflow/exceldesign/js/parseLayout_wev8.js"></script>

<link type="text/css" rel="stylesheet" href="/css/crmcss/lanlv_wev8.css" />
<p id="edesign_script_css" style="display:none !important">
<script type="text/javascript" src="/workflow/exceldesign/js/format_wev8.js"></script>
<script type="text/javascript" src="/workflow/exceldesign/js/formula_wev8.js"></script>
<script type="text/javascript" src="/workflow/exceldesign/js/formula/system_formula.js"></script>
<script type="text/javascript" src="/workflow/exceldesign/js/formula/db_formula_wev8.js"></script>
<script type="text/javascript" src="/workflow/exceldesign/js/tabpage_wev8.js"></script>
<script type="text/javascript" src="/workflow/exceldesign/js/wfExcelHtml_wev8.js"></script>
<script type="text/javascript" src="/workflow/exceldesign/js/customPublicFun_wev8.js"></script>
</p>
<div class="excelTempDiv">
<table class="excelOuterTable tablefixed">
<tbody>
<tr>
<td align="center">
<table class="excelMainTable tablefixed" style=" width:900px; " _hasPercent="false" >
<tbody>
<tr name="controlwidth" style="height:0px !important;">
<td width="150px"></td>
<td width="300px"></td>
<td width="150px"></td>
<td width="300px"></td>
</tr>
<tr style="height:30px;" >
<td  colspan="4" class="td_edesign td_etype_1 mainTd_0_0">
<div etypeisText="1">
<span>08&nbsp;车辆合格证信息修改及撤销审批流程</span>
</div>
</td>
</tr>
<tr style="height:30px;" >
<td  class="td_edesign td_etype_2 mainTd_1_0" _fieldlabel="49264">
<div >
<span>流程标题</span>
</div>
</td>
<td  colspan="3" class="td_edesign td_etype_3 mainTd_1_1" id="field49264_tdwrap" _fieldid="49264" _cellattr="MAIN.B2">
<div >
<input  fieldtype="1"  datatype="text" viewtype="1" type="text" class="Inputstyle" temptitle="流程标题" id="field49264" name="field49264" style="width:90%;" onChange="checkinput2('field49264','field49264span',this.getAttribute('viewtype'));checkLength('field49264','150','流程标题','文本长度不能超过','1个中文字符等于3个长度');" onBlur=""   onpropertychange="" _listener=""  onfocus="" onclick=""  ondblclick="" onmouseover="" onmouseout=""  value=""><span id="field49264span" style="word-break:break-all;word-wrap:break-word;"><img src='/images/BacoError_wev8.gif' align='absmiddle'></span>
</div>
</td>
</tr>
<tr style="height:30px;" >
<td  class="td_edesign td_etype_2 mainTd_2_0" _fieldlabel="49265">
<div >
<span>业务办理人员</span>
</div>
</td>
<td  class="td_edesign td_etype_3 mainTd_2_1" id="field49265_tdwrap" _fieldid="49265" _cellattr="MAIN.B3">
<div >
<span id="field49265span" style="word-break:break-all;word-wrap:break-word"></span><input type="hidden" id="field49265" name="field49265" value=""  _isedit="0" onpropertychange="" _listener="" /> 
</div>
</td>
<td  class="td_edesign td_etype_2 mainTd_2_2" _fieldlabel="49266">
<div >
<span>申请单位</span>
</div>
</td>
<td  class="td_edesign td_etype_3 mainTd_2_3" id="field49266_tdwrap" _fieldid="49266" _cellattr="MAIN.D3">
<div >
<span id="field49266span" style="word-break:break-all;word-wrap:break-word"></span><input type="hidden" id="field49266" name="field49266" value=""  _isedit="0" onpropertychange="" _listener="" /> 
</div>
</td>
</tr>
<tr style="height:30px;" >
<td  class="td_edesign td_etype_2 mainTd_3_0" _fieldlabel="49267">
<div >
<span>申请部门</span>
</div>
</td>
<td  class="td_edesign td_etype_3 mainTd_3_1" id="field49267_tdwrap" _fieldid="49267" _cellattr="MAIN.B4">
<div >
<span id="field49267span" style="word-break:break-all;word-wrap:break-word"></span><input type="hidden" id="field49267" name="field49267" value=""  _isedit="0" onpropertychange="" _listener="" /> 
</div>
</td>
<td  class="td_edesign td_etype_2 mainTd_3_2" _fieldlabel="49268">
<div >
<span>申请时间</span>
</div>
</td>
<td  class="td_edesign td_etype_3 mainTd_3_3" id="field49268_tdwrap" _fieldid="49268" _cellattr="MAIN.D4">
<div >
<span id="field49268span" style="word-break:break-all;word-wrap:break-word">2020-04-26</span><input type="hidden" id="field49268" name="field49268" value="2020-04-26"  _isedit="0" onpropertychange="" _listener="" /> 
</div>
</td>
</tr>
<tr style="height:30px;" >
<td  class="td_edesign td_etype_2 mainTd_4_0" _fieldlabel="49269">
<div >
<span>联系方式</span>
</div>
</td>
<td  colspan="3" class="td_edesign td_etype_3 mainTd_4_1" id="field49269_tdwrap" _fieldid="49269" _cellattr="MAIN.B5">
<div >
<input  fieldtype="1"  datatype="text" viewtype="1" type="text" class="Inputstyle" temptitle="联系方式" id="field49269" name="field49269" style="width:90%;" onChange="checkinput2('field49269','field49269span',this.getAttribute('viewtype'));checkLength('field49269','100','联系方式','文本长度不能超过','1个中文字符等于3个长度');" onBlur=""   onpropertychange="" _listener=""  onfocus="" onclick=""  ondblclick="" onmouseover="" onmouseout=""  value=""><span id="field49269span" style="word-break:break-all;word-wrap:break-word;"><img src='/images/BacoError_wev8.gif' align='absmiddle'></span>
</div>
</td>
</tr>
<tr style="height:30px;" >
<td  class="td_edesign td_etype_2 mainTd_5_0" _fieldlabel="49270">
<div >
<span>车辆系列</span>
</div>
</td>
<td  class="td_edesign td_etype_3 mainTd_5_1" id="field49270_tdwrap" _fieldid="49270" _cellattr="MAIN.B6">
<div >
<input  fieldtype="1"  datatype="text" viewtype="1" type="text" class="Inputstyle" temptitle="车辆系列" id="field49270" name="field49270" style="width:90%;" onChange="checkinput2('field49270','field49270span',this.getAttribute('viewtype'));checkLength('field49270','100','车辆系列','文本长度不能超过','1个中文字符等于3个长度');" onBlur=""   onpropertychange="" _listener=""  onfocus="" onclick=""  ondblclick="" onmouseover="" onmouseout=""  value=""><span id="field49270span" style="word-break:break-all;word-wrap:break-word;"><img src='/images/BacoError_wev8.gif' align='absmiddle'></span>
</div>
</td>
<td  class="td_edesign td_etype_2 mainTd_5_2" _fieldlabel="49272">
<div >
<span>车辆型号</span>
</div>
</td>
<td  class="td_edesign td_etype_3 mainTd_5_3" id="field49272_tdwrap" _fieldid="49272" _cellattr="MAIN.D6">
<div >
<input  fieldtype="1"  datatype="text" viewtype="1" type="text" class="Inputstyle" temptitle="车辆型号" id="field49272" name="field49272" style="width:90%;" onChange="checkinput2('field49272','field49272span',this.getAttribute('viewtype'));checkLength('field49272','100','车辆型号','文本长度不能超过','1个中文字符等于3个长度');" onBlur=""   onpropertychange="" _listener=""  onfocus="" onclick=""  ondblclick="" onmouseover="" onmouseout=""  value=""><span id="field49272span" style="word-break:break-all;word-wrap:break-word;"><img src='/images/BacoError_wev8.gif' align='absmiddle'></span>
</div>
</td>
</tr>
<tr style="height:30px;" >
<td  class="td_edesign td_etype_2 mainTd_6_0" _fieldlabel="49273">
<div >
<span>销售区域</span>
</div>
</td>
<td  class="td_edesign td_etype_3 mainTd_6_1" id="field49273_tdwrap" _fieldid="49273" _cellattr="MAIN.B7">
<div >
<input  fieldtype="1"  datatype="text" viewtype="1" type="text" class="Inputstyle" temptitle="销售区域" id="field49273" name="field49273" style="width:90%;" onChange="checkinput2('field49273','field49273span',this.getAttribute('viewtype'));checkLength('field49273','100','销售区域','文本长度不能超过','1个中文字符等于3个长度');" onBlur=""   onpropertychange="" _listener=""  onfocus="" onclick=""  ondblclick="" onmouseover="" onmouseout=""  value=""><span id="field49273span" style="word-break:break-all;word-wrap:break-word;"><img src='/images/BacoError_wev8.gif' align='absmiddle'></span>
</div>
</td>
<td  class="td_edesign td_etype_2 mainTd_6_2" _fieldlabel="109222">
<div >
<span>经销商名称</span>
</div>
</td>
<td  class="td_edesign td_etype_3 mainTd_6_3" id="field109222_tdwrap" _fieldid="109222" _cellattr="MAIN.D7">
<div >
<input  fieldtype="1"  datatype="text" viewtype="1" type="text" class="Inputstyle" temptitle="经销商名称" id="field109222" name="field109222" style="width:90%;" onChange="checkinput2('field109222','field109222span',this.getAttribute('viewtype'));checkLength('field109222','200','经销商名称','文本长度不能超过','1个中文字符等于3个长度');" onBlur=""   onpropertychange="" _listener=""  onfocus="" onclick=""  ondblclick="" onmouseover="" onmouseout=""  value=""><span id="field109222span" style="word-break:break-all;word-wrap:break-word;"><img src='/images/BacoError_wev8.gif' align='absmiddle'></span>
</div>
</td>
</tr>
<tr style="height:30px;" >
<td  colspan="4" class="td_edesign td_etype_7 mainTd_7_0">
<div >
<div id="detailDiv_1" class="">
<table class="excelDetailTable" _seniorset="y" id="oTable1" name="oTable1" style="width:100%;"> 
 <tbody> 
  <tr name="controlwidth" style="height:0px !important;" class="exceldetailtitle"> 
   <td width="30.0%"></td> 
   <td width="30.0%"></td> 
   <td width="40.0%"></td> 
  </tr> 
  <tr _target="headrow" class="exceldetailtitle " style="height:28px;"> 
   <td colspan="2" class="detail1_0_0 td_etype_1"> <span>车辆VIN码</span> </td> 
   <td class="detail1_0_2 td_etype_10"> 
    <div id="div1button" class="detailButtonDiv" style="width:100px;"> 
     <button class="addbtn_p" type="button" id="$addbutton1$" name="addbutton1" onclick="addRow1(1);return false;" title="添加"></button> 
     <button class="delbtn_p" type="button" id="$delbutton1$" name="delbutton1" onclick="deleteRow1(1);return false;" title="删除"></button> 
    </div> </td> 
  </tr> 
  <tr _target="headrow" class="exceldetailtitle " style="height:28px;"> 
   <td class="detail1_1_0 td_etype_20"> <input type="checkbox" notbeauty="true" name="check_all_record" onclick="detailOperate.checkAllFun(1);" title="全选" /> </td> 
   <td class="detail1_1_1 td_etype_24"> </td> 
   <td class="detail1_1_2 td_etype_2"> <span>车辆VIN码</span> </td> 
  </tr>  
 </tbody> 
</table>
</div>

</div>
</td>
</tr>
<tr style="height:30px;" >
<td  rowspan="7" class="td_edesign td_etype_1 mainTd_8_0">
<div etypeisText="1">
<span>更换信息详情</span>
</div>
</td>
<td  class="td_edesign td_etype_2 mainTd_8_1" _fieldlabel="49274">
<div >
<span>是否完税</span>
</div>
</td>
<td  colspan="2" class="td_edesign td_etype_3 mainTd_8_2" id="field49274_tdwrap" _fieldid="49274" _cellattr="MAIN.C9">
<div >
<select notBeauty=true class="Inputstyle" style="height:auto;" viewtype="1" temptitle="是否完税" onBlur="checkinput2('field49274','field49274span',this.getAttribute('viewtype'));" id="field49274" name="field49274"   onChange="changeChildField(this,49274,-1);changeforUpload('49274',80020,7); onfocus='' onclick='' ondblclick='' onmouseover='' onmouseout='' ">
<option value=""></option>
<option value="0">是</option>
<option value="1">否</option>
</select>
<input type="hidden" id="uploadMaxField" name="uploadMaxField" isedit="1" value="49274" />
<span id="field49274span"><img src='/images/BacoError_wev8.gif' align='absmiddle'></span>
<input type="hidden" id="oldfieldview49274" name="oldfieldview49274" value="3" />

</div>
</td>
</tr>
<tr style="height:30px;" >
<td  class="td_edesign td_etype_2 mainTd_9_1" _fieldlabel="49275">
<div >
<span>更换类型</span>
</div>
</td>
<td  colspan="2" class="td_edesign td_etype_3 mainTd_9_2" id="field49275_tdwrap" _fieldid="49275" _cellattr="MAIN.C10">
<div >
<select notBeauty=true class="Inputstyle" style="height:auto;" viewtype="1" temptitle="更换类型" onBlur="checkinput2('field49275','field49275span',this.getAttribute('viewtype'));" id="field49275" name="field49275"   onChange="changeChildField(this,49275,-1);changeforUpload('49275',80020,7); onfocus='' onclick='' ondblclick='' onmouseover='' onmouseout='' ">
<option value=""></option>
<option value="0">修改</option>
<option value="1">撤销</option>
</select>
<input type="hidden" id="uploadMaxField" name="uploadMaxField" isedit="1" value="49275" />
<span id="field49275span"><img src='/images/BacoError_wev8.gif' align='absmiddle'></span>
<input type="hidden" id="oldfieldview49275" name="oldfieldview49275" value="3" />

</div>
</td>
</tr>
<tr style="height:30px;" >
<td  class="td_edesign td_etype_2 mainTd_10_1" _fieldlabel="50771">
<div >
<span>是否涉及环保信息变更（车辆型号、制造日期、发动机型号、VIN码）</span>
</div>
</td>
<td  colspan="2" class="td_edesign td_etype_3 mainTd_10_2" id="field50771_tdwrap" _fieldid="50771" _cellattr="MAIN.C11">
<div >
<select notBeauty=true class="Inputstyle" style="height:auto;" viewtype="1" temptitle="是否涉及环保信息变更（车辆型号、制造日期、发动机型号、VIN码）" onBlur="checkinput2('field50771','field50771span',this.getAttribute('viewtype'));" id="field50771" name="field50771"   onChange="changeshowattr('50771_0',this.value,-1,80020,102983,false);changeChildField(this,50771,-1);changeforUpload('50771',80020,7); onfocus='' onclick='' ondblclick='' onmouseover='' onmouseout='' ">
<option value=""></option>
<option value="0">是</option>
<option value="1">否</option>
</select>
<input type="hidden" id="uploadMaxField" name="uploadMaxField" isedit="1" value="50771" />
<span id="field50771span"><img src='/images/BacoError_wev8.gif' align='absmiddle'></span>
<input type="hidden" id="oldfieldview50771" name="oldfieldview50771" value="3" />

</div>
</td>
</tr>
<tr style="height:30px;" >
<td  colspan="3" class="td_edesign td_etype_2 mainTd_11_1" _fieldlabel="109221">
<div >
<span>更换项目（勾选，可多项勾选，其他可编辑）</span>
</div>
</td>
</tr>
<tr style="height:30px;" >
<td  colspan="3" class="td_edesign td_etype_13 mainTd_12_1">
<div etypeisText="1">
<span  class="span_mc mc_4_0 "  style="display:inline-block;"  _fieldid="109221" >
<div class="radioCheckDiv">
<div class="selectItemHorizontalDiv"><input type='checkbox' class="Inputstyle" style="height:auto;" viewtype="1" temptitle="更换项目（勾选，可多项勾选，其他可编辑）" onBlur="checkinput2('field109221','field109221span',this.getAttribute('viewtype'));"  name="field109221_0" id="field109221_0" value="0"  viewtype='1'  onclick="selectItemCheckChange(this,109221);checkinput2('field109221','field109221span',this.getAttribute('viewtype'));"">
<label for="field109221_0" >车辆型号</label>
</div>
<div class="selectItemHorizontalDiv"><input type='checkbox' class="Inputstyle" style="height:auto;" viewtype="1" temptitle="更换项目（勾选，可多项勾选，其他可编辑）" onBlur="checkinput2('field109221','field109221span',this.getAttribute('viewtype'));"  name="field109221_1" id="field109221_1" value="1"  viewtype='1'  onclick="selectItemCheckChange(this,109221);checkinput2('field109221','field109221span',this.getAttribute('viewtype'));"">
<label for="field109221_1" >发证日期</label>
</div>
<div class="selectItemHorizontalDiv"><input type='checkbox' class="Inputstyle" style="height:auto;" viewtype="1" temptitle="更换项目（勾选，可多项勾选，其他可编辑）" onBlur="checkinput2('field109221','field109221span',this.getAttribute('viewtype'));"  name="field109221_2" id="field109221_2" value="2"  viewtype='1'  onclick="selectItemCheckChange(this,109221);checkinput2('field109221','field109221span',this.getAttribute('viewtype'));"">
<label for="field109221_2" >车身颜色</label>
</div>
<div class="selectItemHorizontalDiv"><input type='checkbox' class="Inputstyle" style="height:auto;" viewtype="1" temptitle="更换项目（勾选，可多项勾选，其他可编辑）" onBlur="checkinput2('field109221','field109221span',this.getAttribute('viewtype'));"  name="field109221_3" id="field109221_3" value="3"  viewtype='1'  onclick="selectItemCheckChange(this,109221);checkinput2('field109221','field109221span',this.getAttribute('viewtype'));"">
<label for="field109221_3" >发动机型号</label>
</div>
<div class="selectItemHorizontalDiv"><input type='checkbox' class="Inputstyle" style="height:auto;" viewtype="1" temptitle="更换项目（勾选，可多项勾选，其他可编辑）" onBlur="checkinput2('field109221','field109221span',this.getAttribute('viewtype'));"  name="field109221_4" id="field109221_4" value="4"  viewtype='1'  onclick="selectItemCheckChange(this,109221);checkinput2('field109221','field109221span',this.getAttribute('viewtype'));"">
<label for="field109221_4" >总质量</label>
</div>
<div class="selectItemHorizontalDiv"><input type='checkbox' class="Inputstyle" style="height:auto;" viewtype="1" temptitle="更换项目（勾选，可多项勾选，其他可编辑）" onBlur="checkinput2('field109221','field109221span',this.getAttribute('viewtype'));"  name="field109221_5" id="field109221_5" value="5"  viewtype='1'  onclick="selectItemCheckChange(this,109221);checkinput2('field109221','field109221span',this.getAttribute('viewtype'));"">
<label for="field109221_5" >发动机号</label>
</div>
<div class="selectItemHorizontalDiv"><input type='checkbox' class="Inputstyle" style="height:auto;" viewtype="1" temptitle="更换项目（勾选，可多项勾选，其他可编辑）" onBlur="checkinput2('field109221','field109221span',this.getAttribute('viewtype'));"  name="field109221_6" id="field109221_6" value="6"  viewtype='1'  onclick="selectItemCheckChange(this,109221);checkinput2('field109221','field109221span',this.getAttribute('viewtype'));"">
<label for="field109221_6" >排量和功率</label>
</div>
<div class="selectItemHorizontalDiv"><input type='checkbox' class="Inputstyle" style="height:auto;" viewtype="1" temptitle="更换项目（勾选，可多项勾选，其他可编辑）" onBlur="checkinput2('field109221','field109221span',this.getAttribute('viewtype'));"  name="field109221_7" id="field109221_7" value="7"  viewtype='1'  onclick="selectItemCheckChange(this,109221);checkinput2('field109221','field109221span',this.getAttribute('viewtype'));"">
<label for="field109221_7" >外廓尺寸</label>
</div>
<div class="selectItemHorizontalDiv"><input type='checkbox' class="Inputstyle" style="height:auto;" viewtype="1" temptitle="更换项目（勾选，可多项勾选，其他可编辑）" onBlur="checkinput2('field109221','field109221span',this.getAttribute('viewtype'));"  name="field109221_8" id="field109221_8" value="8"  viewtype='1'  onclick="selectItemCheckChange(this,109221);checkinput2('field109221','field109221span',this.getAttribute('viewtype'));"">
<label for="field109221_8" >整备质量</label>
</div>
<div class="selectItemHorizontalDiv"><input type='checkbox' class="Inputstyle" style="height:auto;" viewtype="1" temptitle="更换项目（勾选，可多项勾选，其他可编辑）" onBlur="checkinput2('field109221','field109221span',this.getAttribute('viewtype'));"  name="field109221_9" id="field109221_9" value="9"  viewtype='1'  onclick="selectItemCheckChange(this,109221);checkinput2('field109221','field109221span',this.getAttribute('viewtype'));"">
<label for="field109221_9" >额定载质量</label>
</div>
<div class="selectItemHorizontalDiv"><input type='checkbox' class="Inputstyle" style="height:auto;" viewtype="1" temptitle="更换项目（勾选，可多项勾选，其他可编辑）" onBlur="checkinput2('field109221','field109221span',this.getAttribute('viewtype'));"  name="field109221_10" id="field109221_10" value="10"  viewtype='1'  onclick="selectItemCheckChange(this,109221);checkinput2('field109221','field109221span',this.getAttribute('viewtype'));"">
<label for="field109221_10" >轮距</label>
</div>
<div class="selectItemHorizontalDiv"><input type='checkbox' class="Inputstyle" style="height:auto;" viewtype="1" temptitle="更换项目（勾选，可多项勾选，其他可编辑）" onBlur="checkinput2('field109221','field109221span',this.getAttribute('viewtype'));"  name="field109221_11" id="field109221_11" value="11"  viewtype='1'  onclick="selectItemCheckChange(this,109221);checkinput2('field109221','field109221span',this.getAttribute('viewtype'));"">
<label for="field109221_11" >载客人数</label>
</div>
<div class="selectItemHorizontalDiv"><input type='checkbox' class="Inputstyle" style="height:auto;" viewtype="1" temptitle="更换项目（勾选，可多项勾选，其他可编辑）" onBlur="checkinput2('field109221','field109221span',this.getAttribute('viewtype'));"  name="field109221_12" id="field109221_12" value="12"  viewtype='1'  onclick="selectItemCheckChange(this,109221);checkinput2('field109221','field109221span',this.getAttribute('viewtype'));"">
<label for="field109221_12" >货箱内部尺寸</label>
</div>
<div class="selectItemHorizontalDiv"><input type='checkbox' class="Inputstyle" style="height:auto;" viewtype="1" temptitle="更换项目（勾选，可多项勾选，其他可编辑）" onBlur="checkinput2('field109221','field109221span',this.getAttribute('viewtype'));"  name="field109221_13" id="field109221_13" value="13"  viewtype='1'  onclick="selectItemCheckChange(this,109221);checkinput2('field109221','field109221span',this.getAttribute('viewtype'));"">
<label for="field109221_13" >轴距</label>
</div>
<div class="selectItemHorizontalDiv"><input type='checkbox' class="Inputstyle" style="height:auto;" viewtype="1" temptitle="更换项目（勾选，可多项勾选，其他可编辑）" onBlur="checkinput2('field109221','field109221span',this.getAttribute('viewtype'));"  name="field109221_14" id="field109221_14" value="14"  viewtype='1'  onclick="selectItemCheckChange(this,109221);checkinput2('field109221','field109221span',this.getAttribute('viewtype'));"">
<label for="field109221_14" >钢板弹簧片数</label>
</div>
<div class="selectItemHorizontalDiv"><input type='checkbox' class="Inputstyle" style="height:auto;" viewtype="1" temptitle="更换项目（勾选，可多项勾选，其他可编辑）" onBlur="checkinput2('field109221','field109221span',this.getAttribute('viewtype'));"  name="field109221_15" id="field109221_15" value="15"  viewtype='1'  onclick="selectItemCheckChange(this,109221);checkinput2('field109221','field109221span',this.getAttribute('viewtype'));"">
<label for="field109221_15" >车辆制造日期</label>
</div>
<div class="selectItemHorizontalDiv"><input type='checkbox' class="Inputstyle" style="height:auto;" viewtype="1" temptitle="更换项目（勾选，可多项勾选，其他可编辑）" onBlur="checkinput2('field109221','field109221span',this.getAttribute('viewtype'));"  name="field109221_16" id="field109221_16" value="16"  viewtype='1'  onclick="selectItemCheckChange(this,109221);checkinput2('field109221','field109221span',this.getAttribute('viewtype'));"">
<label for="field109221_16" >备注</label>
</div>
<div class="selectItemHorizontalDiv"><input type='checkbox' class="Inputstyle" style="height:auto;" viewtype="1" temptitle="更换项目（勾选，可多项勾选，其他可编辑）" onBlur="checkinput2('field109221','field109221span',this.getAttribute('viewtype'));"  name="field109221_17" id="field109221_17" value="17"  viewtype='1'  onclick="selectItemCheckChange(this,109221);checkinput2('field109221','field109221span',this.getAttribute('viewtype'));"">
<label for="field109221_17" >底盘号</label>
</div>
<div class="selectItemHorizontalDiv"><input type='checkbox' class="Inputstyle" style="height:auto;" viewtype="1" temptitle="更换项目（勾选，可多项勾选，其他可编辑）" onBlur="checkinput2('field109221','field109221span',this.getAttribute('viewtype'));"  name="field109221_18" id="field109221_18" value="18"  viewtype='1'  onclick="selectItemCheckChange(this,109221);checkinput2('field109221','field109221span',this.getAttribute('viewtype'));"">
<label for="field109221_18" >底盘合格证编号</label>
</div>
<div class="selectItemHorizontalDiv"><input type='checkbox' class="Inputstyle" style="height:auto;" viewtype="1" temptitle="更换项目（勾选，可多项勾选，其他可编辑）" onBlur="checkinput2('field109221','field109221span',this.getAttribute('viewtype'));"  name="field109221_19" id="field109221_19" value="19"  viewtype='1'  onclick="selectItemCheckChange(this,109221);checkinput2('field109221','field109221span',this.getAttribute('viewtype'));"">
<label for="field109221_19" >其他</label>
</div>
</div>
<input type="hidden" id="uploadMaxField" name="uploadMaxField" isedit="1" value="109221" />
<span id="field109221span"><img src='/images/BacoError_wev8.gif' align='absmiddle'></span>
<input type="hidden" id="field109221" name="field109221"  value="" viewtype='1' temptitle='更换项目（勾选，可多项勾选，其他可编辑）'/>
<input type="hidden" id="oldfieldview109221" name="oldfieldview109221" value="3" />

</span>
<span  class="span_mc mc_4_1 "  style="display:inline-block;"  _fieldid="49277" >
<input  fieldtype="1"  datatype="text" viewtype="0" type="text" class="Inputstyle" temptitle="其他" id="field49277" name="field49277" style="width:90%;" onChange="checkinput2('field49277','field49277span',this.getAttribute('viewtype'));checkLength('field49277','100','其他','文本长度不能超过','1个中文字符等于3个长度');" onBlur=""   onpropertychange="" _listener=""  onfocus="" onclick=""  ondblclick="" onmouseover="" onmouseout=""  value=""><span id="field49277span" style="word-break:break-all;word-wrap:break-word;"></span><input type="hidden" id="oldfieldview49277" name="oldfieldview49277" value="2" />
</span>

</div>
</td>
</tr>
<tr style="height:30px;" >
<td  class="td_edesign td_etype_2 mainTd_13_1" _fieldlabel="109223">
<div >
<span>情况说明</span>
</div>
</td>
<td  colspan="2" class="td_edesign td_etype_3 mainTd_13_2" id="field109223_tdwrap" _fieldid="109223" _cellattr="MAIN.C14">
<div >
<textarea class="Inputstyle" temptype="1" viewtype="0" temptitle="情况说明" id="field109223" name="field109223" rows="4"  onchange="checkinput2('field109223','field109223span',this.getAttribute('viewtype'));checkLength('field109223','0','情况说明','文本长度不能超过','1个中文字符等于3个长度');" cols="40"  onpropertychange="" _listener="" oninput="" onfocus="" onclick=""  ondblclick="" onmouseover="" onmouseout=""  style="width:80%;word-break:break-all;word-wrap:break-word"></textarea>
<span id="field109223span"></span>
</div>
</td>
</tr>
<tr style="height:30px;" >
<td  colspan="3" class="td_edesign td_etype_7 mainTd_14_1">
<div >
<div id="detailDiv_0" class="">
<table class="excelDetailTable" _seniorset="y" id="oTable0" name="oTable0" style="width:100%;"> 
 <tbody> 
  <tr name="controlwidth" style="height:0px !important;" class="exceldetailtitle"> 
   <td width="5.16%"></td> 
   <td width="5.06%"></td> 
   <td width="45.24%"></td> 
   <td width="44.52%"></td> 
  </tr> 
  <tr _target="headrow" class="exceldetailtitle " style="height:30px;"> 
   <td colspan="3" class="detail0_0_0 td_etype_1"> <span>更换内容</span> </td> 
   <td class="detail0_0_3 td_etype_10"> 
    <div id="div0button" class="detailButtonDiv" style="width:100px;"> 
     <button class="addbtn_p" type="button" id="$addbutton0$" name="addbutton0" onclick="addRow0(0);return false;" title="添加"></button> 
     <button class="delbtn_p" type="button" id="$delbutton0$" name="delbutton0" onclick="deleteRow0(0);return false;" title="删除"></button> 
    </div> </td> 
  </tr> 
  <tr _target="headrow" class="exceldetailtitle " style="height:30px;"> 
   <td class="detail0_1_0 td_etype_20"> <input type="checkbox" notbeauty="true" name="check_all_record" onclick="detailOperate.checkAllFun(0);" title="全选" /> </td> 
   <td class="detail0_1_1 td_etype_1"> <span>序号</span> </td> 
   <td class="detail0_1_2 td_etype_2"> <span>原车辆信息</span> </td> 
   <td class="detail0_1_3 td_etype_2"> <span>申请变更信息</span> </td> 
  </tr>  
 </tbody> 
</table>
</div>

</div>
</td>
</tr>
<tr style="height:30px;" >
<td  class="td_edesign td_etype_2 mainTd_15_0" _fieldlabel="49301">
<div >
<span>选择会签单位</span>
</div>
</td>
<td  class="td_edesign td_etype_3 mainTd_15_1" id="field49301_tdwrap" _fieldid="49301" _cellattr="MAIN.B16">
<div >
<div class='e8_os'  style='width:auto;min-width:210px;' >

<div class='e8_innerShow e8_innerShow_button e8_innerShow_button_right50' style='max-height:2178px;'><span class='e8_spanFloat'><span class='e8_browserSpan '><button class='e8_browflow' id='field49301_browserbtn' type='button' onclick="onShowBrowser2('49301','/systeminfo/BrowserMain.jsp?url=/hrm/resource/MutiResourceBrowser.jsp','/hrm/resource/HrmResource.jsp?id=','17',field49301.getAttribute('viewtype'));"></button></span><span class='e8_browserSpan '><button class='resAddGroupClass' title='新建' id='field49301_addbtn' type='button' onclick="showrescommongroup(this, 49301);"></button></span></span></div>
<div class='e8_innerShow e8_innerShowMust' style='max-height:2178px;'><span name='field49301spanimg'  class='e8_spanFloat' id='field49301spanimg' >
<img align='absmiddle' src='/images/BacoError_wev8.gif'></span></div><div class='e8_outScroll' id='outfield49301div' style='width:100%;margin-right:-50px;'><div class='e8_innerShow e8_innerShowContent' style='max-height:2178px; margin-right:50px;' id='innerContentfield49301div'><div style='margin-left:51px;' id='innerfield49301div' hasAdd=true hasBrowser=true><span style='float:none;'name='field49301span' id='field49301span' ></span>
<input onblur="__browserNamespace__.setAutocompleteOff(this)" type= 'text' value='' issingle=false class='e8_browserInputMore' name='field49301__' id='field49301__'  onpropertychange="wfbrowvaluechange(this,49301);"  onfocus="" onblur="" onclick="" ondblclick="" onmouseover="" onmouseout="" onkeydown="__browserNamespace__.delByBS(event,'field49301__',2,false,{});" /></div></div></div></div>

<script type='text/javascript'>
	jQuery('#field49301').val('');
window.setTimeout(function(){
	var isSingle=false;
var browserBoxId='';
var browserBox = null;
if(browserBoxId){
browserBox=jQuery('#'+browserBoxId);
}
if(!browserBox||browserBox.length()==0){
browserBox=jQuery('#field49301span').closest('div.e8_os');
}
var _this = browserBox;
if(isSingle=="false"||isSingle==false){
	browserBox.hover(function(){
if(!_this.data("_perfect")){
_this.find("#outfield49301div").perfectScrollbar();_this.data("_perfect",true);
}
},function(){});
};
browserBox.hover(function(){
if(!_this.data("_autocomplete")){
__browserNamespace__.hoverShowNameSpan(_this.find("span.e8_showNameClass"));__browserNamespace__.e8autocomplete({nameAndId:'field49301',inputNameAndId:'field49301__',isMustInput:2,hasAdd:true,completeUrl:"javascript:getajaxurl(17)",isSingle:false,extraParams:{"_exclude":"getNameAndIdVal"},row_height:22,linkUrl:"javascript:openhrm($id$)",needHidden:false,sb:{},_callback:'',_callbackParams:'',type:'17',browserBox:''});
__browserNamespace__.e8formatInitData({nameAndId:'field49301',name:'field49301',isMustInput:2,hasInput:true,browserBox:''});
_this.data("_autocomplete",true);
}
},function(){});},500);</script>
<input type="hidden" viewtype="1" id="field49301" name="field49301" value="" __value=""  temptitle="选择会签单位" onpropertychange="try{checkLengthbrow('field49301','field49301span','0','选择会签单位','文本长度不能超过','1个中文字符等于3个长度',field49301.getAttribute('viewtype'))}catch(e){}" _listener="try{checkLengthbrow('field49301','field49301span','0','选择会签单位','文本长度不能超过','1个中文字符等于3个长度',field49301.getAttribute('viewtype'))}catch(e){}" />
<input type="hidden" id="oldfieldview49301" name="oldfieldview49301" value="3" /> 
</div>
</td>
<td  class="td_edesign td_etype_2 mainTd_15_2" _fieldlabel="49303">
<div >
<span>选择分管领导</span>
</div>
</td>
<td  class="td_edesign td_etype_3 mainTd_15_3" id="field49303_tdwrap" _fieldid="49303" _cellattr="MAIN.D16">
<div >
<div class='e8_os'  style='width:auto;min-width:210px;' >

<div class='e8_innerShow e8_innerShow_button e8_innerShow_button_right50' style='max-height:2178px;'><span class='e8_spanFloat'><span class='e8_browserSpan '><button class='e8_browflow' id='field49303_browserbtn' type='button' onclick="onShowBrowser2('49303','/systeminfo/BrowserMain.jsp?url=/hrm/resource/MutiResourceBrowser.jsp','/hrm/resource/HrmResource.jsp?id=','17',field49303.getAttribute('viewtype'));"></button></span><span class='e8_browserSpan '><button class='resAddGroupClass' title='新建' id='field49303_addbtn' type='button' onclick="showrescommongroup(this, 49303);"></button></span></span></div>
<div class='e8_innerShow e8_innerShowMust' style='max-height:2178px;'><span name='field49303spanimg'  class='e8_spanFloat' id='field49303spanimg' >
<img align='absmiddle' src='/images/BacoError_wev8.gif'></span></div><div class='e8_outScroll' id='outfield49303div' style='width:100%;margin-right:-50px;'><div class='e8_innerShow e8_innerShowContent' style='max-height:2178px; margin-right:50px;' id='innerContentfield49303div'><div style='margin-left:51px;' id='innerfield49303div' hasAdd=true hasBrowser=true><span style='float:none;'name='field49303span' id='field49303span' ></span>
<input onblur="__browserNamespace__.setAutocompleteOff(this)" type= 'text' value='' issingle=false class='e8_browserInputMore' name='field49303__' id='field49303__'  onpropertychange="wfbrowvaluechange(this,49303);"  onfocus="" onblur="" onclick="" ondblclick="" onmouseover="" onmouseout="" onkeydown="__browserNamespace__.delByBS(event,'field49303__',2,false,{});" /></div></div></div></div>

<script type='text/javascript'>
	jQuery('#field49303').val('');
window.setTimeout(function(){
	var isSingle=false;
var browserBoxId='';
var browserBox = null;
if(browserBoxId){
browserBox=jQuery('#'+browserBoxId);
}
if(!browserBox||browserBox.length()==0){
browserBox=jQuery('#field49303span').closest('div.e8_os');
}
var _this = browserBox;
if(isSingle=="false"||isSingle==false){
	browserBox.hover(function(){
if(!_this.data("_perfect")){
_this.find("#outfield49303div").perfectScrollbar();_this.data("_perfect",true);
}
},function(){});
};
browserBox.hover(function(){
if(!_this.data("_autocomplete")){
__browserNamespace__.hoverShowNameSpan(_this.find("span.e8_showNameClass"));__browserNamespace__.e8autocomplete({nameAndId:'field49303',inputNameAndId:'field49303__',isMustInput:2,hasAdd:true,completeUrl:"javascript:getajaxurl(17)",isSingle:false,extraParams:{"_exclude":"getNameAndIdVal"},row_height:22,linkUrl:"javascript:openhrm($id$)",needHidden:false,sb:{},_callback:'',_callbackParams:'',type:'17',browserBox:''});
__browserNamespace__.e8formatInitData({nameAndId:'field49303',name:'field49303',isMustInput:2,hasInput:true,browserBox:''});
_this.data("_autocomplete",true);
}
},function(){});},500);</script>
<input type="hidden" viewtype="1" id="field49303" name="field49303" value="" __value=""  temptitle="选择分管领导" onpropertychange="try{checkLengthbrow('field49303','field49303span','0','选择分管领导','文本长度不能超过','1个中文字符等于3个长度',field49303.getAttribute('viewtype'))}catch(e){}" _listener="try{checkLengthbrow('field49303','field49303span','0','选择分管领导','文本长度不能超过','1个中文字符等于3个长度',field49303.getAttribute('viewtype'))}catch(e){}" />
<input type="hidden" id="oldfieldview49303" name="oldfieldview49303" value="3" /> 
</div>
</td>
</tr>
<tr style="height:30px;" >
<td  colspan="4" class="td_edesign td_etype_1 mainTd_16_0">
<div etypeisText="1">
<span>事业部（子公司）质量管理部部长/科长/授权人需会签</span>
</div>
</td>
</tr>
<tr style="height:30px;" >
<td  class="td_edesign td_etype_2 mainTd_17_0" _fieldlabel="49298">
<div >
<span>附件</span>
</div>
</td>
<td  colspan="3" class="td_edesign td_etype_3 mainTd_17_1" id="field49298_tdwrap" _fieldid="49298" _cellattr="MAIN.B18">
<div >
<table _target="mainFileUploadField" class="annexblocktblclass" cols="3" id="field49298_tab" style="border-collapse:collapse;border:0px;width:400px">
<tbody>
<col width="70%">
<col width="17%">
<col width="13%">
<tr>
<td colspan=3>
<TABLE class="ViewForm">
<tr>
<td colspan=2>
<div style="height: 32px;vertical-align:middle;">
<span id="uploadspan_49298" style="display:inline-block;line-height: 32px;">最大30M/个)</span>
<span id="field_49298span" style='display:inline-block;line-height: 32px;color:red !important;font-weight:normal;'>（必填）</span>
</div>
<div style="height: 30px;">
<div style="float:left;">
<span>
<span id="spanButtonPlaceHolder49298"></span>
</span>
</div>
<div style="width:10px!important;height:3px;float:left;"></div>
<div style="height: 30px;float:left;">
<button type="button" id="btnCancel49298" disabled="disabled" style="height:25px;text-align:center;vertical-align:middle;line-height:23px;background-color: #dfdfdf;color:#999999;padding:0 10px 0 4px;" onclick="clearAllQueue(oUpload49298);showmustinput(oUpload49298);" onmouseover="changebuttonon(this)" onmouseout="changebuttonout(this)"><img src='/images/ecology8/workflow/fileupload/clearallenable_wev8.png' style="width:20px;height:20px;" align=absMiddle>清除所有选择</button>
<span id="field49298spantest" style="display:none;" >
<img src='/images/BacoError_wev8.gif' align=absMiddle>
</span>
</div>
<div style="width:10px!important;height:3px;float:left;"></div>
<div style="height: 30px;float:left;">
</div>
<div style="clear:both;"></div>
</div>
<input  class=InputStyle  type=hidden size=60 name="field49298" id="field49298" temptitle="附件"  viewtype=1 value="">
</td>
</tr>
<tr>
<td colspan=2>
<div class="_uploadForClass">
<div class="fieldset flash" id="fsUploadProgress49298">
</div>
</div>
<div id="divStatus49298"></div>
</td>
</tr>
</TABLE>
<input type="hidden" id="mainId" name="mainId" value="2689">
<input type="hidden" id="subId" name="subId" value="2816">
<input type="hidden" id="secId" name="secId" value="2620">
</td>
</tr>
</TABLE>

</div>
</td>
</tr>
<tr style="height:30px;" >
<td  colspan="4" class="td_edesign td_etype_1 mainTd_18_0">
<div etypeisText="1">
<span>需上传车辆状态照片/视频、法规符合性证明材料、参数更换部分合规材料、整车VIN/ECU照片等。</span>
</div>
</td>
</tr>
<tr style="height:30px;" >
<td  class="td_edesign td_etype_2 mainTd_19_0" _fieldlabel="49299">
<div >
<span>本部门负责人意见</span>
</div>
</td>
<td  colspan="3" class="td_edesign td_etype_5 mainTd_19_1">
<div >
<input class="InputStyle" id="$node102984$" name="node102984" />
</div>
</td>
</tr>
<tr style="height:30px;" >
<td  class="td_edesign td_etype_2 mainTd_20_0" _fieldlabel="49300">
<div >
<span>相关单位会签</span>
</div>
</td>
<td  colspan="3" class="td_edesign td_etype_5 mainTd_20_1">
<div >
<input class="InputStyle" id="$node102985$" name="node102985" />
</div>
</td>
</tr>
<tr style="height:30px;" >
<td  class="td_edesign td_etype_2 mainTd_21_0" _fieldlabel="49302">
<div >
<span>事业部领导审核</span>
</div>
</td>
<td  colspan="3" class="td_edesign td_etype_5 mainTd_21_1">
<div >
<input class="InputStyle" id="$node102987$" name="node102987" />
</div>
</td>
</tr>
<tr style="height:30px;" >
<td  class="td_edesign td_etype_2 mainTd_22_0" _fieldlabel="49304">
<div >
<span>公司质量管理部批准</span>
</div>
</td>
<td  colspan="3" class="td_edesign td_etype_5 mainTd_22_1">
<div >
<input class="InputStyle" id="$node102986$" name="node102986" />
</div>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
<script lanuage=javascript>
/*
jQuery(document).ready(function(){
checkCustomize = function (){ 
//	var b= jQuery("#indexnum0").val()-1;
	for(var i = 0; i < $("#indexnum1").val(); i++)明细行索引{
        var a=jQuery("#field109224_"+i).val().length;   
             if(a!=17)
             {  alert("存在输入的VIN不是17位，请确认后重新输入!");
			 return;
			 }
else
{return true;}
}
}
});
*/

alert("start");
ModeForm.showMessage("结束时间需大于开始时间");
//var fieldvalue = ModeForm.getFieldValue("field49268");
alert(fieldvalue);
 </script>


</div>
<input type="hidden" id="edesign_layout" />
<script>
var runSubmitFormula = function(){
};
var runSaveFormula = function(){
};
var runRejectFormula = function(){
};
var runDoReview3Formula = function(){
};
var runSubmitDirectFormula = function(){
};
var runDoReviewFormula = function(){
};
var runDoReview2Formula = function(){
};
try{
	 var globalFormula = '{}';
	 globalFormula = JSON.parse(globalFormula);
}catch(e){}
jQuery(document).ready(function(){
	 readyOperate.execute(0); 
});
</script>


</body>
</html>
<script language="javascript">

function changeshowattr50771(){	changeshowattr('50771_0','',-1,80020,102983,true);
}	if (window.addEventListener){
	    window.addEventListener("load", changeshowattr50771, false);
	}else if (window.attachEvent){
	    window.attachEvent("onload", changeshowattr50771);
	}else{
	    window.onload=changeshowattr50771;
	}


function changeshowattr109221(){	changeshowattr('109221_0','',-1,80020,102983,true);
}	if (window.addEventListener){
	    window.addEventListener("load", changeshowattr109221, false);
	}else if (window.attachEvent){
	    window.attachEvent("onload", changeshowattr109221);
	}else{
	    window.onload=changeshowattr109221;
	}




	$G("htmlfieldids").value += "field109223;情况说明;1,";


























var oUpload49298;
function fileupload49298() {
 var settings = {
selectfieldid:"0",
uploadType:"0",
fieldid:"49298",
flash_url:"/js/swfupload/swfupload.swf",
upload_url:"/docs/docupload/MultiDocUploadByWorkflow.jsp",
post_params:{
	"mainId":"2689",
	"subId":"2816",
	"secId":"2620",
	"userid":"28525",
	"logintype":"1",
	"workflowid":"80020"
},
file_size_limit :"30 MB",
file_types : "*.*",
file_types_description : "All Files",
file_upload_limit : 100,
file_queue_limit : 0,
custom_settings : { 
	progressTarget : "fsUploadProgress49298",
	cancelButtonId : "btnCancel49298",
	uploadspan : "field_49298span",
	uploadfiedid : "field49298"
},
debug: false,
button_image_url : "/images/ecology8/workflow/fileupload/begin1_wev8.png",
button_placeholder_id : "spanButtonPlaceHolder49298",
button_width: 104,
button_height: 26,
button_text_top_padding: 0,
button_text_left_padding: 18,
button_window_mode: SWFUpload.WINDOW_MODE.TRANSPARENT,
button_cursor: SWFUpload.CURSOR.HAND,
file_queued_handler : fileQueued,
file_queue_error_handler : fileQueueError,
file_dialog_complete_handler : fileDialogComplete_1,
upload_start_handler : uploadStart,
upload_progress_handler : uploadProgress,
upload_error_handler : uploadError,
upload_success_handler : uploadSuccess_1,
upload_complete_handler : uploadComplete_1,
queue_complete_handler : queueComplete
};
try {
	oUpload49298=new SWFUpload(settings);
	mainUploadObjs.push(oUpload49298);
} catch(e) {
	alert(e)
}
}
	if (window.addEventListener){
	    window.addEventListener("load", fileupload49298, false);
	}else if (window.attachEvent){
	    window.attachEvent("onload", fileupload49298);
	}else{
	    window.onload=fileupload49298;
	}
jQuery(document).ready(function(){try{}catch(e){}});






function checktimeok(){
	if ("b"!="b" && "a"!="a" && document.frmmain.b.value!=""){
		YearFrom=document.frmmain.a.value.substring(0,4);
		MonthFrom=document.frmmain.a.value.substring(5,7);
		DayFrom=document.frmmain.a.value.substring(8,10);
		YearTo=document.frmmain.b.value.substring(0,4);
		MonthTo=document.frmmain.b.value.substring(5,7);
		DayTo=document.frmmain.b.value.substring(8,10);
		if(!DateCompare(YearFrom, MonthFrom, DayFrom,YearTo, MonthTo,DayTo )){
			window.top.Dialog.alert("结束时间不能小于起始时间");
			displayAllmenu();
			return false;
		}
	}
		return true;
}

function changeKeyword(){
}

function updateKeywordData(strKeyword){
}


function onShowKeyword(isbodymand){
}
var workflowId=80020;
var formId=-1787;
var isBill=1;
var yearId=-1;
var monthId=-1;
var dateId=-1;
var fieldId=-1;
var fieldValue=-1;
var supSubCompanyId=-1;
var subCompanyId=-1;
var departmentId=-1;
var recordId=-1;
var yearFieldValue=-1;
var yearFieldHtmlType=-1;
var monthFieldValue=-1;
var dateFieldValue=-1;
var createrdepartmentid=0;
function initDataForWorkflowCode(){
	yearId="";
	monthId="";
	dateId="";
	fieldId="";
	fieldValue="";
	supSubCompanyId="";
	subCompanyId="";
	departmentId="";
	recordId=-1;
	yearFieldValue=-1;
	yearFieldHtmlType=0;
	monthFieldValue=-1;
	dateFieldValue=-1;
	if( $GetEle("field")!=null){
	if(yearFieldHtmlType==5){//年份为下拉框
	try{
	objYear= $GetEle("field");
	yearId=objYear.options[objYear.selectedIndex].text;
	}catch(e){
	}
	}else{
	yearFieldValue= $GetEle("field").value;
	if(yearFieldValue.indexOf("-")>0){
	var yearFieldValueArray = yearFieldValue.split("-") ;
	if(yearFieldValueArray.length>=1){
	yearId=yearFieldValueArray[0];
	}
	}else{
	yearId=yearFieldValue;
	}
	}
	}
	if( $GetEle("field")!=null){
	monthFieldValue= $GetEle("field").value;
	if(monthFieldValue.indexOf("-")>0){
	var monthFieldValueArray = monthFieldValue.split("-") ;
	if(monthFieldValueArray.length>=2){
	monthId=monthFieldValueArray[1];
	}
	}
	}
	if( $GetEle("field")!=null){
	dateFieldValue= $GetEle("field").value;
	if(dateFieldValue.indexOf("-")>0){
	var dateFieldValueArray = dateFieldValue.split("-") ;
	if(dateFieldValueArray.length>=3){
	dateId=dateFieldValueArray[2];
	}
	}
	}
if( $GetEle("field")!=null){
	var fval = $GetEle("field-1").value;
	if(fval == ""){
	fval = "-1";
	}
	fieldId=-1;
	fieldValue= fval;
	}else{
	fieldId = "-1";
	fieldValue = "-1";
	}
	if( $GetEle("field")!=null){
	supSubCompanyId= $GetEle("field").value;
	}
	if(supSubCompanyId==""||(supSubCompanyId<=0&&supSubCompanyId>-1)){
	supSubCompanyId="-1";
	}
	if( $GetEle("field")!=null){
	subCompanyId= $GetEle("field").value;
	}
	if(subCompanyId==""||(subCompanyId<=0&&subCompanyId>-1)){
	subCompanyId="-1";
	}
	if( $GetEle("field")!=null){
	departmentId= $GetEle("field").value;
	}
	if(departmentId==""||(departmentId<=0&&departmentId>-1)){
	departmentId="-1";
	}
}
function onCreateCodeAgain(ismand){
	if($G("field")!=null&&$G("fieldspan")!=null){
		initDataForWorkflowCode();
		$G("workflowKeywordIframe").src="/workflow/request/WorkflowCodeIframe.jsp?operation=CreateCodeAgain&requestId=0&workflowId="+workflowId+"&formId="+formId+"&isBill="+isBill+"&yearId="+yearId+"&monthId="+monthId+"&dateId="+dateId+"&fieldId="+fieldId+"&fieldValue="+fieldValue+"&supSubCompanyId="+supSubCompanyId+"&subCompanyId="+subCompanyId+"&departmentId="+departmentId+"&recordId="+recordId+"&ismand="+ismand+"&createrdepartmentid="+createrdepartmentid;
	}
}
function onCreateCodeAgainReturn(newCode,ismand){
	if(typeof(newCode)!="undefined"&&newCode!=""){
		$G("field").value=newCode;
		$G("fieldspan").innerHTML='';
		if(parent.document.getElementById("requestmarkSpan")!=null){
			jQuery(parent.document.getElementById("requestmarkSpan")).text(newCode);
		}
	}
}
function onChooseReservedCode(ismand){
	if($G("field")!=null&&$G("fieldspan")!=null){
		initDataForWorkflowCode();
		var urls="/systeminfo/BrowserMain.jsp?url="+escape("/workflow/workflow/showChooseReservedCodeOperate.jsp?workflowId="+workflowId+"&formId="+formId+"&isBill="+isBill+"&yearId="+yearId+"&monthId="+monthId+"&dateId="+dateId+"&fieldId="+fieldId+"&fieldValue="+fieldValue+"&supSubCompanyId="+supSubCompanyId+"&subCompanyId="+subCompanyId+"&departmentId="+departmentId+"&recordId="+recordId+"&createrdepartmentid="+createrdepartmentid);
		var dialognew = new window.top.Dialog();
		dialognew.currentWindow = window;
		dialognew.URL = urls;
		dialognew.callbackfun = function (paramobj, con) {
		if(typeof(con)!="undefined"&&con!=""){
		var idanname = con.id+"~~wfcodecon~~"+con.name;
		initDataForWorkflowCode();
		$GetEle("workflowKeywordIframe").src="/workflow/request/WorkflowCodeIframe.jsp?operation=chooseReservedCode&requestId=0&workflowId="+workflowId+"&formId="+formId+"&isBill="+isBill+"&codeSeqReservedIdAndCode="+idanname+"&ismand="+ismand+"&createrdepartmentid="+createrdepartmentid;
		}
		} ;
		dialognew.Title = "选择预留号";
		dialognew.Modal = true;
		dialognew.Width = 550 ;
		dialognew.Height = 500 ;
		dialognew.isIframe=false;
		dialognew.show();
	}
}
function onNewReservedCode(ismand){
	initDataForWorkflowCode();
	var urls="/systeminfo/BrowserMain.jsp?url="+escape("/workflow/workflow/showNewReservedCodeOperate.jsp?workflowId="+workflowId+"&formId="+formId+"&isBill="+isBill+"&yearId="+yearId+"&monthId="+monthId+"&dateId="+dateId+"&fieldId="+fieldId+"&fieldValue="+fieldValue+"&supSubCompanyId="+supSubCompanyId+"&subCompanyId="+subCompanyId+"&departmentId="+departmentId+"&recordId="+recordId+"&createrdepartmentid="+createrdepartmentid);
	var dialognew = new window.top.Dialog();
	dialognew.currentWindow = window;
	dialognew.URL = urls;
	dialognew.Title = "新建预留号";
	dialognew.Modal = true;
	dialognew.Width = 550 ;
	dialognew.Height = 500 ;
	dialognew.isIframe=false;
	dialognew.show();
}

function showfieldpop(){
}

function dyniframesize(){
	var dyniframe;
}
if(window.addEventListener){
	window.addEventListener("load",dyniframesize,false);
}else if(window.attachEvent){
	window.attachEvent("onload",dyniframesize);
}else{
	window.onload=dyniframesize;
}

function addRow1(groupid){
	 var rowindex = parseInt($G("indexnum1").value);
	 var curindex = parseInt($G("nodesnum1").value);
	 var addRowHtmlStr = "<tr _target=\"datarow\" _rowindex=\""+rowindex+"\">  <td class=\"detail1_3_0 td_etype_21\"> <input type=\"checkbox\" notbeauty=\"true\" name=\"check_node_1\" value=\""+rowindex+"\" /><input type=\"hidden\" name=\"dtl_id_1_"+rowindex+"\" value=\"\" />   <div class=\"detailRowHideArea\"></div></td>  <td class=\"detail1_3_1 td_etype_22\"> <span name=\"detailIndexSpan1\">"+(curindex+1)+"</span> </td>  <td class=\"detail1_3_2 td_etype_3\" _cellattr=\"DETAIL_2.C4_"+rowindex+"\" _fieldid=\"109224_"+rowindex+"\" _fieldtype=\"1_1\"> <input  fieldtype='1'   class='Inputstyle' viewtype='1' datatype='text' type='text' temptitle='车辆VIN码' name='field109224_"+rowindex+"' id='field109224_"+rowindex+"'  style='width:90%;' value=\"\"  onBlur=''   onpropertychange=\"\" _listener=\"\" onfocus=\"\" onclick=\"\"  ondblclick=\"\" onmouseover=\"\" onmouseout=\"\"  onChange=\"checkinput2('field109224_"+rowindex+"','field109224_"+rowindex+"span',this.getAttribute('viewtype'));checkLength('field109224_"+rowindex+"','17','车辆VIN码','文本长度不能超过','1个中文字符等于3个长度');\"><span id='field109224_"+rowindex+"span' style=''><img src='/images/BacoError_wev8.gif' align='absmiddle'></span> </td> </tr>";
	 //操作主体放JS文件中
	 detailOperate.addRowOperDom(groupid, addRowHtmlStr);
	 $G("needcheck").value += ",field109224_"+rowindex+""
	 try{
		

	 }catch(e){}
	 var initDetailFields = "";
	 detailOperate.addRowExecFun(groupid, initDetailFields);
}
function deleteRow1(groupid, isfromsap){
	 //操作主体放JS文件中
	 detailOperate.delRowFun(groupid, isfromsap);
}
function addRow0(groupid){
	 var rowindex = parseInt($G("indexnum0").value);
	 var curindex = parseInt($G("nodesnum0").value);
	 var addRowHtmlStr = "<tr _target=\"datarow\" _rowindex=\""+rowindex+"\">  <td class=\"detail0_3_0 td_etype_21\"> <input type=\"checkbox\" notbeauty=\"true\" name=\"check_node_0\" value=\""+rowindex+"\" /><input type=\"hidden\" name=\"dtl_id_0_"+rowindex+"\" value=\"\" />   <div class=\"detailRowHideArea\"></div></td>  <td class=\"detail0_3_1 td_etype_22\"> <span name=\"detailIndexSpan0\">"+(curindex+1)+"</span> </td>  <td class=\"detail0_3_2 td_etype_3\" _cellattr=\"DETAIL_1.C4_"+rowindex+"\" _fieldid=\"49307_"+rowindex+"\" _fieldtype=\"2_1\"> <textarea class='Inputstyle' temptype='1' viewtype='1' temptitle='原车辆信息' id='field49307_"+rowindex+"' name='field49307_"+rowindex+"' onChange=\"checkinput2('field49307_"+rowindex+"','field49307_"+rowindex+"span',this.getAttribute('viewtype'));checkLength('field49307_"+rowindex+"','2000','原车辆信息','文本长度不能超过','1个中文字符等于3个长度')\" cols='40' rows='4' style='word-break:break-all;word-wrap:break-word;width:70%;'></textarea><span id='field49307_"+rowindex+"span'><img src='/images/BacoError_wev8.gif' align='absmiddle'></span> </td>  <td class=\"detail0_3_3 td_etype_3\" _cellattr=\"DETAIL_1.D4_"+rowindex+"\" _fieldid=\"49308_"+rowindex+"\" _fieldtype=\"2_1\"> <textarea class='Inputstyle' temptype='1' viewtype='1' temptitle='申请变更信息' id='field49308_"+rowindex+"' name='field49308_"+rowindex+"' onChange=\"checkinput2('field49308_"+rowindex+"','field49308_"+rowindex+"span',this.getAttribute('viewtype'));checkLength('field49308_"+rowindex+"','2000','申请变更信息','文本长度不能超过','1个中文字符等于3个长度')\" cols='40' rows='4' style='word-break:break-all;word-wrap:break-word;width:70%;'></textarea><span id='field49308_"+rowindex+"span'><img src='/images/BacoError_wev8.gif' align='absmiddle'></span> </td> </tr>";
	 //操作主体放JS文件中
	 detailOperate.addRowOperDom(groupid, addRowHtmlStr);
	 $G("needcheck").value += ",field49307_"+rowindex+",field49308_"+rowindex+""
	 try{
		
	 }catch(e){}
	 var initDetailFields = "";
	 detailOperate.addRowExecFun(groupid, initDetailFields);
}
function deleteRow0(groupid, isfromsap){
	 //操作主体放JS文件中
	 detailOperate.delRowFun(groupid, isfromsap);
}
function calSum(groupid){
	 //实现主体放在JS中
	 return calOperate.calSumFun(groupid);
}
jQuery(document).ready(function(){
	 calOperate.initCalRuleCfg('{"detail_1":{"colcal":"","rowcal":"","maincal":""},"detail_0":{"colcal":"","rowcal":"","maincal":""}}');

});



jQuery(document).ready(function(){
	try{
		createTags();
	}catch(e){}
	doDisableAll_s();
});

function doDisableAll_s(){
	jQuery("*").removeAttr("onchange");
	jQuery("*").removeAttr("onclick");
	jQuery("*").removeAttr("onBlur");
	jQuery("*").removeAttr("onKeyPress");
	jQuery("*").removeAttr("onpropertychange");
	jQuery("*").removeAttr("onfocus");
}
</script>