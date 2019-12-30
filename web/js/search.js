var oldKey = "";
var index = -1;
var pos = new Array();//用于记录每个关键词的位置，以方便跳转
var posy = new Array();//用于记录每个关键词的位置，以方便跳转
var oldCount = 0;//记录搜索到的所有关键词总数

function previous(){
    index--;
    index = index < 0 ? oldCount - 1 : index;
    search();
}
function next(){
    index++;
    //index = index == oldCount ? 0 : index;
    if(index==oldCount){
        index = 0 ;
    }
    search();
}

function search() {
    $(".result").removeClass("res");//去除原本的res样式
    var key = $("#key").val().trim(); //取key值
    if (!key) {
        $(".result").each(function () {//恢复原始数据
            $(this).replaceWith($(this).html());
        });
        oldKey = "";
        return; //key为空则退出
    }
    if (oldKey != key) {
        //重置
        index = 0;
        $(".result").each(function () {
            $(this).replaceWith($(this).html());
        });
        pos = new Array();
        posy = new Array();
        var regExp = new RegExp(key+'(?!([^<]+)?>)', 'ig');//正则表达式匹配
        let root = $(".content-inner").eq(0);// 搜索的顶级标签 - 也就是范围
        root.html(root.html().replace(regExp, "<span id='result" + index + "' class='result'>" + key + "</span>")); // 高亮操作
        $("#key").val(key);
        oldKey = key;
        $(".result").each(function () {
            pos.push($(this).offset().top);
            posy.push($(this).offset().left);
        });
        oldCount = $(".result").length;
    }

    $(".result:eq(" + index + ")").addClass("res");//当前位置关键词改为红色字体
    // $("body").scrollTop(pos[index]);//跳转到指定位置
    $("body").scrollTop = (pos[index]);//跳转到指定位置
    window.scrollTo(0,pos[index]- 30);
}