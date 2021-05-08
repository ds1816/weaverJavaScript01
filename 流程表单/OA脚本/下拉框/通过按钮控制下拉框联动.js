///通过按钮控制下拉框的值
///每个按钮设置data-index
///设置class为h_likeButton

var _selectId = "field7986";
$(".h_likeButton").click(function(){
	//添加选中样式
	$(".j_selectButton").removeClass("j_selectButton");
	$(this).addClass("j_selectButton");

	//联动下拉框的内容
	$("#" + _selectId).val($(this).data("index"));

	//提交
	doSubmit(this);
});

//页面加载的时候初始化样式
$(document).ready(function(){
	var data = $("#" + _selectId).val();
	if(data == "") return;
	$(".h_likeButton").each(function(index, ele){
		if($(ele).data("index") == data) $(ele).addClass("j_selectButton");
	});
});