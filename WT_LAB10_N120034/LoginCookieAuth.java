import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

public class LoginCookieAuth extends HttpServlet {
    Cookie []ck = new Cookie[5];
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        int i=0;
        Enumeration<String> initParams = getServletConfig().getInitParameterNames();
        while (initParams.hasMoreElements()) {
            String pname = initParams.nextElement();
            String pvalue = config.getInitParameter(pname);
            ck[i] = new Cookie(pname,pvalue);
            i++;
        }   
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String uname = request.getParameter("uname");
        
        String pwd = request.getParameter("pwd");
        int i;
        for(i=0;i<ck.length;i++){   
            if((ck[i].getName()).equals(uname) && (ck[i].getValue()).equals(pwd)){
                out.println("Welcome "+ uname);
                break;
            }
        }
        if(i>=ck.length)
        {
            out.println("You are not an authenticated user”."); 
        }
    }
    public void destroy()
    {
        for(int i=0;i<5;i++)
        {
            ck[i].setMaxAge(0);
        }
    }

}
