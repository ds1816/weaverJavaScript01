///图片类的附件，需要直观的展示图片信息
jQuery(document).ready(function(){
    //addImgInRow("field6325");
    //addImgInBlock("field6325", "picPart");
    addImgInDetail("field7981", "picPart");
});

/* 测试1：openAccessory(""); 火狐会出现弹出下载界面的问题 */
/* 测试2：window.open(_src, 'big', 'fullscreen=yes'); 火狐会出现弹出下载界面的问题 */

///根据附件id构造图片字符串
function createAppendixStr(_fieldId){
    var _userId = wf__info.f_bel_userid;    //获得用户id
    var _requestId = $("#requestid").val(); //requestId

    return "<div class='j_small_img'><img src='/weaver/weaver.file.FileDownload?fileid=" + _fieldId + 
        "&f_weaver_belongto_userid="+ _userId + "&f_weaver_belongto_usertype=null&requestid=" + _requestId +
        "&desrequestid=0&fromrequest=1' onclick=\"openAccessory('" + _fieldId + "')\" /></div>";
}
///根据路径构造图片
function createImgStr(_imgPath){
    return "<div class='j_small_img'><img src='" + _imgPath + "' /></div>";
}



/* 新增图片在行前 */
/* 新增图片在行前 */
/* 新增图片在行前 */

/// _appendixId: 需要转换的附件id
function addImgInRow(_appendixId){
    var _count = $("#" + _appendixId + "_idnum").val();  //获得附件的数量
    var _base = $("#" + _appendixId + "_tab").find("tr");//获得附件所有行

    ///往行中添加数据
    for(var i = 0; i < _count; i++){
        var _fieldId = _base.eq(i).find(".fieldClassChange").eq(0).find("a").attr("_fileid");//获得fieldId内容
        _base.eq(i).children().eq(0).children().eq(0).before(createAppendixStr(_fieldId));   //追加图片
        _base.eq(i).find(".fieldClassChange").eq(0).children().eq(0).css("display", "none"); //隐藏系统图标
    }
}



/* 新增图片在新块内 */
/* 新增图片在新块内 */
/* 新增图片在新块内 */

/// _appendixId: 需要转换的附件id
/// _newBlockId: 图片存放的id
function addImgInBlock(_appendixId, _newBlockId){
    var _count = $("#" + _appendixId + "_idnum").val();  //获得附件的数量
    var _base = $("#" + _appendixId + "_tab").find("tr");//获得附件所有行

    ///往行中添加数据
    var _html = "";
    for(var i = 0; i < _count; i++){
        var _fieldId = _base.eq(i).find(".fieldClassChange").eq(0).find("a").attr("_fileid");//获得fieldId内容
        _html += createAppendixStr(_fieldId); //加入图片字符串
    }
    $("#" + _newBlockId).html(_html);
}


/* 新增图片在明细内 */
/* 新增图片在明细内 */
/* 新增图片在明细内 */

/// _appendixId: 需要转换的附件id
/// _detailClass: 图片存放的明细的class
function addImgInDetail(_appendixId, _detailClass){
    var _count = $("#" + _appendixId + "_idnum").val();  //获得附件的数量
    var _base = $("#" + _appendixId + "_tab").find("tr");//获得附件所有行

    ///往行中添加数据
    var _detialRow = $("." + _detailClass); //获得明细中的行
    for(var i = 0; i < _detialRow.length; i++){
        var _fieldId = _base.eq(i).find(".fieldClassChange").eq(0).find("a").attr("_fileid");//获得fieldId内容
        _detialRow.eq(i).html(createAppendixStr(_fieldId)); //追加内容
    }
}