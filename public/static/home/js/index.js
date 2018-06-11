$(document).ready(function() {

    var $wrapper = $('.tab_wrapper'),
        $allTabs = $wrapper.find('.tab_content > div'),
        $tabMenu = $wrapper.find('.tab_menu li');

    //var myarr = ["全部域名"111111111111,"4数字","5数字","6数字","字母","杂米","6数字"];
    ////		myarr.length
    //		$tabMenu.css("width",$(".tab_menu").width()/myarr.length)
    //
    $allTabs.not(':first-of-type').hide();
    $tabMenu.filter(':first-of-type').find(':first').width('100%')

    $tabMenu.each(function(i) {
        $(this).attr('data-tab', 'tab' + i);
    });

    $allTabs.each(function(i) {
        $(this).attr('data-tab', 'tab' + i);
    });

    $tabMenu.on('click', function() {
        var dataTab = $(this).data('tab'),
            $getWrapper = $(this).closest($wrapper);
        $getWrapper.find($tabMenu).removeClass('active');
        $(this).addClass('active');
        $getWrapper.find($allTabs).hide();
        $getWrapper.find($allTabs).filter('[data-tab=' + dataTab + ']').show();
    });

    //	弹窗
    $(".dom_btn").on('click', function() {

        $("#submitModal").modal("show");
        $("#domain").attr("value",$(this).parents("tr").find("td").eq(0).text());
    });

    $("#submitModal").css({"line-height":$(window).height()+"px"});

});