package controllers.products;

import dao.ListProductDAO;
import model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "EditProductController", value = "/EditProductController.html")
public class EditProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        try {
            int product_id = Integer.parseInt(request.getParameter("id"));
            ListProductDAO dao =  new ListProductDAO();

            Product a = dao.getProduct(product_id);
            request.setAttribute("product", a);
            request.getRequestDispatcher("editProduct.jsp").forward(request,response);

        } catch (Exception e) {
            e.printStackTrace();
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
