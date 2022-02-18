package dao;

import context.DBContext;
import model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

public class OrdersDAO {

    //method insert data into database
    public void insertOrder(List<Product> list, String name, String address) throws Exception {

        try {
            for(int i = 0; i<list.size(); i++) {
                String query = "insert into bookstoredb.orders(user_mail, user_name, user_phone, user_address, product_name, product_quantity, product_price)\n" +
                        "values(?,?,?,?,?,?,?)";
                Connection conn = new DBContext().getConnection();
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setString(1, "duy@gmail.com");
                ps.setString(2, name);
                ps.setString(3, "123");
                ps.setString(4, address);
                ps.setString(5, list.get(i).getName());
                ps.setInt(6, list.get(i).getNumber());
                ps.setInt(7, list.get(i).getPrice_sale());
                ps.executeUpdate();
            }

        } catch (Exception e){
            e.printStackTrace();
        }

    }
}
