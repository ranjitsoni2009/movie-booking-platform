package io.github.ranjitsoni.moviebooking.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

/**
 * SeatTypeEntity
 */
@Getter
@Setter
@Entity
@Table(name = "SeatCategories")
@EqualsAndHashCode(onlyExplicitlyIncluded = true, callSuper = false)
public class SeatCategoryEntity {

    private String title;
}
