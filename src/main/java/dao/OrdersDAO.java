package dao;

import context.DBContext;
import model.Account;
import model.Order;
import model.Product;

import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class OrdersDAO {

    //method insert data into database
    public void insertOrder(List<Product> list, Account acc, String name, String address) throws Exception {

        try {
            for(int i = 0; i<list.size(); i++) {
                String query = "insert into bookstoredb.orders(user_mail, user_name, user_phone, user_address, " +
                        "product_id, product_name, product_quantity, product_price)\n" +
                        "values(?,?,?,?,?,?,?,?)";

                Connection conn = new DBContext().getConnection();
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setString(1, acc.getUser());
                ps.setString(2, name);
                ps.setString(3, acc.getPhone());
                ps.setString(4, address);
                ps.setInt(5, list.get(i).getId());
                ps.setString(6, list.get(i).getName());
                ps.setInt(7, list.get(i).getNumber());
                ps.setInt(8, list.get(i).getPrice_sale());
                ps.executeUpdate();
            }

        } catch (Exception e){
            e.printStackTrace();
        }

    }

    //method get list Order
    public List<Order> getListOrder(String user) {
        try {
            String query = "select o.order_id, o.user_mail, o.user_name, o.user_phone, o.user_address, o.product_id, " +
                    "o.product_name, o.product_quantity, o.product_price, p.product_img_source \n" +
                    "from bookstoredb.orders as o, bookstoredb.products as p \n" +
                    "where o.product_id = p.product_id and user_mail like ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ResultSet rs = ps.executeQuery();
            List<Order> list = new ArrayList<>();
            while (rs.next()) {
                Order a = new Order(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getInt(6), rs.getString(7),
                        rs.getInt(8), rs.getInt(9), rs.getString(10));
                list.add(a);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
