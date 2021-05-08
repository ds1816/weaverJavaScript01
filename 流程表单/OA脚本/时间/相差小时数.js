/* 相差小时数 */
/* 相差小时数 */
/* 相差小时数 */

var beginTimeId = "field8482"; //开始时间Id
var beginDateId = "field7911"; //开始日期Id
var endTimeId   = "field8483"; //结束时间Id
var endDateId   = "field7912"; //结束日期Id

$(document).ready(function(){
	checkCustomize = function(){
		var beginTime = new Date($("#" + beginTimeId).val() + " " + $("#" + beginDateId).val());
		var endTime = new Date($("#" + endTimeId).val() + " " + $("#" + endDateId).val());

		var differTime = endTime - beginTime;            //时间差的毫秒数
		var days = Math.floor(differTime / (3600*1000)); //时间差的小时数
		$("#field8170").val(days);
		return true;
	}
});