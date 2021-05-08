/* 根据勾选框，展示时默认展示一行，隐藏时清空明细表 */
/* 根据勾选框，展示时默认展示一行，隐藏时清空明细表 */
/* 根据勾选框，展示时默认展示一行，隐藏时清空明细表 */

$(document).ready(function(){
	document.getElementById("field8475").onchange = function () {
		if($(this).is(":checked"))  changeType("field8474", 0);
		else                        changeType("field8474", 1);

		
		$("#detailDiv_0 tr[_rowindex]").remove();
		document.getElementById("nodesnum0").value = 0;
		document.getElementById("indexnum0").value = 0;
	};
});

/// 转换输入框的类型
/// id    :id号，需要包含field
/// toType: 1为必填 0为非必填
function changeType(id, toType){
	if(toType == 1){
		$("#" + id + "span").html('<img src="/images/BacoError_wev8.gif" align="absmiddle">');
		$("#" + id).attr('viewtype','1');

		//修改验证input的值
		var baseText = $("input[name='needcheck']").val();
		var result = (baseText == "")? id: (baseText + "," + id);
		$("input[name='needcheck']").val(result);
	} else {
		$("#" + id + "span").html('');
		$("#" + id).attr('viewtype','0');

		//修改验证input的值
		var baseText = $("input[name='needcheck']").val();
		var baseList = baseText.split(',');
		for(var i = baseList.length - 1; i >= 0 ; i--){
			var data = baseList[i].trim();
			if((data == id) || (data == ""))
				baseList.splice(i, 1);
		}
		$("input[name='needcheck']").val(baseList.join(','));
	}
}