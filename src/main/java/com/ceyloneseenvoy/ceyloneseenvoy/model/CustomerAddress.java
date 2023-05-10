package com.ceyloneseenvoy.ceyloneseenvoy.model;

import lombok.*;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "customer_addresses")
@AllArgsConstructor
@NoArgsConstructor
@Data
@EqualsAndHashCode
@Builder
public class CustomerAddress implements Serializable {
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
    private Customer customer;

    public CustomerAddress(String address, String province, String city, String postalCode, Customer customer) {
        this.address = address;
        this.province = province;
        this.city = city;
        this.postalCode = postalCode;
        this.customer = customer;
    }
}
