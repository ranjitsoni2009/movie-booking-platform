package io.github.ranjitsoni.moviebooking.entity;

import lombok.Setter;
import lombok.Getter;
import lombok.EqualsAndHashCode;
import jakarta.persistence.Table;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.OneToMany;

@Getter
@Setter
@Entity
@Table(name = "Features")
@EqualsAndHashCode(onlyExplicitlyIncluded = true, callSuper = false)
public class FeatureEntity extends BaseEntity {

    private String featureName;

    @Enumerated(value = EnumType.STRING)
    private FeatureType featureType;

    @OneToMany(fetch = FetchType.LAZY)
    private List<ScreenFeatureMappingEntity> screenFeatureMappings;
}
