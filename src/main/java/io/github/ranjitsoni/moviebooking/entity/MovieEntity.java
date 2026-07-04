package io.github.ranjitsoni.moviebooking.entity;

import lombok.Setter;
import lombok.Getter;
import lombok.EqualsAndHashCode;
import jakarta.persistence.Table;
import jakarta.persistence.Entity;
import jakarta.persistence.Column;

import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;

@Getter
@Setter
@Entity
@Table(name = "Movies")
@EqualsAndHashCode(onlyExplicitlyIncluded = true, callSuper = false)
public class MovieEntity extends BaseEntity {
    
    private String movieName;

    @Column(nullable = false, unique = true)
    @EqualsAndHashCode.Include
    private String certificateNumber;

    private String description;
    private String releaseDate;
    private float rating;

    @Enumerated(value = EnumType.ORDINAL)
    private MovieStatus status; 
    private String duration;
}
