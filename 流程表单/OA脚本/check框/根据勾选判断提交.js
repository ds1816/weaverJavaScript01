/* 勾选即可提交 */
/* 勾选即可提交 */
/* 勾选即可提交 */

$(document).ready(function(){
	var checkBox = { id: "field8475", name: "确认归还" };

	checkCustomize = function (){
		if(!$('#' + checkBox.id).is(":checked")) {
			alert("请勾选" + checkBox.name);
			return false;
		} else{
			return true;
		}
	}
});