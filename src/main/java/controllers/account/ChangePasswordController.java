package controllers.account;

import dao.AccountDAO;
import model.Account;
import org.apache.commons.codec.digest.DigestUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ChangePasswordController", value = "/ChangePasswordController.html")
public class ChangePasswordController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(true);

        String password = request.getParameter("pass");
        String hashPassword = DigestUtils.md5Hex(password).toUpperCase();

        String newPassword1 = request.getParameter("newPass1");
        String newPassword2 = request.getParameter("newPass2");
        String hashNewPassword = DigestUtils.md5Hex(newPassword2).toUpperCase();

        //check null
        if(password == null || newPassword1 == null || newPassword2 ==null){
            String error = "Hãy điền đầy đủ thông tin";
            request.setAttribute("error", error);
            request.getRequestDispatcher("changePassword.jsp").forward(request,response);
        }
        //check pass
        Account acc = (Account) session.getAttribute("user");
        AccountDAO dao = new AccountDAO();
        if(!hashPassword.equals(acc.getPassword())) {
            String error = "Mật khẩu hiện tại sai";
            request.setAttribute("error", error);
            request.getRequestDispatcher("changePassword.jsp").forward(request,response);
        }
        if(!newPassword1.equals(newPassword2)) {
            String error = "Mật khẩu mới không trùng khớp";
            request.setAttribute("error", error);
            request.getRequestDispatcher("changePassword.jsp").forward(request,response);
        }
        if(password != null && newPassword1 != null && newPassword2 != null && hashPassword.equals(acc.getPassword()) &&
                newPassword1.equals(newPassword2)) {
            dao.updatePassword(acc, hashNewPassword);
            String mess = "Đổi mật khẩu thành công!";
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);
        }
    }
}
