package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Functions.DBFunctions;
import customTools.PasswordUtil;
import customTools.emailUtil;
import model.Spuser;

@WebServlet("/ForgotPassword")
public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ForgotPassword() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String newpass = emailUtil.getRandomPassword();
		String email = request.getParameter("email");
		Spuser user = DBFunctions.getUserByEmail(email);
		String hashedpass="";
		String subject = "Samazon password reset";
		String body = "A request has been sent to reset your password.  Here is"
				+ "your temporary password to log in and change it: " + newpass;
		
		try{
			hashedpass = PasswordUtil.hashPasswordPlusSalt(newpass, user.getSalt());
		} catch (Exception e){
			System.out.println(e);
		}
		
		user.setHashedpassword(hashedpass);
		DBFunctions.update(user);
		emailUtil.sendEmail(email, "donotreply@samazon.com", subject, body);
		
		request.getRequestDispatcher("/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
