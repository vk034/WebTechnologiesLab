<%-- 
    Document   : Register
    Created on : Apr 12, 2017, 4:39:38 PM
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
        <title>Registration Page</title>
    </head>
    <body>
       <%
        String fname, lname, sid, gender, Address, branch, year,uname, pwd, cpwd="";
        String s1="";
        String s2="";
        String s3="";
        String s4="";
        String s5 ="";
        String subjects[];
        if("Submit".equals(request.getParameter("submit")))
        {
        fname = request.getParameter("fname");
        lname = request.getParameter("lname");
        sid = request.getParameter("sid");
        gender = request.getParameter("gender");
        Address = request.getParameter("Address");
        branch = request.getParameter("branch");
        year = request.getParameter("year");
        uname = request.getParameter("uname");
        pwd = request.getParameter("pwd");
        cpwd = request.getParameter("cpwd");
        
        subjects = request.getParameterValues("subjects");
        if (subjects != null) 
        {
            for(int i = 0; i < subjects.length; i++) 
            {
                if(subjects[i].equals("OOPS"))
                {
                    s1=subjects[i];
                }
                if(subjects[i].equals("CN"))
                {
                    s2=subjects[i];
                }
                if(subjects[i].equals("CC"))
                {
                    s3=subjects[i];
                }
                if(subjects[i].equals("MAD"))
                {
                    s4=subjects[i];
                }
                if(subjects[i].equals("WT"))
                {
                    s5=subjects[i];
                }
            }
        }
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentdatabase","root","");           
            String sql = "insert into registeredstudents values('"+sid+"','"+fname+"','"+lname+"','"+gender+"','"+Address+"','"+branch+"','"+year+"','"+s1+"','"+s2+"','"+s3+"','"+s4+"','"+s5+"','"+uname+"','"+pwd+"')";
            PreparedStatement ps = con.prepareStatement(sql);
            int result = ps.executeUpdate();
            if(result>0)
            {
                out.print("Details stored successfully");   
                response.sendRedirect("Login.jsp;");
            }
            else
            {
                out.print("Error occured while storing details");  
                response.sendRedirect("index.html");
                
            }
            
            ps.close();
            con.close();
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        }
        %>
    <form method = "post" action = "">
    <fieldset>
    <legend>Registration</legend>
	<table align="center">	
	<tr>
	<td>
	First Name
	</td>
	<td>
		<input type="text" name="fname" /> 
	</td>
	</tr>
	<tr>
	<td>
	Last Name
	</td>
	<td>
		<input type="text" name="lname" />
	</td>
	</tr>
	<tr>
	<td>
	University ID
	</td>
	<td>
		<input type="text" name="sid" />
	</td>
	</tr>
	<tr>
	<tr>
	<td>
	Gender
	</td>
	<td><input type="radio" name="gender" value="male" checked>Male 
			<input type="radio" name="gender" value="female">Female 
	</td>
	</tr>
	<tr>
	<td>
	Address
	</td>
	<td>
	<textarea name="Address" rows="3" cols="5"></textarea>
	</td>
	</tr>
	<tr>
	<td>
	Branch
	</td>
	<td>
	<select name="branch">
	<option value="cse">CSE</option>
	<option value="ece">ECE</option>
	<option value="eee">EEE</option>
	</select>
	</td>
	</tr>

	<tr>
	<td>
	Year
	</td>
	<td>
	<select name="year">
		<option value="select" selected>Select</option>
		<option value="E1">E1</option>
		<option value="E2">E2</option>
		<option value="E3">E3</option>
		<option value="E4">E4</option>
	</select>
	</td>
	</tr>
	<tr>
	<td>
	Subjects
	</td>
	<td>
	<input type="checkbox" name="subjects[]" value="OOPS"/> OOPS
	<input type="checkbox" name="subjects[]" value="CN"/> CN
	<input type="checkbox" name="subjects[]" value="CC"/> CC
	<input type="checkbox" name="subjects[]" value="MAD"/> MAD
	<input type="checkbox" name="subjects[]" value="WT"/> WT
	</td>
	</tr>
	<tr>
	<td>
	UserName
	</td><td><input type="text" name="uname"/>
	</td></tr>
	<tr>
	<td>
	Password
	</td><td>
	<input type="password" name="pwd" />
	</td></tr>
	<tr>
	<td>
	Confirm Password
	</td><td>
	<input type="password" name="cpwd" value="" maxlength=30></td></tr>
	<tr>
	<td>
	<input type="submit" name="submit" value="Submit"/>
	</td><td>
	<input type="reset" name="reset" value="Reset"/> 
    </td></tr>
    </table>
  </fieldset>
  </form>
    </body>
</html>
