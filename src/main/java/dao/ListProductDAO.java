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
            String query = "select p.product_id, p.product_name, s.supplier_name, p.product_author, co.cover_form_name, " +
                    "p.product_price, p.product_price_sale, p.product_img_source, ca.category_name\n" +
                    "from bookstoredb.products as p, bookstoredb.suppliers as s, bookstoredb.cover_forms as co, bookstoredb.categorys as ca\n" +
                    "where p.supplier_id = s.supplier_id and p.cover_form_id = co.cover_form_id and p.category_id = ca.category_id\n" +
                    "and product_id BETWEEN 1 AND 9";
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
            String query = "select * from\n" +
                    "(select p.product_id, p.product_name, s.supplier_name, p.product_author, co.cover_form_name, " +
                    "p.product_price, p.product_price_sale, p.product_img_source, ca.category_name, (ROW_NUMBER() OVER (ORDER BY product_id)) as t\n" +
                    "from bookstoredb.products as p, bookstoredb.suppliers as s, bookstoredb.cover_forms as co, bookstoredb.categorys as ca\n" +
                    "where p.supplier_id = s.supplier_id and p.cover_form_id = co.cover_form_id and p.category_id = ca.category_id\n" +
                    "and  p.product_price > p.product_price_sale) as x\n" +
                    "where t between 8 and 10";
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
            String query = "select p.product_id, p.product_name, s.supplier_name, p.product_author, co.cover_form_name, \n" +
                    "p.product_price, p.product_price_sale, \n" +
                    "p.product_img_source, ca.category_name, (ROW_NUMBER() OVER (ORDER BY product_id)) as t\n" +
                    "from bookstoredb.products as p, bookstoredb.suppliers as s, bookstoredb.cover_forms as co, bookstoredb.categorys as ca\n" +
                    "where p.supplier_id = s.supplier_id and p.cover_form_id = co.cover_form_id and p.category_id = ca.category_id\n" +
                    "and p.product_id between ?*9-8 AND ?*9 ";
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
    public Product getProduct(int id) throws Exception {
        try {
            String query = "select p.product_id, p.product_name, s.supplier_name, p.product_author, co.cover_form_name, \n" +
                    "p.product_price, p.product_price_sale, \n" +
                    "p.product_img_source, ca.category_name, (ROW_NUMBER() OVER (ORDER BY product_id)) as t\n" +
                    "from bookstoredb.products as p, bookstoredb.suppliers as s, bookstoredb.cover_forms as co, bookstoredb.categorys as ca\n" +
                    "where p.supplier_id = s.supplier_id and p.cover_form_id = co.cover_form_id and p.category_id = ca.category_id\n" +
                    "and p.product_id LIKE ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
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
    public int countCategory(int cate) throws SQLException {
        try {
            String query = "SELECT COUNT(*) FROM bookstoredb.products WHERE category_id = ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, cate);
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
    public List<Product> searchCategory(int cate, int index ) throws Exception {
        try {
            String query = "select * from (select p.product_id, p.product_name, s.supplier_name, p.product_author, co.cover_form_name, \n" +
                    "p.product_price, p.product_price_sale, \n" +
                    "p.product_img_source, ca.category_name, (ROW_NUMBER() OVER (ORDER BY p.product_id)) as r\n" +
                    "from bookstoredb.products as p, bookstoredb.suppliers as s, bookstoredb.cover_forms as co, bookstoredb.categorys as ca\n" +
                    "where p.supplier_id = s.supplier_id and p.cover_form_id = co.cover_form_id and p.category_id = ca.category_id\n" +
                    "and p.category_id = ?) as x\n" +
                    "where r between ?*9-8 and ?*9";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, cate);
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
            String query = "select * from (select p.product_id, p.product_name, s.supplier_name, p.product_author, co.cover_form_name, \n" +
                    "p.product_price, p.product_price_sale, \n" +
                    "p.product_img_source, ca.category_name, (ROW_NUMBER() OVER (ORDER BY p.product_id)) as r\n" +
                    "from bookstoredb.products as p, bookstoredb.suppliers as s, bookstoredb.cover_forms as co, bookstoredb.categorys as ca\n" +
                    "where p.supplier_id = s.supplier_id and p.cover_form_id = co.cover_form_id and p.category_id = ca.category_id\n" +
                    "and p.product_price > p.product_price_sale) as x\n" +
                    "where r between ?*9-8 and ?*9";
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
            String query = "select * from (select p.product_id, p.product_name, s.supplier_name, p.product_author, co.cover_form_name, \n" +
                    "p.product_price, p.product_price_sale, \n" +
                    "p.product_img_source, ca.category_name, (ROW_NUMBER() OVER (ORDER BY p.product_id)) as r\n" +
                    "from bookstoredb.products as p, bookstoredb.suppliers as s, bookstoredb.cover_forms as co, bookstoredb.categorys as ca\n" +
                    "where p.supplier_id = s.supplier_id and p.cover_form_id = co.cover_form_id and p.category_id = ca.category_id\n" +
                    "and product_name LIKE ?) as x\n" +
                    "where r between ?*9-8 and ?*9";
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
    public int countSupplier(int supp) throws SQLException {
        try {
            String query = "SELECT COUNT(*) FROM bookstoredb.products WHERE supplier_id = ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, supp);
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
    public List<Product> searchSupplier(int supp, int index) throws Exception {
        try {
            String query = "select * from (select p.product_id, p.product_name, s.supplier_name, p.product_author, co.cover_form_name, \n" +
                    "p.product_price, p.product_price_sale, \n" +
                    "p.product_img_source, ca.category_name, (ROW_NUMBER() OVER (ORDER BY p.product_id)) as r\n" +
                    "from bookstoredb.products as p, bookstoredb.suppliers as s, bookstoredb.cover_forms as co, bookstoredb.categorys as ca\n" +
                    "where p.supplier_id = s.supplier_id and p.cover_form_id = co.cover_form_id and p.category_id = ca.category_id\n" +
                    "and s.supplier_id = ?) as x\n" +
                    "where r between ?*9-8 and ?*9";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, supp);
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
                String query = "select * from (select p.product_id, p.product_name, s.supplier_name, p.product_author, co.cover_form_name, \n" +
                        "p.product_price, p.product_price_sale, \n" +
                        "p.product_img_source, ca.category_name, (ROW_NUMBER() OVER (ORDER BY p.product_id)) as r\n" +
                        "from bookstoredb.products as p, bookstoredb.suppliers as s, bookstoredb.cover_forms as co, bookstoredb.categorys as ca\n" +
                        "where p.supplier_id = s.supplier_id and p.cover_form_id = co.cover_form_id and p.category_id = ca.category_id\n" +
                        "and p.product_price_sale > ? and  p.product_price_sale < ?) as x\n" +
                        "where r between ?*9-8 and ?*9\n" +
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
                String query = "select * from (select p.product_id, p.product_name, s.supplier_name, p.product_author, co.cover_form_name, \n" +
                        "p.product_price, p.product_price_sale, \n" +
                        "p.product_img_source, ca.category_name, (ROW_NUMBER() OVER (ORDER BY p.product_id)) as r\n" +
                        "from bookstoredb.products as p, bookstoredb.suppliers as s, bookstoredb.cover_forms as co, bookstoredb.categorys as ca\n" +
                        "where p.supplier_id = s.supplier_id and p.cover_form_id = co.cover_form_id and p.category_id = ca.category_id\n" +
                        "and p.product_price_sale > ? ) as x\n" +
                        "where r between ?*9-8 and ?*9\n" +
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
            String query = "select p.product_id, p.product_name, s.supplier_name, p.product_author, co.cover_form_name, \n" +
                    "p.product_price, p.product_price_sale, \n" +
                    "p.product_img_source, ca.category_name\n" +
                    "from bookstoredb.products as p, bookstoredb.suppliers as s, bookstoredb.cover_forms as co, bookstoredb.categorys as ca\n" +
                    "where p.supplier_id = s.supplier_id and p.cover_form_id = co.cover_form_id and p.category_id = ca.category_id\n" +
                    "and p.product_id like ?";
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

    public List<Product> removeAll(List<Product> ls) {
        ls.removeAll(ls);
        return ls;
    }



}
