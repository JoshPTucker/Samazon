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
 * Servlet implementation class AddToCart
 */
@WebServlet("/AddToCart")
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddToCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Spuser user = (Spuser)session.getAttribute("user");
		
		List<Sporder> cart = (List<Sporder>)session.getAttribute("cart");
		Spproduct product = DBFunctions.getProductByID(request.getParameter("productid"));
		
		Sporder order = new Sporder();
		
		
		order.setQuantity(new BigDecimal(request.getParameter("quantity")));
		order.setSpproduct(product);
		order.setSpuser(user);
		order.setStatus("2");
		
		if(user==null){
			if(cart==null){
				cart = new ArrayList<Sporder>();
				cart.add(order);
			}
			else{
				cart.add(order);
			}
			session.setAttribute("cart", cart);
		}
		else{
			DBFunctions.insert(order);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
