package com.ceyloneseenvoy.ceyloneseenvoy.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "tour_package_images")
@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class TourPackageImage {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "image", columnDefinition = "TEXT")
    private String image;
}
