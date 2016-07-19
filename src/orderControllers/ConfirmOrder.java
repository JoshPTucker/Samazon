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
import customTools.emailUtil;
import model.Sporder;
import model.Spuser;

/**
 * Servlet implementation class ConfirmOrder
 */
@WebServlet("/ConfirmOrder")
public class ConfirmOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfirmOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Spuser user = (Spuser)session.getAttribute("user");
		
		List<Sporder> orders = DBFunctions.getOrders(user.getUserid(), 2);
		
		String to = user.getUseremail();
		String from = "donotreply@samazon.com";
		String subject = "Samazon order receipt";
		StringBuilder body = new StringBuilder("Here is your receipt from your Samazon order\n");
		double total = 0;
		
		for(Sporder o:orders){
			body.append(" - "+o.getSpproduct().getProductname());
			body.append("\n"+o.getSpproduct().getProductprice()+" x "+o.getQuantity().intValue()+"\n");
			total += o.getSpproduct().getProductprice().doubleValue()*o.getQuantity().intValue();
			
			o.setStatus("1");
			DBFunctions.update(o);
		}
		body.append("Total: " + total + "\n Thank you for shopping with us!");
		
		emailUtil.sendEmail(to, from, subject, body.toString());
		
		request.setAttribute("cart", null);
		
		request.getRequestDispatcher("/Profile").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
