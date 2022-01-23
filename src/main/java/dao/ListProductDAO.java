package dao;

import context.DBContext;
import model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ListProductDAO {

    public List<Product> getListProduct(){
        try {
            String query = "SELECT * FROM bookstoredb.products where product_id BETWEEN 1 AND 9";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                Product a = new Product(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getInt(6),
                        rs.getInt(7), rs.getString(8), rs.getString(9));
                list.add(a);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    // get 3 Product price_sale - use bean
    public List<Product> getListSale(){
        try {
            String query = "SELECT * FROM (SELECT *, (ROW_NUMBER() OVER (ORDER BY product_id)) as t \n" +
                    "FROM bookstoredb.products WHERE product_price > product_price_sale) AS X\n" +
                    "WHERE t between 8 AND 10";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            List<Product> lists = new ArrayList<>();
            while (rs.next()) {
                Product a = new Product(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getInt(6),
                        rs.getInt(7), rs.getString(8),  rs.getString(9));
                lists.add(a);
            }
            return lists;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    // get all ListProduct price_sale - use bean
    public List<Product> getAllProductSale(){
        try {
            String query = "SELECT * FROM bookstoredb.products where product_price > product_price_sale";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            List<Product> listA = new ArrayList<>();
            while (rs.next()) {
                Product a = new Product(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getInt(6),
                        rs.getInt(7), rs.getString(8),  rs.getString(9));
                listA.add(a);
            }
            return listA;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Product> pagingProduct(int index){
        try {
            String query = "SELECT * FROM bookstoredb.products WHERE product_id between ?*9-8 AND ?*9";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, index);
            ps.setInt(2, index);
            ResultSet rs = ps.executeQuery();
            List<Product> list = new ArrayList<>();
            while (rs.next()) {
                Product a = new Product(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getInt(6),
                        rs.getInt(7), rs.getString(8), rs.getString(9));
                list.add(a);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
