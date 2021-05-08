/* 明细中输入框符合正则 */
/* 明细中输入框符合正则 */
/* 明细中输入框符合正则 */

$(document).ready(function(){
	$("#detailDiv_0").delegate("input[id^='field8208_']", "change", function(){
		var b = /^[0-9]{5}$/.test($(this).val());
		if(b) return;
		else { alert("请输入5位数的内部码"); $(this).val(""); }
	})
});