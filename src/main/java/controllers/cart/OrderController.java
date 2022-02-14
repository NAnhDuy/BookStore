package controllers.cart;

import model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "OrderController", value = "/OrderController.html")
public class OrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession(true);

        int price = 0;
        int total = 0;
        List<Product> list = (List<Product>) session.getAttribute("cart");
        for(int i=0; i<list.size(); i++ ) {
            price = list.get(i).getPrice_sale() * list.get(i).getNumber();
            total += price;
        }

        session.setAttribute("total", total);
        request.getRequestDispatcher("order.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
