package Servlets;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Functions.DBFunctions;
import customTools.ReviewUtil;
import model.Spproduct;
import model.Spreview;
import model.Spuser;

/**
 * Servlet implementation class ReviewServlet
 */
@WebServlet("/ReviewServlet")
public class ReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		//get current date time with Date()
		Date date = new Date();
		String reviewtext = request.getParameter("reviewtext");
//		Number rating;
//		rating= Integer.parseInt(request.getParameter("rating"));
//		BigDecimal r=new BigDecimal( rating.toString());
		Spuser user = (Spuser) session.getAttribute("user");
		String id= request.getParameter("productid");
		long productid= Integer.parseInt(id);
		
		Spproduct product = DBFunctions.getProductByID(id);
		
		Spreview rev = new Spreview();
		rev.setProductreview(reviewtext);
		rev.setSpproduct(product);
		rev.setSpuser(user);
		ReviewUtil.insert(rev);
		List<Spreview> r=ReviewUtil.getProductReviews(productid);
		ArrayList<Spreview> reviews=new ArrayList<Spreview>();
		reviews.addAll(r);
		session.setAttribute("currproduct", product);
		session.setAttribute("reviews", reviews);
		String nextURL="/productdetails.jsp";
		response.sendRedirect(request.getContextPath() + nextURL);
		
	}

}
