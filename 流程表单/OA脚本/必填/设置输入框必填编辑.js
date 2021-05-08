/* js转换输入框必填编辑 */
/* js转换输入框必填编辑 */
/* js转换输入框必填编辑 */

$(document).ready(function(){
	//field7915为输入框
	changeType("field7915", 0, 0); //field7915原来是编辑字段，需要修改为必填字段
	changeType("field7915", 0, 1); //field7915原来是编辑字段，需要修改为必填字段
	//field8348为人力选择框
	changeType("field8348", 1, 0); //field8348原来是必填字段，需要修改为编辑字段
	changeType("field8348", 0, 1); //field8348原来是编辑字段，需要修改为必填字段
});

/// 转换输入框的类型
/// id    :id号，需要包含field
/// type  : 0 输入框 1人力选择框
/// toType: 1为必填 0为非必填
function changeType(id, type, toType){
	if(toType == 1){
		if(type == 0) $("#" + id + "span").html('<img src="/images/BacoError_wev8.gif" align="absmiddle">');
		else $("#" + id + "spanimg").html('<img align="absmiddle" src="/images/BacoError_wev8.gif">');

		$("#" + id).attr('viewtype','1');

		//修改验证input的值
		var baseText = $("input[name='needcheck']").val();
		var result = (baseText == "")? id: (baseText + "," + id);
		$("input[name='needcheck']").val(result);
	} else {
		if(type == 0)  $("#" + id + "span").html('');
		else $("#" + id + "spanimg").html('');

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