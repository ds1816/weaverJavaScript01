/* 提交时检查所有行的特定字段为正数(浮点数、整数) */
/* 提交时检查所有行的特定字段为正数(浮点数、整数) */
/* 提交时检查所有行的特定字段为正数(浮点数、整数) */

$(document).ready(function(){
	checkCustomize = function (){
		///检查明细表的天数 公里数大于0
		var _idList = [{id: "field8567", text: "预计使用公里数"}, {id: "field8578", text: "使用天数"}];
		var _nodesnum0 = (document.getElementById("nodesnum0")) ?
						document.getElementById("nodesnum0").value:
						0;
	    return checkText(_idList, _nodesnum0);
  	};
});

/// 检查明细表中特定字段是否有值
/// _idList : 需检查的字段的id列表
/// _num    : 明细表的行数
/// 返回值  ： 如果所有都大于0，则返回true；否则返回false
function checkText(_idList, _num){
	if(_idList.length <= 0) return; //如果无数据，则结束

	while(_num >= 1){
		if(jQuery("#"+_idList[0].id+"_"+(_num-1)).length > 0) { //检查有数据
			for(var i = 0; i < _idList.length; i++){
				//检查大于0
				if((jQuery("#"+_idList[i].id+"_"+(_num-1)).length > 0) && (jQuery("#"+_idList[i].id+"_"+(_num-1)).val() < 0)){
					alert("提醒：请检查" + _idList[i].text + "需大于0");
					return false;
				}
			}
		}

		_num--;
	}
	return true;
}