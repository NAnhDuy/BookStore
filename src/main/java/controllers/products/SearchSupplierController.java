package controllers.products;

import dao.ListProductDAO;
import model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchSupplierController", value = "/SearchSupplierController.html")
public class SearchSupplierController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);

        try {
            String supplier = request.getParameter("supplier");
            int supp = 0;
            switch (supplier) {
                case "kimdong" : supp = 9;
                break;
                case "tre" : supp = 11;
                break;
                case "alpha" : supp = 2;
                break;
                case "tanviet" : supp = 14;
                break;
                case "dinhti" : supp = 16;
                break;
                case "nhanam" : supp = 8;
                break;
            }

            int index = Integer.parseInt(request.getParameter("index"));
            ListProductDAO listProductDAO = new ListProductDAO();
            List<Product> ls = listProductDAO.searchSupplier(supp, index);
            int count = listProductDAO.countSupplier(supp);
            int size = 9;
            int endPage = count/size;
            if (count % size != 0) {
                endPage++;
            }

            if(session.getAttribute("user") != null) {
                session.setAttribute("header", "headerUser.jsp");
                request.setAttribute("listSupplier", ls);
                request.setAttribute("endPage", endPage);
                request.setAttribute("supplier", supplier);
                request.getRequestDispatcher("searchBySupplier.jsp").forward(request, response);
            }
            session.setAttribute("header", "header.jsp");
            request.setAttribute("listSupplier", ls);
            request.setAttribute("endPage", endPage);
            request.setAttribute("supplier", supplier);
            request.getRequestDispatcher("searchBySupplier.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
