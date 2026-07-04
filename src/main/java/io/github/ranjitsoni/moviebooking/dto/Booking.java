package io.github.ranjitsoni.moviebooking.dto;

import java.time.OffsetDateTime;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@EqualsAndHashCode
public class Booking {

  private String id;

  private String userId;

  private String showId;

  private Integer numberOfSeats;

  private OffsetDateTime bookingTime;
}

