/* 至少勾选n项 */
/* 至少勾选n项 */
/* 至少勾选n项 */

$(document).ready(function(){
	var checkBoxList = ["field8730", "field8731", "field7913"];

	checkCustomize = function (){
		return checkCount(checkBoxList, 1);
	}
});

function checkCount(checkBoxList, needCheckedCount){
	//获得勾选的数目
	var count = 0;
	for(var i = 0; i < checkBoxList.length; i++){
		if($('#' + checkBoxList[i]).is(":checked")) count++;
	}

	//如果选择数量少于needCheckedCount个，则提示并返回false。否则返回true
	if(count < needCheckedCount){
		alert("请至少选择" + needCheckedCount + "个");
		return false;
	} else {
		return true;
	}
}