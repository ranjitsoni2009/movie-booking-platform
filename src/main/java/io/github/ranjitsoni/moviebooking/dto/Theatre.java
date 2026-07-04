package io.github.ranjitsoni.moviebooking.dto;

import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@EqualsAndHashCode
public class Theatre {

  private String id;

  private String name;

  private String location;

  private List<ShowResponse> shows;
}

