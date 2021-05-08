/* 提交时检查所有行的金额为正数(千分位) */
/* 提交时检查所有行的金额为正数(千分位) */
/* 提交时检查所有行的金额为正数(千分位) */

$(document).ready(function(){
	checkCustomize = function (){
		var _id = "field8476";
		var _nodesnum0 = (document.getElementById("nodesnum0")) ?
						document.getElementById("nodesnum0").value * 1.0:
						0;
	    return checkMoney(_id, _nodesnum0);
  	};
});

/// 检查明细表中特定字段是否有值
/// _id   : 金额字段的id号
/// _num  : 明细表的行数
/// 返回值： 如果所有行金额都大于0，则返回true；否则返回false
function checkMoney(_id, _num){
	while(_num >= 1){
		var _value = $("#"+_id+"_"+(_num-1)).val();
		if(_value.replace(/,/g, '') < 0){
			alert("提醒：请检查金额需大于0");
			return false;
		}
		_num--;
	}
	return true;
}