/* 将下拉框改为radio按钮 */
/* 将下拉框改为radio按钮 */
/* 将下拉框改为radio按钮 */

$(document).ready(function(){
	initRadio("6536");
});

///初始化radio
function initRadio(_id){
	var optionList = $("#field" + _id).find("option"); //获得下拉框的option
	var str = "";         //radio字符串
	optionList.each(function(index, data){
		if(data.value == "") return true;
		if($("#field" + _id).val() == data.value) 
			str += "<input type='radio' name='U_radio" + _id + "' value='" + data.value + "' checked>" + data.innerText;
		else 
			str += "<input type='radio' name='U_radio" + _id + "' value='" + data.value + "'>" + data.innerText;
	});
	$("#field" + _id).hide();
	$("#field" + _id).after(str);

	///联动select的值
	$("input[name='U_radio" + _id + "']").change(function(){
		var _thisValue = $(this).val();
		$("#field" + _id).val(_thisValue);
		$("#field" + _id + "span").text("");
		$("#field" + _id).change();
	});
}
