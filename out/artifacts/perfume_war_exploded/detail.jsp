<%@ page import="perfume.dao.ItemDAO" %>
<%@ page import="perfume.entity.Item" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Perfume Store</title>
    <link rel="icon" href="img/icon.png">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/styles_zh_CN.css">
    <link rel="stylesheet" href="css/detail.css">
</head>

<body class="fnb_zh_CN fnb_sticky-isOnTop">
    <div class="fnb_navigation">
        <div class="fnb_header fnb_white">
            <div class="fnb_gradient">
            </div>
            <%@include file="include/head.jsp"%>
            <div class="fnb_main-menu">
            </div>
        </div>
    </div>
    <main role="main" class="fnb_main-container">
        <div class="container fnb_pdp-Breadcrumb fnb_breadcrumb-product">
            <div class="breadcrumb">
                <ol class="fnb_breadcrumb fnb_text-4 fnb_font-2 ">
                    <li><a href="index.html">首页</a></li>
                    <li>产品名称</li>
                </ol>
            </div>
        </div>
        <div class="container fnb_products-container fnb_plp-page load">
            <%
                int id = Integer.parseInt(request.getParameter("id")==null?"1":request.getParameter("id"));
                ItemDAO itemDAO = new ItemDAO();
                Item item = itemDAO.getItemById(id);
            %>
            <div class="row">
                <div class="fnb_pdp-image fnb_col-wd5 fnb_thumb-1">
                    <img class="fnb_img-responsive" src="img/<%=item.getPhoto()%>" alt="">
                </div>
                <div class="fnb_col-wd6 information">
                    <div class="fnb_pdp-information">
                        <h1 class="fnb_pdp-title fnb_text-18"><%=item.getName()%></h1>
                        <p class="fnb_pdp-subtitle fnb_block-blc fnb_text-6"><%=item.getEngname()%></p>
                    </div>
                    <div class="detailfnb_desc"><%=item.getDesc()%></div>
                    <div class="item fnb_col-wd12">
                        <div class="title">价格:</div>
                        <div class="price">￥<span><%=item.getPrice()%></span></div>
                    </div>
                    <div class="item fnb_col-wd12">
                        <div class="title">规格:</div>
                        <div class="capacity">
                            <ul>
                                <li class="now">30ml</li>
                                <li class="normal">50ml</li>
                                <li class="normal">100ml</li>
                            </ul>
                        </div>
                    </div>
                    <div class="item fnb_col-wd12">
                        <div class="title">库存:</div>
                        <div class="stock"><%=item.getStock()%></div>
                    </div>
                    <div class="item fnb_col-wd12">
                        <div class="Addcartnum">
                            <div class="numberBox">
                                <input type="text" class="text20" value="1">
                            </div>
                            <div class="arrow">
                                <div class="topArrow curPoint" onclick="add()">
                                    <div class="icon1"></div>
                                </div>
                                <div class="bottomArrow" onclick="reduce()">
                                    <div class="icon2"></div>
                                </div>
                            </div>
                        </div>
                        <div class="button addToBagButton no-gutter-right">
                            <div class="has_btn" onclick="addItemToCart(<%=item.getId()%>,$('.text20').val())">
                                <button type="button"
                                        class="shop-btn fnb_btn-state shop-btn-mirror fnb_btn fnb_content_btn fnb_black  fnb_submit fnb_event_listener fnb_font-1-b fnb_text-2 fnb_fulldiv fnb_addtobag-btn "
                                        style="opacity: 1;"><span style="opacity: 1;" >加入购物袋</span></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </main>


    <%@include file="include/footer.jsp"%>
</body>

</html>

<script>
    function addItemToCart(id,number) {
        $.ajax({
            type:"get",
            url:"CartServlet",
            data:{
                'id':id,
                'action':'add',
                "number":number
            },
            success:function (result) {
                toastr.success(result);
                setTimeout(function () {
                    location.reload();
                },1000)

            }
        })
    }

    function add() {
        var number = parseInt($(".text20").val());
        if(number< <%=item.getStock()%>){
            $(".text20").val(++number);
        }

    }
    function reduce() {
        var number = parseInt($(".text20").val());
        if(number>1){
            $(".text20").val(--number);
        }
    }
</script>


