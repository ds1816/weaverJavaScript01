/* 文件上传-明细中，单张上传 */
/* 文件上传-明细中，单张上传 */
/* 文件上传-明细中，单张上传 */

var _imgSelectId = "field8471";

function changeFileType(_appendixId){
	setTimeout(function(){ 
		var _base = $("table[id^='" + _appendixId + "']").find("input[type='file']");//获得附件所有行
		_base.removeAttr("multiple");                                                //改为单张上传
	}, 500); //由于页面加载的问题，所以需要延长0.5S修改
}

//页面加载时检查
jQuery(document).ready(function(){ changeFileType(_imgSelectId); });

//新增一行时检查
$("button[id='$addbutton0$']").click(function(){ changeFileType(_imgSelectId); });