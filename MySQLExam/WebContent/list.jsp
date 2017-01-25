<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	<form action="/MySQLExam/add.jsp" method="POST">
		<table border="1">
			<tr><td>이름</td><td><input type="text" name="name"></td></tr>
			<tr><td>성별</td><td><input type="text" name="gender"></td></tr>
			<tr><td>전공</td><td><input type="text" name="major"></td></tr>
			<tr><td>지역</td><td><input type="text" name="city"></td><tr>
			<tr><td colspan="2"><input type="submit" value="추가"></td></tr>
			
		</table>
	</form>
		<table border="1">
		<tr><td>번호</td><td>내용</td><td>가입일</td><td>삭제</td></tr>
		<%
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			try {
				String jdbcDriver = "jdbc:mysql://127.0.0.1:3306/students?uniCode=true&characterEncoding=utf8";
				String dbUser = "root";
				String dbPass = "mentos1234";
				String query = "SELECT * FROM students";
				conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
				stmt = conn.createStatement();
				rs = stmt.executeQuery(query);
				while(rs.next()){
		%>
			<tr><td><%= rs.getString("NO") %></td>
			<td>
				<form action="/MySQLExam/update.jsp" method="POST">
					이름:<input type="text" name="name" size="10" value="<%=rs.getString("NAME") %>">
					성별:<input type="text" name="gender" size="10" value="<%= rs.getString("GENDER") %>">
					전공:<input type="text" name="major" size="10" value="<%= rs.getInt("MAJOR") %>">
					지역:<input type="text" name="city
					" size="10" value="<%= rs.getInt("CITY") %>">
					<input type="hidden" name="no" value="<%= rs.getInt("no") %>">
					<input type="submit" value="수정">
				</form>
			</td>
			<td><%= rs.getDate("CREATED_AT") %></td>
			<td>
				<form action="/MySQLExam/delete.jsp" method="POST">
					<input type="hidden" name="no" value="<%= rs.getInt("NO") %>">
					<input type="submit" value="삭제"	>
				</form>
				</td>
			</tr>
		<%
				}
			}catch(SQLException ex) {
				ex.printStackTrace();
			}finally {
				if(stmt != null) try { stmt.close(); } catch(SQLException e) { }
				if(conn != null) try { conn.close(); } catch(SQLException e) { }
			}
		%>
		</table>
	</body>
</html>
