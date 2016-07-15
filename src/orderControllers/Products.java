package orderControllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Functions.DBFunctions;
import model.Spproduct;

@WebServlet("/Products")
public class Products extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Products() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Spproduct> products = DBFunctions.getProducts();
		
		request.setAttribute("products", products);

		request.getRequestDispatcher("/products.jsp").forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
