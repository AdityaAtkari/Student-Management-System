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
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ADITYA","Oracle@123");
			out.println( "DataBase Connected");
			pst=con.prepareStatement("Select * from student where roll= ?");
			pst.setInt(1,roll);
			rs=pst.executeQuery();
			if(rs.next())
			{
				String Name=rs.getString("name");
				String Address=rs.getString("Address");
				
				out.println( "Record is found in database");
				out.println("<html>");
			    out.println("<!DOCTYPE html>");
			    out.println("<head>");
			    out.println("<meta charset='UTF-8'>");
			    out.println("<title>Search Page</title>");
			    out.println("<style>");
			    out.println(".searchbuttons{");
			    out.println("height: 180px;");
			    out.println("width: 40%;");
			    out.println("background-color: deepskyblue;");
			    out.println("margin-top: 10%");
			    out.println("margin-left: 27%");
			    out.println("align-items: center");
			    out.println("justify-content: center");
			    out.println("display: flex");
			    out.println("}");
			    out.println("</style>");
			    out.println("</head>");
			    out.println("<body>");
			    out.println("<center>");
			    out.println("<div class='searchbuttons'>");
			    
			    out.println("<table align='center'>");
			    out.println("<form action='http://localhost:8888/MyWebProject/JspExample/UpdatePage.jsp' method='post'>");
			    out.println("<tr>");
			    out.println("<td>Roll no</td>");
			    out.println("<td><input type='textfield' size='20px' name='roll' value="+roll+"></td>");
			    out.println("</tr>");
			    out.println("<tr>");
			    out.println("<td>Name</td>");
			    out.println("<td><input type='textfield' size='20px' name='name' value="+Name+"></td>");
			    out.println("</tr>");
			    out.println("<tr>");
			    out.println("<td>Address</td>");
			    out.println("<td><input type='textfield' size='20px' name='Address' value="+Address+"></td>");
			    out.println("</tr>");
			    out.println("</table>");
			    out.println("<table align='center'>");
			    out.println("<tr>");
			   // out.println("<td><button type='submit' >Search</a></button> </td>");
			   // out.println("</form>");
			    out.println("<td><button type='submit'>Update</button> </td>");
			    out.println("</form>");
			    out.println("<form action='http://localhost:8888/MyWebProject/JspExapmle/HomePage.html'>");
			    out.println("<td><button type='button'>Home</button></td>");
			    out.println("</form>");
			    out.println("</tr>");
			    out.println("</table>");
			    out.println("</form>");
			    out.println("</div>");
			    out.println("</body>");
			    out.println("</html>");	
			}
			else
			{
				out.println( "Record is not found in database");
			
			}
		}catch (Exception e1){
			e1.printStackTrace();
		}
%>
</form>
</body>
</html>