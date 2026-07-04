package io.github.ranjitsoni.moviebooking.dto;

import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@EqualsAndHashCode
public class ShowResponse {

  private Show data;

  private List<Notification> notifications;
}

