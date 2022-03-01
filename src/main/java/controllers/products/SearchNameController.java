package controllers.products;

import context.DBContext;
import dao.ListProductDAO;
import model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchNameController", value = "/SearchNameController.html")
public class SearchNameController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);

        try {
            String search = request.getParameter("search");
            int index = Integer.parseInt(request.getParameter("index"));
            ListProductDAO listProductDAO = new ListProductDAO();
            List<Product> ls = listProductDAO.searchName(search, index);
            int count = listProductDAO.countName(search);
            int size = 9;
            int endPage = count/size;
            if (count % size != 0) {
                endPage++;
            }

            if(session.getAttribute("user") != null) {
                session.setAttribute("header", "headerUser.jsp");
                request.setAttribute("listName", ls);
                request.setAttribute("endPage", endPage);
                request.setAttribute("search", search);
                request.getRequestDispatcher("searchByName.jsp").forward(request, response);
            }
            session.setAttribute("header", "header.jsp");
            request.setAttribute("listName", ls);
            request.setAttribute("endPage", endPage);
            request.setAttribute("search", search);
            request.getRequestDispatcher("searchByName.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
