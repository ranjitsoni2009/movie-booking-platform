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
@Table(name = "Cities")
@EqualsAndHashCode(onlyExplicitlyIncluded = true, callSuper = false)
public class CityEntity {

    private String name;
    private String pinCode;

    @OneToMany(mappedBy = "city")
    private List<CityTheatreMappingEntity> cityTheatreMappingEntities;
}
