
$(document).ready(function () {

    var path = $("#path").text();

    var categoryid = $("#categoryid").text();

    var currentPage = 1;

    var opt ;

    to_page(path, 1,categoryid,0,"0");


    $(".select_cate").change(function () {
        opt = $(".select_cate").val();
        to_page(path,1,opt,1,"0");
    })

    $(".select_px").change(function () {
        var order = $(".select_px").val();
        to_page(path,1,opt,1,order);
    });
});




function to_page(path, page,categoryid,i,order) {
    $.ajax({
        url: path + "/admin/goods/salesJson",
        data: {
            page:page,
            categoryid:categoryid,
            order:order
        },
        type: "get",
        success: function (result) {

            //解析显示
            build_user_table(path, result,i);

            //页面信息
            build_page_info(path, result);

            //分页
            build_page_nav(path, result);

            currentPage = page;
        }
    });
}

function build_user_table(path,result,i) {
    $("#goodsinfo tbody").empty();
    var goods = result.info.list;
    var categorys = result.info.categoryList;
    //只执行一遍即可
    if (i==0){
        $("<option id='cate'></option>").append("全部商品").appendTo(".select_cate");
        var b = document.getElementById("cate");
        b.setAttribute("value","0");
        $.each(categorys,function (index,item) {
            $("<option class='active'></option>").append(item.catename).appendTo(".select_cate");
            var a = document.getElementsByClassName("active");
            a[index].setAttribute("value",item.cateid);
        })
        i++;
    }


    $.each(goods, function (index,item) {
        var userid = $("<td></td>").append(item.goodsId);
        var username = $("<td></td>").append(item.goodsName);
        var email = $("<td></td>").append(item.num);
        var telephone = $("<td></td>").append(item.categoryName);
        $("<tr></tr>").append(userid)
            .append(username)
            .append(email)
            .append(telephone).appendTo("#goodsinfo tbody");

    })

}

function build_page_info(path,result) {
    $("#page-info-area").empty();
    $("#page-info-area").append("当前第"+ result.info.pageInfo.pageNum +"页，总共"+ result.info.pageInfo.pages +"页，总共"+ result.info.pageInfo.total +"记录")
}

function build_page_nav(path,result) {
    $("#page-div-nav ul").empty();
    var pageUl = $("<ul></ul>").addClass("pagination")

    var firstPage = $("<li></li>").append($("<a aria-label=\"Next\"></a>")
        .append($("<span aria-hidden=\"true\"></span>")
            .append("首页")));

    var prePage = $("<li></li>").append($("<a aria-label=\"Next\"></a>")
        .append($("<span aria-hidden=\"true\"><i class=\"fa fa-backward\"></i></span>")));

    if(!result.info.pageInfo.hasPreviousPage) {
        prePage.addClass("li-none");
    } else {
        prePage.click(function () {
            var categoryid = $("#categoryid").text();
            to_page('/shop',result.info.pageInfo.prePage,categoryid);
        });
    }

    //跳转
    firstPage.click(function () {
        var categoryid = $("#categoryid").text();
        to_page('/shop',1,categoryid);
    });

    var nextPage = $("<li></li>").append($("<a aria-label=\"Next\"></a>")
        .append($("<span aria-hidden=\"true\"><i class=\"fa fa-forward\"></i></span>")));

    var lastPage = $("<li></li>").append($("<a aria-label=\"Next\"></a>")
        .append($("<span aria-hidden=\"true\"></span>")
            .append("末页")));

    if(!result.info.pageInfo.hasNextPage) {
        nextPage.addClass("li-none");
    } else {
        nextPage.click(function () {
            var categoryid = $("#categoryid").text();
            to_page('/shop',result.info.pageInfo.nextPage,categoryid);
        });
    }

    lastPage.click(function () {
        var categoryid = $("#categoryid").text();
        to_page('/shop',result.info.pageInfo.lastPage,categoryid);
    });

    pageUl.append(firstPage).append(prePage);

    $.each(result.info.pageInfo.navigatepageNums,function (index,item) {
        var numLi = $("<li></li>").append($("<a></a>")
            .append($("<span aria-hidden=\"true\"></span>").append(item)));
        if(result.info.pageInfo.pageNum === item) {
            numLi.addClass("active");
        }
        numLi.click(function () {
            var categoryid = $("#categoryid").text();
            to_page('/shop',item,categoryid);
        });
        pageUl.append(numLi);
    });

    pageUl.append(nextPage).append(lastPage).appendTo("#page-div-nav");
}

function selectGoodsByName() {
    var goodsName =  $("#goodsName").val();
    var path = $("#path").text();
    $.ajax({
        url: path + "/admin/goods/search",
        data: {
            goodsName:goodsName,
            page:1,
            categoryid:0
        },
        type: "get",
        success: function (result) {
            //解析显示
            build_user_table(path, result);

            //页面信息
            build_page_info(path, result);

            //分页
            build_page_nav(path, result);

            currentPage = page;
        }
    });
}