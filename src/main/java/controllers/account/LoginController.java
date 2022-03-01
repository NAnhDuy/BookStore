package controllers.account;

import dao.AccountDAO;
import model.Account;
import org.apache.commons.codec.digest.DigestUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "LoginController", value = "/LoginController.html")
public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession(true);
        PrintWriter out = response.getWriter();
        try {
            String userMail = request.getParameter("username");
            String password = request.getParameter("password");
            String hashPassword = DigestUtils.md5Hex(password).toUpperCase();

            //check null
            if (userMail == "" || password == "") {
                String error = "Tài khoản và Mật khẩu không được phép trống";
                request.setAttribute("error", error);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            AccountDAO accountDAO = new AccountDAO();
            Account acc = accountDAO.getAccount(userMail);

            //check mail
            if (acc == null) {
                String error = "Không tìm thấy tài khoản";
                request.setAttribute("error", error);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            //check number_failed_login
            if(acc != null && !hashPassword.equals(acc.getPassword())) {
                if(session.getAttribute("numberFalse") == null) {
                    session.setAttribute("numberFalse", 0);
                }
                int numberFalse = (Integer) session.getAttribute("numberFalse");
                numberFalse++;
                String error = "Mật khẩu không đúng";
                accountDAO.updateNumberFalse(numberFalse, acc);

                session.setAttribute("numberFalse", numberFalse);
                request.setAttribute("error", error);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            //check cart
            if(session.getAttribute("checkCart") != null) {
                session.setAttribute("header", "headerUser.jsp");
                request.getRequestDispatcher("cart.jsp").forward(request, response);
            }
            //check number false after logout
            if(session.getAttribute("numberFalse") == null) {
                session.setAttribute("numberFalse", 0);
            }
            int numberFalse = (Integer) session.getAttribute("numberFalse");
            accountDAO.updateNumberFalse(numberFalse, acc);

            //update last_date_login
            Date date = new Date( );
            SimpleDateFormat ft = new SimpleDateFormat ("E yyyy.MM.dd 'at' hh:mm:ss a ");
            String upDate = ft.format(date);
            accountDAO.updateLastDate(upDate, acc);
            //check admin
            if(acc.getDecentralization_id() == 1) {
                session.setAttribute("user", acc);
                session.setAttribute("header", "adminHeader.jsp");
                request.getRequestDispatcher("adminHome.jsp").forward(request, response);
            }
            if(acc.getDecentralization_id() == 0) {
                session.setAttribute("user", acc);
                session.setAttribute("header", "headerUser.jsp");
                request.getRequestDispatcher("homeUser.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
