package controllers.account;

import dao.OrdersDAO;
import model.Account;
import model.Order;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "AdminOrderController", value = "/AdminOrderController.html")
public class AdminOrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession(true);
        PrintWriter out = response.getWriter();

        OrdersDAO dao = new OrdersDAO();
        List<Order> listOrder = dao.getOrderAdmin();

        request.setAttribute("listO", listOrder);
        request.getRequestDispatcher("adminOrder.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
