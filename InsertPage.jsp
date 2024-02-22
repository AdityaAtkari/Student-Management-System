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
		String name=request.getParameter("name");
		String address=request.getParameter("Address");
		int roll=Integer.parseInt(request.getParameter("roll"));
		
		try {
			String username=request.getParameter("user");
			String pass=request.getParameter("pass");
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ADITYA","Oracle@123");
			out.println( "DataBase Connected ");
			out.println("<br>");
	
				pst=con.prepareStatement("Insert into student values(?,?,?)");
				pst.setInt(1, roll);
				pst.setString(2, name);
				pst.setString(3, address);
				int res=pst.executeUpdate();
		
		if(res>=1)
		{
			//response.sendRedirect("http://localhost:8888/MyWebProject/InsertPage.html");
			out.println( "\nData Inserted Sucessfully");
			out.println("<br>");
			out.println("<a href = 'InsertPage.html'>Insert Again</a>");		}
		else
		{
			//response.sendRedirect("http://localhost:8888/MyWebProject/InsertPageError.html");
			out.println( "Error in data Insertion");
			out.println("<br>");
			out.println("<a href = 'DeletePage.html'>Insert Again</a>");
		}
		}
		catch(Exception e1){
			//JOptionPane.showMessageDialog(null, "Error in DataBase Connection");

		}
	%>
</form>
</body>
</html>