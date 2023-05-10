package com.ceyloneseenvoy.ceyloneseenvoy.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "user_addresses")
public class UserAddress implements Serializable {
    @Id
    private Long id;

    @Column(name = "address", nullable = false)
    private String address;

    @Column(nullable = false)
    private String province;

    @Column(nullable = false)
    private String city;

    @Column(name = "postal_code")
    private String postalCode;

    @OneToOne
    @MapsId
    private User user;

    public UserAddress() {
    }

    public UserAddress(String address, String province, String city, String postalCode, User user) {
        this.address = address;
        this.province = province;
        this.city = city;
        this.postalCode = postalCode;
        this.user = user;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "UserAddress{" +
                "id=" + id +
                ", address='" + address + '\'' +
                ", province='" + province + '\'' +
                ", city='" + city + '\'' +
                ", postalCode='" + postalCode + '\'' +
                '}';
    }
}
