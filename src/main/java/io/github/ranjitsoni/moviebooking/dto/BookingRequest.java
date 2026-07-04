package io.github.ranjitsoni.moviebooking.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@EqualsAndHashCode
public class BookingRequest {

  private String userId;

  private String showId;

  private Integer numberOfSeats;
}

