package controllers.cart;

import dao.ListProductDAO;
import model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "MyCartController", value = "/MyCartController.html")
public class MyCartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession(true);

        String action = request.getParameter("action");
        int id = Integer.parseInt(request.getParameter("id"));

        if (action != null && action.equalsIgnoreCase("delete")) {
            ListProductDAO listProductDAO = new ListProductDAO();
            List<Product> lp = (List<Product>) session.getAttribute("cart");
            List<Product> cart = listProductDAO.remove(id, lp);

            session.setAttribute("cart", cart);
            request.getRequestDispatcher("myCart.jsp").forward(request, response);
        }

        request.getRequestDispatcher("myCart.jsp").forward(request,response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
