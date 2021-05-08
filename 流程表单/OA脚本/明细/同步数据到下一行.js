/* 同步上一行数据到下一行 */
/* 同步上一行数据到下一行 */
/* 同步上一行数据到下一行 */

$(document).ready(function(){
	var detailList = [8476, 8349];//同步的输入框的id

	$("button[id='$addbutton0$']").click(function(){ 
		var trList = $("#detailDiv_0 tr[_rowindex]");//所有明细行
		var baseIndex = $(trList[trList.length - 2]).attr("_rowindex");//最后一行数据
		var newIndex = $(trList[trList.length - 1]).attr("_rowindex"); //新增行的数据

		//遍历并赋值
		for(var i = 0; i < detailList.length; i++){
			$("#field" + detailList[i] + "_" + newIndex + "span").val($("#field" + detailList[i] + "_" + baseIndex + "span").val());
			$("#field" + detailList[i] + "_" + newIndex).val($("#field" + detailList[i] + "_" + baseIndex).val());
		}
	})
});