package controllers.cart;

import dao.ListProductDAO;
import dao.OrdersDAO;
import model.Account;
import model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(name = "PayController", value = "/PayController.html")
public class PayController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(true);

        try {
            OrdersDAO dao = new OrdersDAO();
            String name = request.getParameter("username");
            String address = request.getParameter("address");
            List<Product> list = (List<Product>) session.getAttribute("cart");
            Account acc = (Account) session.getAttribute("user");
            //update order_day
            Date date = new Date( );
            SimpleDateFormat ft = new SimpleDateFormat ("E yyyy.MM.dd 'at' hh:mm:ss a ");
            String upDate = ft.format(date);
            dao.insertOrder(list, acc, name, address, upDate);

            //delete product from session cart
            ListProductDAO listProductDAO = new ListProductDAO();
            List<Product> listDel = listProductDAO.removeAll(list);

            session.setAttribute("cart", listDel);
            request.setAttribute("payMess", "Mua hàng thành công");
            request.getRequestDispatcher("cart.jsp").forward(request,response);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
