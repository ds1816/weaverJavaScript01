/* 将明细表的其他行的数据放为本输入框的选项 */
/* 将明细表的其他行的数据放为本输入框的选项 */
/* 将明细表的其他行的数据放为本输入框的选项 */


$(document).ready(function(){
	var _detailId = 1; //明细表id，明细表1此值为0
	var _inputId = "10270"; //输入框的id
	var _findId = "10270";  //输入框的数据来源id

	$("#detailDiv_" + _detailId).delegate("input[id^='field" + _inputId + "_']", "focus", function(){
		var allCount = $("#nodesnum" + _detailId).val();      //总行数

		///创建下拉列表内容
		var str = "";
		for(var i = 0; i < allCount; i++){
			if($("#field" + _findId + "_" + i).length == 0) continue; //如果元素被删除，则跳过
			if($("#field" + _findId + "_" + i).val() == "") continue; //如果无值，也跳过

			str += "<option>" + $("#field" + _findId + "_" + i).val() + "</option>";
		}

		var index = this.id.split("_")[1]; //获得序号
		//如果有下拉列表，则直接修改值；否则加入元素
		if($("#field" + _inputId + "_" + index + "List").length == 0)
			$(this).parent().append("<datalist  id='field" + _inputId + "_" + index + "List'>" + str + "</datalist >");
		else $("#field" + _inputId + "_" + index + "List").html(str);
		//将下拉列表和输入框联动
		this.setAttribute("list","field" + _inputId + "_" + index + "List");
	})
});