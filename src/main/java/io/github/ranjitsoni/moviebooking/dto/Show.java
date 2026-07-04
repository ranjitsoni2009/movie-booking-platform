package io.github.ranjitsoni.moviebooking.dto;

import java.time.OffsetDateTime;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@EqualsAndHashCode
public class Show {

  private String id;

  private String movieId;

  private OffsetDateTime startTime;

  private OffsetDateTime endTime;

  private Integer availableSeats;
}

