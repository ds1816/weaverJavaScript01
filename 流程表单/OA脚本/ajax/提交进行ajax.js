/* 提交的时候进行ajax */
/* 提交的时候进行ajax */
/* 提交的时候进行ajax */

$(document).ready(function(){
	checkCustomize = function (){
		var b = false;
		$.ajax({
	        type: "POST",
	        url: "/userDefined/java/getTime.jsp",
	        data: null,
	        async:false, 
	        contentType: "application/json",
	        success: function (result) {
	            b = true;
	        },
	        error: function (error) { }
	    })
	    return b;
	}
});