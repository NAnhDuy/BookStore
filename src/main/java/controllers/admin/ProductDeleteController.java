package controllers.admin;

import dao.ListProductDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ProductDeleteController", value = "/ProductDeleteController.html")
public class ProductDeleteController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; cherset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        try {
            int product_id = Integer.parseInt(request.getParameter("product_id"));
            ListProductDAO dao = new ListProductDAO();
            dao.deleteProduct(product_id);

            request.setAttribute("mess", "Xóa sản phẩm thành công");
            request.getRequestDispatcher("adminHome.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
