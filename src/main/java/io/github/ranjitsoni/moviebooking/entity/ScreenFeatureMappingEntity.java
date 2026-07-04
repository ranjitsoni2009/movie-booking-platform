package io.github.ranjitsoni.moviebooking.entity;

import lombok.Setter;
import lombok.Getter;
import lombok.EqualsAndHashCode;
import jakarta.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat.Feature;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
@Getter
@Setter
@Entity
@Table(name = "ScreenFeature_Mappings")
@EqualsAndHashCode(onlyExplicitlyIncluded = true, callSuper = false)
public class ScreenFeatureMappingEntity {

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "screenId", referencedColumnName = "id")
    private ScreenEntity screen;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "featureId", referencedColumnName = "id")
    private FeatureEntity feature;
}
