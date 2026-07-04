package io.github.ranjitsoni.moviebooking.entity;

import lombok.Setter;
import lombok.Getter;
import lombok.EqualsAndHashCode;
import jakarta.persistence.Table;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Getter
@Setter
@Entity
@Table(name = "CityTheatre_Mappings")
@EqualsAndHashCode(onlyExplicitlyIncluded = true, callSuper = false)
public class CityTheatreMappingEntity {

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "city_id", referencedColumnName = "id")
    private CityEntity city;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "theatre_id", referencedColumnName = "id")
    private TheatreEntity theatre;
    
    private String openedDate;
    private String status;
}
