package orderControllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Functions.DBFunctions;
import model.Sporder;
import model.Spuser;

@WebServlet("/ViewOrder")
public class ViewOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public ViewOrder() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Spuser user = (Spuser)session.getAttribute("user");
		double shipping = 1.5;
		
		List<Sporder> orders = DBFunctions.getOrders(user.getUserid(), 2);
		
		double total = 0;
		double volume = 0;
		
		for(Sporder o:orders){
			double q = o.getQuantity().doubleValue();
			double p = o.getSpproduct().getProductprice().doubleValue();
			double t = o.getSpproduct().getTax().doubleValue();
			
			volume++;
			
			total+= q*p*t;
		}

		request.setAttribute("orders", orders);
		request.setAttribute("shipping", volume*1.5);
		request.setAttribute("total", total);
		
		request.getRequestDispatcher("/confirmorder.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
