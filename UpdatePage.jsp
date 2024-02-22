<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
int roll=Integer.parseInt(request.getParameter("roll"));
String name=request.getParameter("name");
String Address=request.getParameter("Address");
try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ADITYA","Oracle@123");
	out.println( "DataBase Connected");
	pst = con.prepareStatement("update student set name = ?, address = ? where roll = ?");
	
	pst.setInt(3, roll);
	pst.setString(1, name);
	pst.setString(2, Address);
	
	int res = pst.executeUpdate();
	if(res >= 1)
	{
		out.println(" record is updated successfully");
		out.println("<br>");
		out.println("<a href = 'SearchPage.html'>Search Again</a>");
		
	}
	else
	{
		out.println(" Error in record updation");
	}
	
}catch (Exception e1){
	e1.printStackTrace();
} 
%>
</form>
</body>
</html>