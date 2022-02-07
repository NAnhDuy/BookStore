package controller;

import dao.ListProductDAO;
import model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CartController", value = "/CartController.html")
public class CartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

//        try {
//            int id = Integer.parseInt(request.getParameter("id"));
//            int number = Integer.parseInt(request.getParameter("number"));
//
//            HttpSession session = request.getSession(true);
//            ListProductDAO listProductDAO = new ListProductDAO();
//            List<Product> ls = listProductDAO.listById(id, number);
//            session.setAttribute("listI", ls);
//
//            request.getRequestDispatcher("cart.jsp").forward(request, response);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }

        try {
            HttpSession session = request.getSession(true);
            int id = Integer.parseInt(request.getParameter("id"));
            String action = request.getParameter("action");
            int number = Integer.parseInt(request.getParameter("number"));

            if (action != null && action.equalsIgnoreCase("add")) {
                if (session.getAttribute("cart") == null) {
                    session.setAttribute("cart", new ArrayList<>());
                }
                Product p = new ListProductDAO().listById(id, number);
                List<Product> ls = (List<Product>) session.getAttribute("cart");
                ls.add(p);

                session.setAttribute("cart", ls);
                request.getRequestDispatcher("cart.jsp").forward(request, response);
            } else if (action != null && action.equalsIgnoreCase("delete")) {
                ListProductDAO listProductDAO = new ListProductDAO();
                List<Product> lp = (List<Product>) session.getAttribute("cart");
                List<Product> cart = listProductDAO.remove(id, lp);


                session.setAttribute("cart", cart);
                request.getRequestDispatcher("cart.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
