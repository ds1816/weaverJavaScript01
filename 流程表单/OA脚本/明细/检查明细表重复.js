/* 检查明细表重复 */
/* 检查明细表重复 */
/* 检查明细表重复 */
$(document).ready(function(){
	$("#detailDiv_0").delegate("input[id^='field10735_']", "blur", function(){
		var _thisValue = this.value;


		///创建下拉列表内容
		var str = "";
		for(var i = 0; i < $("#nodesnum0").val(); i++){
			if($("#field10735_" + i).length == 0) continue; //如果元素被删除，则跳过
			if(i == this.id.split("_")[1]) continue; //如果是本元素，则跳过
			if($("#field10735_" + i).val() == $(this).val()) {
				alert("数据重复");
				return;
			}
		}
	})
});