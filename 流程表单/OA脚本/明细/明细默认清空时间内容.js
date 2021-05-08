/* 明细默认清空时间 */
/* 明细默认清空时间 */
/* 明细默认清空时间 */

function clearText(){
	var lastIndex = parseInt($("#nodesnum0").val()) - 1;
	$("#field8734_" + lastIndex).val("");
	$("#field8734_" + lastIndex + "span").text("");
}

//页面加载时检查
jQuery(document).ready(function(){ 
	setTimeout(function(){ clearText(); }, 500);
});

//新增一行时检查
$("button[id='$addbutton0$']").click(function(){ clearText(); });