package controllers.cart;

import dao.OrdersDAO;
import model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "PayController", value = "/PayController.html")
public class PayController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession(true);
        PrintWriter out = response.getWriter();

        try {
            OrdersDAO dao = new OrdersDAO();
            String name = request.getParameter("username");
            String address = request.getParameter("address");
            List<Product> list = (List<Product>) session.getAttribute("cart");
            dao.insertOrder(list, name, address);

        } catch (Exception e) {
            e.printStackTrace();
        }


    }
}
