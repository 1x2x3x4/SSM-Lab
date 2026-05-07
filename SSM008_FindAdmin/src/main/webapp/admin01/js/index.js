$(function(){

//各学院tab选项卡click事件触发
    $("#acad_list ul li").mouseover(function(){
        var i = $(this).index(); //获取当前点击下标
        $(this).addClass('current').siblings().removeClass('current');
        $("#acad_news_list ul").eq(i).show().siblings().hide();
    })
})