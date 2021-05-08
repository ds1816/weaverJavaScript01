/* 提交时，根据check框，添加多人员选择框 */
/* 提交时，根据check框，添加多人员选择框 */
/* 提交时，根据check框，添加多人员选择框 */


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
	var _data = [{id: 24, name: 'AA'},{id: 26, name: 'BB'}];            //所有人员信息
	var _idList = [{id: "field8534", index: 1},{id: "field8535", index: 0}]; //check框对应的在_data里面的序号

	checkCustomize = function (){
		var _selectedData = [];
		for(var i = 0; i < _idList.length; i++){
			if($('#' + _idList[i].id).is(":checked"))  _selectedData.push(_data[_idList[i].index]);
		}
		addPeople("field7922", _selectedData);
		return true
	}
});