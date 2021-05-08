/* 确定系统时间并提交 获得当前系统时间 */
/* 确定系统时间并提交 获得当前系统时间 */
/* 确定系统时间并提交 获得当前系统时间 */

/// 主表中当只填写时间，可以提供 确定系统时间并提交 获得当前系统时间 按钮
/// 将 确定系统时间并提交 的class更改为 changeButton ，并添加自定义属性 submitNow 为 true
/// 将 获得当前系统时间 的class更改为 changeButton
$(".changeButton").click(function(){
	var _this = this;
	$.ajax({
		type: "POST",
		url: "/userDefined/java/getTime.jsp?F=yyyy-MM-dd HH:mm",
		data: null,
		contentType: "application/json",
		success: function (result) {
			//修改日期值
			var timeList = result.split(" ");
			$("#field7912").val(timeList[0]);
			$("#field7912span").text(timeList[0]);
			$("#field8483").val(timeList[1]);
			$("#field8483span").text(timeList[1]);

			//触发提交按钮
			if($(_this).attr("submitNow")){
				setTimeout(function(){
					parent.bodyiframe.doSubmitBack(_this);
					parent.hideRightClickMenu();
				}, 1000);
			}
		},
		error: function (error) {
			alert('系统时间获取失败');
		}
	})
});