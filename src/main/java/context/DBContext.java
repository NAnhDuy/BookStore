package context;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBContext {

    public Connection getConnection() throws Exception {
        String url = "jdbc:mysql://localhost:3306/shoppingdb";
        if (instance == null || instance.trim().isEmpty()) {
            url = "jdbc:mysql://" + "localhost:" + portNumber + "/" + dbName;
        }
        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection(url, userID, password);
    }
    private final String dbName = "bookstoredb";
    private final String portNumber = "3306";
    private final String instance = ""; //leave this one empty if your sql is a single instance
    private final String userID = "root";
    private final String password = "123456";
}
