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
@Table(name = "Bookings")
@EqualsAndHashCode(onlyExplicitlyIncluded = true, callSuper = false)
public class BookingEntity {
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "bookedBy", referencedColumnName = "id")
    
    private UserEntity bookedBy;
    private String bookingDate;
    private BookingStatus status;
    private int numOfSeats;
}
