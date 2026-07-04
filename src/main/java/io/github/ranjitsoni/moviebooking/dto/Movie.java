package io.github.ranjitsoni.moviebooking.dto;

import java.time.LocalDate;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@EqualsAndHashCode
public class Movie {

  private String id;

  private String title;

  private String genre;

  private Integer duration;

  private LocalDate releaseDate;
}

