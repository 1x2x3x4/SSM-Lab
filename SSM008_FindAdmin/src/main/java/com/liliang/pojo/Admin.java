package com.liliang.pojo;

public class Admin {
    private Integer id;       // 主键id
    private String username; // 客户名称
    private String password; // 客户密码
    private String sex;      // 客户性别
    private Integer age;      // 客户年龄
    private String jobs;      // 职业
    private String phone;     // 电话
    private String id_number; // 身份证号码
    private String address;    // 客户地址

    // 无参构造方法
    public Admin() {
    }

    // 有参构造方法
    public Admin(Integer id, String username, String password, String sex, Integer age, String jobs, String phone, String id_number, String address) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.sex = sex;
        this.age = age;
        this.jobs = jobs;
        this.phone = phone;
        this.id_number = id_number;
        this.address = address;
    }


    // 普通Getter和Seter方法

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getJobs() {
        return jobs;
    }

    public void setJobs(String jobs) {
        this.jobs = jobs;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getId_number() {
        return id_number;
    }

    public void setId_number(String id_number) {
        this.id_number = id_number;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }


    //toString输出方法


    @Override
    public String toString() {
        return "Admin{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", sex='" + sex + '\'' +
                ", age=" + age +
                ", jobs='" + jobs + '\'' +
                ", phone='" + phone + '\'' +
                ", id_number='" + id_number + '\'' +
                ", address='" + address + '\'' +
                '}';
    }
}
