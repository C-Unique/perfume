<%@ page import="perfume.entity.Cart" %>
<%@ page import="javax.lang.model.element.VariableElement" %>
<%@ page import="perfume.entity.Item" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Set" %>
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
    <link rel="stylesheet"  href="css/cart.css"/>
</head>

<body>
    <div class="fnb_navigation">
        <div class="fnb_header fnb_white">
            <div class="fnb_gradient">
            </div>
            <%@include file="include/head.jsp"%>
        </div>
    </div>
    <div class="fnb_navigation">
        <div class="fnb_main-menu">
        </div>
    </div>
    <main role="main" class="fnb_main-container">
        <div class="container fnb_pdp-Breadcrumb fnb_breadcrumb-product">
            <div class="breadcrumb">
                <div class="fnb_breadcrumb fnb_text-5 fnb_font-3 ">
                    <a href="index.jsp"> <img src="img/return.png" alt=""><span>继续购物</span></a>
                </div>
            </div>
        </div>
        <div class="container fnb_products-container fnb_plp-page load">
            <div class="row">
                <div class="fnb_col-wd8 fnb_wider-8 no-gutter-right">
                    <div class="module-checkoutTable checkoutPublic">
                        <div class="module-checkoutTable-body">
                            <div class="_checkbox active"></div>
                            <ul class="module-checkoutTable-body-UHeader">
                                <li class="module-checkoutTable-body-LHeader module-checkoutTable-Table-checkAll">全选
                                </li>
                                <li class="module-checkoutTable-body-LHeader module-checkoutTable-Table-productInfo">
                                    商品信息
                                </li>
                                <li class="module-checkoutTable-body-LHeader module-checkoutTable-Table-productPrice">
                                    单价(元)
                                </li>
                                <li class="module-checkoutTable-body-LHeader module-checkoutTable-Table-productNumber">
                                    数量
                                </li>
                                <li
                                        class="module-checkoutTable-body-LHeader module-checkoutTable-Table-productSubtotal">
                                    小计(元)</li>
                                <li class="module-checkoutTable-body-LHeader module-checkoutTable-Table-control">操作</li>
                            </ul>
                            <%
                                Cart cart = (Cart) request.getSession().getAttribute("cart");
                                if(cart!=null){
                                    HashMap<Item, Integer> goods = cart.getGoods();
                                    if(goods!=null && goods.size()>0){
                                        Set<Item> items = goods.keySet();
                                        for (Item item : items) {






                            %>
                            <div class="checkout-product-body">
                                <div class="checkout-product-body-item">
                                    <div class="checkout-product-body-item-content">
                                        <div class="_checkbox none"></div>
                                        <a href="index.jsp" target="_blank" class="checkout-product-body-item-img">
                                            <img src="img/<%=item.getPhoto()%>" class="" alt="" title=""></a>
                                        <div class="checkout-product-body-item-info">
                                            <h6 class="checkout-product-body-item-productNameCN"><%=item.getEngname()%></h6>
                                            <h6 class="checkout-product-body-item-productNameCN"><%=item.getName()%></h6>
                                        </div>
                                        <div class="checkout-product-body-item-unit">
                                            <div class="checkout-product-body-item-unit-price">
                                                <span class="checkout-product-body-item-unit-sapPrice"><%=item.getPrice()%></span>
                                                <span class="checkout-product-body-item-unit-offerPrice"></span>
                                            </div>
                                        </div>
                                        <div class="checkout-product-body-item-amount">
                                            <div class="checkout-product-body-item-amount-warp">
                                                <div class="mlnoe">
                                                    <span
                                                            class="checkout-product-body-item-amount-module-span">仅剩<%=item.getStock()%>件</span>
                                                </div>
                                                <div class="checkout-product-body-item-amount-module">
                                                    <i class="checkout-product-body-item-amount-btn minus" onclick="redeuceNumberToCart(<%=item.getId()%>,1)">-</i>
                                                    <span class="checkout-product-body-item-amount-num"><%=goods.get(item)%></span>
                                                    <i class="checkout-product-body-item-amount-btn" onclick="addItemToCart(<%=item.getId()%>,1,<%=item.getStock()%>)">+</i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="checkout-product-body-item-subtotal">
                                            <div class="checkout-product-body-item-unit-price">
                                                <span class="checkout-product-body-item-unit-sapPrice"><%=item.getPrice()*goods.get(item)%></span>
                                            </div>
                                        </div>
                                        <div class="checkout-product-body-item-handle">
                                            <div class="checkout-product-body-item-handle-module">
                                                <i class="checkout-product-body-item-handle-delete" onclick="del(<%=item.getId()%>)"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%
                                        }
                                    }

                            %>
                        </div>
                    </div>
                </div>
                <section class="fnb_bag_summary fnb_col-wd3 fnb_col-wd-offset-12 fnb_wideren_offset-1 no-gutter-left">
                    <section class="fnb_bill">
                        <header class="fnb_section-header">
                            <h2 class="fnb_section_title fnb_text-7 fnb_font-1 fnb_text_lh-25"> 总览</h2>
                            <p class="fnb_section_description fnb_text-4 fnb_font-1"> 订单编号<span class="fnb_font-bold">
                                    74748409</span> </p>
                        </header>
                        <div class="fnb_section-content">
                            <div class="fnb_bill-thl row">
                                <div class="fnb_bill-text fnb_col-wd8 fnb_text-4 fnb_font-1 fnb_half_bottom"> 商品总价</div>
                                <div
                                        class="fnb_bill_price fnb_col-wd4 pull-right no-gutter-left fnb_text-4  fnb_font-1-b">
                                    ¥<%=cart.getTotalPrice()%></div>
                            </div>

                            <div class="fnb_bill-tva row fnb_half_bottom">
                                <div class="fnb_bill-text fnb_col-wd8 fnb_text-4 fnb_font-2">
                                    配送费用</div>

                                <div class="fnb_bill_fee fnb_col-wd4 fnb_text-4 pull-right fnb_text-right fnb_font-1-b"
                                     id="taxe"> 免费配送</div>
                            </div>
                            <div class="row">
                                <div class="fnb_bill-text fnb_col-wd8 fnb_text-4 fnb_font-2 ">订单总计</div>
                                <div class="fnb_bill_fee fnb_col-wd4 fnb_text-4 pull-right fnb_font-2 fnb_text-right"
                                     id="taxes">¥<%=cart.getTotalPrice()%></div>
                            </div>
                            <div class="row fnb_submit">
                                <button type="submit" class="fnb_btn fnb_black fnb_col-wd12 fnb_font-1-b fnb_text-7">
                                    确认并付款</button>
                            </div>
                        </div>
                    </section>
                    <%
                        }
                    %>
                    <section class="fnb_question no-gutter">
                        <div class="fnb_section-content">
                            <h2 class="fnb_text-7 fnb_font-8"> 需要更多帮助？</h2>
                            <p class="fnb_text-4 fnb_font-2">
                                <span class="fnb_font-2"> 如有任何问题, <span>欢迎拨打客服热线</span> </span>
                                8888 236 888, 或通过在线客服联系我们</p>
                        </div>
                    </section>
                </section>
            </div>
        </div>
    </main>
    <%@include file="include/footer.jsp"%>

</body>
</html>

<script>
    function del(id) {
        if(confirm("您确定要删除吗")){
            $.ajax({
                type:"get",
                url:"CartServlet",
                data:{
                    'id':id,
                    'action':'delete'
                },
                success:function (result) {
                    toastr.success(result);
                    setTimeout(function () {
                        location.reload();
                    },1000)

                }
            })
        }

    }

    function addItemToCart(id,number, stock) {
        if(parseInt($('.checkout-product-body-item-amount-num').html())<stock){
            $.ajax({
                type:"get",
                url:"CartServlet",
                data:{
                    'id':id,
                    'action':'add',
                    "number":number
                },
                success:function () {
                    location.reload();
                }
            })
        }
    }

    function redeuceNumberToCart(id,number) {
        if(parseInt($(".checkout-product-body-item-amount-num").text())>1){
            $.ajax({
                type:"get",
                url:"CartServlet",
                data:{
                    'id':id,
                    'action':'reduce',
                    "number":number
                },
                success:function () {
                    location.reload();
                }
            })
        }


    }
</script>