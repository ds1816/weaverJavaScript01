/* 获得修改行的序号 */
/* 获得修改行的序号 */
/* 获得修改行的序号 */

$(document).ready(function(){
	$("#detailDiv_1").delegate("input[id^='field8732_']", "change", function(){
		var _num = $(this).parents('tr[_target="datarow"]').eq(0).find('span[name="detailIndexSpan1"]').html();
		console.log(_num);
	})
});