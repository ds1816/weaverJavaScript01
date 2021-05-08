/* 文件上传-改变的上传类型、单张上传 */
/* 文件上传-改变的上传类型、单张上传 */
/* 文件上传-改变的上传类型、单张上传 */

function changeFileType(_appendixId){
    var _base = $("#" + _appendixId + "_tab").find("input[type='file']");//获得附件所有行
    _base.removeAttr("multiple");                                        //改为单张上传
}

jQuery(document).ready(function(){
	setTimeout(function(){ changeFileType("field8479"); }, 500); //由于页面加载的问题，所以需要延长0.5S修改
});