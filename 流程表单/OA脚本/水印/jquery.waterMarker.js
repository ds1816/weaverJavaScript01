(function($) {
	var setting = {
		width: "360px",
		height: "300px",
		backgroundColor: "rgba(244, 244, 245, 1)",
		waterMarkerColor: "rgba(231, 231, 232, 1)",
		waterMarkerFont: "60px 黑体",
		waterMarkerTimeFont: "30px 'Helvetica Neue', Helvetica, Arial, sans-serif",
		rotate: -40
	};
	
	// 对Date的扩展，将 Date 转化为指定格式的String
	// 月(M)、日(d)、小时(H/h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
	// 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
	// 例子：
	// (new Date()).format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
	// (new Date()).format("yyyy-MM-dd HH:mm:ss.S") ==> 2006-07-02 08:09:04.423
	// (new Date()).format("yyyy-MM-dd HH:mm:ss.S") ==> 2006-07-02 08:09:04.423
	// (new Date()).format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18
	// author: meizz
	Date.prototype.format = function(fmt) {
		var o = {
			"M+" : this.getMonth() + 1,												// 月份
			"d+" : this.getDate(),													// 日
//			"H+" : this.getHours(),													// 小时（24小时制）
//			"h+" : this.getHours() > 12 ? this.getHours() - 12 : this.getHours(),	// 小时（12小时制）
			"h+" : this.getHours(),													// 小时（24小时制）
			"m+" : this.getMinutes(),												// 分
			"s+" : this.getSeconds(),												// 秒
			"q+" : Math.floor((this.getMonth() + 3) / 3),							// 季度
			"S"  : this.getMilliseconds()											// 毫秒
		};
		if (/(y+)/.test(fmt))
			fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
		for (var k in o)
			if (new RegExp("("+ k +")").test(fmt))
				fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
		return fmt;
	};
	
	$.waterMarker = function(text) {
		if (text == null || $.trim(text) == "") {
			return;
		}
		var random = new Date().getTime();
		var canvas = $("<canvas id=\"canvas_" + random + "\" width=\"" + setting.width + "\" height=\"" + setting.height + "\"></canvas>")[0];
		var context2D = canvas.getContext("2d");
		var length = $.trim(text).length;
		context2D.fillStyle = setting.backgroundColor;
		context2D.fillRect(0, 0, canvas.width, canvas.height);
		context2D.rotate(setting.rotate * Math.PI / 180);
		context2D.translate(-150, 80);
		context2D.font = setting.waterMarkerFont; 
		context2D.fillStyle = setting.waterMarkerColor;
		context2D.fillText(text, (canvas.width / 2) - length * 30, (canvas.height / 2) - 10); 
		context2D.font = setting.waterMarkerTimeFont;
		context2D.fillText((new Date()).format("yyyy-MM-dd hh:mm"), (canvas.width / 2) - 120, (canvas.height / 2) + 30);
		$("body").css("cssText","background:url("+ canvas.toDataURL("image/png") + ") !important;");
		$("body").css({"background-position":"top center"});
	};
})(jQuery);