/* 输入框验证电话 */
/* 输入框验证电话 */
/* 输入框验证电话 */

jQuery(document).ready(function(){
	checkCustomize = function(){
		var isPhone = /^([0-9]{3,4}-)?[0-9]{7,8}$/;//手机号码
		var isMob= /^0?1[3|4|5|8][0-9]\d{8}$/;// 座机格式
		var _val = $("#field7915").val();
		if(_val == "") return true;
		else if(isMob.test(_val) || isPhone.test(_val)) return true;
		else {
			alert("请填写正确的联系电话");
			return false;
		}
	};
});