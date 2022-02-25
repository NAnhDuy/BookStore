package controllers.account;

import dao.AccountDAO;
import model.Account;
import org.apache.commons.codec.digest.DigestUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "SignInController", value = "/SignInController.html")
public class SignInController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(true);

        try {
            String name = request.getParameter("name");
            String usermail = request.getParameter("username");
            String password = request.getParameter("password");
            String password2 = request.getParameter("password2");
            String phone = request.getParameter("phone");

            String regexMail = "^[A-Z0-9_a-z]+@[A-Z0\\.a-z]+\\.[A-Za-z]{2,6}$";
            String regex = "[a-zA-Z0-9_!@#$%^&*]+";
            //check null
            if (name == "" || usermail == "" || password == "" || password2 == "" || phone == "") {
                String error = "Hãy điền đầy đủ thông tin";
                request.setAttribute("error", error);
                request.getRequestDispatcher("signIn.jsp").forward(request, response);
            }
            //check mail
            if (!usermail.matches(regexMail)) {
                String error = "Email không hợp lệ";
                request.setAttribute("error", error);
                request.getRequestDispatcher("signIn.jsp").forward(request, response);
            }
            //check password
            if (password.length() < 5) {
                String error = "Mật khẩu không được ít hơn 5 ký tự";
                request.setAttribute("error", error);
                request.getRequestDispatcher("signIn.jsp").forward(request, response);
            }
            if (!password.equals(password2)) {
                String error = "Mật khẩu không khớp";
                request.setAttribute("error", error);
                request.getRequestDispatcher("signIn.jsp").forward(request, response);
            }
            if(usermail.matches(regexMail)&&password.length() > 5&&password.equals(password2)) {
                String passMd5Hex = DigestUtils.md5Hex(password).toUpperCase();

                AccountDAO accountDAO = new AccountDAO();
                Account acc = new Account();
                acc.setName(name);
                acc.setUser(usermail);
                acc.setPassword(passMd5Hex);
                acc.setPhone(phone);
                accountDAO.insertNewUser(acc);
                session.setAttribute("user", acc);
                request.getRequestDispatcher("homeUser.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
