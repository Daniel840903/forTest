<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="zh-TW">

    <head>
        <meta charset="UTF-8">
        <title>手機銷售平台</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
        <!-- 	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> -->
        <style>
            body {
                font-family: 'Microsoft JhengHei', 'Noto Sans CJK', Arial, sans-serif;
                margin: 0;
                padding: 0;
            }

            .navbar {
                background-color: #b00020;
                overflow: hidden;
                position: fixed;
                height: 100vh;
                width: 220px;
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .navbar .logo {
                width: 100px;
                height: auto;
                margin: 20px 0;
            }

            .navbar a {
                display: flex;
                align-items: center;
                color: #fff;
                text-align: center;
                padding: 14px 20px;
                text-decoration: none;
                width: 100%;
                box-sizing: border-box;
            }

            .navbar a.special {
                background-color: #ff5722;
                /* 特別樣式的背景色 */
                font-weight: bold;
                /* 特別樣式的字體加粗 */
            }

            .navbar a.special:hover {
                background-color: #ff5722;
                /* 移除 hover 效果 */
                color: #fff;
                /* 確保文字顏色不變 */
            }

            .navbar a img {
                margin-right: 10px;
                width: 20px;
                /* 小 logo 的寬度 */
                height: 20px;
                /* 小 logo 的高度 */
            }

            .navbar a:hover {
                background-color: #ddd;
                color: black;
            }

            .main-content {
                margin-left: 220px;
                /* adjust this value based on navbar width */
                padding: 20px;
            }

            .product {
                border: 1px solid #ddd;
                margin: 20px;
                padding: 20px;
                text-align: center;
            }

            .product img {
                max-width: 100px;
                height: auto;
            }

            .product-title {
                font-size: 1.2em;
                margin: 10px 0;
            }

            .price {
                color: red;
            }

            .navbar a i {
                margin-right: 10px;
                /* 圖示和文字之間的空格 */
            }
        </style>
    </head>

    <body>
        <div class="navbar">

            <a href="${pageContext.request.contextPath}/jsp/Home.jsp" class="special">
                <i class="fa-solid fa-house"></i>
                後臺管理系統
            </a>
            <br>
            <a href="${pageContext.request.contextPath}/jsp/Log.jsp">
                <i class="fa-solid fa-user"></i>
                會員管理
            </a>
            <a href="${pageContext.request.contextPath}/jsp/ProductHomepage.jsp">
                <i class="fa-solid fa-user"></i>
                商品管理
            </a>
            <a href="discounts.jsp">
                <i class="fa-solid fa-cart-shopping"></i>
                訂單管理
            </a>
            <a href="${pageContext.request.contextPath}/GetAllComments">
                <i class="fa-solid fa-comments"></i>
                討論區管理
            </a>
            <a href="${pageContext.request.contextPath}/PhonePlanSearchAll">
                <i class="fa-solid fa-clipboard-list"></i>
                方案管理
            </a>
            <a href="hotProducts.jsp">
                <i class="fa-solid fa-wrench"></i>
                維修管理
            </a>
        </div>

    </body>

    </html>