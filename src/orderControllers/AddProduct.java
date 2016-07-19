package orderControllers;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Functions.DBFunctions;
import model.Spproduct;
import model.Spuser;

/**
 * Servlet implementation class AddProduct
 */
@WebServlet("/AddProduct")
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddProduct() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Spuser user = (Spuser) session.getAttribute("user");
		String nextURL;

		// TO DO: add user.getAdmin()		
		// if(user==null || user.getAdmin() != 1) {
		if (user == null) {
			// if not a valid user or the user is not the admin, redirect to products
			nextURL = "/Products";
		} else {

				
			Spproduct newproduct = new Spproduct();
			newproduct.setProductname(request.getParameter("productname"));
			newproduct.setProductdescription(request.getParameter("description"));
			newproduct.setProductpicture(request.getParameter("imageurl"));
			newproduct.setProductprice(new BigDecimal(request.getParameter("price")));
			newproduct.setTax(new BigDecimal(request.getParameter("taxrate")));

			DBFunctions.insert(newproduct);

			nextURL = "/dashboard.jsp";
		}

		response.sendRedirect(request.getContextPath() + nextURL);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
