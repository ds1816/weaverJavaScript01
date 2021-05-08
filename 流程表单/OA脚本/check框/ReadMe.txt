注意：
	1、如果是明细表中一直存在的check框
		$("").bind("change", function(){});
	2、如果是明细表中的新增字段
		$("").delegate("input", "change", function(){});

	3、如果check框在主表中，不能直接使用
		$("#field8475").change(function(){});