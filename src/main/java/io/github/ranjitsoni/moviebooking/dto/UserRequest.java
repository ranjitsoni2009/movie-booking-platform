package io.github.ranjitsoni.moviebooking.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@EqualsAndHashCode
public class UserRequest {

  private String firstName;

  private String lastName;

  private String email;

  private String phone;
}

