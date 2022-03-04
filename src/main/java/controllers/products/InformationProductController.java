package controllers.products;

import dao.ListProductDAO;
import model.Account;
import model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "InformationProductController", value = "/InformationProductController.html")
public class InformationProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);

        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String number = request.getParameter("number");
            request.setAttribute("product", new ListProductDAO().getProduct(id));

            Account acc = (Account) session.getAttribute("user");

            if(acc != null && acc.getDecentralization_id() == 1 && number.equals("0")) {
                session.setAttribute("header", "adminHeader.jsp");
                RequestDispatcher rd = request.getRequestDispatcher("information.jsp");
                rd.forward(request,response);
            }

            if(acc != null && acc.getDecentralization_id() == 1 && number.equals("1")) {
                session.setAttribute("header", "adminHeader.jsp");
                RequestDispatcher rd = request.getRequestDispatcher("productDelete.jsp");
                rd.forward(request,response);
            }

            if(acc != null && acc.getDecentralization_id() == 2 && number.equals("0")) {
                session.setAttribute("header", "headerUser.jsp");
                RequestDispatcher rd = request.getRequestDispatcher("information.jsp");
                rd.forward(request,response);
            }
            if(acc != null && acc.getDecentralization_id() == 2 && number.equals("1")) {
                session.setAttribute("header", "headerUser.jsp");
                RequestDispatcher rd = request.getRequestDispatcher("information.jsp");
                rd.forward(request,response);
            }

            session.setAttribute("header", "header.jsp");
            RequestDispatcher rd = request.getRequestDispatcher("information.jsp");
            rd.forward(request,response);
        } catch (Exception ex) {
            response.getWriter().println(ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
