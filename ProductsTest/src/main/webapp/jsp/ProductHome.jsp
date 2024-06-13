<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品總攬</title>
<style>
body {
    text-align: center;
    background-color: lightyellow;
    font-family: Arial, sans-serif;
}

h1 {
    color: #333;
}

.form-container {
    display: flex;
    justify-content: center;
    gap: 20px;
    margin-bottom: 20px;
}

.search input[type="text"], .row2 input[type="text"], .row2 textarea {
    width: 200px;
    padding: 8px;
    margin: 10px 0;
    border: 1px solid #ccc;
    border-radius: 4px;
}

.btn2 {
    padding: 10px 20px;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

.btn2:hover {
    background-color: #45a049;
}

table {
    margin: 20px auto;
    border-collapse: collapse;
    width: 80%;
}

table, th, td {
    border: 1px solid #ddd;
}

th, td {
    padding: 12px;
    text-align: center;
}

th {
    background-color: #a8fefa;
}

tr:nth-child(even) {
    background-color: #f2f2f2;
}

input[type="button"] {
    padding: 5px 10px;
    background-color: #f44336;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type="button"]:hover {
    background-color: #d32f2f;
}

label {
    display: inline-block;
    width: 100px;
    text-align: right;
    margin-right: 10px;
}
</style>
</head>
<body>
    <div align="center">
        <h1>商品總攬</h1>
        <div class="form-container">
            <form class="search" action="./DemoProductServletAction" method="get">
                <input type="hidden" name="action" value="search"> 
                <label for="productid">查詢產品:</label> 
                <input type="text" id="productid" name="productid" placeholder="請輸入ID" required> 
                <input class="btn2" type="submit" value="查詢">
            </form>
            <form class="search" action="./DemoProductServletAction" method="get">
                <input type="hidden" name="action" value="like">
                <label for="productName">關鍵字輸入:</label> 
                <input type="text" id="productName" name="productName" placeholder="請輸入商品名稱" required>
                <input class="btn2" type="submit" value="關鍵字查詢">
            </form>
        </div>
        <br>
        <div class="row2">
            <form class="search" action="./DemoProductServletAction" method="post">
                <input type="hidden" name="action" value="insert">
                <label for="productName">商品名稱:</label> 
                <input type="text" id="productName" name="productName" placeholder="請输入商品名稱" required>
                <label for="price">商品價格:</label> 
                <input type="text" id="price" name="price" placeholder="請输入商品價格" required>
                <label for="description">商品描述:</label> 
                <input type="text" id="description" name="description" placeholder="請输入商品描述" required>
                <label for="stockQuantity">商品庫存:</label> 
                <input type="text" id="stockQuantity" name="stockQuantity" placeholder="請输入商品庫存" required>
                <input class="btn2" type="submit" value="新增">
                
            </form>
        </div>
    </div>
    
    <table>
        <tr>
            <th>商品編號</th>
            <th>商品名稱</th>
            <th>商品價格</th>
            <th>商品描述</th>
            <th>商品庫存</th>
            <th>修改</th>
            <th>刪除</th>
        </tr>
        <c:forEach var="product" items="${listProduct}">
            <tr>
                <td>${product.productid}</td>
                <td>${product.productName}</td>
                <td>${product.price}</td>
                <td>${product.description}</td>
                <td>${product.stockQuantity}</td>
                <td>
                    <input type="button" value="修改" onclick="editProduct(${product.productid})">                   
                </td>
                <td>
                    <input type="button" value="刪除" onclick="deleteProduct(${product.productid})">
                </td>
            </tr>
        </c:forEach>
    </table>
    <br>
    <script>
    function editProduct(productid) {
        window.location.href = './DemoProductServletAction?action=search&productid=' + productid; 
    }

    function deleteProduct(productid) {
        if (confirm('確定要刪除這個商品嗎？')) {
            window.location.href = './DemoProductServletAction?action=delete&productid=' + productid;
        }  
    }
    </script>
</body>
</html>
