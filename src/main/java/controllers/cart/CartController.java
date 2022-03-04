package controllers.cart;

import dao.ListProductDAO;
import model.Account;
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

        try {
            HttpSession session = request.getSession(true);
            int id = Integer.parseInt(request.getParameter("id"));
            String action = request.getParameter("action");
            int number = Integer.parseInt(request.getParameter("number"));

            if (action != null && action.equalsIgnoreCase("add")) {
                if (session.getAttribute("cart") == null) {
                    session.setAttribute("cart", new ArrayList<>());
                }

                List<Product> ls = (List<Product>) session.getAttribute("cart");
                Product p = new ListProductDAO().listById(id, number);
                //check id products
                for(int i=0; i<ls.size(); i++) {
                    if(ls.get(i).getId() == id) {
                        int a = number + ls.get(i).getNumber();
                        ls.remove(i);
                        p.setNumber(a);
                    }
                }
                ls.add(p);

                Account acc = (Account) session.getAttribute("user");
                if(acc != null && acc.getDecentralization_id() == 2) {
                    session.setAttribute("header", "headerUser.jsp");
                    session.setAttribute("cart", ls);
                    request.getRequestDispatcher("cart.jsp").forward(request, response);
                }
                if(acc != null && acc.getDecentralization_id() == 1) {
                    session.setAttribute("header", "adminHeader.jsp");
                    session.setAttribute("cart", ls);
                    request.getRequestDispatcher("cart.jsp").forward(request, response);
                }
                session.setAttribute("header", "header.jsp");
                session.setAttribute("cart", ls);
                request.getRequestDispatcher("cart.jsp").forward(request, response);

            } else if (action != null && action.equalsIgnoreCase("delete")) {
                ListProductDAO listProductDAO = new ListProductDAO();
                List<Product> lp = (List<Product>) session.getAttribute("cart");
                List<Product> cart = listProductDAO.remove(id, lp);
                Account acc = (Account) session.getAttribute("user");

                if(acc != null && acc.getDecentralization_id() == 2) {
                    session.setAttribute("header", "headerUser.jsp");
                    session.setAttribute("cart", cart);
                    request.getRequestDispatcher("cart.jsp").forward(request, response);
                }
                if(acc != null && acc.getDecentralization_id() == 1) {
                    session.setAttribute("header", "adminHeader.jsp");
                    session.setAttribute("cart", cart);
                    request.getRequestDispatcher("cart.jsp").forward(request, response);
                }
                session.setAttribute("header", "header.jsp");
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
