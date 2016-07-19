package Servlets;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;

import customTools.ReviewUtil;
import model.Spreview;

/**
 * Servlet implementation class Helpful
 */
@WebServlet("/Helpful")
public class Helpful extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Helpful() {
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
		// TODO Auto-generated method stub
	//HttpSession session =request.getSession();
	String id = request.getParameter("reviewid");
	Spreview rev= ReviewUtil.getReviewByID(id);
	BigDecimal helpful=new BigDecimal (rev.getHelpful().intValue()+1);
	rev.setHelpful( helpful);
	ReviewUtil.update(rev);
	request.setAttribute("currproduct", rev.getSpproduct());
	String nextURL = "/details.jsp";
	request.getRequestDispatcher(nextURL).forward(request,response);
	}

}
