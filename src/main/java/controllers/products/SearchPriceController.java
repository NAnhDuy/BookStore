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

@WebServlet(name = "SearchPriceController", value = "/SearchPriceController.html")
public class SearchPriceController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);

        try {
            String p = request.getParameter("price");
            int priceMin = 0;
            int priceMax = 0;
            switch (p) {
                case "0-150" : priceMin = 0; priceMax = 150000;
                    break;
                case "150-300" : priceMin = 150000; priceMax = 300000;
                    break;
                case "300-500" : priceMin = 300000; priceMax = 500000;
                    break;
                case "500-max" : priceMin = 500000;
                    break;
            }
            int index = Integer.parseInt(request.getParameter("index"));
            ListProductDAO listProductDAO = new ListProductDAO();
            List<Product> ls = listProductDAO.searchPrice(priceMin, priceMax, index);
            int count = listProductDAO.countPrice(priceMin, priceMax);
            int size = 9;
            int endPage = count/size;
            if (count % size != 0) {
                endPage++;
            }

            if(session.getAttribute("user") != null) {
                session.setAttribute("header", "headerUser.jsp");
                request.setAttribute("listPrice", ls);
                request.setAttribute("set", p);
                request.setAttribute("endPage", endPage);
                request.getRequestDispatcher("searchByPrice.jsp").forward(request, response);
            }
            session.setAttribute("header", "header.jsp");
            request.setAttribute("listPrice", ls);
            request.setAttribute("set", p);
            request.setAttribute("endPage", endPage);
            request.getRequestDispatcher("searchByPrice.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
