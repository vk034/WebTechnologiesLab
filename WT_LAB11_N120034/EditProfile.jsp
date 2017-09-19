<%-- 
    Document   : Prof
    Created on : Apr 13, 2017, 12:32:50 PM
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
        
        <form name="profile" action="" method="post">
            <legend>View/Edit Profile</legend>
        <table align="center" border="1" cellpadding="5" cellspacing="5">
        <caption>PROFILE</caption>
	<tr>
	<td>
	First Name
	</td>
	<td>
            <input type="text" name="fname" value="<%=rs.getString(2)%>">
	</td>
	</tr>
	<tr>
	<td>
	Last Name
	</td>
	<td>
            <input type="text" name="lname" value="<%=rs.getString(3)%>">
	</td>
	</tr>
	<tr>
	<td>
	University ID
	</td>
	<td>
            <input type="text" name="sid" value="<%=rs.getString(1)%>" readonly>
	</td>
	</tr>
	<tr>
	<tr>
	<td>
	Gender
	</td>
	<td>
            <input type="text" name="gender" value="<%=rs.getString(4)%>" readonly>
	</td>
	</tr>
	<tr>
	<td>
	Address
	</td>
	<td>
            <textarea cols="10" rows="10" name="Address"><%=rs.getString(5)%></textarea>
	</td>
	</tr>
	<tr>
	<td>
	Branch
	</td>
	<td>
            <input type="text" name="branch" value="<%=rs.getString(6)%>" readonly>
	</tr>
	<tr>
	<td>
	Year
	</td>
	<td>
            <input type="text" name="year" value="<%=rs.getString(7)%>" readonly>
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
        </tr
        <tr>
            <td><input type="submit" name="esub" value="Save"></td>
            <td><input type="reset" name="ereset" value="Cancel"></td>
        </tr>
        </table>
        </form>
        <%
        rs.close();
        
        String fname, lname,Address="";
        if("Save".equals(request.getParameter("esub")))
        {
            fname = request.getParameter("fname");
            lname = request.getParameter("lname");
            Address = request.getParameter("Address");
            sql = "update registeredstudents set FirstName='"+fname+"',LastName='"+lname+"', Address ='"+Address+"' where UserName = '"+UserName+"';";
            ps = con.prepareStatement(sql);
            int result = ps.executeUpdate();
            if(result>0)
            {
                response.sendRedirect("Profile.jsp");
            }
            else
            {
                response.sendRedirect("EditProfile.jsp");
            }
        }
        ps.close();
        con.close();
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        %>
    </body>
</html>
