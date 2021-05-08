/* 明细中，根据单选的结果，将明细中的内容给主表 */
/* 明细中，根据单选的结果，将明细中的内容给主表 */
/* 明细中，根据单选的结果，将明细中的内容给主表 */

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
	var _content = [
		{
			detailIdPart: "field8349", ///明细id
			mainId: "field8473",       ///主表id
			detailType: "input"        ///类型
		},{
			detailIdPart: "field8350",
			mainId: "field8474",
			detailType: "input"
		}
	];

	// 控制单选
	$("input[id^='field8470_']").attr('checked',false);
	$(this).attr('checked',true);

	// 将fileId赋给主表
	var _tr = $(this).parents("tr").eq(0);
	for(var i = 0; i < _content.length; i++){
		var _value = _tr.find(_content[i].detailType + "[id^='" + _content[i].detailIdPart + "']").val();
		$("#" + _content[i].mainId).val(_value);
	}
}