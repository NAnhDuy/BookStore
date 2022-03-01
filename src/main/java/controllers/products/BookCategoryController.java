package controllers.products;

import dao.ListProductDAO;
import model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "BookCategoryController", value = "/BookCategoryController.html")
public class BookCategoryController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);

        try {
            String cate = request.getParameter("cate");
            int category = 0;
            switch (cate) {
                case "child": category = 5;
                    break;
                case "manga": category = 3;
                    break;
                case "kinhte": category = 2;
                    break;
                case "vanhoc": category = 6;
                    break;
                case "khoahoc": category = 1;
                    break;
                case "nuconggiachanh": category = 4;
                    break;

            }
            int index = Integer.parseInt(request.getParameter("index"));
            ListProductDAO listProductDAO = new ListProductDAO();
            List<Product> ls = listProductDAO.searchCategory(category, index);
            int count = listProductDAO.countCategory(category);
            int size = 9;
            int endPage = count/size;
            if (count % size != 0) {
                endPage++;
            }

            if(session.getAttribute("user") != null) {
                session.setAttribute("header", "headerUser.jsp");
                request.setAttribute("listP", ls);
                request.setAttribute("endPage", endPage);
                request.setAttribute("category", cate);
                request.getRequestDispatcher("BookCategory.jsp").forward(request, response);
            }

            session.setAttribute("header", "header.jsp");
            request.setAttribute("listP", ls);
            request.setAttribute("endPage", endPage);
            request.setAttribute("category", cate);
            request.getRequestDispatcher("BookCategory.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
