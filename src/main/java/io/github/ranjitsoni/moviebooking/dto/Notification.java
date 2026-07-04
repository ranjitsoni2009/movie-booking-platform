package io.github.ranjitsoni.moviebooking.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@EqualsAndHashCode
public class Notification {

  private String type;

  private String message;

  private String code;
}

