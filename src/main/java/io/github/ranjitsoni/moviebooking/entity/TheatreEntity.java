package io.github.ranjitsoni.moviebooking.entity;

import lombok.Setter;
import lombok.Getter;
import lombok.EqualsAndHashCode;
import jakarta.persistence.Table;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.OneToMany;

@Getter
@Setter
@Entity
@Table(name = "Theatres")
@EqualsAndHashCode(onlyExplicitlyIncluded = true, callSuper = false)
public class TheatreEntity extends BaseEntity {

    private String name;
    private String address;
    private String company;

    @OneToMany(mappedBy = "theatre")
    private List<CityTheatreMappingEntity> cityTheatreMappingEntities;
}
