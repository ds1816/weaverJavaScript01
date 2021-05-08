/* 根据主表勾选框，勾选时默认展示一行明细，否则清空并隐藏明细表 */
/* 根据主表勾选框，勾选时默认展示一行明细，否则清空并隐藏明细表 */
/* 根据主表勾选框，勾选时默认展示一行明细，否则清空并隐藏明细表 */

// 这里面存在一个问题就是，由于明细打开后会展示一行明细，再点击勾选框会清空并隐藏明细，此时会有一个确认删除的confirm框，这个框是系统自带的，无法去除。所以这个bug无法解决，请容忍。

$(document).ready(function(){
	$("#detailDiv_0").parents("tr").eq(0).hide(); //默认隐藏明细

	document.getElementById("field8475").onchange = function () {
		if($(this).is(":checked"))  hideDetail();
		else                        showDetail();
	};
});

///展示明细，并默认带出一行
function showDetail(){
	$("#detailDiv_0").parents("tr").eq(0).show();
	$("button[id='$addbutton0$']").click();
}

///清空并隐藏明细表
function hideDetail(){
	$("#detailDiv_0 input[name^='check_node_']").attr('checked', 'checked');

	$("button[id='$delbutton0$']").click();

	document.getElementById("nodesnum0").value = 0;
	document.getElementById("indexnum0").value = 0;

	$("#detailDiv_0").parents("tr").eq(0).hide();
}