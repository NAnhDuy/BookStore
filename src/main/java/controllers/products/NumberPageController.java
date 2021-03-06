package controllers.products;

import dao.ListProductDAO;
import model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "NumberPageController", value = "/NumberPageController.html")
public class NumberPageController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);

        int index = Integer.parseInt(request.getParameter("index"));
        List<Product> ls = new ListProductDAO().pagingProduct(index);

        if(session.getAttribute("user") != null) {
            session.setAttribute("header", "headerUser.jsp");
            request.setAttribute("listP", ls);
            request.getRequestDispatcher("numberPage.jsp").forward(request,response);
        }
        session.setAttribute("header", "header.jsp");
        request.setAttribute("listP", ls);
        request.getRequestDispatcher("numberPage.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
