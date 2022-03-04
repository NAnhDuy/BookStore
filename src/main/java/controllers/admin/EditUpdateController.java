package controllers.admin;

import dao.ListProductDAO;
import model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "EditUpdateController", value = "/EditUpdateController.html")
public class EditUpdateController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        try {
            String product_name = request.getParameter("product_name");
            String product_author = request.getParameter("product_author");
            int product_price = Integer.parseInt(request.getParameter("product_price"));
            int product_price_sale = Integer.parseInt(request.getParameter("product_price_sale"));
            String img = request.getParameter("product_img_source");
            int product_id = Integer.parseInt(request.getParameter("product_id"));

            String supplier = request.getParameter("supplier");
            int supplier_id = 0;
            switch (supplier) {
                case "1980 Books": supplier_id = 1; break;
                case "Alpha Books": supplier_id = 2; break;
                case "AZ Việt Nam": supplier_id = 3; break;
                case "Báo Sinh Viên VN - Hoa Học Trò": supplier_id = 4; break;
                case "Cty Văn Hóa Văn Lang": supplier_id = 5; break;
                case "IPM": supplier_id = 6; break;
                case "Minh Long": supplier_id = 7; break;
                case "Nhã Nam": supplier_id = 8; break;
                case "Nhà Xuất Bản Kim Đồng": supplier_id = 9; break;
                case "NXB Tổng Hợp TPHCM": supplier_id = 10; break;
                case "NXB Trẻ": supplier_id = 11; break;
                case "Saigon Books": supplier_id = 12; break;
                case "Skybooks": supplier_id = 13; break;
                case "Tân Việt": supplier_id = 14; break;
                case "Thái Hà": supplier_id = 15; break;
                case "Đinh Tị": supplier_id = 16; break;
            }

            String cover_form = request.getParameter("cover_form");
            int cover_form_id = 0;
            switch (cover_form) {
                case "Bìa Mềm": cover_form_id = 1; break;
                case "Bìa Cứng": cover_form_id = 2; break;
                case "Bộ Hộp": cover_form_id = 3; break;
            }

            String category = request.getParameter("category");
            int category_id = 0;
            switch (category) {
                case "khoa học kỹ thuật": category_id = 1; break;
                case "Kinh Tế": category_id = 2; break;
                case "MANGA - LIGHT NOVEL": category_id = 3; break;
                case "Nữ Công Gia Chánh": category_id = 4; break;
                case "thiếu nhi": category_id = 5; break;
                case "Văn Học": category_id = 6; break;
            }

            ListProductDAO dao = new ListProductDAO();
            dao.updateProduct(product_name, product_author, product_price, product_price_sale, img, supplier_id,
                    cover_form_id, category_id, product_id);

            Product afterUpdate = dao.getProduct(product_id);

            request.setAttribute("product", afterUpdate);
            request.setAttribute("mess", "Chỉnh sửa sản phẩm thành công");
            request.getRequestDispatcher("editProduct.jsp").forward(request,response);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
