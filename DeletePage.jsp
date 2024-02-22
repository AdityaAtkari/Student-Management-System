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
try {
	
	String username=request.getParameter("user");
	String pass=request.getParameter("pass");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ADITYA","Oracle@123");
	out.println( "DataBase Connected");
	out.println("<br>");
	pst=con.prepareStatement("Delete from student where roll=?");
	pst.setInt(1, roll);
	int res=pst.executeUpdate();
	if(res>=1)
	{
		out.println(" record is Deleted successfully");
		out.println("<br>");
		out.println("<a href = 'DeletePage.html'>Delete Again</a>");
	}
	else
	{
		out.println("Error in record is Deletion");
	} 

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