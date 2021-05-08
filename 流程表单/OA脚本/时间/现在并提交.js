/* 确定当前时间并提交 获得当前时间 */
/* 确定当前时间并提交 获得当前时间 */
/* 确定当前时间并提交 获得当前时间 */

/// 主表中当只填写时间，可以提供 确定当前时间并提交 获得当前时间 按钮
/// 将 确定当前时间并提交 的class更改为 changeButton ，并添加自定义属性 submitNow 为 true
/// 将 获得当前时间 的class更改为 changeButton

var needWriteDateId = "7912"; //日期序号
var needWriteTimeId = "8483"; //时间序号

$(".changeButton").click(function(){
	//修改日期值
	var time = new Date();
	$("#field" + needWriteDateId).val(getDateYMD(time));
	$("#field" + needWriteDateId + "span").text(getDateYMD(time));
	$("#field" + needWriteTimeId).val(getTimeHM(time));
	$("#field" + needWriteTimeId + "span").text(getTimeHM(time));

	//触发提交按钮
	if($(this).attr("submitNow")){
		setTimeout(function(){
			parent.bodyiframe.doSubmitBack(this);
			parent.hideRightClickMenu();
		}, 1000);
	}
});

///将 _time 转换成 yyyy-mm-dd 类型
function getDateYMD(_time){
	var year = _time.getFullYear();
	var month = _time.getMonth()+1;
	var date = _time.getDate();

	return year + "-" + ((month < 10) ? ("0" + month): month) + "-" + ((date < 10) ? ("0" + date): date);
}

///将 _time 转换成 hh:mm 类型
function getTimeHM(_time){
	var hours = _time.getHours();
	var minutes = _time.getMinutes();

	return ((hours < 10) ? ("0" + hours): hours) + ":" + ((minutes < 10) ? ("0" + minutes): minutes);
}