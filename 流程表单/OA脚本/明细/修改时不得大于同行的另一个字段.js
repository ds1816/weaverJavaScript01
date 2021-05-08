/* 修改时，不得大于同行的另一个字段值 */
/* 修改时，不得大于同行的另一个字段值 */
/* 修改时，不得大于同行的另一个字段值 */

$(document).ready(function(){
	$("#detailDiv_1").delegate("input[id^='field8679_']", "change", function(){
		var _thisValue = this.value;
		var _otherValue = $(this).parents("tr").eq(0).find("input[id^='field8678_']").val();
		if(parseInt(_otherValue) < parseInt(_thisValue)) {
			alert('请领数量不能大于库存量！');
			this.value = "";
		}
	})
});