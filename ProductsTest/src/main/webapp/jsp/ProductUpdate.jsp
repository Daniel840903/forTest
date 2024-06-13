<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>修改商品</title>
    <style>
        body {
            text-align: center;
            background-color: lightyellow;
            font-family: Arial, sans-serif;
        }

        h2 {
            color: #333;
        }

        form {
            display: inline-block;
            margin-top: 20px;
            text-align: left;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        input[type="text"], textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"], input[type="button"] {
            padding: 10px 20px;
            margin: 10px 5px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover, input[type="button"]:hover {
            background-color: #45a049;
        }

        .btn-return {
            background-color: #2196F3;
        }

        .btn-return:hover {
            background-color: #0b7dda;
        }
    </style>
</head>
<body>
    <h2>修改商品</h2>
    <form action="../DemoProductServletAction" method="post">
        <input type="hidden" name="action" value="update">

        <label for="productid">產品ID:</label>
        <input type="text" id="productid" name="productid" required>

        <label for="productName">產品名稱:</label>
        <input type="text" id="productName" name="productName" required>

        <label for="price">價格:</label>
        <input type="text" id="price" name="price" required>

        <label for="description">產品描述:</label>
        <textarea id="description" name="description" required></textarea>

        <label for="stockQuantity">庫存數量:</label>
        <input type="text" id="stockQuantity" name="stockQuantity" required>

        <input type="submit" value="更新送出">
        <input type="button" class="btn-return" onclick="returnProduct()" value="返回上一頁">
    </form>
    <script>
        function returnProduct() {
            var url = "../DemoProductServletAction?action=list";
            window.location.href = url;
        }
    </script>
</body>
</html>


