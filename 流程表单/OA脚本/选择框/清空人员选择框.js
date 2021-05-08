/* 清空人员选择框的值 */
/* 清空人员选择框的值 */
/* 清空人员选择框的值 */


/// 方法一： 手工清除内容
function deleteWay1(){
	var _id = "field7921";
	$("#" + _id + "span").html(""); 
	$("#" + _id).val(""); 
};

/// 方法二： 使用框中的删除按钮
function deleteWay2(){
	var _id = "field7922";
	var list = $("#" + _id + "span").children(); 
	list.each(function(index, ele){
		$(ele).children("span").click();
	})
};