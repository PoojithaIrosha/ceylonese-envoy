package com.ceyloneseenvoy.ceyloneseenvoy.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "tour_packages")
@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class TourPackage implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "overview", nullable = false, columnDefinition = "TEXT")
    private String overview;

    @Column(name = "price", nullable = false)
    private Double price;

    @Column(name = "cancellation_policy", columnDefinition = "TEXT")
    private String cancellationPolicy;

    @Column(name = "highlights", columnDefinition = "TEXT")
    private String highlights;

    @Column(name = "inclusions", columnDefinition = "TEXT")
    private String inclusions;

    @Column(name = "exclusions", columnDefinition = "TEXT")
    private String exclusions;

    @Column(name = "departure_details", columnDefinition = "TEXT")
    private String departureDetails;

    @Column(name = "additional_information", columnDefinition = "TEXT")
    private String additionalInformation;

    @Column(name = "locations", columnDefinition = "TEXT")
    private String locations;

    @Enumerated(EnumType.STRING)
    @Column(name = "is_active", nullable = false)
    private IsActive isActive;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "tour_package_id", referencedColumnName = "id")
    private List<TourPackageImage> tourPackageImages = new ArrayList<>();

    public List<TourPackageImage> getTourPackageImages() {
        return tourPackageImages;
    }

    public void setTourPackageImages(TourPackageImage tourPackageImage) {
        this.tourPackageImages.add(tourPackageImage);
    }
}
