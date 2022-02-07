package dao;

import context.DBContext;
import model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
    //method handle pagination
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
    // method get Product Information by product_id
    public Product getProduct(String id) throws Exception {
        try {
            String query = "SELECT * FROM bookstoredb.products WHERE product_id LIKE ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product a = new Product(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getInt(6),
                        rs.getInt(7), rs.getString(8), rs.getString(9));
                return a;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    // count product_Category
    public int count(String txt) throws SQLException {
        try {
            String query = "SELECT COUNT(*) FROM bookstoredb.products\n" +
                    "WHERE product_Category like ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txt + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    // search by product_Category
    public List<Product> searchTxt(String txt, int index ) throws Exception {
        try {
            String query = "SELECT * FROM(SELECT *, row_number() over (order by product_id) as r \n" +
                    "FROM bookstoredb.products WHERE product_Category LIKE ?) as t\n" +
                    "WHERE r between ?*9-8 and ?*9";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txt + "%");
            ps.setInt(2, index);
            ps.setInt(3, index);
            ResultSet rs = ps.executeQuery();
            List<Product> listC = new ArrayList<>();
            while (rs.next()) {
                Product a = new Product(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getInt(6),
                        rs.getInt(7), rs.getString(8), rs.getString(9));
                listC.add(a);
            }
            return listC;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // count product_price_sale
    public int countSale() throws SQLException {
        try {
            String query = "SELECT COUNT(*) FROM bookstoredb.products WHERE product_price > product_price_sale";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    // search by product_price > product_price_sale
    public List<Product> searchSale(int index ) throws Exception {
        try {
            String query = "SELECT * FROM(SELECT *, row_number() over (order by product_id) as r \n" +
                    "FROM bookstoredb.products WHERE product_price > product_price_sale) as t\n" +
                    "WHERE r between ?*9-8 and ?*9";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, index);
            ps.setInt(2, index);
            ResultSet rs = ps.executeQuery();
            List<Product> listSale = new ArrayList<>();
            while (rs.next()) {
                Product a = new Product(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getInt(6),
                        rs.getInt(7), rs.getString(8), rs.getString(9));
                listSale.add(a);
            }
            return listSale;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    // count product_name
    public int countName(String name) throws SQLException {
        try {
            String query = "SELECT COUNT(*) FROM bookstoredb.products WHERE product_name LIKE ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, "%" + name + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    // search by product_name
    public List<Product> searchName(String name, int index) throws Exception {
        try {
            String query = "SELECT * FROM(SELECT *, row_number() over (order by product_id) as r \n" +
                    "FROM bookstoredb.products WHERE product_name LIKE ?) as t\n" +
                    "WHERE r between ?*9-8 and ?*9";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, "%" + name + "%");
            ps.setInt(2, index);
            ps.setInt(3, index);
            ResultSet rs = ps.executeQuery();
            List<Product> listSale = new ArrayList<>();
            while (rs.next()) {
                Product a = new Product(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getInt(6),
                        rs.getInt(7), rs.getString(8), rs.getString(9));
                listSale.add(a);
            }
            return listSale;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    // count product_supplier
    public int countSupplier(String name) throws SQLException {
        try {
            String query = "SELECT COUNT(*) FROM bookstoredb.products WHERE product_supplier LIKE ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, "%" + name + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    // search by product_supplier
    public List<Product> searchSupplier(String name, int index) throws Exception {
        try {
            String query = "SELECT * FROM(SELECT *, row_number() over (order by product_id) as r \n" +
                    "FROM bookstoredb.products WHERE product_supplier LIKE ?) as t\n" +
                    "WHERE r between ?*9-8 and ?*9";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setInt(2, index);
            ps.setInt(3, index);
            ResultSet rs = ps.executeQuery();
            List<Product> listSale = new ArrayList<>();
            while (rs.next()) {
                Product a = new Product(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getInt(6),
                        rs.getInt(7), rs.getString(8), rs.getString(9));
                listSale.add(a);
            }
            return listSale;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    // count product_price
    public int countPrice(int min, int max) throws SQLException {
        if(min != 500000) {
            try {
                String query = "SELECT COUNT(*) FROM bookstoredb.products WHERE product_price_sale > ? and  product_price_sale < ?";
                Connection conn = new DBContext().getConnection();
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setInt(1, min);
                ps.setInt(2, max);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            try {
                String query = "SELECT COUNT(*) FROM bookstoredb.products WHERE product_price_sale > ?";
                Connection conn = new DBContext().getConnection();
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setInt(1, min);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }


        return 0;
    }
    // search by product_price
    public List<Product> searchPrice(int min, int max, int index) throws Exception {
        if(min != 500000) {
            try {
                String query = "SELECT * FROM(SELECT *, row_number() over (order by product_id) as r \n" +
                        "FROM bookstoredb.products WHERE product_price_sale > ? and  product_price_sale < ?) as t\n" +
                        "WHERE r between ?*9-8 and ?*9\n" +
                        "order by product_price_sale";
                Connection conn = new DBContext().getConnection();
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setInt(1, min);
                ps.setInt(2, max);
                ps.setInt(3, index);
                ps.setInt(4, index);
                ResultSet rs = ps.executeQuery();
                List<Product> listSale = new ArrayList<>();
                while (rs.next()) {
                    Product a = new Product(rs.getInt(1), rs.getString(2), rs.getString(3),
                            rs.getString(4), rs.getString(5), rs.getInt(6),
                            rs.getInt(7), rs.getString(8), rs.getString(9));
                    listSale.add(a);
                }
                return listSale;

            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            try {
                String query = "SELECT * FROM(SELECT *, row_number() over (order by product_id) as r \n" +
                        "FROM bookstoredb.products WHERE product_price_sale > ?) as t\n" +
                        "WHERE r between ?*9-8 and ?*9\n" +
                        "order by product_price_sale";
                Connection conn = new DBContext().getConnection();
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setInt(1, min);
                ps.setInt(2, index);
                ps.setInt(3, index);
                ResultSet rs = ps.executeQuery();
                List<Product> listSale = new ArrayList<>();
                while (rs.next()) {
                    Product a = new Product(rs.getInt(1), rs.getString(2), rs.getString(3),
                            rs.getString(4), rs.getString(5), rs.getInt(6),
                            rs.getInt(7), rs.getString(8), rs.getString(9));
                    listSale.add(a);
                }
                return listSale;

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }
    //method get List product by ID
    public Product listById (int id, int number){
        try {
            String query = "SELECT * FROM bookstoredb.products WHERE product_id like ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            List<Product> listI = new ArrayList<>();
            while (rs.next()) {
                Product a = new Product(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getInt(6),
                        rs.getInt(7), rs.getString(8), rs.getString(9), number);
                return a;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public List<Product> remove(int id, List<Product> ls) {
        for (Product x : ls) {
            if (x.getId() == id) {
                ls.remove(x);
                return ls;
            }
        }
        return null;
    }

}
