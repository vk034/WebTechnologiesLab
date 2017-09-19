<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        
        <form method="post" action="">
        <fieldset>
        <legend>Login</legend>
	<table align="center">
	<tr>
	<td>
	UserName
	</td><td><input type="text" name="uname" required/>

	</td></tr>
	<tr>
	<td>
	Password
	</td><td>
	<input type="password" name="pwd" required />
	</td></tr>
	<tr>
	<td>
	<input type="submit" name="login" value="Login"/>
	</td><td>
	<input type="reset" name="reset" value="Cancel"/> 
</td></tr>
	
  
  </table>
  </fieldset>
  </form>
        <%
            if("Login".equals(request.getParameter("login")))
            {
                String uname = request.getParameter("uname");
                String pwd = request.getParameter("pwd");
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentdatabase","root","");           
                    String sql = "select * from registeredstudents where UserName = '"+uname+"' and Password = '"+pwd+"'";
                    PreparedStatement ps = con.prepareStatement(sql);
                    ResultSet rs = ps.executeQuery();
                    if(rs.next())
                    {  
                        session.setAttribute("UserName",uname);  
                        response.sendRedirect("EditViewProfile.jsp");
                    }
                    else
                    {
                        out.print("Invalid username/password");  
                        response.sendRedirect("Login.jsp"); 
                    }
                }catch(Exception e)
                {
                    e.printStackTrace();
                }
            }
        %>
    </body>
</html>
