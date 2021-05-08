/* c是A-B */
/* c是A-B */
/* c是A-B */

$(document).ready(function(){
	$("#detailDiv_0").delegate("input[id^='field10041_']", "change", function(){
		var parentEle = $(this).parents("tr").eq(0);
		parentEle.find("input[id^='field9813_']").val(
			this.value + '-' +
			parentEle.find("input[id^='field9812_']").val()
		);
	});

	$("#detailDiv_0").delegate("input[id^='field9812_']", "change", function(){
		var parentEle = $(this).parents("tr").eq(0);
		parentEle.find("input[id^='field9813_']").val(
			parentEle.find("input[id^='field10041_']").val() + '-' +
			this.value
		);
	});
});