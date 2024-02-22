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

try {
	
	String username=request.getParameter("user");
	String pass=request.getParameter("pass");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ADITYA","Oracle@123");
	out.println( "DataBase Connected");
	pst=con.prepareStatement("Select * from userdetails where username=? and password=?");
	pst.setString(1,username);
	pst.setString(2, pass);
	rs=pst.executeQuery();
if(rs.next())
{
	response.sendRedirect("http://localhost:8888/MyWebProject/JspExample/HomePage.html");
	
}
else
{
	response.sendRedirect("http://localhost:8888/MyWebProject/JspExample/LoginPageError.html");	
}
}
catch(Exception e1){
	//JOptionPane.showMessageDialog(null, "Error in DataBase Connection");

}


%>
</form>
</body>
</html>