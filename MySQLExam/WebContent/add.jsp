<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
<tr><td>번호</td><td>이름</td><td>성별</td><td>전공</td><td>지역</td><td>가입일</td></tr>
	<%
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		int major = Integer.parseInt(request.getParameter("major"));
		int city = Integer.parseInt(request.getParameter("city"));
	
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = null; PreparedStatement stmt = null;
		try {
			String jdbcDriver = "jdbc:mysql://127.0.0.1:3306/students?uniCode=true&characterEncoding=utf8";
			String dbUser = "root";
			String dbPass = "mentos1234";
			String query = "SELECT * FROM students";
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			stmt = conn.prepareStatement("insert into students (name,gender,major,city)"
					+" values (?,?,?,?);");
			stmt.setString(1, name);
			stmt.setString(2, gender);
			stmt.setInt(3, major);
			stmt.setInt(4, city);
			stmt.executeUpdate();
			
		}catch(SQLException ex) {
			ex.printStackTrace();
		} finally {
			if(stmt != null) try { stmt.close(); } catch(SQLException e) { }
			if(conn != null) try { conn.close(); } catch(SQLException e) { }
	%>
		<script>
			location.href="list.jsp";
		</script>
	<%
		}
	%>
		
	</table>
</body>
</html>