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
        PrintWriter out = response.getWriter();

        String header = (String) session.getAttribute("header");

        if (header.equals("headerUser.jsp")) {
            request.getRequestDispatcher("homeUser.jsp").forward(request, response);
        }
        if (header.equals("adminHeader.jsp")) {
            request.getRequestDispatcher("adminHome.jsp").forward(request, response);


        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
