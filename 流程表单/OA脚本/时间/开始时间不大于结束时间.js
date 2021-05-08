/* 开始时间不大于结束时间 */
/* 开始时间不大于结束时间 */
/* 开始时间不大于结束时间 */

var beginTimeId = {id: "field7911", name: "开始时间"}; //开始Id
var endTimeId   = {id: "field7912", name: "结束时间"}; //结束Id

$(document).ready(function(){
	checkCustomize = checkChangeFunction; // 提交时检查
	$("#" + beginTimeId.id).bindPropertyChange(function(){ checkChangeFunction(); });// 选择开始时间时检查
	$("#" + endTimeId.id).bindPropertyChange(checkChangeFunction);  // 选择结束时间时检查
});

/// 具体方法
function checkChangeFunction(){
	var beginTime = new Date($("#" + beginTimeId.id).val()); //转换成日期类型
	var endTime = new Date($("#" + endTimeId.id).val());     //转换成日期类型
	return (beginTime > endTime) ? 
		( alert(beginTimeId.name + "不得大于" + endTimeId.name), false ): ( true );
}


//---------------------------------------------------------------------------------------------------
/* 开始日期时间不大于结束日期时间 */
/* 开始日期时间不大于结束日期时间 */
/* 开始日期时间不大于结束日期时间 */

var beginTimeId = {date: "field7911", time: "field8482"}; //开始
var endTimeId   = {date: "field7912", time: "field8483"}; //结束

$(document).ready(function(){
	checkCustomize = function (){
		var beginTime = new Date($("#" + beginTimeId.date).val() + " " +$("#" + beginTimeId.time).val()); //转换成日期类型
		var endTime = new Date($("#" + endTimeId.date).val() + " " +$("#" + endTimeId.time).val());     //转换成日期类型
		return (beginTime > endTime) ? 
			( alert("开始日期时间不大于结束日期时间"), false ): ( true );
	}; // 提交时检查
});