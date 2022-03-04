package controllers.admin;

import dao.ListProductDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "NewProductController", value = "/NewProductController.html")
public class NewProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        try {
            String product_name = request.getParameter("name");
            String product_author = request.getParameter("author");
            int price = Integer.parseInt(request.getParameter("price"));
            int price_sale = Integer.parseInt(request.getParameter("price_sale"));
            String img = request.getParameter("img");
            int supplier_id = Integer.parseInt(request.getParameter("supplier"));
            int cover_form_id = Integer.parseInt(request.getParameter("cover_form"));
            int category_id = Integer.parseInt(request.getParameter("category"));

            ListProductDAO dao = new ListProductDAO();
            dao.insertNewProduct(product_name, product_author, price, price_sale, img, supplier_id, cover_form_id,
                    category_id);

            request.setAttribute("mess", "Thêm sản phẩm mới thành công");
            request.getRequestDispatcher("newProduct.jsp").forward(request,response);
        } catch (Exception e) {
             e.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
