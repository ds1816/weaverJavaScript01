/* 明细中，check框保持单选 */
/* 明细中，check框保持单选 */
/* 明细中，check框保持单选 */

///下面两段代码二选一
/// 都适用
$(document).ready(function(){
	$("#detailDiv_0").delegate("input[id^='field8470_']", "change", function(){checkChangeFunction(this);})
});
/// 修改已有的check框
$(document).ready(function(){
	$("#detailDiv_0 input[id^='field8470_']").change(function(){ checkChangeFunction(this); });
});


/// 具体方法
function checkChangeFunction(_this){
	$("#detailDiv_0 input[type='checkbox'][id^='field8470_']").attr('checked',false);
	$(_this).attr('checked',true);
}