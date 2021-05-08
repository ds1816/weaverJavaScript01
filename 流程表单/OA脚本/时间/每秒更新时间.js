/* 每秒更新时间 */
/* 每秒更新时间 */
/* 每秒更新时间 */

$(document).ready(function(){
	showtime();
	setInterval("showtime()",1000);
});
function showtime() {
	var date = new Date();
	var _text = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate() + " " + date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
	document.getElementById("field6321span").innerText = _text
	document.getElementById("field6321").value = _text
}