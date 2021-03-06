package controllers.products;

import dao.ListProductDAO;
import model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "SearchPriceSaleController", value = "/SearchPriceSaleController.html")
public class SearchPriceSaleController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);

        try {
            int index = Integer.parseInt(request.getParameter("index"));

            ListProductDAO listProductDAO = new ListProductDAO();
            List<Product> ls = listProductDAO.searchSale(index);
            int count = listProductDAO.countSale();
            int size = 9;
            int endPage = count/size;
            if (count % size != 0) {
                endPage++;
            }

            if(session.getAttribute("user") != null) {
                session.setAttribute("header", "headerUser.jsp");
                request.setAttribute("listSale", ls);
                request.setAttribute("endPage", endPage);
                request.getRequestDispatcher("allSalePage.jsp").forward(request, response);
            }
            session.setAttribute("header", "header.jsp");
            request.setAttribute("listSale", ls);
            request.setAttribute("endPage", endPage);
            request.getRequestDispatcher("allSalePage.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
