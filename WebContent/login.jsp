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
    <link rel="stylesheet" href="css/login.css">
</head>

<body>
    <div class="fnb_navigation">
        <div class="fnb_header fnb_white">
            <div class="fnb_gradient">
            </div>
            <jsp:include page="include/head.jsp"/>
        </div>
    </div>
    <div class="fnb_navigation">
        <div class="fnb_main-menu">
        </div>
    </div>
    <main role="main" class="fnb_main-container">
        <div class="container fnb_products-container fnb_plp-page load">
            <form action="doLogin.jsp" method="post">
                <h3 class="fnb_account-title fnb_text-16 fnb_text-center">用户登录</h3>
                <div class="login">
                    <h2 class="loginTitle"></h2>
                    <div class="namepositon">
                        <div class="form_field-label fnb_inline">
                            <div class="Title_name">
                                用户名
                                <span class="mandatory">*</span>
                            </div>
                            <div class="form_field-input">
                                <input type="text" id="username" name="username">
                            </div>
                            <div class="fnb_error_msg fnb_text-3"></div>
                        </div>
                    </div>
                    <div class="pwdpositon">
                        <div class="form_field-label fnb_inline">
                            <div class="Title_name">
                                密码
                                <span class="mandatory">*</span>
                            </div>
                            <div class="form_field-input">
                                <input type="password" id="userpwd" name="password">
                            </div>
                            <div class="fnb_error_msg fnb_text-3"></div>
                        </div>
                    </div>
                    <div class="fnb_account-password-link fnb_text-4 fnb_font-2 fnb_buttonlink pull-right">
                        忘记密码？
                    </div>
                    <button class="fnb_main-submit fnb_btn fnb_black">
                        登陆
                    </button>
                    <p class="fnb_color-grey fnb_text-4 fnb_half_top fnb_bottom" style="font-weight:normal">
                        *必填
                    </p>
                </div>
            </form>
        </div>
    </main>
    <jsp:include page="include/footer.jsp"/>

</body>

</html>
