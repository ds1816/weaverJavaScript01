/* 根据下拉框的值，更改提示文字 */
/* 根据下拉框的值，更改提示文字 */
/* 根据下拉框的值，更改提示文字 */

/// 如果下拉框value为0，则隐藏提示文字行
/// 如果下拉框value为1，则更改提示文字为【注：本表单为事后补单，请重点注意】
/// 注意： 请先将提示文字区域的 class 设置为 promptText
jQuery(document).ready(function(){
	var _selectId = "field8581";
	if($("#" + _selectId).val() == 0){
		$(".promptText").parents("tr").eq(0).hide();
	} else {
		$(".promptText").text("【注：本表单为事后补单，请重点注意】");
	}
});