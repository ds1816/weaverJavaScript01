/* 获得人员选择框的值 */
/* 获得人员选择框的值 */
/* 获得人员选择框的值 */


/// 获得单人力资源选择框的值
/// 备注：请先将框的class设置为 j_people
function getOneName(){
	var name = $(".j_person .e8_showNameClass a:eq(1)").text(); 
	return name;
};

/// 获得多人力资源选择框的值
/// 备注：请先将框的class设置为 j_people
function getNameList(){
	var list = $(".j_people .e8_showNameClass");
	var nameList = [];
	list.each(function(){
		nameList.push($(this).find("a:eq(0)").text());
	});
	return nameList;
};