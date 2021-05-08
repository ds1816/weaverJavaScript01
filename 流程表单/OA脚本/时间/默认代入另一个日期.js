/* 默认代入另一个日期 */
/* 默认代入另一个日期 */
/* 默认代入另一个日期 */

$(document).ready(function(){
	var _oldId = "field8444";
	var _newId = "field8464";

	$("#" + _newId).val($("#" + _oldId).val());
	$("#" + _newId + "span").text($("#" + _oldId + "span").text());
});