import WfForm from './public/interface';
import * as InputUtil from './public/inputUtil';

let table = "";
let mainMap = "";
let detailMap = "";
let dtRow = "";
let tabsCount = "";
let tabsRow = "";
let mainEc = new Map();
let detailEc = new Map();
let store = "";
let _WfForm = "";

// 获取元素的值
function getText(cell, attrs, fieldmark) {  
    let text = "";
    let fieldid = "0";
    let cellTd;
    if (cell) { 
        cellTd = $(cell);
        fieldmark = cellTd.find("[data-fieldmark*=field]").attr("data-fieldmark");
        if (!fieldmark && (cell.className.includes("etype_13") || cell.className.includes("etype_17"))) {
            let arr = [];
            for (let i in store.cellInfo) {
                arr.push(i);
            }
            for (let mark of arr) {
                if (/mc_\d_\d_\d_nodemark/.test(mark)) {
                    text += store.cellInfo[mark];
                }
            }
            if (cellTd.find("img").size() > 0) {
                let imgs = Array.from(cellTd.find("img"));
                for (let img of imgs) {
                    let base64image = getBase64Image(img);
                    text += base64image + "&&";
                }
            }
            attrs.set("text", text.replace(/\n/g, ""));
            return;
        } else if (fieldmark === undefined) {
            text += cellTd[0].innerText;
            attrs.set("text", text);
            return;
        }
        if (!cellTd.find("[data-fieldmark*=field]").is(":visible")) {
            return;
        }
    }
    if (/field\d+_\d+/.test(fieldmark)) {
        fieldid = fieldmark.substring(5, fieldmark.indexOf("_"));
    } else {
        fieldid = fieldmark.substring(5);
    }
    const fieldAttr = WfForm.getFieldInfo(fieldid);
    const { htmltype,detailtype } = fieldAttr;
    const fieldValue = WfForm.getFieldValue(fieldmark);

    // 可编辑的单行文本
    if(fieldid < 0){
        if(fieldid === "-1" || fieldid === "-9"){
            text = fieldValue;
        }else if(fieldid === "-2"){
            if (fieldValue === "0") {
                text += "正常";
            } else if (fieldValue === "1") {
                text += "重要";
            } else {
                text += "紧急";
            }
        }else{
            text = "";
        }