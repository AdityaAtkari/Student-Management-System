<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Display page jsp</title>
</head>
<body>
<form action="">
<%@ page language="java" import="java.sql.*" %>
<%
Connection con;
PreparedStatement pst;
ResultSet rs;
%>
<%
response.setContentType("text/html");
//PrintWriter out=response.getWriter();
try {
	
	String username=request.getParameter("user");
	String pass=request.getParameter("pass");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ADITYA","Oracle@123");
	out.println( "DataBase Connected");
	out.println("<br>");
		
	

} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
} catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
%>
</form>
</body>
</html>