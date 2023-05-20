package com.ceyloneseenvoy.ceyloneseenvoy.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "admins")
@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class Admin implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String password;
    private String email;
    @Enumerated(EnumType.STRING)
    private IsActive status;

}
