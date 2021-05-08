/* 根据浏览框的选择，清空明细表 */
/* 根据浏览框的选择，清空明细表 */
/* 根据浏览框的选择，清空明细表 */

$(document).ready(function(){
	$("#field7578").bindPropertyChange(function(){
		$("#detailDiv_0 tr[_rowindex]").remove();
		document.getElementById("nodesnum0").value = 0;
		document.getElementById("indexnum0").value = 0;
	});
});