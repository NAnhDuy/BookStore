package controllers.page;

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

        try {
            String supplier = request.getParameter("supplier");
            switch (supplier) {
                case "kimdong" : supplier = "Nhà Xuất Bản Kim Đồng";
                break;
                case "tre" : supplier = "NXB Trẻ";
                break;
                case "alpha" : supplier = "Alpha Books";
                break;
                case "tanviet" : supplier = "Tân Việt";
                break;
                case "dinhti" : supplier = "Đinh Tị";
                break;
                case "nhanam" : supplier = "Nhã Nam";
                break;
            }

            int index = Integer.parseInt(request.getParameter("index"));
            ListProductDAO listProductDAO = new ListProductDAO();
            List<Product> ls = listProductDAO.searchSupplier(supplier, index);
            int count = listProductDAO.countSupplier(supplier);
            int size = 9;
            int endPage = count/size;
            if (count % size != 0) {
                endPage++;
            }
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
