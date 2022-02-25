package model;

public class Account {
    private String user;
    private String password;
    private String name;
    private String phone;
    private int decentralization_id;

    public Account() {
    }

    public Account(String user, String password, String name, String phone, int decentralization_id) {
        this.user = user;
        this.password = password;
        this.name = name;
        this.phone = phone;
        this.decentralization_id = decentralization_id;
    }

    public int getDecentralization_id() {
        return decentralization_id;
    }

    public void setDecentralization_id(int decentralization_id) {
        this.decentralization_id = decentralization_id;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
