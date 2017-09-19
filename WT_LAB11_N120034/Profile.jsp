<%-- 
    Document   : Profile
    Created on : Apr 12, 2017, 3:53:15 PM
    Author     : saisravanthi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>
    </head>
    <body>
        <%
            ResultSet rs = null;
        try{
            
            String UserName=(String)session.getAttribute("UserName");  
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentdatabase","root","");           
            String sql = "select * from registeredstudents where UserName = '"+UserName+"';";
            PreparedStatement ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if(!rs.next())
            {
                response.sendRedirect("Login.jsp");
            }
        %>
        
       <table align="center" border="1" cellpadding="5" cellspacing="5">
       <caption>PROFILE</caption>
	<tr>
	<td>
	First Name
	</td>
	<td>
		<%=rs.getString(2)%>
	</td>
	</tr>
	<tr>
	<td>
	Last Name
	</td>
	<td>
            <%=rs.getString(3)%>
	</td>
	</tr>
	<tr>
	<td>
	University ID
	</td>
	<td>
            <%=rs.getString(1)%>
	</td>
	</tr>
	<tr>
	<tr>
	<td>
	Gender
	</td>
	<td><%=rs.getString(4)%>
	</td>
	</tr>
	<tr>
	<td>
	Address
	</td>
	<td>
	<%=rs.getString(5)%>
	</td>
	</tr>
	<tr>
	<td>
	Branch
	</td>
	<td>
        <%=rs.getString(6)%>
	</tr>

	<tr>
	<td>
	Year
	</td>
	<td>
	<%=rs.getString(7)%>
	</td>
	</tr>
	<tr>
	<td>
	Subjects
	</td>
	<td>
	<%=rs.getString(8)%><br/>
        <%=rs.getString(9)%><br/>
        <%=rs.getString(10)%><br/>
        <%=rs.getString(11)%><br/>
        <%=rs.getString(12)%><br/>
	</td>
        </tr>
    </table
        <%
        rs.close();
        ps.close();
        con.close();
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        %>
    </body>
</html>
