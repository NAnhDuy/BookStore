package controllers.cart;

import dao.ListProductDAO;
import dao.OrdersDAO;
import model.Account;
import model.Order;
import model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "MyCartController", value = "/MyCartController.html")
public class MyCartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession(true);
        PrintWriter out = response.getWriter();

        try {
            String action = request.getParameter("action");
            out.println(action);
            int id = Integer.parseInt(request.getParameter("id"));
            out.println(id);

            if (action != null && action.equalsIgnoreCase("delete")) {
                ListProductDAO listProductDAO = new ListProductDAO();
                List<Product> lp = (List<Product>) session.getAttribute("cart");
                List<Product> cart = listProductDAO.remove(id, lp);

                session.setAttribute("cart", cart);
                request.getRequestDispatcher("myCart.jsp").forward(request, response);
            }

            if(session.getAttribute("user")!=null) {
                Account a = (Account) session.getAttribute("user");
                String userMail = a.getUser();
                List<Order> orderCart = new OrdersDAO().getListOrder(userMail);

                session.setAttribute("header", "headerUser.jsp");
                session.setAttribute("orderCart", orderCart);
                request.getRequestDispatcher("myCart.jsp").forward(request,response);
            }

            session.setAttribute("header", "header.jsp");
            request.getRequestDispatcher("myCart.jsp").forward(request,response);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
