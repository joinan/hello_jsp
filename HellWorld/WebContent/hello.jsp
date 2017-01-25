<%@ page import="com.join.hell.HellWorld"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! public int multiply(int a, int b) { return a*b; } %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Hell World</title>
	</head>
	<body>
		<h1>Hello</h1>
		현재 시간은 <%= new HellWorld().now() %> 입니다.
		
		<%
			int a = Integer.parseInt(request.getParameter("a"));
			int b = Integer.parseInt(request.getParameter("b"));
		%>
		
		a와 b를 곱한값은 <%= a * b %> 입니다.
		
		<br>
		<% for (int i=0; i< 10; i++){%>
			<br> 안녕하세요 <%= multiply(i, 10) %>
		<% } %>
	</body>
</html>