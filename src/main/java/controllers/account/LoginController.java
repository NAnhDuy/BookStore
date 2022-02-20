package controllers.account;

import dao.AccountDAO;
import model.Account;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginController", value = "/LoginController.html")
public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession(true);

        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            //check null
            if (username == "" || password == "") {
                String error = "Tài khoản và Mật khẩu không được phép trống";
                request.setAttribute("error", error);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            AccountDAO accountDAO = new AccountDAO();
            Account acc = accountDAO.getAccount(username, password);

            //check mail
            if (acc == null) {
                String error = "Tài khoản hoặc Mật khẩu sai";
                request.setAttribute("error", error);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            //check cart
            if(session.getAttribute("checkCart") != null) {
                session.setAttribute("header", "header.jsp");
                request.getRequestDispatcher("cart.jsp").forward(request, response);
            }
            session.setAttribute("user", acc);
            session.setAttribute("header", "header.jsp");
            request.getRequestDispatcher("homeUser.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
