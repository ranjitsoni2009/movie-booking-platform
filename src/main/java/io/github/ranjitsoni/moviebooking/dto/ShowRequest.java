package io.github.ranjitsoni.moviebooking.dto;

import java.time.OffsetDateTime;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@EqualsAndHashCode
public class ShowRequest {

  private String movieId;

  private String theatreId;

  private String screenId;

  private OffsetDateTime startTime;

  private OffsetDateTime endTime;
}

