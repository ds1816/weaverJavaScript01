/* 判断时间范围1是否在时间范围2中，更改提示文字 */
/* 判断时间范围1是否在时间范围2中，更改提示文字 */
/* 判断时间范围1是否在时间范围2中，更改提示文字 */

/// 注意： 请先将提示文字区域的 class 设置为 promptText
/// 如果判断时间范围1在时间范围2中，则隐藏提示文字行
/// 否则，则更改提示文字为【注：本表单请假时间和实际情况可能存在出入，请重点注意】
jQuery(document).ready(function(){
	var _beginDateId1 = "field8566", _beginDateId2 = "field8586";
	var _beginTimeId1 = "field8567", _beginTimeId2 = "field8587";
	var _endDateId1   = "field8568", _endDateId2   = "field8588";
	var _endTimeId1   = "field8569", _endTimeId2   = "field8589";

	var isError = checkDate($("#" + _beginDateId1).val(), $("#" + _beginDateId2).val(), $("#" + _beginTimeId1).val(), $("#" + _beginTimeId2).val(), $("#" + _endDateId1).val(), $("#" + _endDateId2).val(), $("#" + _endTimeId1).val(), $("#" + _endTimeId2).val());
	if(!isError){
		$(".promptText").parents("tr").eq(0).hide();
	} else {
		$(".promptText").text("【注：本表单请假时间和实际情况可能存在出入，请重点注意】");
	}
});

/// 检查时间2是否在时间1范围内
/// _beginDate1 _beginTime1 时间1的开始日期、时间
/// _beginDate2 _beginTime2 时间2的开始日期、时间
/// _endDate1 _endTime1 时间1的结束日期、时间
/// _endDate2 _endTime2 时间2的结束日期、时间
/// 在范围内返回false,否则返回true
function checkDate(_beginDate1, _beginDate2, _beginTime1, _beginTime2, _endDate1, _endDate2, _endTime1, _endTime2){
	console.log(_beginDate1, _beginDate2, _beginTime1, _beginTime2, _endDate1, _endDate2, _endTime1, _endTime2);
	var isError = false;

	//检查开始时间
	if(_beginDate1 > _beginDate2) { isError = true;console.log(1); }
	else if(_beginDate1 == _beginDate2){ 
		if(_beginTime1 > _beginTime2) { isError = true;console.log(2); }
		console.log(3);
	}

	//检查结束时间
	if(_endDate1 < _endDate2) { isError = true; console.log(4); }
	else if(_endDate1 == _endDate2){ 
		if(_endTime1 < _endTime2) { isError = true; console.log(5); }
		console.log(6);
	}

	return isError;
}