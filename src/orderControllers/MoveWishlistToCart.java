package orderControllers;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Functions.DBFunctions;
import model.Sporder;
import model.Spproduct;
import model.Spuser;

/**
 * Servlet implementation class MoveWishlistToCart
 */
@WebServlet("/MoveWishlistToCart")
public class MoveWishlistToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MoveWishlistToCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		//Spuser user = (Spuser)session.getAttribute("user");		
		
		String orderid = request.getParameter("orderid");
		Sporder order = DBFunctions.getOrderByID(orderid);
		
		// change the status to 2 to indicate that this is now an item in the cart
		order.setStatus("2");			
		
		if(order != null){
			DBFunctions.update(order);			
		}
		
		request.getRequestDispatcher("/Wishlist").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
