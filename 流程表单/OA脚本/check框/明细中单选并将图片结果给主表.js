/* 明细中，根据单选的结果，将明细中的图片内容给主表 */
/* 明细中，根据单选的结果，将明细中的图片内容给主表 */
/* 明细中，根据单选的结果，将明细中的图片内容给主表 */

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
	var _content = {
		detailIdPart: "field8471",
		mainId: "field8472"
	};

	// 控制单选
	$("input[type='checkbox'][id^='field8470_']").attr('checked',false);
	$(_this).attr('checked',true);

	// 将fileId赋给主表
	var _tr = $(_this).parents("tr").eq(0);
	var _imgList = _tr.find("table[id^='" + _content.detailIdPart + "']").find("img");
	var _value = "";
	_imgList.each(function(index, obj){
		if(index != 0) _value += ",";
		_value += $(obj).attr("_fileid");
	})
	$("#" + _content.mainId).val(_value);
}