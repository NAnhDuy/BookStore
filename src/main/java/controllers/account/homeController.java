package controllers.account;

import model.Account;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "homeController", value = "/homeController.html")
public class homeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession(true);

        Account a = (Account) session.getAttribute("user");

        if(a != null) {
            request.getRequestDispatcher("homeUser.jsp").forward(request,response);
        }
        request.getRequestDispatcher("home.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
