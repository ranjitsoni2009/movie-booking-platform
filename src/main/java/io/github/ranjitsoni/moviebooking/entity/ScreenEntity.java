package io.github.ranjitsoni.moviebooking.entity;

import lombok.Setter;
import lombok.Getter;
import lombok.EqualsAndHashCode;
import jakarta.persistence.Table;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
@Getter
@Setter
@Entity
@Table(name = "Screens")
@EqualsAndHashCode(onlyExplicitlyIncluded = true, callSuper = false)
public class ScreenEntity extends BaseEntity {
    
    private String screenName;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "theatreId", referencedColumnName = "id")
    private TheatreEntity theatre;

    @OneToMany(fetch = FetchType.LAZY)
    private List<ScreenFeatureMappingEntity> screenFeatureMappings;

    @OneToMany(fetch = FetchType.LAZY)
    private List<ScreenSeatMappingEntity> screenSeatMapping;
}
