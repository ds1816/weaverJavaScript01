/* 根据多选框是否勾选，显示隐藏 */
/* 根据多选框是否勾选，显示隐藏 */
/* 根据多选框是否勾选，显示隐藏 */

///勾选多选框则显示其他内容，否则隐藏内容
$(document).ready(function(){
	var showOrHiddenId = "field7915";
	document.getElementById("field7913").onchange = function () {
		//由于触发的时候框的值还未改，所以是根据之前的值更改的
		if($(this).is(":checked")) $("#" + showOrHiddenId).hide();
		else                       $("#" + showOrHiddenId).show();
	};
});


///勾选多选框则显示其他内容，否则隐藏内容
$(document).ready(function(){
	var showOrHiddenId = "field7915";
	document.getElementById("field7913").onchange = function () {
		//由于触发的时候框的值还未改，所以是根据之前的值更改的
		if($(this).is(":checked")) $("#" + showOrHiddenId).parents("tr").eq(0).hide();
		else                       $("#" + showOrHiddenId).parents("tr").eq(0).show();
	};
});