package controller;

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

@WebServlet(name = "SearchPriceSaleController", value = "/SearchPriceSaleController.html")
public class SearchPriceSaleController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

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
