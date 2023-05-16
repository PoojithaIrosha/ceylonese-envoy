package com.ceyloneseenvoy.ceyloneseenvoy.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "tour_reviews")
@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class TourReview {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(columnDefinition = "TEXT")
    private String comment;

    private String name;

    private String email;

    private LocalDate date;

    private Integer rating;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "tour_package_id", referencedColumnName = "id")
    private TourPackage tourPackage;
}
