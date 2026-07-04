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
@Table(name = "Seats")
@EqualsAndHashCode(onlyExplicitlyIncluded = true, callSuper = false)
public class SeatEntity {

    private String seatNumber;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "seatTypeId", referencedColumnName = "id")
    private SeatType seatType;
    
}
