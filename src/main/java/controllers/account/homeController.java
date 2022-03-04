package controllers.account;

import model.Account;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "homeController", value = "/homeController.html")
public class homeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession(true);
        try {
            Account acc = (Account) session.getAttribute("user");

            if (acc.getDecentralization_id() == 2) {
                request.getRequestDispatcher("homeUser.jsp").forward(request, response);

            }
            if (acc.getDecentralization_id() == 1) {
                request.getRequestDispatcher("adminHome.jsp").forward(request, response);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
