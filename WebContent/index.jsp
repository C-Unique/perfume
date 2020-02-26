<%@ page import="perfume.dao.ItemDAO" %>
<%@ page import="perfume.entity.Item" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</head>

<body class="fnb_zh_CN fnb_sticky-isOnTop">
  <div class="fnb_navigation">
    <div class="fnb_header fnb_white">
      <div class="fnb_gradient">

      </div>
      <jsp:include page="include/head.jsp"/>
      <div class="fnb_main-menu">
        <div class="fnb_main-menu-items">

          <div class="total menuitem">

            <div class="fnb_main-menu-item">
              <a class="fnb_active" href="" data-link="#totaltab">ALL</a>
            </div>
          </div>
          <div class="Chanel menuitem">
            <div class="fnb_main-menu-item">
              <a class="" href="" data-link="#Chaneltab">CHANEL</a>
            </div>
          </div>
          <div class="dior menuitem">
            <div class="fnb_main-menu-item">
              <a class="" href="" data-link="#diortab">Dior</a>
            </div>
          </div>
          <div class="Lancome menuitem">
            <div class="fnb_main-menu-item">
              <a class="" href="" data-link="#Lancometab">LANCOME</a>
            </div>
          </div>
          <div class="BVLGARI menuitem">
            <div class="fnb_main-menu-item">
              <a class="" href="" data-link="#BVLGARItab">BVLGARI</a>
            </div>
          </div>
          <div class="Other menuitem">
            <div class="fnb_main-menu-item">
              <a class="" href="" data-link="#Othertab">Other</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <main role="main" class="fnb_main-container">
    <div class="pushZone">
      <section class="fnb_fullbleed-container fnb_is-parent">
        <div class="paredito parsys"></div>
      </section>
    </div>
    <div class="container fnb_products-container fnb_plp-page load">
      <div class="fnb_products__ container clearfix fnb_products-container">
        <ul class="row">
          <%
            ItemDAO itemDAO = new ItemDAO();
            List<Item> items = itemDAO.getAllItems();
            application.setAttribute("items",items);
          %>
          <c:if test="${items!=null&& items.size()>0}">
            <c:forEach items="${items}" var="item" >
              <li class="fnb_inline">

                <div class="fnb_col-wd6 fnb_product-grid clearfix fnb_event_listener fadding">
                  <div class="fnb_col-wd6 fnb_product-img">
                    <a href="detail.jsp?id=${item.id}"><img class="fnb_img-responsive fnb_img-desc load" src="img/${item.photo}" alt=""></a>
                  </div>
                  <div class="fnb_col-wd6 fnb_product-grid-infos">
                    <div class="fnb_inline-block">
                      <div class="fnb_product-title"><a href="detail.jsp?id=${item.id}">${item.engname}</a></div>
                    </div>
                    <div class="fnb_product_grid_description">
                      <p><a href="detail.jsp?id=${item.id}">${item.name}</a></p>
                      <p class="fnb_desc">${item.desc}</p>
                    </div>
                    <p class="fnb_text-3 fnb_product-price fnb_font-2 ">￥<span>${item.price}</span></p>
                    <div class="fnb_buy">
                      <div class="quickbuyButton button">
                        <div style="text-align: left">
                          <div class="fnb_buy">
                            <button class="fnb_btn fnb_content_btn fnb_black  fnb_font-1 fnb_quickbuy-btn  " type="button" onclick="addItemToCart(${item.id},1)">加入购物车</button>
                          </div>
                        </div>

                      </div>
                    </div>
                  </div>
                </div>
              </li>
            </c:forEach>
          </c:if>







        </ul>
      </div>
    </div>
    <div class="container fnb_products-container">
      <div id="pagination" class="pagination">
        <ul>
          <li class="disabled">&lt;</li>
          <li class="active">1</li>
          <li>2</li>
          <li>3</li>
          <li>4</li>
          <li>5</li>
          <li>&gt;</li>
        </ul>
      </div>
    </div>
  </main>


 <jsp:include page="include/footer.jsp"/>
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
</script>

