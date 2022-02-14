package controllers.page;

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
        PrintWriter out = response.getWriter();
        try {
            String cate = request.getParameter("cate");
            String category ="";
            switch (cate) {
                case "child": category = "Thiếu Nhi";
                    break;
                case "manga": category = "MANGA - LIGHT NOVEL";
                    break;
                case "kinhte": category = "Kinh Tế";
                    break;
                case "vanhoc": category = "Văn Học";
                    break;
                case "khoahoc": category = "khoa học kỹ thuật";
                    break;
                case "nuconggiachanh": category = "Nữ Công Gia Chánh";
                    break;

            }
            int index = Integer.parseInt(request.getParameter("index"));
            ListProductDAO listProductDAO = new ListProductDAO();
            List<Product> ls = listProductDAO.searchCategory(category, index);
            out.println(ls.get(0).getName());
            int count = listProductDAO.countCategory(category);
            int size = 9;
            int endPage = count/size;
            if (count % size != 0) {
                endPage++;
            }

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
