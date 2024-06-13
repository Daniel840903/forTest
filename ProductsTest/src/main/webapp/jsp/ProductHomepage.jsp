<%@ page language="java" contentType="text/html; charset=UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>歡迎使用者</title>
		<style>
			*{ 
				margin:0;
				box-sizing: border-box;
			}
			body {
 				text-align: center; 
				background-color: lightyellow;
				font-family: Arial, sans-serif;
			}

			.maincontent{
				margin-left: 220px; 
				padding-top:25% 
			}
			.container{
 				
			}

			h2 {
				color: #333;
			}

			.btn-back {
				margin-top: 20px;
			}

			.btn-back input[type="submit"] {
				padding: 10px 20px;
				background-color: #2196F3;
				color: white;
				border: none;
				border-radius: 4px;
				cursor: pointer;
			}

			.btn-back input[type="submit"]:hover {
				background-color: #0b7dda;
			}
		</style>
	</head>

	<body>
	<div>
		<jsp:include page="header.jsp" />
	</div>
	<div class="maincontent">
			<h2>歡迎使用者</h2>

			<div class="btn-back">
				<form action="../DemoProductServletAction" method="get">
					<input type="hidden" name="action" value="list">
					<input type="submit" value="進入系統">
				</form>
			</div>
		</div>
	</body>

	</html>