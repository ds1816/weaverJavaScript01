/* 获得多人员选择框的人员数量 */
/* 获得多人员选择框的人员数量 */
/* 获得多人员选择框的人员数量 */

$(document).ready(function(){
	$("#field7578").bindPropertyChange(function(){
		var list = $("#field7578").val();
		var count = list.split(",").length;
		$("#field7579").val(count);
  	});
});