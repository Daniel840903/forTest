<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
        }
        .container {
            margin-top: 50px;
        }
        .error-msg {
            color: #f00;
            font-size: 18px;
            margin-bottom: 20px;
        }
        .back-link {
            text-decoration: none;
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border-radius: 4px;
        }
    </style>
</head>
<body>
        <h1>操作錯誤 請重新執行</h1>
        <div class="btn-back">
        <form action="./../ProductServlet" method="get">
            <input type="hidden" name="action" value="list">
            <input type="submit" value="返回首頁">
        </form>
    </div>
</body>
</html>
