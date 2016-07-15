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
import model.Sporder;
import model.Spproduct;
import model.Spuser;


@WebServlet("/AddToWishList")
public class AddToWishList extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddToWishList() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Spuser user = (Spuser)session.getAttribute("user");
		
		Spproduct product = DBFunctions.getProductByID(request.getParameter("productid"));
		
		Sporder order = new Sporder();
		
		
		order.setQuantity(new BigDecimal(request.getParameter("quantity")));
		order.setSpproduct(product);
		order.setSpuser(user);
		order.setStatus("3");
		
		DBFunctions.insert(order);
		
		request.getRequestDispatcher("/Wishlist").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
