/* 添加多人员选择框 */
/* 添加多人员选择框 */
/* 添加多人员选择框 */

/// 追加人员
/// _id   多人员选择框的id
/// _data 数据
function addPeople(_id, _data){
	var _span = '', _text = '';
	for(var i = 0; i < _data.length; i++){
		_span += '<span class="e8_showNameClass"><a href="javascript:return false;" onclick="pointerXY(event);" disabled="true" target="_blank">' + _data[i].name + '</a>&nbsp;<span class="e8_delClass" id="' + _data[i].id + '" onclick="del(event,this,1,false,{});" style="opacity: 0; visibility: hidden;">&nbsp;x&nbsp;</span></span>';

		if(i > 0) _text += ",";
		_text += _data[i].id;
	}

	$("#" + _id + "span").html(_span); 
	$("#" + _id).val(_text); 
};
$(document).ready(function(){
	var _data = [{id: 24, name: 'AA'},{id: 26, name: 'BB'}];
	addPeople("field7922", _data);
});

//界面上有个name是lastloginuserid的input，它的值好像是当前操作者。