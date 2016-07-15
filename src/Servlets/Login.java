package Servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Functions.DBFunctions;
import Functions.DBUser;
import model.Sporder;
import model.Spuser;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String useremail = request.getParameter("email");
        String userpassword = request.getParameter("password");       
        String action = request.getParameter("action");     
        String nextURL = "";       
        HttpSession session = request.getSession();          
        Spuser user = null;        
        
        System.out.println("LoginServlet action: "+action);
        if (action.equals("logout")){
        	System.out.println("LoginServlet: action=logout");
            session.invalidate();
            nextURL = "/login.jsp";
            
        }else{
            user = DBUser.getValidUser(useremail, userpassword);
            
            if (user != null){            	
            	
            	System.out.println("found valid user"+useremail+" "+userpassword);
                session.setAttribute("user", user); 
                session.setAttribute("username", String.valueOf(user.getUsername()));
                
                // TO DO: add shopping cart to the database
                List<Sporder> cart = (List<Sporder>)session.getAttribute("cart");
                DBFunctions.addCart(cart);                 
                
                nextURL = "/showproducts.jsp";
            }else{
                nextURL = "/login.jsp";
            }
            
        }
        //redirect to the next page    
        response.sendRedirect(request.getContextPath() + nextURL);
	}

}
