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
    public Account getAccount(String user) {

        try {
            String query = "SELECT * FROM bookstoredb.account \n" +
                    "WHERE user_mail like ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Account a = new Account(rs.getString(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getInt(5));
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
            ps.setString(2, a.getPassword());
            ps.setString(3, a.getName());
            ps.setString(4, a.getPhone());
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //method update number_false_login
    public void updateNumberFalse(int number, Account acc) {
        try {
            String query = "update bookstoredb.account set number_failed_login = ? where user_mail like ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, number);
            ps.setString(2, acc.getUser());
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //method update last_login
    public void updateLastDate(String lastDate, Account acc) {
        try {
            String query = "update bookstoredb.account set last_login = ? " +
                    "where user_mail like ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, lastDate);
            ps.setString(2, acc.getUser());
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //method update Password
    public void updatePassword(Account acc,String password) {
        try {
            String query = "update bookstoredb.account set user_password = ? " +
                    "where user_mail like ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, password);
            ps.setString(2, acc.getUser());
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
