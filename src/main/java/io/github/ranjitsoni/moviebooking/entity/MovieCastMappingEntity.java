package io.github.ranjitsoni.moviebooking.entity;

import lombok.Setter;
import lombok.Getter;
import lombok.EqualsAndHashCode;
import jakarta.persistence.Table;
import jakarta.persistence.Entity;
@Getter
@Setter
@Entity
@Table(name = "MovieCastMappings")
@EqualsAndHashCode(onlyExplicitlyIncluded = true, callSuper = false)
public class MovieCastMappingEntity {

}
