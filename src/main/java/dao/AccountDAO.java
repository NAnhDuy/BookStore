package dao;

import context.DBContext;
import model.Account;
import model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AccountDAO {

    //method get Account, check user
    public Account getAccount(String user, String password) {

        try {
            String query = "SELECT * FROM bookstoredb.account \n" +
                    "WHERE user_mail like ? and user_password like ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Account a = new Account(rs.getString(1), rs.getString(2), rs.getString(3),
                        rs.getString(4));
                return a;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    //method insert new user
    public void insertNewUser(Account a) {

        try {
            String query = "insert into bookstoredb.account(user_mail, user_password, user_name, user_phone) \n" +
                    "values(?, ?, ?, ?)";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, a.getUser());
            ps.setString(2, a.getName());
            ps.setString(3, a.getPassword());
            ps.setString(4, a.getPhone());
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
