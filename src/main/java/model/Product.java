package model;

public class Product {
    private int id;
    private String name;
    private String supplier;
    private String author;
    private String cover_form;
    private int price;
    private int price_sale;
    private String img;
    private String category;

    public Product() {}

    public Product(int id, String name, String supplier, String author, String cover_form, int price, int price_sale, String img,
                   String category) {
        this.id = id;
        this.name = name;
        this.supplier = supplier;
        this.author = author;
        this.cover_form = cover_form;
        this.price = price;
        this.price_sale = price_sale;
        this.img = img;
        this.category = category;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSupplier() {
        return supplier;
    }

    public void setSupplier(String supplier) {
        this.supplier = supplier;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getCover_form() {
        return cover_form;
    }

    public void setCover_form(String cover_form) {
        this.cover_form = cover_form;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getPrice_sale() {
        return price_sale;
    }

    public void setPrice_sale(int price_sale) {
        this.price_sale = price_sale;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

}
