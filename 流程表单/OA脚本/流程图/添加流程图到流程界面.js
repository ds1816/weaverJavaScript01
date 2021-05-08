///模拟点击事件生成流程图
var baseFrame = $(window.parent.document).find(".tab_menu");
baseFrame.children().eq(1).children().eq(0).click(); //展示流程图
$(window.parent.document).find("#divWfPic").hide();  //隐藏流程图
$(window.parent.document).find("#divWfBill").show();  //隐藏流程图

///需要设置流程图放入的区域id为overflowPic
$(document).ready(function(){
	//由于生成流程图需要一段时间，所以要延长一段时间
	setTimeout(function(){
		//找到canvas
		var pic = $(window.parent.document.getElementById("piciframe")).contents().find("#mainArea");

		//生成图片
		var _img = document.createElement("img");
		_img.src = pic[0].toDataURL("image/png");
		$('#overflowPic').append(_img);
	}, 500);
});