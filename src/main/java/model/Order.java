package model;

public class Order {
    private int orderId;
    private String mail;
    private String userName;
    private String phone;
    private String address;
    private int productId;
    private String productName;
    private int productQuantity;
    private int productPrice;
    private String img;
    private String order_date;

    public Order(int orderId, String mail, String userName, String phone, String address, int productId, String productName,
                 int productQuantity, int productPrice, String img, String order_date) {
        this.orderId = orderId;
        this.mail = mail;
        this.userName = userName;
        this.phone = phone;
        this.address = address;
        this.productId = productId;
        this.productName = productName;
        this.productQuantity = productQuantity;
        this.productPrice = productPrice;
        this.img = img;
        this.order_date = order_date;
    }

    public Order(int orderId, String mail, String userName, String phone, String address, int productId, String productName,
                 int productQuantity, int productPrice, String img) {
        this.orderId = orderId;
        this.mail = mail;
        this.userName = userName;
        this.phone = phone;
        this.address = address;
        this.productId = productId;
        this.productName = productName;
        this.productQuantity = productQuantity;
        this.productPrice = productPrice;
        this.img = img;
    }


    public String getOrder_date() {
        return order_date;
    }

    public void setOrder_date(String order_date) {
        this.order_date = order_date;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String name) {
        this.userName = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(int productQuantity) {
        this.productQuantity = productQuantity;
    }

    public int getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(int productPrice) {
        this.productPrice = productPrice;
    }
}
